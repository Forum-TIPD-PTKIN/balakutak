<?php

namespace App\Modules\Litapdimas\Services;

use App\Models\ResearchService;
use App\Modules\Litapdimas\Models\LitapdimasProposal;
use Illuminate\Support\Str;

class PublicPublicationService
{
    /**
     * Publikasikan proposal Litapdimas yang telah disetujui (status 07 atau 11) ke tabel publik research_services
     */
    public function publish(LitapdimasProposal $proposal): ResearchService
    {
        $authorName = $proposal->lecturer?->name;
        if (!$authorName) {
            // Ambil dari id_ketua atau fallback
            $authorName = "Peneliti Litapdimas ({$proposal->id_ketua_litapdimas})";
        }

        $abstractText = "Penelitian didanai oleh Kementerian Agama RI melalui program Litapdimas tahun anggaran {$proposal->tahun_anggaran} dengan kategori {$proposal->id_kategori}. Biaya disetujui: Rp " . number_format($proposal->biaya_disetujui ?: $proposal->biaya_usulan, 0, ',', '.') . ".";

        $slugBase = Str::slug($proposal->judul);
        $slug = $slugBase;
        $counter = 1;

        while (ResearchService::where('slug', $slug)->where('id', '!=', $proposal->id)->exists()) {
            $slug = "{$slugBase}-{$counter}";
            $counter++;
        }

        return ResearchService::updateOrCreate(
            ['slug' => $slug],
            [
                'title' => $proposal->judul,
                'author' => $authorName,
                'year' => (int) $proposal->tahun_anggaran,
                'type' => 'research',
                'abstract' => $abstractText,
                'content' => "<p>{$abstractText}</p><p>Nomor Registrasi: <strong>{$proposal->noreg}</strong></p><p>Hasil Similarity: {$proposal->similarity_score}%</p>",
                'external_link' => $proposal->url_proposal ?: null,
                'is_active' => true,
                'order' => 1,
            ]
        );
    }

    /**
     * Publikasikan semua proposal Litapdimas yang berstatus disetujui/selesai
     */
    public function publishEligibleProposals(): int
    {
        $eligible = LitapdimasProposal::whereIn('status_usulan', ['07', '11'])
            ->orWhere('rekomendasi_akhir', 'Direkomendasi')
            ->get();

        $count = 0;
        foreach ($eligible as $proposal) {
            $this->publish($proposal);
            $count++;
        }

        return $count;
    }
}
