// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
        }

        form.classList.add('was-validated')
        }, false)
    })

    document.addEventListener('DOMContentLoaded', function() {
        const tipoSelect = document.getElementById('tipo');
        const precioInput = document.getElementById('precio');
        const precioFeedback = precioInput ? precioInput.nextElementSibling : null;

        if (tipoSelect && precioInput && precioFeedback) {
            const validarPrecio = () => {
                if (tipoSelect.value === 'compra' || tipoSelect.value === 'venta') {
                    if (precioInput.value === '') {
                        precioInput.setCustomValidity('El precio es obligatorio');
                        precioFeedback.textContent = 'El precio es obligatorio';
                    } else if (parseFloat(precioInput.value) < 1) {
                        precioInput.setCustomValidity('El precio debe ser mínimo 1€');
                        precioFeedback.textContent = 'El precio debe ser mínimo 1€';
                    } else {
                        precioInput.setCustomValidity('');
                    }
                } else {
                    precioInput.setCustomValidity('');
                    precioInput.value = '';
                }
            };

            tipoSelect.addEventListener('change', validarPrecio);
            precioInput.addEventListener('input', validarPrecio);
            precioInput.addEventListener('change', validarPrecio);
        }
    });
})()
