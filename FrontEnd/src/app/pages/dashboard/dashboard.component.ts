import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CarritoService } from '../../services/carrito.service';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [RouterOutlet, CommonModule],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  images = [
    { src: 'assets/img/logo.svg', alt: 'Logo', height: 40 },
    { src: 'assets/img/user.svg', alt: 'Foto de Usuario', height: 40 }
  ];

  compras: any[] = [];
  usuario: any;

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.listarCompras();
    this.obtenerPerfil();
  }

  obtenerPerfil(): void {
    this.userService.obtenerPerfil().subscribe({
      next: (usuario: any) => {
        this.usuario = usuario;
      },
      error: (error: any) => {
        console.error('Error al obtener el perfil del usuario', error);
      }
    });
  }

  listarCompras(): void {
    this.userService.listarCompras().subscribe({
      next: (compras: any[]) => {
        this.compras = compras;
      },
      error: (error: any) => {
        console.error('Error al listar las compras', error);
      }
    });
  }
}