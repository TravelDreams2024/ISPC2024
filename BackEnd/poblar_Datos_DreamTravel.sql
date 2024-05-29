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
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'San Carlos de Bariloche',450,'2024-08-05 06:00:00.000000',20,1,1,'Paisajes majestuosos, lagos cristalinos, montañas imponentes, chocolate artesanal, esquí de clase mundial y encanto alpino.','bariloche1.jpg');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Villa Carlos Paz',360,'2024-07-19 18:00:00.000000',20,1,1,'Lago, teatro, naturaleza, diversión, espectáculos, sierras, tranquilidad, gastronomía, balnearios, entretenimiento y relax.','VillaCarlosPaz_img.png');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Necochea',360,'2024-09-25 06:00:00.000000',20,1,1,'Playas extensas, paseos costeros, faro histórico, pesca deportiva, tranquilidad, dunas imponentes, atardeceres espectaculares.','Necochea.jpg');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Monte Hermoso',320,'2024-06-20 12:30:00.000000',5,1,1,'Playas de arenas doradas, bosques de pinos, reserva natural, actividades acuáticas, descanso, sol, familia, paz, naturaleza.','MonteHermoso.jpg');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Pehuenco',300,'2024-10-02 06:00:00.000000',10,1,1,'Extensas dunas doradas, pinos y acacias. Experiencia única para los amantes de la naturaleza y la serenidad.','Pehuenco.jpg');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Glaciar Perito Moreno',450,'2024-07-21 06:00:00.000000',15,1,1,'Majestuosa masa de hielo, imponente belleza natural, aventura glaciar, turquesa resplandeciente, paisaje patagónico Ãºnico.','Glaciar.png');
INSERT INTO destinos (`id_destino`,`nombre_Destino`,`precio_Destino`,`fecha_salida`,`cantidad_Disponible`,`id_categoria`,`id_metodoPago`,`descripcion`,`image`) VALUES (NULL,'Buzios',850,'2024-08-02 18:00:00.000000',15,2,1,'Playas paradisíacas, aguas cristalinas, encanto bohemio, gastronomía exquisita, actividades acuáticas, arte y cultura.','Buzios.jpg');

#4º INSERTAMOS NOSOTROS
INSERT INTO nosotros