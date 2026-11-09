# ANALISIS API LITAPDIMAS KEMENAG & RENCANA IMPLEMENTASI MODUL/ADDON INTEGRASI PADA APP-CMS (BALAKUTAK CMS)

**Dokumen Versi:** 1.0  
**Tanggal:** 9 November 2026  
**Penyusun:** Pakar Sistem Integrasi & Arsitektur Perangkat Lunak  
**Target Sistem:** Litapdimas API (Kemenag RI) & `app-cms` (Laravel 11, AdminLTE 3)

---

## 1. EXECUTIVE SUMMARY & ARSITEKTUR API LITAPDIMAS

Layanan API **Litapdimas (Penelitian, Publikasi Ilmiah, dan Pengabdian kepada Masyarakat)** Kementerian Agama RI (`https://litapdimas.kemenag.go.id/index.php/api/docs`) menyediakan fasilitas pertukaran data dua arah (*read & push/sync*) antara sistem pusat Kementerian Agama dengan Perguruan Tinggi Keagamaan Islam (PTKIN/PTKIS).

### 1.1 Klasifikasi Akses & Endpoint

API Litapdimas dibagi menjadi dua paradigma akses:

1. **Akses Terbuka (Public / Open Reference):**
   - Tidak memerlukan autentikasi (`idreq` & `keyreq`).
   - Format: `GET` format JSON.
   - Endpoint:
     - `/api/kategori/[tahun]` : Referensi Kategori/Klaster bantuan per tahun anggaran.
     - `/api/reviewer/` : Data reviewer aktif nasional.
     - `/api/ref_status/` : Status usulan bantuan (`00: Draft`, `01: Pengajuan`, dst).
     - `/api/ref_arkan/` & `/api/ref_subarkan/` : Tema dan Subtema Arkan (Khas Kemenag).
     - `/api/fungsional/` : Jabatan fungsional (Asisten Ahli, Lektor, dll).
     - `/api/bidangilmu/` : Rumpun ilmu keagamaan/sains.
     - `/api/luaran/` : Jenis luaran bantuan (HKI, Jurnal, Buku, Prototipe).
     - `/api/ref_afiliasi/` : Kode dan daftar PTKIN/PTKIS se-Indonesia.
     - `/api/bantuan/periode_update` : Cek batas waktu (tenggat jendela) pengiriman data bantuan tiap tahapan.

2. **Akses Terbatas (Restricted / Satker Authenticated):**
   - Membutuhkan credential query parameter / payload:
     - `idreq` (ID Perguruan Tinggi / Satker)
     - `keyreq` (Token/Key verifikasi Satker dari portal Litapdimas)
   - Endpoint:
     - **GET** `/api/peneliti/list/?idreq=...&keyreq=...&from=...&rec=...` : Tarik data peneliti/dosen satker beserta `id_peneliti` dan `passkey` (SHA1).
     - **GET** `/api/peneliti/person/?idreq=...&keyreq=...&idplt=...` : Cari data profil peneliti luar PT untuk riset kolaboratif.
     - **GET** `/api/bantuan/list/?idreq=...&keyreq=...&tahun=...` : Monitoring histori usulan proposal bantuan beserta nilai review & reviewer.
     - **POST** `/api/bantuan/tahap1/` : Sinkronisasi / setor data usulan proposal baru (No. Reg, judul, ketua, anggota, estimasi biaya, link PDF proposal & RAB open-access).
     - **POST** `/api/bantuan/tahap2/` : Sinkronisasi penetapan hasil review, skor kesamaan/similarity (Turnitin dsb), nilai reviewer isi & presentasi, biaya disetujui, rekomendasi, hingga berkas LPJ/Laporan akademik & keuangan.

### 1.2 Karakteristik & Tantangan Teknis Kritis

1. **Validasi Format Noreg (Nomor Registrasi):**
   - Noreg wajib 15 digit dengan struktur: `[id_kategori (5 digit)][kode_satker (6 digit)][nomor urut (4 digit)]` (Contoh: `211022020060071`).
2. **Ketergantungan Window Sinkronisasi (`periode_update`):**
   - Pengiriman data Tahap 1 dan Tahap 2 memiliki *window limit* ketat. Di luar periode aktif, request POST akan ditolak server Kemenag. Sistem harus mengunci pengiriman atau memberikan *alert* jika window telah ditutup.
3. **Persyaratan Dokumen Open-Access:**
   - Parameter `url_proposal`, `url_rab`, `url_similarity`, `url_lap_akademik`, `url_lap_keuangan` harus berupa URL publik yang valid dan langsung dapat diakses/diunduh oleh robot Litapdimas tanpa login cookie.
4. **Relasi Peneliti berbasis `id_peneliti`:**
   - Dosen/peneliti di CMS lokal harus memiliki pemetaan (*field mapping*) ke `id_peneliti` Litapdimas agar pengusulan ketua dan multi-anggota (`id_anggota` dipisah koma) valid.

---

## 2. MODEL INTEGRASI MODUL / ADDON UNTUK APP-CMS

Aplikasi `app-cms` berbasis **Laravel 11**, arsitektur monolit modern dengan panel admin **AdminLTE 3**, Tailwind CSS, dan Spatie Permissions.

### 2.1 Pola Desain (Design Pattern): Modular Service-Repository

Untuk menjaga agar core CMS tetap bersih (*clean architecture* & *loose coupling*), integrasi Litapdimas dibangun sebagai **Sub-Sistem / Addon Domain Litapdimas**:

```
app/
├── Modules/Litapdimas/                 # Isolasi domain Litapdimas
│   ├── Config/litapdimas.php           # Konfigurasi credentials & timeouts
│   ├── Contracts/LitapdimasClientInterface.php
│   ├── Services/
│   │   ├── LitapdimasApiService.php    # Client HTTP Wrapper (Guzzle/Http Client)
│   │   ├── ReferenceSyncService.php    # Sinkronisasi Master Data
│   │   ├── ProposalSyncService.php     # Logic Dispatcher Tahap 1 & 2
│   │   └── ResearcherSyncService.php   # Pemetaan Data Dosen <-> ID Peneliti
│   ├── Jobs/
│   │   ├── SyncLitapdimasReferencesJob.php
│   │   ├── PushProposalStage1Job.php
│   │   └── PushProposalStage2Job.php
│   ├── Models/
│   │   ├── LitapdimasReference.php     # Cache master kategori, arkan, bidang ilmu
│   │   ├── LitapdimasProposal.php      # Data usulan penelitian & riwayat sinkronisasi
│   │   ├── LitapdimasReview.php        # Data reviewer & penilaian
│   │   └── LitapdimasSyncLog.php       # Audit trail setiap HTTP request & response
│   ├── Http/
│   │   └── Controllers/
│   │       ├── LitapdimasSettingController.php
│   │       ├── LitapdimasProposalController.php
│   │       └── LitapdimasSyncController.php
│   └── Providers/
│       └── LitapdimasServiceProvider.php
```

### 2.2 Integrasi dengan Fitur Core App-CMS yang Sudah Ada

1. **Model `Lecturer` (`app/Models/Lecturer.php`):**
   - Ditambahkan migration alter table: `litapdimas_id`, `nidn`, `nip`, `litapdimas_fungsional_id`, `litapdimas_bidangilmu_id`, `litapdimas_passkey`.
   - Mengintegrasikan data dosen website kampus dengan profil peneliti Litapdimas.
2. **Model `ResearchService` & Konten Publik CMS:**
   - Data penelitian yang telah didanai dan selesai (lolos Tahap 2) dapat dipublikasikan secara otomatis ke halaman portal publik CMS (`/penelitian` / `ResearchService`) sebagai portofolio akademik kampus.
3. **Menu Manajemen AdminLTE:**
   - Didaftarkan menu baru pada sidebar AdminLTE:
     - 🎓 **Litapdimas Kemenag**
       - ⚙️ Pengaturan API (`idreq`, `keyreq`, URL Sandbox/Production)
       - 📚 Master Referensi (Klaster, Arkan, Reviewer)
       - 👥 Data Peneliti Terdaftar
       - 📑 Usulan Riset (Tahap 1 - Proposal)
       - 📊 Monitoring & Evaluasi (Tahap 2 - Review & Laporan)
       - 📜 Log Sinkronisasi & Error Report

---

## 3. RANCANGAN STRUKTUR BASIS DATA (DATABASE SCHEMA)

### 3.1 Tabel `litapdimas_settings`
Menyimpan konfigurasi credentials satker:
- `id` (PK)
- `satker_name` (varchar)
- `satker_code` (varchar 6 - untuk pembentuk noreg)
- `idreq` (varchar)
- `keyreq` (text, encrypted)
- `base_url` (varchar, default: `https://litapdimas.kemenag.go.id/index.php/api`)
- `is_active` (boolean)
- `timestamps`

### 3.2 Tabel `litapdimas_references`
Penyimpanan cache data referensi agar tidak membebani server Kemenag setiap kali rendering form:
- `id` (PK)
- `ref_type` (enum: `kategori`, `reviewer`, `status`, `arkan`, `subarkan`, `fungsional`, `bidangilmu`, `luaran`, `afiliasi`, `periode_update`)
- `ref_code` (varchar)
- `ref_name` (varchar)
- `meta_data` (json) -> menyimpan detail seperti `min_anggaran`, `max_anggaran`, `id_arkan`, dll.
- `last_synced_at` (timestamp)

### 3.3 Tabel `litapdimas_proposals`
Tabel utama pengelolaan siklus penelitian:
- `id` (PK, UUID)
- `noreg` (varchar 15, unique, index)
- `tahun_anggaran` (year)
- `id_kategori` (varchar)
- `id_jenis` (int: 1-6)
- `id_bidangilmu` (varchar)
- `id_arkan` (varchar)
- `id_subarkan` (varchar)
- `judul` (varchar 255)
- `biaya_usulan` (bigint)
- `biaya_disetujui` (bigint, nullable)
- `lecturer_id` (FK ke `lecturers.id` - Ketua)
- `id_ketua_litapdimas` (varchar)
- `id_anggota_litapdimas` (text, comma separated ID)
- `id_luaran` (varchar, comma separated)
- `url_proposal` (text)
- `url_rab` (text)
- `similarity_score` (int, nullable)
- `url_similarity` (text, nullable)
- `url_lap_akademik` (text, nullable)
- `url_lap_keuangan` (text, nullable)
- `rekomendasi_akhir` (enum: `Direkomendasi`, `Tidak Direkomendasi`, null)
- `status_usulan` (varchar: ref status Litapdimas)
- `sync_tahap1_status` (enum: `draft`, `queued`, `synced`, `failed`)
- `sync_tahap1_at` (timestamp, nullable)
- `sync_tahap2_status` (enum: `draft`, `queued`, `synced`, `failed`)
- `sync_tahap2_at` (timestamp, nullable)
- `timestamps`

### 3.4 Tabel `litapdimas_sync_logs`
- `id` (PK)
- `action_type` (tahap1, tahap2, ref_sync, peneliti_sync)
- `proposal_id` (FK nullable)
- `request_payload` (json, censored keys)
- `response_code` (int)
- `response_body` (text)
- `status` (success, failed)
- `created_at`

---

## 4. RENCANA IMPLEMENTASI BERTAHAP (ROADMAP)

### Fase 1: Persiapan & Modul Fundamental (Hari 1 - 2)
1. Buat direktori modul dan daftarkan `LitapdimasServiceProvider` ke Laravel 11.
2. Buat tabel konfigurasi, referensi, dan log (`migrations`).
3. Kembangkan `LitapdimasApiService`:
   - Implementasi Guzzle/HTTP Client dengan proteksi timeout, retry mechanism, dan log error.
   - Pengecekan koneksi (*Ping / Health Check*) menggunakan endpoint public `/ref_status/`.

### Fase 2: Sinkronisasi Master Data & Peneliti (Hari 3 - 4)
1. Integrasi cron schedule / job `SyncLitapdimasReferencesJob` untuk menarik:
   - Klaster Kategori per tahun aktif.
   - Arkan & Sub-Arkan.
   - Bidang Ilmu & Luaran.
   - Status Bantuan & Periode Update.
2. Sinkronisasi Data Peneliti Satker (`/api/peneliti/list/`):
   - Fitur pencocokan NIDN / NIP antara tabel `lecturers` di `app-cms` dengan data Litapdimas.
   - Penyimpanan `id_peneliti` Kemenag pada profil dosen CMS.

### Fase 3: Manajemen Proposal & Setor Data Tahap 1 (Hari 5 - 7)
1. Form Pengajuan Proposal Internal di CMS:
   - Auto-generator nomor registrasi (`noreg`) 15 digit sesuai standar Litapdimas.
   - Validasi file PDF Proposal & RAB (unggah ke public storage dengan symlink, pastikan direct link dapat diunduh tanpa session).
   - Validasi batasan anggaran per kategori (`min_anggaran` dan `max_anggaran`).
2. Implementasi Worker/Job `PushProposalStage1Job`:
   - Pengiriman POST ke `/api/bantuan/tahap1/`.
   - Menangani response status dan menyimpan audit trail log.

### Fase 4: Monitoring, Review, & Setor Data Tahap 2 (Hari 8 - 10)
1. Penarikan update status dari `/api/bantuan/list/?tahun=...`:
   - Memperbarui progres usulan lokal secara berkala.
2. Form Input Hasil Evaluasi & Review Tahap 2:
   - Input similarity Turnitin (persentase & URL sertifikat).
   - Input reviewer isi & presentasi (format `ID|Nama`).
   - Input biaya disetujui, rekomendasi akhir, serta URL berkas laporan akhir & keuangan.
3. Fitur Pengecekan `periode_update` sebelum pengiriman:
   - Memberikan peringatan (*warning*) jika batas waktu pengiriman Tahap 2 telah habis.
4. Implementasi `PushProposalStage2Job` ke endpoint `/api/bantuan/tahap2/`.

### Fase 5: Publikasi Portofolio ke Frontend CMS & Testing (Hari 11 - 12)
1. Otomasi publikasi riset lolos ke halaman portal publik `app-cms`.
2. Unit Testing & Mock HTTP Testing menggunakan MockClient Laravel.
3. Uji coba User Acceptance Test (UAT) oleh operator LP2M kampus.

---

## 5. REKOMENDASI KEAMANAN & PRAKTIK TERBAIK (BEST PRACTICES)

1. **Enkripsi Kredensial:**
   - Parameter `keyreq` adalah rahasia institusi; wajib dienkripsi di database menggunakan `Crypt::encryptString()` dan tidak boleh di-hardcode di file `.env` repository publik.
2. **Asynchronous Processing (Queue):**
   - Komunikasi dengan server Kemenag wajib menggunakan Laravel Queue (`database` / `redis`). Jangan mengeksekusi sinkronisasi API pada request synchronous web controller untuk mencegah *HTTP 504 Gateway Timeout* jika server Kemenag sedang lambat/padat.
3. **Public URL Storage Hardening:**
   - Dokumen proposal dan RAB yang dikirimkan harus open access, tetapi untuk menghindari indexing sembarangan oleh mesin pencari Google terhadap proposal internal, gunakan direktori acak yang di-obfuscate (contoh: `/storage/litapdimas/proposals/x9b2f18.../proposal.pdf`) dan pasang header `X-Robots-Tag: noindex, nofollow`.
4. **Idempotensi & Auto-Update:**
   - API Litapdimas bersifat *upsert based on noreg*. Jika pengiriman ulang Tahap 1 dilakukan dengan `noreg` yang sama, sistem Litapdimas akan menimpa data lama. Manfaatkan fitur ini untuk mekanisme update data proposal.

---
*Dokumen ini dirancang sebagai panduan teknis implementasi siap pakai oleh tim developer app-cms.*
