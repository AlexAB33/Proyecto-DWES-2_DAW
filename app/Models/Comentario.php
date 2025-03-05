<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Comentario extends Model
{
    use HasFactory;

    protected $fillable = [
        'anuncio_id',
        'user_id',
        'contenido',
        'nombre'
    ];

    public $timestamps = true;

    public function anuncio()
    {
        return $this->belongsTo(Anuncio::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
