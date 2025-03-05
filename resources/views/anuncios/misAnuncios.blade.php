@extends('layouts.app')

@section('content')
    <div class="container">
        <h1>Mis anuncios</h1>
        <div class="row">
            @foreach ($anuncios as $anuncio)
                @include('partials.card', ['anuncio' => $anuncio, 'user_id' => $user_id])
            @endforeach
        </div>

        @include('partials.pagination', ['anuncios' => $anuncios])
    </div>
@endsection
