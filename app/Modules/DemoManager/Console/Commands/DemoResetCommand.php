<?php

namespace App\Modules\DemoManager\Console\Commands;

use App\Modules\DemoManager\Services\DemoResetService;
use Illuminate\Console\Command;

class DemoResetCommand extends Command
{
    protected $signature = 'demo:reset {--force : Lewati konfirmasi}';
    protected $description = 'Pulihkan database dan storage BalaKutaK CMS ke snapshot demo pristine';

    public function handle(DemoResetService $service): int
    {
        if (!config('demo.enabled', true) && !$this->option('force')) {
            $this->warn('Demo mode saat ini dinonaktifkan di konfigurasi (DEMO_MODE=false).');
            return Command::FAILURE;
        }

        $this->info('Memulai pemulihan snapshot demo pristine...');
        $result = $service->reset();

        foreach ($result['messages'] as $msg) {
            $this->line('  - ' . $msg);
        }

        $this->info('Pemulihan demo berhasil selesai.');
        return Command::SUCCESS;
    }
}
