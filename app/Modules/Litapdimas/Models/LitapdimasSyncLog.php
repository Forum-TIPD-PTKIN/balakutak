<?php

namespace App\Modules\Litapdimas\Models;

use Illuminate\Database\Eloquent\Model;

class LitapdimasSyncLog extends Model
{
    protected $table = 'litapdimas_sync_logs';

    protected $fillable = [
        'action_type',
        'proposal_id',
        'endpoint',
        'request_payload',
        'response_code',
        'response_body',
        'status',
    ];

    protected $casts = [
        'request_payload' => 'array',
    ];
}
