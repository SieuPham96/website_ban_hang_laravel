<?php

namespace App\Providers;

use Closure;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Contracts\Foundation\CachesRoutes;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Routing\Route as RoutingRoute;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * The path to the "home" route for your application.
     *
     * This is used by Laravel authentication to redirect users after login.
     *
     * @var string
     */
    public const HOME = '/home';

    /**
     * The controller namespace for the application.
     *
     * When present, controller route declarations will automatically be prefixed with this namespace.
     *
     * @var string|null
     */
    // protected $namespace = 'App\Http\Controllers';

    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        $this->configureRateLimiting();

        $this->routes(function () {
            Route::prefix('api')
                ->middleware('api')
                ->namespace($this->namespace)
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/web.php'));

            // Admin category route
            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/admins/category.php'));
                
            // Admin menu route
            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/admins/menu.php'));
            
            // Admin product route
            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/admins/product.php'));

            // Admin slider route
            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/admins/slider.php'));

            // Admin setting route
            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/admins/setting.php'));

            // Admin user route
            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/admins/user.php'));

            // Admin role route
            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/admins/role.php'));

            // Admin permission route
            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/admins/permission.php'));

        });
    }

    /**
     * Configure the rate limiters for the application.
     *
     * @return void
     */
    protected function configureRateLimiting()
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(60)->by(optional($request->user())->id ?: $request->ip());
        });
    }
}
