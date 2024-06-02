/*
-- Query: SELECT * FROM dreamtravel.destinos
LIMIT 0, 1000

-- Date: 2024-05-28 04:30
*/
#SCRIPT PARA POBLAR LA BASE CON LOS DATOS DE TRABAJO
#1º SELECCIONAMOS LA BASE
use dreamtravel;

#2º INSERTAMOS LOS DATOS DE LAS CATEGORIAS
INSERT INTO categorias(`id_categoria`,`nombreCategoria`)VALUES (NULL, 'Nacional');
INSERT INTO categorias(`id_categoria`,`nombreCategoria`)VALUES (NULL, 'Internacional');

#3º INSERTAMOS LOS DATOS DE LOS METODOS DE PAGO
INSERT INTO metodo_pago(`id_metodoPago`,`nombrePago`)VALUES (NULL, 'Tarjeta');
INSERT INTO metodo_pago(`id_metodoPago`,`nombrePago`)VALUES (NULL, 'Efectivo');

#4º INSERTAMOS LOS DESTINOS
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'San Carlos de Bariloche',450,'2024-08-05 06:00:00.000000',20,1,1,'Paisajes majestuosos, lagos cristalinos, montañas imponentes, chocolate artesanal, esquí de clase mundial y encanto alpino.','https://imgur.com/lkLUUVP');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Villa Carlos Paz',360,'2024-07-19 18:00:00.000000',20,1,1,'Lago, teatro, naturaleza, diversión, espectáculos, sierras, tranquilidad, gastronomía, balnearios, entretenimiento y relax.','https://imgur.com/eueFEH0');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Necochea',360,'2024-09-25 06:00:00.000000',20,1,1,'Playas extensas, paseos costeros, faro histórico, pesca deportiva, tranquilidad, dunas imponentes, atardeceres espectaculares.','https://imgur.com/fmOTpCr');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Monte Hermoso',320,'2024-06-20 12:30:00.000000',5,1,1,'Playas de arenas doradas, bosques de pinos, reserva natural, actividades acuáticas, descanso, sol, familia, paz, naturaleza.','https://imgur.com/sHquW2b');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Pehuenco',300,'2024-10-02 06:00:00.000000',10,1,1,'Extensas dunas doradas, pinos y acacias. Experiencia única para los amantes de la naturaleza y la serenidad.','https://imgur.com/ziN8JzS');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Glaciar Perito Moreno',450,'2024-07-21 06:00:00.000000',15,1,1,'Majestuosa masa de hielo, imponente belleza natural, aventura glaciar, turquesa resplandeciente, paisaje patagónico Ãºnico.','https://imgur.com/TcZyLCP');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Buzios',850,'2024-08-02 18:00:00.000000',15,2,1,'Playas paradisíacas, aguas cristalinas, encanto bohemio, gastronomía exquisita, actividades acuáticas, arte y cultura.','https://imgur.com/kcJGrj2');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Camboriú',950,'2024-08-02 18:00:00.000000',15,2,1,'Playas extensas, moderna infraestructura turística, vida nocturna animada, gastronomía diversa, relax.','https://imgur.com/JQhfiRZ');

#5º ACTUALIZACION DE DESTINOS (IMAGENES AGREGADAS) SOLO SI EL PASO 4 SE CREÓ SIN LINK DE IMAGENES,CASO CONTRARIO PASAR AL PASO 6
UPDATE destinos SET image = 'https://imgur.com/lkLUUVP' WHERE id_destino = 1;
UPDATE destinos SET image = 'https://imgur.com/eueFEH0' WHERE id_destino = 2;
UPDATE destinos SET image = 'https://imgur.com/fmOTpCr' WHERE id_destino = 3;
UPDATE destinos SET image = 'https://imgur.com/sHquW2b' WHERE id_destino = 4;
UPDATE destinos SET image = 'https://imgur.com/ziN8JzS' WHERE id_destino = 5;
UPDATE destinos SET image = 'https://imgur.com/TcZyLCP' WHERE id_destino = 6;
UPDATE destinos SET image = 'https://imgur.com/kcJGrj2' WHERE id_destino = 7;
UPDATE destinos SET image = 'https://imgur.com/JQhfiRZ' WHERE id_destino = 8;

#6º INSERTAMOS NOSOTROS
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`rol`,`github`,`linkedin`,`imagen`) VALUES (NULL,'Cantarino, Emmanuel', 'Full Stack', 'https://github.com/MaxiCantarino','https://www.linkedin.com/','https://imgur.com/hP7sdsS');
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`rol`,`github`,`linkedin`,`imagen`) VALUES (NULL,'Cascallares, Facundo', 'Full Stack', 'https://github.com/FacundoCascallares','https://www.linkedin.com/','https://imgur.com/hP7sdsS');
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`rol`,`github`,`linkedin`,`imagen`) VALUES (NULL,'Fernandez, Claudio Ranses', 'Full Stack', 'https://github.com/ccrrff2014','https://www.linkedin.com/','https://imgur.com/hP7sdsS');
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`rol`,`github`,`linkedin`,`imagen`) VALUES (NULL,'González, Natalia', 'Full Stack', 'https://github.com/Natalia24v','https://www.linkedin.com/','https://imgur.com/Qxcj00Z');
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`rol`,`github`,`linkedin`,`imagen`) VALUES (NULL,'Navarrete, Romina Gabriela', 'Full Stack', 'https://github.com/rominarg','https://www.linkedin.com/','https://imgur.com/Qxcj00Z');
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`rol`,`github`,`linkedin`,`imagen`) VALUES (NULL,'Oro, Elias', 'Full Stack', 'https://github.com/EliasOro2030','https://www.linkedin.com/','https://imgur.com/hP7sdsS');
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`rol`,`github`,`linkedin`,`imagen`) VALUES (NULL,'Ortiz, Fernando Ariel', 'Full Stack', 'https://github.com/ariel957','https://www.linkedin.com/','https://imgur.com/hP7sdsS');
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`rol`,`github`,`linkedin`,`imagen`) VALUES (NULL,'Soto Valenzuela, Juan Gabriel', 'Full Stack', 'https://github.com/vstecnic','https://www.linkedin.com/','https://imgur.com/hP7sdsS');

#7º INSERTAMOS USUARIOS DE PRUEBA
INSERT INTO Usuario (`id_usuario`, `nombre_usuario`,`apellido_usuario`, `passw`, `rol`, `direccion`, `dni`, `telefono`, `mail`, `id_metodoPago`) VALUES (NULL, 'Homero','Simpson', 'ctrlSupr', 'usuario', 'Av.Siempre Viva 742', '2745136', '0303456', 'homerjsimpson@aol.com',1);
INSERT INTO Usuario (`id_usuario`, `nombre_usuario`,`apellido_usuario`, `passw`, `rol`, `direccion`, `dni`, `telefono`, `mail`, `id_metodoPago`) VALUES (NULL, 'Diana','Prince', 'ww2009_dc', 'administrador', '4000 Warner Boulevard, Burbank, California, Estados Unidos', '17242560', '0800101010231', 'justice_leage@yahoo.com',2);
INSERT INTO Usuario (`id_usuario`, `nombre_usuario`,`apellido_usuario`, `passw`, `rol`, `direccion`, `dni`, `telefono`, `mail`, `id_metodoPago`) VALUES (NULL, 'Rick','Sánchez', 'SoyPickleRick','administrador', 'Calle Falsa 123', '888888', '0600242526', 'ricks@altavista.com',1);
INSERT INTO Usuario (`id_usuario`, `nombre_usuario`,`apellido_usuario`, `passw`, `rol`, `direccion`, `dni`, `telefono`, `mail`, `id_metodoPago`) VALUES (NULL, 'Bruno','Diaz', 'ImBatman', 'usuario', 'Algun lugar de Gotham City 482 ', '227596', '4865145780', 'bruno_diaz@gotham.com',2);
