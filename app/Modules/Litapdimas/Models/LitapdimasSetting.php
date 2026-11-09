<?php

namespace App\Modules\Litapdimas\Models;

use Illuminate\Database\Eloquent\Model;

class LitapdimasSetting extends Model
{
    protected $table = 'litapdimas_settings';

    protected $fillable = [
        'satker_name',
        'satker_code',
        'idreq',
        'keyreq',
        'base_url',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'keyreq' => 'encrypted',
    ];
}
