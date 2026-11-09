<?php

namespace App\Modules\Litapdimas\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\Litapdimas\Models\LitapdimasReference;
use App\Modules\Litapdimas\Models\LitapdimasSetting;
use App\Modules\Litapdimas\Models\LitapdimasSyncLog;
use App\Modules\Litapdimas\Services\LitapdimasApiService;
use App\Modules\Litapdimas\Services\ReferenceSyncService;
use App\Modules\Litapdimas\Services\ResearcherSyncService;
use Illuminate\Http\Request;

class LitapdimasSettingController extends Controller
{
    public function index()
    {
        $setting = LitapdimasSetting::first() ?? new LitapdimasSetting([
            'base_url' => 'https://litapdimas.kemenag.go.id/index.php/api',
            'is_active' => true,
        ]);

        $refCounts = LitapdimasReference::groupBy('ref_type')
            ->selectRaw('ref_type, count(*) as count, max(last_synced_at) as last_sync')
            ->get();

        $recentLogs = LitapdimasSyncLog::latest()->take(10)->get();

        return view('admin.litapdimas.settings', compact('setting', 'refCounts', 'recentLogs'));
    }

    public function update(Request $request)
    {
        $validated = $request->validate([
            'satker_name' => 'nullable|string|max:255',
            'satker_code' => 'nullable|string|max:20',
            'idreq' => 'nullable|string|max:50',
            'keyreq' => 'nullable|string|max:255',
            'base_url' => 'required|url',
            'is_active' => 'boolean',
        ]);

        $validated['is_active'] = $request->has('is_active');

        $setting = LitapdimasSetting::first();
        if ($setting) {
            // Jika keyreq dikosongkan saat update, pertahankan yang lama
            if (empty($validated['keyreq'])) {
                unset($validated['keyreq']);
            }
            $setting->update($validated);
        } else {
            LitapdimasSetting::create($validated);
        }

        return redirect()->route('admin.litapdimas.settings')
            ->with('success', 'Pengaturan API Litapdimas Satker berhasil disimpan!');
    }

    public function testConnection(LitapdimasApiService $apiService)
    {
        $res = $apiService->get('ref_status');

        if (($res['status'] ?? null) == '1') {
            return response()->json([
                'status' => 'success',
                'message' => 'Koneksi ke Server API Litapdimas Kemenag Berhasil!',
                'data' => $res,
            ]);
        }

        return response()->json([
            'status' => 'error',
            'message' => 'Gagal terhubung ke API Litapdimas: ' . ($res['message'] ?? 'Unknown Error'),
        ], 400);
    }

    public function syncReferences(ReferenceSyncService $syncService)
    {
        try {
            $syncService->syncRefStatus();
            $syncService->syncRefArkan();
            $syncService->syncRefSubArkan();
            $syncService->syncBidangIlmu();
            $syncService->syncLuaran();
            $syncService->syncPeriodeUpdate();
            $syncService->syncKategori((int) date('Y'));

            return redirect()->route('admin.litapdimas.settings')
                ->with('success', 'Sinkronisasi Master Referensi Litapdimas Berhasil!');
        } catch (\Exception $e) {
            return redirect()->route('admin.litapdimas.settings')
                ->with('error', 'Gagal sinkronisasi referensi: ' . $e->getMessage());
        }
    }

    public function syncResearchers(ResearcherSyncService $researcherService)
    {
        $result = $researcherService->syncSatkerResearchers();

        if ($result['status']) {
            return redirect()->route('admin.litapdimas.settings')
                ->with('success', "Berhasil menarik {$result['total_fetched']} peneliti satker. Dosen tercocokkan: {$result['matched_count']}.");
        }

        return redirect()->route('admin.litapdimas.settings')
            ->with('error', "Gagal menarik data peneliti: " . ($result['message'] ?? 'Pastikan idreq dan keyreq sudah benar.'));
    }
}
