import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CarritoService } from '../../services/carrito.service';
import { Destino } from '../../models/destinos';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';

@Component({
  selector: 'app-destinos-cart',
  standalone: true,
  imports: [CommonModule,FormsModule, RouterModule],
  templateUrl: './destinos-cart.component.html',
  styleUrls: ['./destinos-cart.component.css']
})
export class DestinosCartComponent implements OnInit {
  carritoItems: any[] = [];
  destinos: Destino[] = [];
  total: number = 0;
  defaultImage = 'url_de_imagen_por_defecto';
  metodosPago: any[] = [];
  metodoPagoSeleccionado: string = '';

  constructor(private carritoService: CarritoService, private router: Router) {}

  ngOnInit(): void {
    this.obtenerCarrito();
    this.obtenerDestinos();
    this.obtenerMetodosPago(); 
  }
  obtenerMetodosPago(): void {
    this.carritoService.obtenerMetodosPago().subscribe({
      next: (metodos: any[]) => {
        this.metodosPago = metodos;
      },
      error: (error: any) => {
        console.error('Error al obtener los métodos de pago', error);
      }
    });
  }

  obtenerCarrito(): void {
    this.carritoService.obtenerCarrito().subscribe({
      next: (items: any[]) => {
        this.carritoItems = items.map(item => ({
          ...item,
          cantidad: Number(item.cantidad) // Asegúrate de que cantidad sea un número
        }));
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
    if (item.id_compra === undefined) {
      console.error('El id del item está undefined:', item);
      return;
    }

    nuevaCantidad = Number(nuevaCantidad);
    if (nuevaCantidad < 1) {
      nuevaCantidad = 1;
    }
    this.carritoService.actualizarItem(item.id_compra, nuevaCantidad).subscribe({
      next: () => {
        item.cantidad = nuevaCantidad; // Actualiza la cantidad localmente
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
    if (!this.metodoPagoSeleccionado) {
      alert('Por favor, seleccione un método de pago.');
      return;
    }

    this.carritoService.checkout(this.metodoPagoSeleccionado).subscribe({
      next: (response: any) => {
        alert('Compra realizada con éxito.');
        this.obtenerCarrito();  // Limpiar el carrito después del checkout
        this.router.navigate(['/destinos']);  // Redirige a la página de destinos
      },
      error: (error: any) => {
        console.error('Error en el checkout', error);
        alert('Error al realizar la compra. Inténtelo de nuevo.');
      }
    });
  }
  actualizarFecha(item: any): void {
    if (item.id_compra === undefined) {
      console.error('El id del item está undefined:', item);
      return;
    }

    const nuevaFecha = item.fecha_salida;
    this.carritoService.actualizarFecha(item.id_compra, nuevaFecha).subscribe({
      next: () => {
        item.fecha_salida = nuevaFecha; // Actualiza la fecha localmente
        console.log('Fecha de salida actualizada:', nuevaFecha);
      },
      error: (error: any) => {
        console.error('Error al actualizar la fecha de salida', error);
      }
    });
  }

}