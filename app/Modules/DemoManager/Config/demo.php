<?php

return [
    'enabled' => env('DEMO_MODE', true),

    'accounts' => [
        [
            'role' => 'Super Administrator',
            'name' => 'Super Admin',
            'email' => 'superadmin@prodi.ac.id',
            'password' => 'password',
            'color' => 'indigo',
        ],
        [
            'role' => 'Admin Program Studi',
            'name' => 'Admin Prodi',
            'email' => 'admin@prodi.ac.id',
            'password' => 'password',
            'color' => 'emerald',
        ],
        [
            'role' => 'Editor Konten & Publikasi',
            'name' => 'Editor Konten',
            'email' => 'editor@prodi.ac.id',
            'password' => 'password',
            'color' => 'amber',
        ],
        [
            'role' => 'Dosen / Peneliti',
            'name' => 'Dosen',
            'email' => 'dosen@prodi.ac.id',
            'password' => 'password',
            'color' => 'blue',
        ],
    ],

    'snapshot' => [
        'sql' => base_path('demo-pristine.sql'),
        'storage' => base_path('demo-storage-pristine.tar.gz'),
    ],

    'protected_emails' => [
        'superadmin@prodi.ac.id',
        'admin@prodi.ac.id',
        'editor@prodi.ac.id',
        'dosen@prodi.ac.id',
    ],
];
