function eliminarProducto(id) {
    const modal = document.getElementById('modal-eliminar');
    const mensajeEliminar = document.getElementById('mensaje-eliminar');
    modal.style.display = 'block';
    document.getElementById('confirmar-eliminar').addEventListener('click', function() {
        if (id) {
            fetch(`/productos/eliminar/${id}`, {
            method: 'DELETE',
            })
            .then(response => {
                document.getElementById('confirmar-eliminar').style.display = 'none';
                document.getElementById('cancelar-eliminar').style.display = 'none';
                mensajeEliminar.style.display = 'block';
                mensajeEliminar.textContent = 'Producto eliminado exitosamente!';
                setTimeout(() => {
                    modal.style.display = 'none';
                    location.reload();
                }, 2000);
            })
            .catch(error => console.error('Error:', error));
        }
    });
}

function cancelar() {
    fetch('/productos')
        .then(response => {
            document.getElementById('modal-eliminar').style.display = 'none';
            location.reload();
        })
}
      
