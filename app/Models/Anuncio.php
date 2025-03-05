<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Anuncio extends Model
{
    protected $fillable = [
        'titulo',
        'descripcion',
        'precio',
        'nombre',
        'apellidos',
        'email',
        'telefono',
        'tipo',
        'user_id'
    ];

    public $timestamps = true;

    public function setPrecioAttribute($precio)
    {
        if ($precio === '' || $precio === null) {
            $this->attributes['precio'] = null;
        } else {
            $this->attributes['precio'] = str_replace(',', '.', $precio);
        }
    }

    public function getPrecioAttribute($precio)
    {
        return number_format($precio, 2, ',', '.');
    }

    public function comentarios()
    {
        return $this->hasMany(Comentario::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
