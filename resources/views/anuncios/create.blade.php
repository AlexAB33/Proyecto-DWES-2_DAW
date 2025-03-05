@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Crear anuncio</h1>

                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form action="{{ route('anuncios.store') }}" method="POST" class="needs-validation" novalidate>
                    @csrf
                    @method('POST')
                    <div class="row">
                        <!-- Titulo -->
                        <div class="form-group col-md-8 mb-3">
                            <label for="titulo">Titulo *</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" required>
                            <div class="invalid-feedback">
                                El título es obligatorio.
                            </div>
                        </div>

                        <!-- Tipo -->
                        <div class="form-group col-md-2 mb-3">
                            <label for="tipo">Tipo (opcional)</label>
                            <select class="form-control" id="tipo" name="tipo">
                                <option value="">Seleccione una opción</option>
                                <option value="compra">Compra</option>
                                <option value="venta">Venta</option>
                            </select>
                        </div>

                        <!-- Precio -->
                        <div class="form-group col-md-2 mb-3">
                            <label for="precio">Precio</label>
                            <input type="number" class="form-control" id="precio" name="precio" min="1" step="0.01">
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Descripcion -->
                        <div class="form-group mb-3">
                            <label for="descripcion">Descripcion *</label>
                            <textarea class="form-control" id="descripcion" rows="4" name="descripcion" required></textarea>
                            <div class="invalid-feedback">
                                La descripción es obligatoria.
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Email -->
                        <div class="form-group col-md-6 mb-3">
                            <label for="email">Email *</label>
                            <input type="email" class="form-control" id="email" name="email" value="{{ Auth::user()->email }}" required>
                            <div class="invalid-feedback">
                                Ingrese un email válido.
                            </div>
                        </div>

                        <!-- Telefono -->
                        <div class="form-group col-md-6 mb-3">
                            <label for="telefono">Telefono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" maxlength="9" pattern="[0-9]{9}" required>
                            <div class="invalid-feedback">
                                El teléfono debe tener 9 dígitos numéricos.
                            </div>
                        </div>
                    </div>

                    <!-- Botones -->
                    <div class="row mt-3">
                        <div class="form-group col-md-4">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-plus"></i> Crear
                            </button>
                        </div>

                        <div class="form-group col-md-4">
                            <button type="reset" class="btn btn-danger w-100">
                                <i class="fas fa-eraser"></i> Limpiar
                            </button>
                        </div>

                        <div class="form-group col-md-4">
                            <a href="{{ route('anuncios.index') }}" class="btn btn-secondary w-100">
                                <i class="fas fa-times"></i> Cancelar
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="{{ asset('js/estado.js') }}"></script>
    <script src="{{ asset('js/validation.js') }}"></script>
@endsection
