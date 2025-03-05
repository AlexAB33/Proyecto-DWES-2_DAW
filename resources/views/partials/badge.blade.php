<span class="badge rounded-pill
    @if($anuncio->tipo == 'venta')
        bg-danger
    @elseif($anuncio->tipo == 'compra')
        bg-success
    @else
        bg-primary
    @endif
">
    {{ ucfirst($anuncio->tipo ? $anuncio->tipo : 'General') }}
</span>
