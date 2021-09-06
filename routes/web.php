<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\AdminController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// backend
Route::get('/home', function () {
    return view('home');
});

// Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
//     \UniSharp\LaravelFilemanager\Lfm::routes();
// });

Route::prefix('admin')->group(function () {
    // login, logout
    Route::get('/', [
        'as' => 'admin.login',
        'uses' => 'App\Http\Controllers\AdminController@loginAdmin'
    ]);

    Route::post('/', [
        'as' => 'admin.post-login',
        'uses' => 'App\Http\Controllers\AdminController@postLoginAdmin'
    ]);

    Route::get('/logout', [
        'as' => 'admin.logout',
        'uses' => 'App\Http\Controllers\AdminController@logout'
    ]);

});






