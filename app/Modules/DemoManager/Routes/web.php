<?php

use App\Modules\DemoManager\Http\Controllers\DemoAdminController;
use Illuminate\Support\Facades\Route;

Route::middleware(['web', 'auth'])->prefix('admin/demo-manager')->name('admin.demo.')->group(function () {
    Route::get('/', [DemoAdminController::class, 'index'])->name('index');
    Route::post('/reset', [DemoAdminController::class, 'reset'])->name('reset');
});
