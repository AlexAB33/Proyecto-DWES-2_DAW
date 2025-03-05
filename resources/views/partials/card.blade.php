<div class="col-lg-4 col-md-6 mb-4">
    <div class="card h-100 bg-dark text-white border-secondary" style="min-height: 230px;">
        <div class="card-header bg-secondary d-flex justify-content-between align-items-center">
            <h5 class="card-title mb-0 text-truncate" style="max-width: 80%;">
                {{ $anuncio->titulo }}
            </h5>
            @include('partials.badge')
        </div>

        <div class="card-body d-flex flex-column">
            <div class="d-flex justify-content-between align-items-center mb-2 w-100">
                <span class="small">
                    <h6 class="text-decoration-underline">Descripción</h6>
                </span>

                <h6 class="card-subtitle text-warning mb-0">
                    @include('partials.showPrice')
                </h6>
            </div>

            <p class="card-text mb-3 text-truncate-3">
                {{ $anuncio->descripcion }}
            </p>

            <div class="mt-auto d-flex justify-content-between align-items-center">
                <span class="small">
                    <a href="{{ route('anuncios.index', ['user_id' => $anuncio->user->id]) }}" class="text-decoration-none text-white">
                        <i class="fas fa-user me-1"></i> {{ $anuncio->user->name }} -
                    </a>
                    <small class="small">
                        {{ $anuncio->created_at->format('d/m/Y H:i') }}
                    </small>
                </span>
                <a href="{{ route('anuncios.show', $anuncio->id) }}" class="btn btn-sm btn-primary">
                    <i class="fas fa-eye me-1"></i> Ver más
                </a>
            </div>
        </div>
    </div>
</div>
