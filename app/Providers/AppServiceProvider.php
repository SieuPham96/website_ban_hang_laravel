<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use App\Models\Category;
use App\Components\Recursive;
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $recursive = new Recursive(Category::all());
        $htmlOptionSearchHeader = $recursive->categoryRecursive($parentId = '');
        View::share('htmlOptionSearchHeader', $htmlOptionSearchHeader);
        Schema::defaultStringLength(191);
    }
}
