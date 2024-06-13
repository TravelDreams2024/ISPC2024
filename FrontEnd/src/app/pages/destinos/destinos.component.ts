import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { DestinosService } from '../../services/destinos.service';
import { CarritoService } from '../../services/carrito.service';
import { Destino } from '../../models/destinos';
import { AuthService } from '../../services/auth.service';
import { AlertaComponent } from '../../alerta/alerta.component';

@Component({
  selector: 'app-destinos',
  standalone: true,
  imports: [CommonModule, RouterModule, HttpClientModule, AlertaComponent],
  templateUrl: './destinos.component.html',
  styleUrls: ['./destinos.component.css']
})
export class DestinosComponent implements OnInit {
  destinosList: Destino[] = [];
  titulo: string = "Nuestros Destinos";
  tipoAlerta: string = '';
  mensajeAlerta: string = '';
  contadorCarrito: number = 0; // Contador para el carrito

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
        // Incrementa el contador del carrito
        this.contadorCarrito++;
        // Mostrar alerta de éxito
        this.mostrarAlerta('Producto agregado al carrito', 'success');
      }, (error: any) => {
        console.error('Error al agregar al carrito', error);
        // Mostrar alerta de error
        this.mostrarAlerta('Error al agregar al carrito', 'danger');
      });
    } else {
      this.router.navigate(['/iniciar-sesion']);
    }
  }

  mostrarAlerta(mensaje: string, tipo: string): void {
    // Asignamos los valores de la alerta
    this.mensajeAlerta = mensaje;
    this.tipoAlerta = tipo;

    // Muestra el toast
    this.showAlert();
  }

  showAlert(): void {
    const toast = document.getElementById('liveToast');
    if (toast) {
      toast.classList.add('show');
      setTimeout(() => {
        toast.classList.remove('show');
        this.mensajeAlerta = '';
        this.tipoAlerta = '';
      }, 5000); // Oculta el toast después de 5 segundos
    }
  }

  trackById(index: number, destino: Destino): number {
    return destino.id_destino;
  }
}
