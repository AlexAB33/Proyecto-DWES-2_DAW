<?php

namespace App\Http\Controllers;

use App\Models\Comentario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ComentarioController extends Controller
{
    public function index($anuncio_id)
    {
        $comentarios = Comentario::where('anuncio_id', $anuncio_id)
                        ->orderBy('created_at', 'desc')
                        ->get();
        return view('anuncios.show', compact('comentarios'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'contenido' => 'required|string|max:255',
            'anuncio_id' => 'required|exists:anuncios,id',
        ]);

        $comentario = new Comentario();
        $comentario->contenido = $request->contenido;
        $comentario->anuncio_id = $request->anuncio_id;
        $comentario->user_id = Auth::id();
        $comentario->created_at = now();
        $comentario->save();

        return redirect()->route('anuncios.show', $request->anuncio_id)
                ->with('success', 'Comentario creado con éxito');
    }

    public function destroy($id)
    {
        $comentario = Comentario::findOrFail($id);
        $comentario->delete();
        return redirect()->route('anuncios.show', $comentario->anuncio_id)
                ->with('success', 'Comentario eliminado con éxito');
    }
}
