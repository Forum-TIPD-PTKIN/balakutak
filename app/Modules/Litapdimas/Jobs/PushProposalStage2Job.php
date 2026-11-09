<?php

namespace App\Modules\Litapdimas\Jobs;

use App\Modules\Litapdimas\Models\LitapdimasProposal;
use App\Modules\Litapdimas\Services\ProposalSyncService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class PushProposalStage2Job implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function __construct(public LitapdimasProposal $proposal)
    {
    }

    public function handle(ProposalSyncService $syncService): void
    {
        Log::info("Memulai Push Tahap 2 untuk Noreg: {$this->proposal->noreg}");
        $syncService->pushTahap2($this->proposal);
    }
}
