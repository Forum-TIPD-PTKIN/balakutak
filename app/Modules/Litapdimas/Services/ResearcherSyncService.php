<?php

namespace App\Modules\Litapdimas\Services;

use App\Models\Lecturer;

class ResearcherSyncService
{
    public function __construct(protected LitapdimasApiService $apiService)
    {
    }

    /**
     * Tarik daftar peneliti satker dari Litapdimas dan cocokkan dengan data Lecturer di CMS
     */
    public function syncSatkerResearchers(int $from = 0, int $rec = 500): array
    {
        $params = [
            'from' => $from,
            'rec' => $rec,
        ];

        $res = $this->apiService->get('peneliti/list/', $params, restricted: true);

        if (($res['status'] ?? null) == '1' && !empty($res['data'])) {
            $matched = 0;
            foreach ($res['data'] as $item) {
                $idPeneliti = $item['id_peneliti'] ?? null;
                $nidn = $item['nidn'] ?? null;
                $nip = $item['nip'] ?? null;
                $nama = $item['nama'] ?? null;

                if (!$idPeneliti) {
                    continue;
                }

                // Cari lecturer berdasarkan NIDN, NIP, atau kemiripan nama
                $lecturer = null;
                if ($nidn) {
                    $lecturer = Lecturer::where('nidn', $nidn)->first();
                }
                if (!$lecturer && $nip) {
                    $lecturer = Lecturer::where('nip', $nip)->first();
                }
                if (!$lecturer && $nama) {
                    $lecturer = Lecturer::where('name', 'LIKE', "%{$nama}%")->first();
                }

                if ($lecturer) {
                    $lecturer->update([
                        'litapdimas_id' => $idPeneliti,
                        'litapdimas_fungsional_id' => $item['id_fungsional'] ?? null,
                        'litapdimas_bidangilmu_id' => $item['id_bidangilmu'] ?? null,
                    ]);
                    $matched++;
                }
            }

            return [
                'status' => true,
                'total_fetched' => count($res['data']),
                'matched_count' => $matched,
            ];
        }

        return ['status' => false, 'message' => $res['message'] ?? 'Gagal mengambil data peneliti satker'];
    }
}
