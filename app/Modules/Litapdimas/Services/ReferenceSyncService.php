<?php

namespace App\Modules\Litapdimas\Services;

use App\Modules\Litapdimas\Models\LitapdimasReference;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class ReferenceSyncService
{
    public function __construct(protected LitapdimasApiService $apiService)
    {
    }

    /**
     * Sinkronisasi kategori bantuan per tahun anggaran
     */
    public function syncKategori(?int $tahun = null): array
    {
        $tahun = $tahun ?: (int) date('Y');
        $res = $this->apiService->get("kategori/{$tahun}");

        if (($res['status'] ?? null) == '1' && !empty($res['data'])) {
            $now = Carbon::now();
            foreach ($res['data'] as $item) {
                LitapdimasReference::updateOrCreate(
                    ['ref_type' => 'kategori', 'ref_code' => (string) $item['id_kategori']],
                    [
                        'ref_name' => $item['nama_kategori'] ?? '',
                        'meta_data' => $item,
                        'last_synced_at' => $now,
                    ]
                );
            }
            return ['status' => true, 'count' => count($res['data'])];
        }

        return ['status' => false, 'message' => $res['message'] ?? 'Gagal mengambil data kategori'];
    }

    /**
     * Sinkronisasi status bantuan
     */
    public function syncRefStatus(): array
    {
        $res = $this->apiService->get("ref_status");
        if (($res['status'] ?? null) == '1' && !empty($res['data'])) {
            $now = Carbon::now();
            foreach ($res['data'] as $item) {
                LitapdimasReference::updateOrCreate(
                    ['ref_type' => 'status', 'ref_code' => (string) $item['id_status']],
                    [
                        'ref_name' => $item['status'] ?? '',
                        'meta_data' => $item,
                        'last_synced_at' => $now,
                    ]
                );
            }
            return ['status' => true, 'count' => count($res['data'])];
        }
        return ['status' => false, 'message' => $res['message'] ?? 'Gagal sync status'];
    }

    /**
     * Sinkronisasi tema arkan
     */
    public function syncRefArkan(): array
    {
        $res = $this->apiService->get("ref_arkan");
        if (($res['status'] ?? null) == '1' && !empty($res['data'])) {
            $now = Carbon::now();
            foreach ($res['data'] as $item) {
                LitapdimasReference::updateOrCreate(
                    ['ref_type' => 'arkan', 'ref_code' => (string) $item['id_arkan']],
                    [
                        'ref_name' => $item['arkan'] ?? '',
                        'meta_data' => $item,
                        'last_synced_at' => $now,
                    ]
                );
            }
            return ['status' => true, 'count' => count($res['data'])];
        }
        return ['status' => false, 'message' => $res['message'] ?? 'Gagal sync arkan'];
    }

    /**
     * Sinkronisasi subtema arkan
     */
    public function syncRefSubArkan(): array
    {
        $res = $this->apiService->get("ref_subarkan");
        if (($res['status'] ?? null) == '1' && !empty($res['data'])) {
            $now = Carbon::now();
            foreach ($res['data'] as $item) {
                LitapdimasReference::updateOrCreate(
                    ['ref_type' => 'subarkan', 'ref_code' => (string) $item['id_sub']],
                    [
                        'ref_name' => $item['subarkan'] ?? '',
                        'meta_data' => $item,
                        'last_synced_at' => $now,
                    ]
                );
            }
            return ['status' => true, 'count' => count($res['data'])];
        }
        return ['status' => false, 'message' => $res['message'] ?? 'Gagal sync subarkan'];
    }

    /**
     * Sinkronisasi bidang ilmu
     */
    public function syncBidangIlmu(): array
    {
        $res = $this->apiService->get("bidangilmu");
        if (($res['status'] ?? null) == '1' && !empty($res['data'])) {
            $now = Carbon::now();
            foreach ($res['data'] as $item) {
                LitapdimasReference::updateOrCreate(
                    ['ref_type' => 'bidangilmu', 'ref_code' => (string) $item['id_bidang']],
                    [
                        'ref_name' => $item['bidangilmu'] ?? '',
                        'meta_data' => $item,
                        'last_synced_at' => $now,
                    ]
                );
            }
            return ['status' => true, 'count' => count($res['data'])];
        }
        return ['status' => false, 'message' => $res['message'] ?? 'Gagal sync bidang ilmu'];
    }

    /**
     * Sinkronisasi luaran
     */
    public function syncLuaran(): array
    {
        $res = $this->apiService->get("luaran");
        if (($res['status'] ?? null) == '1' && !empty($res['data'])) {
            $now = Carbon::now();
            foreach ($res['data'] as $item) {
                LitapdimasReference::updateOrCreate(
                    ['ref_type' => 'luaran', 'ref_code' => (string) $item['id_luaran']],
                    [
                        'ref_name' => $item['luaran'] ?? '',
                        'meta_data' => $item,
                        'last_synced_at' => $now,
                    ]
                );
            }
            return ['status' => true, 'count' => count($res['data'])];
        }
        return ['status' => false, 'message' => $res['message'] ?? 'Gagal sync luaran'];
    }

    /**
     * Sinkronisasi periode update jendela tahapan bantuan
     */
    public function syncPeriodeUpdate(): array
    {
        $res = $this->apiService->get("bantuan/periode_update");
        if (($res['status'] ?? null) == '1' && !empty($res['data'])) {
            $now = Carbon::now();
            foreach ($res['data'] as $index => $item) {
                LitapdimasReference::updateOrCreate(
                    ['ref_type' => 'periode_update', 'ref_code' => (string) ($item['tahap'] ?? "Tahap {$index}")],
                    [
                        'ref_name' => $item['tahap'] ?? '',
                        'meta_data' => $item,
                        'last_synced_at' => $now,
                    ]
                );
            }
            return ['status' => true, 'count' => count($res['data'])];
        }
        return ['status' => false, 'message' => $res['message'] ?? 'Gagal sync periode update'];
    }
}
