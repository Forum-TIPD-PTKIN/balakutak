<?php

namespace App\Modules\DemoManager\Providers;

use App\Modules\DemoManager\Console\Commands\DemoResetCommand;
use App\Modules\DemoManager\Services\DemoResetService;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;

class DemoManagerServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->mergeConfigFrom(
            __DIR__ . '/../Config/demo.php', 'demo'
        );

        $this->app->singleton(DemoResetService::class, function () {
            return new DemoResetService();
        });

        if ($this->app->runningInConsole()) {
            $this->commands([
                DemoResetCommand::class,
            ]);
        }
    }

    public function boot(): void
    {
        $this->loadViewsFrom(__DIR__ . '/../Views', 'demo');

        // Daftarkan route admin modul
        Route::middleware('web')
            ->group(__DIR__ . '/../Routes/web.php');

        // Daftarkan blade directive / component
        Blade::component('demo::components.quick-login', 'demo-quick-login');
    }
}
