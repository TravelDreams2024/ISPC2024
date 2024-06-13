export interface Destino {
  id_destino: number;
  nombre_Destino: string;
  descripcion: string;
  image: string;
  precio_Destino: number;
  fecha_salida: Date;
  cantidad_Disponible: number;
  id_metodoPago: number;
  id_categoria: number;
}