import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { DestinosService } from '../../services/destinos.service';
import { CarritoService } from '../../services/carrito.service';
import { Destino } from '../../models/destinos';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-destinos',
  standalone: true,
  imports: [CommonModule, RouterModule, HttpClientModule],
  templateUrl: './destinos.component.html',
  styleUrls: ['./destinos.component.css']
})
export class DestinosComponent implements OnInit {
  destinosList: Destino[] = [];
  titulo: string = "Nuestros Destinos";

  constructor(
    private destinosService: DestinosService,
    private carritoService: CarritoService,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.getDestinos();
  }

  getDestinos(): void {
    this.destinosService.obtenerDestinos().subscribe(data => {
      this.destinosList = data;
    });
  }

  agregarAlCarrito(destino: Destino): void {
    if (this.authService.isLoggedIn()) {
      this.carritoService.agregarCarrito(destino.id_destino).subscribe(() => {
        console.log('Destino agregado al carrito');
      }, (error: any) => {
        console.error('Error al agregar al carrito', error);
      });
    } else {
      this.router.navigate(['/iniciar-sesion']);
    }
  }

  trackById(index: number, destino: Destino): number {
    return destino.id_destino;
  }
}
