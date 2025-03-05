<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class LimpiarTablas extends Command
{
    protected $signature = 'db:limpiar';
    protected $description = 'Limpia todas las tablas excepto el usuario admin';

    public function handle()
    {
        if ($this->confirm('¿Estás seguro de que quieres borrar todos los datos? Esta acción no se puede deshacer.')) {
            // Desactivar restricciones de clave foránea
            DB::statement('SET FOREIGN_KEY_CHECKS=0');

            // Limpiar tablas
            DB::table('comentarios')->truncate();
            DB::table('anuncios')->truncate();
            DB::table('users')->where('id', '!=', 0)->delete();

            // Reactivar restricciones de clave foránea
            DB::statement('SET FOREIGN_KEY_CHECKS=1');

            $this->info('Todas las tablas han sido limpiadas exitosamente.');
        }
    }
}
