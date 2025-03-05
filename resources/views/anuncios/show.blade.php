@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card bg-dark text-white border-secondary mb-4">
                <div class="card-header bg-secondary d-flex justify-content-between align-items-center">
                    <h3 class="mb-0">{{ $anuncio->titulo }}</h3>
                    @include('partials.badge')
                </div>

                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-md-8">
                            <h5 class="border-bottom pb-2 mb-3">Descripción</h5>
                            <p class="card-text">{{ $anuncio->descripcion }}</p>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-dark text-white border-secondary h-100">
                                <div class="card-header bg-secondary text-center">
                                    <h5 class="mb-0">
                                        Precio
                                    </h5>
                                </div>
                                <div class="card-body d-flex align-items-center justify-content-center">
                                    <h3 class="text-center mb-0 {{ $anuncio->precio ? 'text-warning' : 'text-muted' }}">
                                        @include('partials.showPrice')
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <h5 class="border-bottom pb-2 mb-3">Información del anuncio</h5>
                            <table class="table table-dark table-bordered table-hover">
                                <tbody>
                                    <tr>
                                        <th class="w-25">ID</th>
                                        <td>{{ $anuncio->id }}</td>
                                    </tr>
                                    <tr>
                                        <th>Publicado por</th>
                                        <td>{{ $anuncio->user->name }}</td>
                                    </tr>
                                    <tr>
                                        <th>Contacto</th>
                                        <td>
                                            <div><b>Email:</b> {{ $anuncio->email }}</div>
                                            <div><b>Teléfono:</b> {{ $anuncio->telefono }}</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Fecha de publicación</th>
                                        <td>{{ $anuncio->created_at->format('d/m/Y H:i') }}</td>
                                    </tr>
                                    <tr>
                                        <th>Última actualización</th>
                                        <td>{{ $anuncio->updated_at->format('d/m/Y H:i') }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="card-footer bg-dark border-secondary d-flex justify-content-between">
                    <div>
                        <a href="{{ route('anuncios.index') }}" class="btn btn-secondary">
                            <i class="fas fa-arrow-left me-1"></i>Volver
                        </a>
                    </div>
                    <div>
                        @if(Auth::check() && (Auth::id() == $anuncio->user_id || Auth::id() == 0))
                            <a href="{{ route('anuncios.edit', $anuncio->id) }}" class="btn btn-warning me-2">
                                <i class="fas fa-edit me-1"></i> Editar
                            </a>
                            <form action="{{ route('anuncios.destroy', $anuncio->id) }}" method="POST" class="d-inline">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este anuncio?')">
                                    <i class="fas fa-trash me-1"></i> Eliminar
                                </button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>

            @include('partials.comments')
        </div>
    </div>
</div>
@endsection
