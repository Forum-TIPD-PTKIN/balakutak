@if(config('demo.enabled', true))
    <!-- Kartu Akun Demo (Modular DemoManager Component) -->
    <div class="mb-5 p-3 rounded-2xl bg-gradient-to-br from-indigo-50/80 via-purple-50/40 to-slate-50 border border-indigo-100 shadow-sm">
        <div class="flex items-center justify-between mb-2">
            <div class="flex items-center gap-2">
                <span class="inline-flex items-center justify-center w-5 h-5 rounded-full bg-indigo-600 text-white text-[10px] font-black shadow-sm">
                    <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M13 10V3L4 14h7v7l9-11h-7z"/></svg>
                </span>
                <span class="text-xs font-black uppercase tracking-wider text-indigo-950">Akses Cepat Akun Demo</span>
            </div>
            <span class="text-[9px] font-semibold text-indigo-600 bg-indigo-100/70 px-2 py-0.5 rounded-full">Klik Akun</span>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-2 text-xs">
            @foreach(config('demo.accounts', []) as $account)
                @php
                    $bulletColor = match($account['color'] ?? 'indigo') {
                        'emerald' => 'bg-emerald-500',
                        'amber' => 'bg-amber-500',
                        'blue' => 'bg-blue-500',
                        default => 'bg-indigo-600',
                    };
                @endphp
                <div onclick="fillDemo('{{ $account['email'] }}', '{{ $account['password'] }}')" 
                     class="p-2.5 rounded-xl bg-white border border-indigo-100 hover:border-indigo-500 hover:shadow-md cursor-pointer transition-all duration-200 active:scale-[0.98]">
                    <div class="flex items-center gap-1.5 mb-0.5">
                        <span class="w-2 h-2 rounded-full {{ $bulletColor }}"></span>
                        <span class="font-bold text-slate-800 text-[11px]">{{ $account['name'] }}</span>
                    </div>
                    <div class="text-[10px] text-slate-500 font-mono truncate">
                        {{ $account['email'] }}
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endif
