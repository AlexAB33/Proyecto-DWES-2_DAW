<?php

namespace App\Http\Controllers;

use App\Models\Anuncio;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AnuncioController extends Controller
{
    // Método para listar todos los anuncios
    public function index(Request $request)
    {
        // Obtener el user_id de la consulta
        $user_id = $request->user_id;
        $esAdmin = Auth::check() && Auth::id() === 0;

        if ($user_id) {
            $anuncios = Anuncio::where('user_id', $user_id)->orderBy('created_at', 'desc')->paginate(21);
            $mostrarControles = (Auth::id() == $user_id) || $esAdmin;
            return view('anuncios.index', compact('anuncios', 'mostrarControles', 'esAdmin'));
        } else {
            $anuncios = Anuncio::orderBy('created_at', 'desc')->paginate(21);
            return view('anuncios.index', compact('anuncios', 'esAdmin'));
        }
    }

    // Método para mostrar el formulario de creación de un nuevo anuncio
    public function create()
    {
        return view('anuncios.create');
    }

    // Método para almacenar un nuevo anuncio
    public function store(Request $request)
    {
        // Validar los datos del formulario
        $request->validate([
            'titulo' => 'required|string|max:50',
            'descripcion' => 'required|string|max:2000',
            'precio' => 'required_if:tipo,compra,venta|nullable|numeric|min:1',
            'email' => 'required|email|max:50',
            'telefono' => 'required|digits:9',
            'tipo' => 'nullable|in:compra,venta',
        ]);

        // Crear el anuncio
        $anuncio = new Anuncio();
        $anuncio->fill($request->all());
        $anuncio->user_id = Auth::id();
        $anuncio->save();

        return redirect()->route('anuncios.index')->with('success', 'Anuncio creado con éxito');
    }

    // Método para mostrar un anuncio específico
    public function show($id)
    {
        $anuncio = Anuncio::with(['comentarios.user'])->findOrFail($id);
        $esAdmin = Auth::check() && Auth::id() === 0;
        return view('anuncios.show', compact('anuncio', 'esAdmin'));
    }

    // Método para mostrar el formulario de edición de un anuncio
    public function edit($id)
    {
        $anuncio = Anuncio::findOrFail($id); // Obtener el anuncio por ID

        // Verificar si el usuario actual es el dueño o es admin
        if (Auth::id() != $anuncio->user_id && Auth::id() !== 0) {
            return redirect()->route('anuncios.index')->with('error', 'No tienes permiso para editar este anuncio');
        }

        return view('anuncios.edit', compact('anuncio'));
    }

    // Método para actualizar un anuncio existente
    public function update(Request $request, $id)
    {
        $anuncio = Anuncio::findOrFail($id);

        // Verificar si el usuario actual es el dueño o es admin
        if (Auth::id() != $anuncio->user_id && Auth::id() !== 0) {
            return redirect()->route('anuncios.index')->with('error', 'No tienes permiso para actualizar este anuncio');
        }

        $request->validate([
            'titulo' => 'required|string|max:50',
            'descripcion' => 'required|string|max:2000',
            'precio' => 'required_if:tipo,compra,venta|nullable|numeric|min:1',
            'email' => 'required|email|max:50',
            'telefono' => 'required|digits:9',
            'tipo' => 'nullable|in:compra,venta',
        ]);

        $anuncio->fill($request->all());
        $anuncio->user_id = Auth::id();
        $anuncio->save();

        return redirect()->route('anuncios.index')->with('success', 'Anuncio actualizado con éxito.');
    }

    // Método para eliminar un anuncio
    public function destroy($id)
    {
        $anuncio = Anuncio::findOrFail($id);

        // Verificar si el usuario actual es el dueño o es admin
        if (Auth::id() != $anuncio->user_id && Auth::id() !== 0) {
            return redirect()->route('anuncios.index')->with('error', 'No tienes permiso para eliminar este anuncio');
        }

        $anuncio->delete();
        return redirect()->route('anuncios.index')->with('success', 'Anuncio eliminado con éxito.');
    }

    // Método para ver los anuncios de un usuario específico
    public function misAnuncios($user_id)
    {
        $anuncios = Anuncio::where('user_id', $user_id)
                        ->orderBy('created_at', 'desc')
                        ->paginate(21);

        $esAdmin = Auth::check() && Auth::id() === 0;
        $mostrarControles = (Auth::id() == $user_id) || $esAdmin;

        return view('anuncios.misAnuncios', compact('anuncios', 'user_id', 'mostrarControles', 'esAdmin'));
    }

    public function buscar(Request $request)
    {
        $busqueda = $request->input('busqueda');
        $anuncios = Anuncio::where('titulo', 'like', "%$busqueda%")
                        ->orderBy('created_at', 'desc')
                        ->paginate(21);

        return view('anuncios.index', compact('anuncios'));
    }
}
