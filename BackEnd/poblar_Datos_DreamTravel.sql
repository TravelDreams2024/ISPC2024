/*
-- Query: SELECT * FROM dreamtravel.destinos
LIMIT 0, 1000

-- Date: 2024-05-28 04:30
*/


#SI LA BASE DE DATOS NO ESTA CREADA LOCALMENTE UTILIZAMOS LA SIGUIENTE SENTENCIA
create DATABASE dreamtravel; 



#SCRIPT PARA POBLAR LA BASE CON LOS DATOS DE TRABAJO 
#SELECCIONAMOS LA BASE
use dreamtravel;


#1º INSERTAMOS DATOS A ROLES
INSERT INTO rol(`id_rol`,`nombre_rol`)VALUES (NULL, 'Administrador');
INSERT INTO rol(`id_rol`,`nombre_rol`)VALUES (NULL, 'Usuario');
INSERT INTO rol(`id_rol`,`nombre_rol`)VALUES (NULL, 'Full Stack');


#2º INSERTAMOS LOS DATOS DE LAS CATEGORIAS
INSERT INTO dreamtravelapp_categorias(`id_categoria`,`nombreCategoria`)VALUES (NULL, 'Nacional');
INSERT INTO dreamtravelapp_categorias(`id_categoria`,`nombreCategoria`)VALUES (NULL, 'Internacional');

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


#5º INSERTAMOS NOSOTROS
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`github`,`linkedin`,`imagen`,`id_rol`) VALUES (NULL,'Cantarino, Emmanuel', 'https://github.com/MaxiCantarino','https://www.linkedin.com/','https://imgur.com/hP7sdsS', 3);
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`github`,`linkedin`,`imagen`,`id_rol`) VALUES (NULL,'Cascallares, Facundo', 'https://github.com/FacundoCascallares','https://www.linkedin.com/','https://imgur.com/hP7sdsS',3);
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`github`,`linkedin`,`imagen`,`id_rol`) VALUES (NULL,'Fernandez, Claudio Ranses', 'https://github.com/ccrrff2014','https://www.linkedin.com/','https://imgur.com/hP7sdsS',3);
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`github`,`linkedin`,`imagen`,`id_rol`) VALUES (NULL,'González, Natalia', 'https://github.com/Natalia24v','https://www.linkedin.com/','https://imgur.com/Qxcj00Z',3);
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`github`,`linkedin`,`imagen`,`id_rol`) VALUES (NULL,'Navarrete, Romina Gabriela', 'https://github.com/rominarg','https://www.linkedin.com/','https://imgur.com/Qxcj00Z',3);
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`github`,`linkedin`,`imagen`,`id_rol`) VALUES (NULL,'Oro, Elias', 'https://github.com/EliasOro2030','https://www.linkedin.com/','https://imgur.com/hP7sdsS',3);
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`github`,`linkedin`,`imagen`,`id_rol`) VALUES (NULL,'Ortiz, Fernando Ariel', 'https://github.com/ariel957','https://www.linkedin.com/','https://imgur.com/hP7sdsS',3);
INSERT INTO nosotros (`id_nosotros`,`nombre_apellido`,`github`,`linkedin`,`imagen`,`id_rol`) VALUES (NULL,'Soto Valenzuela, Juan Gabriel', 'https://github.com/vstecnic','https://www.linkedin.com/','https://imgur.com/hP7sdsS',3);

#7º INSERTAMOS USUARIOS DE PRUEBA
INSERT INTO Usuario (`id_usuario`, `nombre_usuario`,`apellido_usuario`, `passw`,`direccion`, `dni`, `telefono`, `mail`, `id_metodoPago`, `id_rol`) VALUES (NULL, 'Homero','Simpson', 'ctrlSupr','Av.Siempre Viva 742', '2745136', '0303456', 'homerjsimpson@aol.com',1,2);
INSERT INTO Usuario (`id_usuario`, `nombre_usuario`,`apellido_usuario`, `passw`,`direccion`, `dni`, `telefono`, `mail`, `id_metodoPago`, `id_rol`) VALUES (NULL, 'Diana','Prince', 'ww2009_dc','4000 Warner Boulevard, Burbank, California, Estados Unidos', '17242560', '0800101010231', 'justice_leage@yahoo.com',2,1);
INSERT INTO Usuario (`id_usuario`, `nombre_usuario`,`apellido_usuario`, `passw`,`direccion`, `dni`, `telefono`, `mail`, `id_metodoPago`, `id_rol`) VALUES (NULL, 'Rick','Sánchez', 'SoyPickleRick','Calle Falsa 123', '888888', '0600242526', 'ricks@altavista.com',2,1);
INSERT INTO Usuario (`id_usuario`, `nombre_usuario`,`apellido_usuario`, `passw`,`direccion`, `dni`, `telefono`, `mail`, `id_metodoPago`, `id_rol`) VALUES (NULL, 'Bruno','Diaz', 'ImBatman','Algun lugar de Gotham City 482 ', '227596', '4865145780', 'bruno_diaz@gotham.com',1,2);

