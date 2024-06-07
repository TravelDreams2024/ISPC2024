import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CarritoService } from '../../services/carrito.service';
import { HttpClientModule } from '@angular/common/http';

@Component({
  selector: 'app-destinos-cart',
  templateUrl: './destinos-cart.component.html',
  styleUrls: ['./destinos-cart.component.css'],
  standalone: true,
  imports: [CommonModule, HttpClientModule]
})
export class DestinosCartComponent implements OnInit {
  carritoItems: any[] = [];
  total: number = 0;

  constructor(private carritoService: CarritoService) {}

  ngOnInit(): void {
    this.obtenerCarrito();
  }

  obtenerCarrito(): void {
    this.carritoService.obtenerCarrito().subscribe((items: any[]) => {
      this.carritoItems = items;
      this.calcularTotal();
    }, (error: any) => {
      console.error('Error al obtener el carrito', error);
    });
  }

  agregarItem(id_destino: number, id_metodoPago: number): void {
    this.carritoService.agregarCarrito(id_destino, id_metodoPago).subscribe(() => {
      this.obtenerCarrito();
    }, (error: any) => {
      console.error('Error al agregar el item al carrito', error);
    });
  }

  eliminarItem(id: number): void {
    this.carritoService.eliminarItem(id).subscribe(() => {
      this.obtenerCarrito();
    }, (error: any) => {
      console.error('Error al eliminar el item del carrito', error);
    });
  }

  calcularTotal(): void {
    this.total = this.carritoItems.reduce((sum, item) => sum + item.id_destino.precio_Destino * item.cantidad, 0);
  }

  checkout(): void {
    // Implementar lógica de checkout
    console.log('Iniciar checkout');
  }
}
