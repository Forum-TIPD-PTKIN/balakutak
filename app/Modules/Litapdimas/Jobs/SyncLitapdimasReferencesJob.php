<?php

namespace App\Modules\Litapdimas\Jobs;

use App\Modules\Litapdimas\Services\ReferenceSyncService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class SyncLitapdimasReferencesJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function __construct(public ?int $tahun = null)
    {
    }

    public function handle(ReferenceSyncService $syncService): void
    {
        Log::info('Memulai Job Sinkronisasi Master Referensi Litapdimas');

        $syncService->syncRefStatus();
        $syncService->syncRefArkan();
        $syncService->syncRefSubArkan();
        $syncService->syncBidangIlmu();
        $syncService->syncLuaran();
        $syncService->syncPeriodeUpdate();
        $syncService->syncKategori($this->tahun ?: (int) date('Y'));

        Log::info('Selesai Job Sinkronisasi Master Referensi Litapdimas');
    }
}
