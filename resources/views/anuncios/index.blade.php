@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row mb-2">
                    <div class="col-md-6">
                        @if (request()->is('anuncios'))
                            <h1>Anuncios</h1>
                        @else
                            <h1>Mis anuncios</h1>
                        @endif
                    </div>

                    <div class="col-md-6">
                        <form action="{{ route('anuncios.buscar') }}" method="GET">
                            <div class="input-group">
                                <input type="text" class="form-control" name="busqueda" placeholder="Buscar anuncio">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                @if (count($anuncios) > 0)
                    <div class="row">
                        @foreach ($anuncios as $anuncio)
                            @include('partials.card', ['anuncio' => $anuncio])
                        @endforeach
                    </div>
                @else
                    <div class="row">
                        <div class="col-md-12">
                            <h2>No se encontraron resultados</h2>
                        </div>
                    </div>
                @endif

                @include('partials.pagination', ['anuncios' => $anuncios])
            </div>
        </div>
    </div>
@endsection
