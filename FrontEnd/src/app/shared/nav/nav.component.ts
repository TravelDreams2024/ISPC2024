import { Component } from '@angular/core';
import { RouterLink, Router } from '@angular/router';
import { CommonModule,NgFor } from '@angular/common';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-nav',
  standalone: true,
  imports: [CommonModule, RouterLink,NgFor],
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent {

  constructor(public authService: AuthService, private router: Router) {}

  onLogout(): void {
    this.authService.logout();
    this.router.navigate(['/iniciar-sesion']);
  }
  images: { src: string, alt: string, height: number }[] = [
    { src: 'assets/img/logo.svg', alt: 'Logo', height: 40 },
    { src: 'assets/img/user.svg', alt: 'Foto de Usuario', height: 40 }
  ];


}
