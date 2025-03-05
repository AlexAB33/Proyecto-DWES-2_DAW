<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\AnuncioController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ComentarioController;

Route::get('/', function () {
    return Auth::check() ? redirect()->route('home') : view('auth.login');
});

Auth::routes();

Route::get('/anuncios', [AnuncioController::class, 'index'])->name('anuncios.index');

Route::get('/nuevoAnuncio', [AnuncioController::class, 'create'])->name('anuncios.create');
Route::post('/nuevoAnuncio', [AnuncioController::class, 'store'])->name('anuncios.store');

Route::get('/anuncios/{id}', [AnuncioController::class, 'show'])->name('anuncios.show');

Route::get('/misAnuncios', [AnuncioController::class, 'index'])->name('anuncios.misAnuncios');

Route::get('/anuncios/{id}/editar', [AnuncioController::class, 'edit'])->name('anuncios.edit');

Route::put('/anuncios/{id}', [AnuncioController::class, 'update'])->name('anuncios.update');

Route::delete('/anuncios/{id}', [AnuncioController::class, 'destroy'])->name('anuncios.destroy');

Route::post('/anuncios/{id}', [ComentarioController::class, 'store'])->name('comentarios.store');

Route::get('/buscar', [AnuncioController::class, 'buscar'])->name('anuncios.buscar');

Route::post('/comentarios', [ComentarioController::class, 'store'])->name('comentarios.store');

Route::delete('/comentarios/{id}', [ComentarioController::class, 'destroy'])->name('comentarios.destroy');

Route::get('/home', [HomeController::class, 'index'])->name('home');
