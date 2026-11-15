<?php

namespace App\Modules\DemoManager\Services;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;

class DemoResetService
{
    /**
     * Restore database and storage to pristine state
     */
    public function reset(): array
    {
        $log = [];
        $sqlPath = config('demo.snapshot.sql', base_path('demo-pristine.sql'));
        $storagePath = config('demo.snapshot.storage', base_path('demo-storage-pristine.tar.gz'));

        // 1. Restore Database SQL
        if (File::exists($sqlPath)) {
            try {
                DB::unprepared('SET FOREIGN_KEY_CHECKS=0;');
                
                // Read and execute SQL statements safely
                $sqlContent = File::get($sqlPath);
                DB::unprepared($sqlContent);
                
                DB::unprepared('SET FOREIGN_KEY_CHECKS=1;');
                $log[] = 'Database restored successfully from pristine snapshot.';
            } catch (\Throwable $e) {
                // Fallback to mariadb CLI via shell if large dump
                $dbHost = config('database.connections.mysql.host', 'cms_db');
                $dbUser = config('database.connections.mysql.username', 'cms_user');
                $dbPass = config('database.connections.mysql.password', '');
                $dbName = config('database.connections.mysql.database', 'balakutak_cms');

                $cmd = sprintf(
                    'mariadb -h %s -u %s -p%s %s < %s 2>&1',
                    escapeshellarg($dbHost),
                    escapeshellarg($dbUser),
                    escapeshellarg($dbPass),
                    escapeshellarg($dbName),
                    escapeshellarg($sqlPath)
                );
                @exec($cmd, $output, $status);
                if ($status === 0) {
                    $log[] = 'Database restored via mariadb client fallback.';
                } else {
                    $log[] = 'Database restore error: ' . $e->getMessage();
                }
            }
        } else {
            $log[] = 'Warning: demo-pristine.sql not found at ' . $sqlPath;
        }

        // 2. Restore Storage Public
        if (File::exists($storagePath)) {
            $storageTarget = storage_path('app');
            $cmd = sprintf('tar -xzf %s -C %s 2>&1', escapeshellarg($storagePath), escapeshellarg($storageTarget));
            @exec($cmd, $out, $ret);
            if ($ret === 0) {
                $log[] = 'Storage public files restored successfully.';
            } else {
                $log[] = 'Storage extract error: ' . implode("\n", $out);
            }
        }

        // 3. Clear Caches
        try {
            \Illuminate\Support\Facades\Artisan::call('cache:clear');
            \Illuminate\Support\Facades\Artisan::call('view:clear');
            $log[] = 'Application view and system cache cleared.';
        } catch (\Throwable $e) {
            $log[] = 'Cache clear note: ' . $e->getMessage();
        }

        Log::info('DemoResetService execution completed.', ['log' => $log]);

        return [
            'success' => true,
            'messages' => $log,
            'timestamp' => now()->toIso8601String(),
        ];
    }
}
