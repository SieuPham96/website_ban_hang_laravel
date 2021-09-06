<?php

use Illuminate\Support\Facades\Route;

    // permission
    Route::prefix('permissions')->group(function () {

        Route::get('/create', [
            'as' => 'permissions.create',
            'uses' => 'App\Http\Controllers\AdminPermissionController@create',
            'middleware' => 'can:permission-add'
        ]);

        Route::post('/store', [
            'as' => 'permissions.store',
            'uses' => 'App\Http\Controllers\AdminPermissionController@store'
        ]);
    });