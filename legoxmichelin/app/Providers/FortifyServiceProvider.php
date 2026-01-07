<?php
namespace App\Providers;

use Laravel\Fortify\Fortify;
use App\Actions\Fortify\CreateNewUser;
use Illuminate\Support\ServiceProvider;
use Laravel\Fortify\Contracts\CreatesNewUsers;

class FortifyServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->singleton(
            CreatesNewUsers::class,
            CreateNewUser::class
        );
    }

    public function boot(): void
    {
        Fortify::loginView(function () {
        return view('auth.login');
        });

        Fortify::registerView(function () {
            return view('auth.register');
        });
    }
}