<?php

namespace App\Modules\Litapdimas\Providers;

use App\Modules\Litapdimas\Services\LitapdimasApiService;
use App\Modules\Litapdimas\Services\ProposalSyncService;
use App\Modules\Litapdimas\Services\ReferenceSyncService;
use App\Modules\Litapdimas\Services\ResearcherSyncService;
use Illuminate\Support\ServiceProvider;

class LitapdimasServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->mergeConfigFrom(
            config_path('litapdimas.php'), 'litapdimas'
        );

        $this->app->singleton(LitapdimasApiService::class, function () {
            return new LitapdimasApiService();
        });

        $this->app->singleton(ReferenceSyncService::class, function ($app) {
            return new ReferenceSyncService($app->make(LitapdimasApiService::class));
        });

        $this->app->singleton(ProposalSyncService::class, function ($app) {
            return new ProposalSyncService($app->make(LitapdimasApiService::class));
        });

        $this->app->singleton(ResearcherSyncService::class, function ($app) {
            return new ResearcherSyncService($app->make(LitapdimasApiService::class));
        });
    }

    public function boot(): void
    {
        // Routes and views can be loaded here if needed
    }
}
