import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { DestinosService } from '../../services/destinos.service';
import { CarritoService } from '../../services/carrito.service';

@Component({
  selector: 'app-destinos',
  standalone: true,
  imports: [CommonModule, RouterModule, HttpClientModule],
  templateUrl: './destinos.component.html',
  styleUrls: ['./destinos.component.css']
})
export class DestinosComponent implements OnInit {
  destinosList: any[] = [];
  titulo: string = "Nuestros Destinos";

  constructor(private destinosService: DestinosService, private carritoService: CarritoService) {}

  ngOnInit(): void {
    this.getDestinos();
  }

  getDestinos(): void {
    this.destinosService.obtenerDestinos().subscribe(data => {
      this.destinosList = data;
    });
  }

  agregarAlCarrito(destino: any): void {
    this.carritoService.agregarCarrito(destino.id_destino, destino.id_metodoPago).subscribe(() => {
      console.log('Destino agregado al carrito');
    }, (error: any) => {
      console.error('Error al agregar al carrito', error);
    });
  }
}
