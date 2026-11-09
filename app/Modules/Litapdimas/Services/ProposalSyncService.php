<?php

namespace App\Modules\Litapdimas\Services;

use App\Models\Lecturer;
use App\Modules\Litapdimas\Models\LitapdimasProposal;
use Carbon\Carbon;

class ProposalSyncService
{
    public function __construct(protected LitapdimasApiService $apiService)
    {
    }

    /**
     * Generate Noregistrasi 15 digit sesuai format Litapdimas:
     * [id_kategori (5)][kode_satker (6)][nomor urut (4)]
     */
    public static function generateNoreg(string $idKategori, string $kodeSatker, int $sequence): string
    {
        $kat = str_pad(substr($idKategori, 0, 5), 5, '0', STR_PAD_RIGHT);
        $sat = str_pad(substr($kodeSatker, 0, 6), 6, '0', STR_PAD_RIGHT);
        $seq = str_pad((string) $sequence, 4, '0', STR_PAD_LEFT);

        return "{$kat}{$sat}{$seq}";
    }

    /**
     * Push Tahap 1 ke Litapdimas
     */
    public function pushTahap1(LitapdimasProposal $proposal): array
    {
        $payload = [
            'noreg' => $proposal->noreg,
            'periode' => $proposal->tahun_anggaran,
            'id_kategori' => $proposal->id_kategori,
            'id_jenis' => $proposal->id_jenis,
            'id_bidangilmu' => $proposal->id_bidangilmu,
            'judul' => $proposal->judul,
            'biaya' => (int) $proposal->biaya_usulan,
            'id_ketua' => $proposal->id_ketua_litapdimas,
            'id_anggota' => $proposal->id_anggota_litapdimas ?: '',
            'id_luaran' => $proposal->id_luaran,
            'id_arkan' => $proposal->id_arkan,
            'id_subarkan' => $proposal->id_subarkan,
            'url_proposal' => $proposal->url_proposal,
            'url_rab' => $proposal->url_rab,
        ];

        $proposal->update(['sync_tahap1_status' => 'queued']);
        $res = $this->apiService->post('bantuan/tahap1/', $payload, restricted: true, proposalId: $proposal->id);

        if (($res['status'] ?? null) == '1') {
            $proposal->update([
                'sync_tahap1_status' => 'synced',
                'sync_tahap1_at' => Carbon::now(),
            ]);
            return ['status' => true, 'message' => $res['message'] ?? 'Berhasil dikirim ke Litapdimas'];
        }

        $proposal->update(['sync_tahap1_status' => 'failed']);
        return ['status' => false, 'message' => $res['message'] ?? 'Gagal mengirim usulan Tahap 1'];
    }

    /**
     * Push Tahap 2 ke Litapdimas
     */
    public function pushTahap2(LitapdimasProposal $proposal): array
    {
        $payload = [
            'noreg' => $proposal->noreg,
            'periode' => $proposal->tahun_anggaran,
            'similarity' => (int) $proposal->similarity_score,
            'url_similarity' => $proposal->url_similarity,
            'reviewer_isi1' => $proposal->reviewer_isi1,
            'nilai_review_isi1' => (int) $proposal->nilai_review_isi1,
            'reviewer_isi2' => $proposal->reviewer_isi2,
            'nilai_review_isi2' => (int) $proposal->nilai_review_isi2,
            'reviewer_presentasi1' => $proposal->reviewer_presentasi1,
            'nilai_review_presentasi1' => (int) $proposal->nilai_review_presentasi1,
            'reviewer_presentasi2' => $proposal->reviewer_presentasi2,
            'nilai_review_presentasi2' => (int) $proposal->nilai_review_presentasi2,
            'biaya_disetujui' => (int) $proposal->biaya_disetujui,
            'reviewer_luaran1' => $proposal->reviewer_luaran1,
            'reviewer_luaran2' => $proposal->reviewer_luaran2,
            'rekomendasi_akhir' => $proposal->rekomendasi_akhir,
            'id_status' => $proposal->status_usulan,
            'url_lap_akademik' => $proposal->url_lap_akademik,
            'url_lap_keuangan' => $proposal->url_lap_keuangan,
        ];

        $proposal->update(['sync_tahap2_status' => 'queued']);
        $res = $this->apiService->post('bantuan/tahap2/', $payload, restricted: true, proposalId: $proposal->id);

        if (($res['status'] ?? null) == '1') {
            $proposal->update([
                'sync_tahap2_status' => 'synced',
                'sync_tahap2_at' => Carbon::now(),
            ]);
            return ['status' => true, 'message' => $res['message'] ?? 'Data Tahap 2 berhasil terupdate di Litapdimas'];
        }

        $proposal->update(['sync_tahap2_status' => 'failed']);
        return ['status' => false, 'message' => $res['message'] ?? 'Gagal mengirim evaluasi Tahap 2'];
    }
}
