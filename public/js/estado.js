document.addEventListener('DOMContentLoaded', function() {
    const tipoSelect = document.getElementById('tipo');
    const precioInput = document.getElementById('precio');

    // Función para habilitar/deshabilitar el campo de precio
    function actualizarEstadoPrecio() {
        if (tipoSelect.value === '') {
            precioInput.disabled = true;
            precioInput.value = '';
        } else {
            precioInput.disabled = false;
        }
    }

    // Ejecutar al cargar la página
    actualizarEstadoPrecio();

    // Escuchar cambios en el tipo
    tipoSelect.addEventListener('change', function() {
        actualizarEstadoPrecio();
    });
});
