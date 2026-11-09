<?php

namespace Database\Seeders;

use App\Models\Lecturer;
use App\Modules\Litapdimas\Models\LitapdimasProposal;
use App\Modules\Litapdimas\Services\PublicPublicationService;
use Illuminate\Database\Seeder;

class LitapdimasApprovedProposalSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Pastikan ada data Dosen di CMS
        $dosen1 = Lecturer::firstOrCreate(
            ['nidn' => '2012086801'],
            [
                'name' => 'Prof. Dr. H. Ahmad Fauzi, M.Ag',
                'nip' => '197505122003121002',
                'email' => 'ahmad.fauzi@prodi.ac.id',
                'phone' => '081234567891',
                'expertise' => 'Studi Islam & Pemikiran Modern',
                'is_active' => true,
                'litapdimas_id' => '201208680208101',
                'litapdimas_fungsional_id' => '04', // Guru Besar
                'litapdimas_bidangilmu_id' => '01',
            ]
        );

        $dosen2 = Lecturer::firstOrCreate(
            ['nidn' => '2003047102'],
            [
                'name' => 'Dr. Siti Nurhaliza, M.Pd.I',
                'nip' => '198207182008012015',
                'email' => 'siti.nurhaliza@prodi.ac.id',
                'phone' => '081234567892',
                'expertise' => 'Pendidikan Islam & Kurikulum Berbasis AI',
                'is_active' => true,
                'litapdimas_id' => '200304710408002',
                'litapdimas_fungsional_id' => '02', // Lektor
                'litapdimas_bidangilmu_id' => '08',
            ]
        );

        $dosen3 = Lecturer::firstOrCreate(
            ['nidn' => '2025078203'],
            [
                'name' => 'Muhammad Ridwan, M.Kom',
                'nip' => '199003152019031008',
                'email' => 'ridwan@prodi.ac.id',
                'phone' => '081234567893',
                'expertise' => 'Sistem Informasi & Data Science Keagamaan',
                'is_active' => true,
                'litapdimas_id' => '202507820108000',
                'litapdimas_fungsional_id' => '01', // Asisten Ahli
                'litapdimas_bidangilmu_id' => '13',
            ]
        );

        // 2. Proposal Litapdimas 1 (Status 07 - Disetujui Bantuan)
        $prop1 = LitapdimasProposal::updateOrCreate(
            ['noreg' => '241012020060001'],
            [
                'tahun_anggaran' => 2024,
                'id_kategori' => '24101', // Penelitian Kolaborasi Internasional
                'id_jenis' => 2,
                'id_bidangilmu' => '01',
                'id_arkan' => '1',
                'id_subarkan' => '1',
                'judul' => 'Integrasi Maqashid Syariah dalam Mitigasi Perubahan Iklim Global pada Komunitas Pesantren Ramah Lingkungan',
                'biaya_usulan' => 175000000,
                'biaya_disetujui' => 150000000,
                'lecturer_id' => $dosen1->id,
                'id_ketua_litapdimas' => $dosen1->litapdimas_id,
                'id_anggota_litapdimas' => $dosen2->litapdimas_id,
                'id_luaran' => '01,02',
                'url_proposal' => 'https://example.com/docs/proposal-241012020060001.pdf',
                'url_rab' => 'https://example.com/docs/rab-241012020060001.pdf',
                'similarity_score' => 14,
                'rekomendasi_akhir' => 'Direkomendasi',
                'status_usulan' => '07', // Ditetapkan Sebagai Penerima Bantuan
                'sync_tahap1_status' => 'synced',
                'sync_tahap2_status' => 'synced',
            ]
        );

        // 3. Proposal Litapdimas 2 (Status 11 - Selesai & Terpublikasi)
        $prop2 = LitapdimasProposal::updateOrCreate(
            ['noreg' => '231022020060015'],
            [
                'tahun_anggaran' => 2023,
                'id_kategori' => '23102', // Riset Terapan Terbuka
                'id_jenis' => 3,
                'id_bidangilmu' => '08',
                'id_arkan' => '3',
                'id_subarkan' => '2',
                'judul' => 'Pengembangan Model Pembelajaran Adaptif Berbasis Gamifikasi AI untuk Penguatan Moderasi Beragama Generasi Z',
                'biaya_usulan' => 95000000,
                'biaya_disetujui' => 85000000,
                'lecturer_id' => $dosen2->id,
                'id_ketua_litapdimas' => $dosen2->litapdimas_id,
                'id_anggota_litapdimas' => $dosen3->litapdimas_id,
                'id_luaran' => '02,05',
                'url_proposal' => 'https://example.com/docs/proposal-231022020060015.pdf',
                'url_rab' => 'https://example.com/docs/rab-231022020060015.pdf',
                'similarity_score' => 11,
                'rekomendasi_akhir' => 'Direkomendasi',
                'status_usulan' => '11', // Selesai
                'sync_tahap1_status' => 'synced',
                'sync_tahap2_status' => 'synced',
            ]
        );

        // 4. Proposal Litapdimas 3 (Status 07 - Riset Teknologi Keagamaan)
        $prop3 = LitapdimasProposal::updateOrCreate(
            ['noreg' => '241032020060028'],
            [
                'tahun_anggaran' => 2024,
                'id_kategori' => '24103', // Riset Pengembangan IPTEK Keagamaan
                'id_jenis' => 4,
                'id_bidangilmu' => '13',
                'id_arkan' => '4',
                'id_subarkan' => '3',
                'judul' => 'Arsitektur Smart Cloud Repository untuk Pelestarian Digital dan Penelusuran Semantik Manuskrip Kuno Nusantara',
                'biaya_usulan' => 120000000,
                'biaya_disetujui' => 110000000,
                'lecturer_id' => $dosen3->id,
                'id_ketua_litapdimas' => $dosen3->litapdimas_id,
                'id_anggota_litapdimas' => $dosen1->litapdimas_id,
                'id_luaran' => '01,03',
                'url_proposal' => 'https://example.com/docs/proposal-241032020060028.pdf',
                'url_rab' => 'https://example.com/docs/rab-241032020060028.pdf',
                'similarity_score' => 9,
                'rekomendasi_akhir' => 'Direkomendasi',
                'status_usulan' => '07', // Ditetapkan Sebagai Penerima Bantuan
                'sync_tahap1_status' => 'synced',
                'sync_tahap2_status' => 'synced',
            ]
        );

        // 5. Eksekusi Publikasi Otomatis ke Halaman Publik research_services
        $publisher = app(PublicPublicationService::class);
        $totalPublished = $publisher->publishEligibleProposals();
        
        $this->command->info("Opsi A Berhasil: {$totalPublished} Penelitian Litapdimas lolos seleksi telah diterbitkan ke portal publik.");
    }
}
