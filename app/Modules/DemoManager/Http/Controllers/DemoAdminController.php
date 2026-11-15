<?php

namespace App\Modules\DemoManager\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\DemoManager\Services\DemoResetService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class DemoAdminController extends Controller
{
    public function index()
    {
        $logPath = '/var/log/cms-demo-reset.log';
        $recentLogs = [];
        if (File::exists($logPath)) {
            $lines = explode("\n", trim(File::get($logPath)));
            $recentLogs = array_reverse(array_filter(array_slice($lines, -30)));
        }

        $snapshotSql = config('demo.snapshot.sql', base_path('demo-pristine.sql'));
        $snapshotStorage = config('demo.snapshot.storage', base_path('demo-storage-pristine.tar.gz'));

        $sqlSize = File::exists($snapshotSql) ? round(File::size($snapshotSql) / 1024 / 1024, 2) . ' MB' : 'Tidak Ditemukan';
        $storageSize = File::exists($snapshotStorage) ? round(File::size($snapshotStorage) / 1024 / 1024, 2) . ' MB' : 'Tidak Ditemukan';

        $accounts = config('demo.accounts', []);
        $demoEnabled = config('demo.enabled', true);

        return view('demo::admin.index', compact('recentLogs', 'sqlSize', 'storageSize', 'accounts', 'demoEnabled'));
    }

    public function reset(Request $request, DemoResetService $service)
    {
        $res = $service->reset();

        return redirect()->route('admin.demo.index')
            ->with('success', 'Database dan media penyimpanan publik berhasil dipulihkan ke snapshot demo awal!');
    }
}
