import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CarritoService } from '../../services/carrito.service';

@Component({
  selector: 'app-destinos-cart',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './destinos-cart.component.html',
  styleUrls: ['./destinos-cart.component.css']
})
export class DestinosCartComponent implements OnInit {
  carritoItems: any[] = [];
  total: number = 0;

  constructor(private carritoService: CarritoService) {}

  ngOnInit(): void {
    this.getCarrito();
  }

  getCarrito(): void {
    this.carritoService.getCarrito().subscribe(data => {
      this.carritoItems = data.carrito;
      this.total = data.total;
    }, (error: any) => {
      console.error('Error al obtener el carrito', error);
    });
  }

  agregarItem(id_destino: number, id_metodoPago: number): void {
    this.carritoService.agregarCarrito(id_destino, id_metodoPago).subscribe(() => {
      this.getCarrito();
    }, (error: any) => {
      console.error('Error al agregar al carrito', error);
    });
  }

  eliminarItem(id: number): void {
    this.carritoService.eliminarCarrito(id).subscribe(() => {
      this.getCarrito();
    }, (error: any) => {
      console.error('Error al eliminar del carrito', error);
    });
  }

  checkout(): void {
    this.carritoService.checkout().subscribe(() => {
      this.getCarrito();
    }, (error: any) => {
      console.error('Error al realizar el checkout', error);
    });
  }
}
