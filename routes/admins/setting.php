<?php

use Illuminate\Support\Facades\Route;

    // setting
    Route::prefix('setting')->group(function () {
        Route::get('/', [
            'as' => 'setting.index',
            'uses' => 'App\Http\Controllers\SettingAdminController@index',
            'middleware' => 'can:setting-list'
        ]);

        Route::get('/create', [
            'as' => 'setting.create',
            'uses' => 'App\Http\Controllers\SettingAdminController@create',
            'middleware' => 'can:setting-add'
        ]);

        Route::post('/store', [
            'as' => 'setting.store',
            'uses' => 'App\Http\Controllers\SettingAdminController@store'
        ]);

        Route::get('/edit/{id}', [
            'as' => 'setting.edit',
            'uses' => 'App\Http\Controllers\SettingAdminController@edit',
            'middleware' => 'can:setting-edit'
        ]);

        Route::post('/update/{id}', [
            'as' => 'setting.update',
            'uses' => 'App\Http\Controllers\SettingAdminController@update'
        ]);

        Route::get('/delete/{id}', [
            'as' => 'setting.delete',
            'uses' => 'App\Http\Controllers\SettingAdminController@delete',
            'middleware' => 'can:setting-delete'
        ]);
    });