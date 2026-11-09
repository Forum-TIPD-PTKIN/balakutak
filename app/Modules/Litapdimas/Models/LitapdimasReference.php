<?php

namespace App\Modules\Litapdimas\Models;

use Illuminate\Database\Eloquent\Model;

class LitapdimasReference extends Model
{
    protected $table = 'litapdimas_references';

    protected $fillable = [
        'ref_type',
        'ref_code',
        'ref_name',
        'meta_data',
        'last_synced_at',
    ];

    protected $casts = [
        'meta_data' => 'array',
        'last_synced_at' => 'datetime',
    ];
}
