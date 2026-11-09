<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // 1. Settings Table
        Schema::create('litapdimas_settings', function (Blueprint $table) {
            $table->id();
            $table->string('satker_name')->nullable();
            $table->string('satker_code', 20)->nullable();
            $table->string('idreq', 50)->nullable();
            $table->text('keyreq')->nullable();
            $table->string('base_url')->default('https://litapdimas.kemenag.go.id/index.php/api');
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        // 2. References Table (Cache data master dari Litapdimas)
        Schema::create('litapdimas_references', function (Blueprint $table) {
            $table->id();
            $table->string('ref_type', 50)->index(); // kategori, reviewer, status, arkan, subarkan, fungsional, bidangilmu, luaran, afiliasi, periode_update
            $table->string('ref_code', 50)->index();
            $table->string('ref_name');
            $table->json('meta_data')->nullable();
            $table->timestamp('last_synced_at')->nullable();
            $table->timestamps();

            $table->unique(['ref_type', 'ref_code']);
        });

        // 3. Proposals Table
        Schema::create('litapdimas_proposals', function (Blueprint $table) {
            $table->id();
            $table->string('noreg', 20)->unique();
            $table->year('tahun_anggaran')->index();
            $table->string('id_kategori', 20);
            $table->unsignedTinyInteger('id_jenis')->default(1);
            $table->string('id_bidangilmu', 20)->nullable();
            $table->string('id_arkan', 20)->nullable();
            $table->string('id_subarkan', 20)->nullable();
            $table->string('judul', 255);
            $table->decimal('biaya_usulan', 15, 2)->default(0);
            $table->decimal('biaya_disetujui', 15, 2)->nullable();
            
            // Relasi ke tabel Lecturer CMS & Litapdimas
            $table->foreignId('lecturer_id')->nullable()->constrained('lecturers')->nullOnDelete();
            $table->string('id_ketua_litapdimas', 50)->index();
            $table->text('id_anggota_litapdimas')->nullable();
            $table->string('id_luaran', 100)->nullable();

            // Berkas Terbuka Tahap 1
            $table->text('url_proposal')->nullable();
            $table->text('url_rab')->nullable();

            // Tahap 2 Data (Review, Similarity, LPJ)
            $table->unsignedTinyInteger('similarity_score')->nullable();
            $table->text('url_similarity')->nullable();
            $table->string('reviewer_isi1', 150)->nullable();
            $table->decimal('nilai_review_isi1', 8, 2)->nullable();
            $table->string('reviewer_isi2', 150)->nullable();
            $table->decimal('nilai_review_isi2', 8, 2)->nullable();
            $table->string('reviewer_presentasi1', 150)->nullable();
            $table->decimal('nilai_review_presentasi1', 8, 2)->nullable();
            $table->string('reviewer_presentasi2', 150)->nullable();
            $table->decimal('nilai_review_presentasi2', 8, 2)->nullable();
            $table->string('reviewer_luaran1', 150)->nullable();
            $table->string('reviewer_luaran2', 150)->nullable();
            $table->string('rekomendasi_akhir', 50)->nullable();
            $table->string('status_usulan', 20)->default('00');
            $table->text('url_lap_akademik')->nullable();
            $table->text('url_lap_keuangan')->nullable();

            // Status Sinkronisasi
            $table->enum('sync_tahap1_status', ['draft', 'queued', 'synced', 'failed'])->default('draft');
            $table->timestamp('sync_tahap1_at')->nullable();
            $table->enum('sync_tahap2_status', ['draft', 'queued', 'synced', 'failed'])->default('draft');
            $table->timestamp('sync_tahap2_at')->nullable();

            $table->timestamps();
        });

        // 4. Sync Logs Table
        Schema::create('litapdimas_sync_logs', function (Blueprint $table) {
            $table->id();
            $table->string('action_type', 50)->index(); // ref_sync, peneliti_sync, tahap1_push, tahap2_push, list_fetch
            $table->unsignedBigInteger('proposal_id')->nullable();
            $table->string('endpoint');
            $table->json('request_payload')->nullable();
            $table->integer('response_code')->nullable();
            $table->longText('response_body')->nullable();
            $table->string('status', 20); // success, failed
            $table->timestamps();
        });

        // 5. Tambah field Litapdimas di tabel lecturers (jika belum ada)
        if (Schema::hasTable('lecturers')) {
            Schema::table('lecturers', function (Blueprint $table) {
                if (!Schema::hasColumn('lecturers', 'litapdimas_id')) {
                    $table->string('litapdimas_id', 50)->nullable()->after('id')->index();
                }
                if (!Schema::hasColumn('lecturers', 'litapdimas_fungsional_id')) {
                    $table->string('litapdimas_fungsional_id', 20)->nullable()->after('litapdimas_id');
                }
                if (!Schema::hasColumn('lecturers', 'litapdimas_bidangilmu_id')) {
                    $table->string('litapdimas_bidangilmu_id', 20)->nullable()->after('litapdimas_fungsional_id');
                }
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasTable('lecturers')) {
            Schema::table('lecturers', function (Blueprint $table) {
                $columns = ['litapdimas_id', 'litapdimas_fungsional_id', 'litapdimas_bidangilmu_id'];
                foreach ($columns as $column) {
                    if (Schema::hasColumn('lecturers', $column)) {
                        $table->dropColumn($column);
                    }
                }
            });
        }

        Schema::dropIfExists('litapdimas_sync_logs');
        Schema::dropIfExists('litapdimas_proposals');
        Schema::dropIfExists('litapdimas_references');
        Schema::dropIfExists('litapdimas_settings');
    }
};
