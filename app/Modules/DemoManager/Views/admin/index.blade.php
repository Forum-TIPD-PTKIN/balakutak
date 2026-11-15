@extends('adminlte::page')

@section('title', 'Demo Manager')

@section('content_header')
    <div class="d-flex align-items-center justify-content-between mb-3 mt-2 px-md-3">
        <div>
            <h1 class="m-0 text-dark font-weight-bold">
                <i class="fas fa-magic text-primary mr-2"></i>Demo Manager
            </h1>
            <p class="text-muted small mb-0">Manajemen snapshot, reset sistem instan, dan kontrol akses akun demo</p>
        </div>
        <ol class="breadcrumb float-sm-right bg-transparent p-0 m-0">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item">Pengaturan</li>
            <li class="breadcrumb-item active">Demo Manager</li>
        </ol>
    </div>
@stop

@section('content')
<div class="container-fluid pb-5 px-md-3">

    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show shadow-sm border-0" role="alert" style="border-radius: 12px;">
            <div class="d-flex align-items-center">
                <i class="fas fa-check-circle fa-2x mr-3"></i>
                <div>
                    <h5 class="alert-heading font-weight-bold mb-1">Berhasil Dipulihkan!</h5>
                    <p class="mb-0">{{ session('success') }}</p>
                </div>
            </div>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

    <div class="row">
        <!-- Status Card -->
        <div class="col-lg-4 mb-4">
            <div class="card shadow-sm border-0 h-100" style="border-radius: 16px;">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title font-weight-bold text-dark m-0">
                        <i class="fas fa-info-circle text-info mr-2"></i>Status Lingkungan Demo
                    </h5>
                </div>
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between p-3 mb-3 bg-light rounded-lg" style="border-radius: 12px;">
                        <div>
                            <span class="text-muted small d-block">Status Fitur Demo</span>
                            <span class="font-weight-bold text-dark h6 mb-0">
                                @if($demoEnabled)
                                    <span class="badge badge-success px-3 py-2"><i class="fas fa-check-circle mr-1"></i> AKTIF</span>
                                @else
                                    <span class="badge badge-secondary px-3 py-2"><i class="fas fa-times-circle mr-1"></i> NONAKTIF</span>
                                @endif
                            </span>
                        </div>
                        <i class="fas fa-server fa-2x text-muted opacity-50"></i>
                    </div>

                    <div class="mb-3">
                        <label class="small text-muted font-weight-bold text-uppercase">Snapshot Database (Pristine SQL)</label>
                        <div class="p-2 border rounded bg-white small font-mono d-flex justify-content-between align-items-center">
                            <span>demo-pristine.sql</span>
                            <span class="badge badge-primary">{{ $sqlSize }}</span>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="small text-muted font-weight-bold text-uppercase">Snapshot Storage (Upload & Media)</label>
                        <div class="p-2 border rounded bg-white small font-mono d-flex justify-content-between align-items-center">
                            <span>demo-storage-pristine.tar.gz</span>
                            <span class="badge badge-primary">{{ $storageSize }}</span>
                        </div>
                    </div>

                    <div class="p-3 bg-warning-light border border-warning rounded-lg mb-3" style="background: #fffbeb; border-radius: 12px;">
                        <div class="d-flex align-items-start">
                            <i class="fas fa-clock text-warning mr-2 mt-1"></i>
                            <div class="small text-dark">
                                <strong>Jadwal Auto-Reset:</strong><br>
                                Sistem otomatis di-reset ke kondisi awal setiap hari pukul <strong>04:00 WIB</strong> via server cron.
                            </div>
                        </div>
                    </div>

                    <!-- Tombol Reset Manual -->
                    <form action="{{ route('admin.demo.reset') }}" method="POST" onsubmit="return confirm('APAKAH ANDA YAKIN?\n\nSemua perubahan data uji coba, artikel, atau media baru akan dikembalikan ke kondisi awal snapshot!')">
                        @csrf
                        <button type="submit" class="btn btn-danger btn-block btn-lg shadow font-weight-bold" style="border-radius: 12px;">
                            <i class="fas fa-sync-alt mr-2"></i> Reset ke Demo Awal Sekarang
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Daftar Akun Demo & Log -->
        <div class="col-lg-8">
            <!-- Akun Demo Aktif -->
            <div class="card shadow-sm border-0 mb-4" style="border-radius: 16px;">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title font-weight-bold text-dark m-0">
                        <i class="fas fa-users-cog text-primary mr-2"></i>Akun Demo Aktif (Tampil di Halaman Login)
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-light">
                                <tr>
                                    <th class="px-4 py-3">Nama Peran</th>
                                    <th class="py-3">Email Akun</th>
                                    <th class="py-3">Password Default</th>
                                    <th class="py-3 text-center">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($accounts as $acc)
                                <tr>
                                    <td class="px-4 py-3 font-weight-bold">
                                        <span class="badge badge-pill badge-info px-2 py-1 mr-1">{{ $acc['name'] }}</span>
                                        <div class="small text-muted">{{ $acc['role'] }}</div>
                                    </td>
                                    <td class="py-3 font-mono small font-weight-bold text-primary">{{ $acc['email'] }}</td>
                                    <td class="py-3 font-mono small text-muted">{{ $acc['password'] }}</td>
                                    <td class="py-3 text-center">
                                        <span class="badge badge-success px-2 py-1"><i class="fas fa-check"></i> Siap Pakai</span>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Log Pemulihan Terakhir -->
            <div class="card shadow-sm border-0" style="border-radius: 16px;">
                <div class="card-header bg-white py-3 border-bottom d-flex align-items-center justify-content-between">
                    <h5 class="card-title font-weight-bold text-dark m-0">
                        <i class="fas fa-history text-secondary mr-2"></i>Log Pemulihan & Eksekusi Reset
                    </h5>
                    <span class="badge badge-secondary">30 Baris Terakhir</span>
                </div>
                <div class="card-body p-0">
                    <pre class="m-0 p-3 bg-dark text-success font-mono small rounded-bottom" style="max-height: 250px; overflow-y: auto; font-size: 11px; line-height: 1.5;">@if(!empty($recentLogs))@foreach($recentLogs as $log){{ $log }}
@endforeach @else Log belum tersedia atau file log belum dibuat. @endif</pre>
                </div>
            </div>
        </div>
    </div>
</div>
@stop
