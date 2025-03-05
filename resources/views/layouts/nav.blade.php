<nav class="navbar navbar-expand-lg navbar-dark bg-dark border-bottom border-white">
    <div class="container">
        <a class="navbar-brand" href="{{ url('/') }}">
            <img src="{{ asset('img/logo.webp') }}" alt="Logo" width="30" height="30" class="d-inline-block align-text-top me-2 rounded-circle">
            Tablón de anuncios
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Menú -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <!-- Anuncios -->
                <li class="nav-item">
                    <a class="nav-link
                        {{ Route::is('anuncios.index') ? 'active' : '' }}"
                        href="{{ route('anuncios.index') }}">
                            Anuncios
                    </a>
                </li>

                @if (Auth::check() && Auth::user()->id != 0)
                <!-- Mis anuncios -->
                <li class="nav-item">
                    <a class="nav-link
                        {{ Route::is('anuncios.misAnuncios') ? 'active' : '' }}"
                        href="{{ route('anuncios.misAnuncios', ['user_id' => Auth::user()->id]) }}">
                            Mis anuncios
                    </a>
                </li>

                <!-- Publicar -->
                <li class="nav-item">
                    <a class="nav-link
                        {{ Route::is('anuncios.create') ? 'active' : '' }}"
                        href="{{ route('anuncios.create') }}">
                            Publicar
                    </a>
                </li>
                @endif
            </ul>

            <!-- Perfil -->
            <ul class="navbar-nav ms-auto">
                <!-- Links de inicio de sesión y registro -->
                @guest
                    @if (Route::has('login'))
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('login') }}">{{ __('Iniciar sesión') }}</a>
                        </li>
                    @endif

                    @if (Route::has('register'))
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('register') }}">{{ __('Registro') }}</a>
                        </li>
                    @endif
                @else
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            @if (Auth::user()->id == 0)
                                <span class="text-danger">{{ Auth::user()->name }}</span>
                            @else
                                {{ ucfirst(Auth::user()->name) }}
                            @endif
                        </a>

                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="{{ route('logout') }}"
                                onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">
                                {{ __('Cerrar sesión') }}
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                @csrf
                            </form>
                        </div>
                    </li>
                @endguest
            </ul>
        </div>
    </div>
</nav>
