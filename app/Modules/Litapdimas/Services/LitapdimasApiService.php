<?php

namespace App\Modules\Litapdimas\Services;

use App\Modules\Litapdimas\Models\LitapdimasSetting;
use App\Modules\Litapdimas\Models\LitapdimasSyncLog;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class LitapdimasApiService
{
    protected string $baseUrl;
    protected string $idreq;
    protected string $keyreq;
    protected int $timeout;

    public function __construct()
    {
        $setting = LitapdimasSetting::where('is_active', true)->first();

        $this->baseUrl = $setting?->base_url ?: config('litapdimas.base_url', 'https://litapdimas.kemenag.go.id/index.php/api');
        $this->idreq = $setting?->idreq ?: (string) config('litapdimas.idreq', '');
        $this->keyreq = $setting?->keyreq ?: (string) config('litapdimas.keyreq', '');
        $this->timeout = config('litapdimas.timeout', 30);
    }

    /**
     * Kirim GET request ke Litapdimas
     */
    public function get(string $endpoint, array $queryParams = [], bool $restricted = false, ?int $proposalId = null): array
    {
        $url = rtrim($this->baseUrl, '/') . '/' . ltrim($endpoint, '/');

        if ($restricted) {
            $queryParams['idreq'] = $this->idreq;
            $queryParams['keyreq'] = $this->keyreq;
        }

        try {
            $response = Http::timeout($this->timeout)->get($url, $queryParams);
            $json = $response->json() ?? [];

            $this->logSync(
                actionType: 'GET ' . $endpoint,
                endpoint: $url,
                payload: $this->maskCredentials($queryParams),
                responseCode: $response->status(),
                responseBody: $response->body(),
                status: $response->successful() && (($json['status'] ?? null) == '1') ? 'success' : 'failed',
                proposalId: $proposalId
            );

            return $json;
        } catch (\Exception $e) {
            Log::error('Litapdimas GET error: ' . $e->getMessage(), ['endpoint' => $endpoint]);
            $this->logSync(
                actionType: 'GET ' . $endpoint,
                endpoint: $url,
                payload: $this->maskCredentials($queryParams),
                responseCode: 500,
                responseBody: $e->getMessage(),
                status: 'failed',
                proposalId: $proposalId
            );

            return [
                'status' => '0',
                'message' => $e->getMessage(),
                'data' => [],
            ];
        }
    }

    /**
     * Kirim POST request ke Litapdimas
     */
    public function post(string $endpoint, array $data = [], bool $restricted = true, ?int $proposalId = null): array
    {
        $url = rtrim($this->baseUrl, '/') . '/' . ltrim($endpoint, '/');

        if ($restricted) {
            $data['idreq'] = $this->idreq;
            $data['keyreq'] = $this->keyreq;
        }

        try {
            $response = Http::asForm()->timeout($this->timeout)->post($url, $data);
            $json = $response->json() ?? [];

            $this->logSync(
                actionType: 'POST ' . $endpoint,
                endpoint: $url,
                payload: $this->maskCredentials($data),
                responseCode: $response->status(),
                responseBody: $response->body(),
                status: $response->successful() && (($json['status'] ?? null) == '1') ? 'success' : 'failed',
                proposalId: $proposalId
            );

            return $json;
        } catch (\Exception $e) {
            Log::error('Litapdimas POST error: ' . $e->getMessage(), ['endpoint' => $endpoint]);
            $this->logSync(
                actionType: 'POST ' . $endpoint,
                endpoint: $url,
                payload: $this->maskCredentials($data),
                responseCode: 500,
                responseBody: $e->getMessage(),
                status: 'failed',
                proposalId: $proposalId
            );

            return [
                'status' => '0',
                'message' => $e->getMessage(),
            ];
        }
    }

    /**
     * Sensor kredensial sensitif pada database audit log
     */
    protected function maskCredentials(array $data): array
    {
        if (isset($data['keyreq'])) {
            $data['keyreq'] = substr($data['keyreq'], 0, 4) . '****' . substr($data['keyreq'], -4);
        }
        return $data;
    }

    /**
     * Simpan jejak audit sinkronisasi
     */
    protected function logSync(string $actionType, string $endpoint, array $payload, int $responseCode, string $responseBody, string $status, ?int $proposalId = null): void
    {
        try {
            LitapdimasSyncLog::create([
                'action_type' => $actionType,
                'proposal_id' => $proposalId,
                'endpoint' => $endpoint,
                'request_payload' => $payload,
                'response_code' => $responseCode,
                'response_body' => mb_strimwidth($responseBody, 0, 5000, '... (truncated)'),
                'status' => $status,
            ]);
        } catch (\Exception $e) {
            Log::warning('Gagal mencatat log sinkronisasi Litapdimas: ' . $e->getMessage());
        }
    }
}
