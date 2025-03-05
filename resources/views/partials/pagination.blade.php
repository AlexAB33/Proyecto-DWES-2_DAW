<div class="d-flex bg-dark justify-content-center my-4">
    <nav aria-label="Navegación de páginas">
        @if ($anuncios->hasPages())
            <ul class="pagination pagination-sm m-0 justify-content-center">
                @if ($anuncios->onFirstPage())
                    <li class="page-item disabled">
                        <span class="page-link bg-dark text-secondary border-secondary">
                            <i class="fas fa-chevron-left"></i>
                        </span>
                    </li>
                @else
                    <li class="page-item">
                        <a class="page-link bg-dark text-white border-secondary" href="{{ $anuncios->previousPageUrl() }}" rel="prev">
                            <i class="fas fa-chevron-left"></i>
                        </a>
                    </li>
                @endif

                @foreach ($anuncios->getUrlRange(1, $anuncios->lastPage()) as $page => $url)
                    @if ($page == $anuncios->currentPage())
                        <li class="page-item active">
                            <span class="page-link bg-primary text-white border-primary">{{ $page }}</span>
                        </li>
                    @else
                        <li class="page-item">
                            <a class="page-link bg-dark text-white border-secondary" href="{{ $url }}">{{ $page }}</a>
                        </li>
                    @endif
                @endforeach

                @if ($anuncios->hasMorePages())
                    <li class="page-item">
                        <a class="page-link bg-dark text-white border-secondary" href="{{ $anuncios->nextPageUrl() }}" rel="next">
                            <i class="fas fa-chevron-right"></i>
                        </a>
                    </li>
                @else
                    <li class="page-item disabled">
                        <span class="page-link bg-dark text-secondary border-secondary">
                            <i class="fas fa-chevron-right"></i>
                        </span>
                    </li>
                @endif
            </ul>
        @endif

        <div class="text-center mt-3">
            <h6>Anuncios del {{ $anuncios->firstItem() }} al {{ $anuncios->lastItem() }} de {{ $anuncios->total() }} anuncios</h6>
        </div>
    </nav>
</div>
