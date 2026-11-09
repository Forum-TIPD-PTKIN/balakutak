<?php

namespace App\Modules\Litapdimas\Models;

use App\Models\Lecturer;
use Illuminate\Database\Eloquent\Model;

class LitapdimasProposal extends Model
{
    protected $table = 'litapdimas_proposals';

    protected $fillable = [
        'noreg',
        'tahun_anggaran',
        'id_kategori',
        'id_jenis',
        'id_bidangilmu',
        'id_arkan',
        'id_subarkan',
        'judul',
        'biaya_usulan',
        'biaya_disetujui',
        'lecturer_id',
        'id_ketua_litapdimas',
        'id_anggota_litapdimas',
        'id_luaran',
        'url_proposal',
        'url_rab',
        'similarity_score',
        'url_similarity',
        'url_lap_akademik',
        'url_lap_keuangan',
        'reviewer_isi1',
        'nilai_review_isi1',
        'reviewer_isi2',
        'nilai_review_isi2',
        'reviewer_presentasi1',
        'nilai_review_presentasi1',
        'reviewer_presentasi2',
        'nilai_review_presentasi2',
        'reviewer_luaran1',
        'reviewer_luaran2',
        'rekomendasi_akhir',
        'status_usulan',
        'sync_tahap1_status',
        'sync_tahap1_at',
        'sync_tahap2_status',
        'sync_tahap2_at',
    ];

    protected $casts = [
        'sync_tahap1_at' => 'datetime',
        'sync_tahap2_at' => 'datetime',
        'biaya_usulan' => 'decimal:2',
        'biaya_disetujui' => 'decimal:2',
        'similarity_score' => 'integer',
    ];

    public function lecturer()
    {
        return $this->belongsTo(Lecturer::class, 'lecturer_id');
    }
}
