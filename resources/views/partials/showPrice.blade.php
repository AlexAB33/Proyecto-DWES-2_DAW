@if($anuncio->tipo == null)
    Sin precio
@else
    {{ $anuncio->precio . ' €' }}
@endif
