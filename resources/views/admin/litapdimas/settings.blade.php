@extends('adminlte::page')

@section('title', 'Pengaturan API Litapdimas Kemenag')

@section('content')
<div class="container-fluid pt-3">
    <!-- Header Standar UI CMS -->
    <div class="row mb-3">
        <div class="col-12">
            <div class="card shadow-sm mb-0">
                <div class="card-body py-3 border-left border-primary d-flex justify-content-between align-items-center flex-wrap" style="border-width: 4px !important;">
                    <div>
                        <h3 class="card-title m-0 font-weight-bold text-dark">
                            <i class="fas fa-graduation-cap mr-2 text-primary"></i>Pengaturan Integrasi Litapdimas Kemenag
                        </h3>
                        <div class="text-muted small mt-1">Konfigurasi Kredensial Satker (idreq & keyreq) dan Sinkronisasi Master Data Penelitian</div>
                    </div>
                    <div class="mt-2 mt-md-0">
                        <button id="btn-test-connection" class="btn btn-outline-primary btn-sm rounded-pill px-3 shadow-sm mr-1">
                            <i class="fas fa-plug mr-1"></i> Uji Koneksi API
                        </button>
                        <a href="{{ route('admin.litapdimas.sync-references') }}" class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm">
                            <i class="fas fa-sync-alt mr-1"></i> Sinkron Master Data
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show rounded-lg shadow-sm" role="alert">
            <i class="fas fa-check-circle mr-2"></i> {{ session('success') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show rounded-lg shadow-sm" role="alert">
            <i class="fas fa-exclamation-triangle mr-2"></i> {{ session('error') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
    @endif

    <div class="row">
        <!-- Kolom Form Pengaturan Kredensial -->
        <div class="col-lg-7">
            <div class="card shadow-sm">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title font-weight-bold m-0 text-dark">
                        <i class="fas fa-key text-secondary mr-2"></i>Kredensial API Satker
                    </h5>
                </div>
                <form action="{{ route('admin.litapdimas.settings.update') }}" method="POST">
                    @csrf
                    <div class="card-body">
                        <div class="alert alert-light border border-info mb-4">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-info-circle text-info fa-2x mr-3"></i>
                                <div>
                                    <strong class="text-dark">Dari mana mendapatkan idreq dan keyreq?</strong><br>
                                    <span class="text-muted small">
                                        Login ke portal Litapdimas Kemenag sebagai Admin Satker PT, lalu buka menu: 
                                        <strong>Data & Persetujuan &rarr; Profil Perguruan Tinggi</strong>.
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="satker_name" class="font-weight-bold text-dark">Nama Satker / Perguruan Tinggi</label>
                            <input type="text" name="satker_name" id="satker_name" class="form-control" 
                                   placeholder="Contoh: UIN / IAIN / STAIN / FAI Universitas ..." 
                                   value="{{ old('satker_name', $setting->satker_name) }}">
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="idreq" class="font-weight-bold text-dark">
                                        idreq (ID Satker) <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" name="idreq" id="idreq" class="form-control" 
                                           placeholder="Contoh: 2010" 
                                           value="{{ old('idreq', $setting->idreq) }}" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="satker_code" class="font-weight-bold text-dark">
                                        Kode Satker (6 Digit)
                                    </label>
                                    <input type="text" name="satker_code" id="satker_code" class="form-control" 
                                           placeholder="Contoh: 202006" maxlength="6"
                                           value="{{ old('satker_code', $setting->satker_code) }}">
                                    <small class="text-muted">Pembentuk 15 digit No. Reg.</small>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="font-weight-bold text-dark">Status Modul</label>
                                    <div class="custom-control custom-switch mt-2">
                                        <input type="checkbox" name="is_active" class="custom-control-input" id="is_active" value="1" 
                                               {{ $setting->is_active ? 'checked' : '' }}>
                                        <label class="custom-control-label" for="is_active">Aktifkan API</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="keyreq" class="font-weight-bold text-dark">
                                keyreq (API Token Rahasia) <span class="text-danger">*</span>
                            </label>
                            <div class="input-group">
                                <input type="password" name="keyreq" id="keyreq" class="form-control" 
                                       placeholder="{{ $setting->keyreq ? '******** (Sudah tersimpan aman, biarkan kosong jika tidak diubah)' : 'Masukkan keyreq dari portal Litapdimas...' }}">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button" id="toggle-keyreq">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <small class="text-muted">Disimpan terenkripsi otomatis dengan AES-256 oleh sistem.</small>
                        </div>

                        <div class="form-group mb-0">
                            <label for="base_url" class="font-weight-bold text-dark">Base URL API Litapdimas</label>
                            <input type="url" name="base_url" id="base_url" class="form-control" 
                                   value="{{ old('base_url', $setting->base_url) }}" required>
                        </div>
                    </div>
                    <div class="card-footer bg-light py-3 d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary px-4 shadow-sm">
                            <i class="fas fa-save mr-1"></i> Simpan Pengaturan
                        </button>
                        <a href="{{ route('admin.litapdimas.sync-researchers') }}" class="btn btn-outline-secondary shadow-sm" onclick="return confirm('Tarik data peneliti satker dari server Kemenag?')">
                            <i class="fas fa-users mr-1"></i> Tarik Data Peneliti Satker
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <!-- Kolom Status Master Data & Audit Log -->
        <div class="col-lg-5">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title font-weight-bold m-0 text-dark">
                        <i class="fas fa-database text-secondary mr-2"></i>Status Data Master Tersimpan
                    </h5>
                </div>
                <div class="card-body p-0">
                    <table class="table table-striped table-valign-middle mb-0">
                        <thead class="bg-light">
                            <tr>
                                <th>Kategori Referensi</th>
                                <th class="text-center">Jumlah</th>
                                <th>Update Terakhir</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($refCounts as $rc)
                                <tr>
                                    <td>
                                        <span class="badge badge-light border text-uppercase font-weight-bold">{{ $rc->ref_type }}</span>
                                    </td>
                                    <td class="text-center font-weight-bold text-dark">{{ $rc->count }}</td>
                                    <td class="small text-muted">
                                        {{ $rc->last_sync ? \Carbon\Carbon::parse($rc->last_sync)->diffForHumans() : '-' }}
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="3" class="text-center text-muted py-3">Belum ada master data. Klik "Sinkron Master Data".</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Card Log Sinkronisasi Terkini -->
            <div class="card shadow-sm">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="card-title font-weight-bold m-0 text-dark">
                        <i class="fas fa-history text-secondary mr-2"></i>Audit Trail API Terkini
                    </h5>
                </div>
                <div class="card-body p-0" style="max-height: 250px; overflow-y: auto;">
                    <ul class="list-group list-group-flush small">
                        @forelse($recentLogs as $log)
                            <li class="list-group-item d-flex justify-content-between align-items-center py-2">
                                <div>
                                    <span class="badge badge-{{ $log->status == 'success' ? 'success' : 'danger' }} mr-1">
                                        {{ $log->status }}
                                    </span>
                                    <code class="text-dark">{{ $log->action_type }}</code>
                                </div>
                                <span class="text-muted">{{ $log->created_at->diffForHumans() }}</span>
                            </li>
                        @empty
                            <li class="list-group-item text-center text-muted py-3">Belum ada log aktivitas.</li>
                        @endforelse
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('js')
<script>
    $('#toggle-keyreq').click(function() {
        var input = $('#keyreq');
        var icon = $(this).find('i');
        if (input.attr('type') === 'password') {
            input.attr('type', 'text');
            icon.removeClass('fa-eye').addClass('fa-eye-slash');
        } else {
            input.attr('type', 'password');
            icon.removeClass('fa-eye-slash').addClass('fa-eye');
        }
    });

    $('#btn-test-connection').click(function() {
        var btn = $(this);
        btn.prop('disabled', true).html('<i class="fas fa-spinner fa-spin mr-1"></i> Menghubungkan...');
        $.ajax({
            url: "{{ route('admin.litapdimas.test-connection') }}",
            type: "GET",
            success: function(res) {
                alert(res.message);
                btn.prop('disabled', false).html('<i class="fas fa-plug mr-1"></i> Uji Koneksi API');
            },
            error: function(err) {
                var msg = err.responseJSON ? err.responseJSON.message : 'Koneksi gagal';
                alert('Peringatan: ' + msg);
                btn.prop('disabled', false).html('<i class="fas fa-plug mr-1"></i> Uji Koneksi API');
            }
        });
    });
</script>
@stop
