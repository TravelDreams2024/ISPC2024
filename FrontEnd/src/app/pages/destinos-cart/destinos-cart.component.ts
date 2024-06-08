import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CarritoService } from '../../services/carrito.service';
import { Destino } from '../../models/destinos';

@Component({
  selector: 'app-destinos-cart',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './destinos-cart.component.html',
  styleUrls: ['./destinos-cart.component.css']
})
export class DestinosCartComponent implements OnInit {
  carritoItems: any[] = [];
  destinos: Destino[] = [];
  total: number = 0;
  defaultImage = 'url_de_imagen_por_defecto';

  constructor(private carritoService: CarritoService) {}

  ngOnInit(): void {
    this.obtenerCarrito();
    this.obtenerDestinos();
  }

  obtenerCarrito(): void {
    this.carritoService.obtenerCarrito().subscribe({
      next: (items: any[]) => {
        this.carritoItems = items;
        this.combinarDatos();
      },
      error: (error: any) => {
        console.error('Error al obtener el carrito', error);
      }
    });
  }

  obtenerDestinos(): void {
    this.carritoService.obtenerDestinos().subscribe({
      next: (destinos: Destino[]) => {
        this.destinos = destinos;
        this.combinarDatos();
      },
      error: (error: any) => {
        console.error('Error al obtener los destinos', error);
      }
    });
  }

  combinarDatos(): void {
    if (this.carritoItems.length > 0 && this.destinos.length > 0) {
      this.carritoItems.forEach(item => {
        const destino = this.destinos.find(d => d.id_destino === item.id_destino);
        if (destino) {
          item.nombre_Destino = destino.nombre_Destino;
          item.descripcion = destino.descripcion;
          item.image = destino.image;
          item.precio_Destino = destino.precio_Destino;
        }
      });
      this.calcularTotal();
    }
  }

  eliminarItem(id: number): void {
    this.carritoService.eliminarItem(id).subscribe({
      next: () => {
        this.obtenerCarrito();
      },
      error: (error: any) => {
        console.error('Error al eliminar el item del carrito', error);
      }
    });
  }

  actualizarCantidad(item: any, nuevaCantidad: number): void {
    nuevaCantidad = Number(nuevaCantidad);
    if (nuevaCantidad < 1) {
      nuevaCantidad = 1;
    }
    item.cantidad = nuevaCantidad;
    this.carritoService.actualizarItem(item.id_destino, nuevaCantidad).subscribe({
      next: () => {
        this.calcularTotal();
      },
      error: (error: any) => {
        console.error('Error al actualizar la cantidad del item', error);
      }
    });
  }

  calcularTotal(): void {
    this.total = this.carritoItems.reduce((sum, item) => sum + item.precio_Destino * item.cantidad, 0);
  }

  checkout(): void {
    console.log('Iniciar checkout');
    // Implementar lógica de checkout
  }
}