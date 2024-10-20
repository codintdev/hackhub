-- INSERT INTO cart(id, id_producto, user) VALUES
--     (1, 1, "mking");

SELECT p.nombre, p.descripcion, p.precio, p.imagen, users.fullname FROM cart INNER JOIN productos p ON cart.id_producto = p.id INNER JOIN users ON cart.user = users.username WHERE user = "test";
