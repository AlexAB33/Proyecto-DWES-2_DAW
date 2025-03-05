@if(Auth::check() && Auth::user()->id != 0)
<div class="card bg-dark text-white border-secondary mb-4">
    <div class="card-header bg-secondary">
        <h4 class="mb-0">
            <i class="fas fa-pen me-2"></i>
            Añadir comentario
        </h4>
    </div>
    <div class="card-body">
        <form action="{{ route('comentarios.store') }}" method="POST">
            @csrf
            <input type="hidden" name="anuncio_id" value="{{ $anuncio->id }}">
            <div class="mb-3">
                <textarea class="form-control bg-dark text-white border-secondary"
                            id="contenido" name="contenido" rows="3"
                            placeholder="Escribe tu comentario aquí..." required></textarea>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-paper-plane me-1"></i> Enviar
                </button>
            </div>
        </form>
    </div>
</div>
@else
@if(Auth::user()->id != 0)
<div class="card bg-dark text-white border-secondary mb-4">
    <div class="card-body text-center py-3">
        <p class="mb-0">
            <i class="fas fa-lock me-1"></i>
            Para dejar un comentario, debes
            <a href="{{ route('login') }}" class="text-info">iniciar sesión</a> o
            <a href="{{ route('register') }}" class="text-info">registrarte</a>.
        </p>
    </div>
</div>
@endif
@endif

<div class="card bg-dark text-white border-secondary mb-4 shadow">
    <div class="card-header bg-secondary d-flex justify-content-between align-items-center">
        <h4 class="mb-0">
            <i class="fas fa-comments me-2"></i>
            Comentarios <span class="badge bg-primary rounded-pill">{{ count($anuncio->comentarios) }}</span>
        </h4>
    </div>

    <div class="card-body p-0">
        @if(count($anuncio->comentarios) > 0)
            <div class="list-group list-group-flush">
                @foreach($anuncio->comentarios as $comentario)
                <div class="list-group-item bg-dark text-white border-secondary p-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h6 class="mb-0">
                            <i class="fas fa-user-circle me-2 text-primary"></i>
                            <strong>{{ $comentario->user->name }}</strong>
                        </h6>
                        <small class="small">
                            <i class="far fa-clock me-1"></i>
                            {{ $comentario->created_at->format('d/m/Y H:i:s') }}
                        </small>
                    </div>

                    <div class="card border-secondary bg-dark p-3 mb-0">
                        <p class="text-white mb-0">{{ $comentario->contenido }}</p>

                        @if(Auth::user()->id == $comentario->user_id || Auth::user()->id == 0)
                            <form action="{{ route('comentarios.destroy', $comentario->id) }}" method="POST">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm float-end" onclick="return confirm('¿Estás seguro de eliminar este comentario?')">
                                    <i class="fas fa-trash me-1"></i> Eliminar
                                </button>
                            </form>
                        @endif
                    </div>
                </div>
                @endforeach
            </div>
        @else
            <div class="text-center py-5">
                <i class="far fa-comment-dots fa-3x mb-3 text-muted"></i>
                <p class="mb-0">No hay comentarios todavía</p>
            </div>
        @endif
    </div>
</div>
