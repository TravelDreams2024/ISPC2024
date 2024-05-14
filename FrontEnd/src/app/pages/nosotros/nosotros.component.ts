import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-nosotros',
  standalone: true,
  imports: [RouterLink, CommonModule],
  templateUrl: './nosotros.component.html',
  styleUrl: './nosotros.component.css'
})
export class NosotrosComponent {
  empresa = 'Travel Dreams';
  mision = 'Desde hace 20 años, Travel Dreams ha sido la brújula que guía a aventureros de todas las edades en sus viajes más esperados. Nuestra misión trasciende un simple itinerario; es una promesa de aventura, descubrimiento y recuerdos que perduran toda la vida.';
  equipo = [
    {
      nombre: 'Cascallares, Facundo',
      rol: 'Full Stack',
      imagen: 'assets/img/A02_avatar_hombre.png',
      twitter: '#',
      facebook: '#',
      linkedin: '#',
      perfil: '/nosotros/1'
    },
    {
      nombre: 'Fernandez, Claudio Ranses',
      rol: 'Full Stack',
      imagen: 'assets/img/A02_avatar_hombre.png',
      twitter: '#',
      facebook: '#',
      linkedin: '#',
      perfil: '/nosotros/2'
    },
    {
      nombre: 'González, Natalia',
      rol: 'Full Stack',
      imagen: 'assets/img/A01_avatar_mujer.png',
      twitter: '#',
      facebook: '#',
      linkedin: '#',
      perfil: '/nosotros/3'
    },
    {
      nombre: 'Navarrete, Romina Gabriela',
      rol: 'Full Stack',
      imagen: 'assets/img/A01_avatar_mujer.png',
      twitter: '#',
      facebook: '#',
      linkedin: '#',
      perfil: '/nosotros/4'
    },
    {
      nombre: 'Oro, Elias',
      rol: 'Full Stack',
      imagen: 'assets/img/A02_avatar_hombre.png',
      twitter: '#',
      facebook: '#',
      linkedin: '#',
      perfil: '/nosotros/1'
    },
    {
      nombre: 'Ortiz, Fernando Ariel',
      rol: 'Full Stack',
      imagen: 'assets/img/A02_avatar_hombre.png',
      twitter: '#',
      facebook: '#',
      linkedin: '#',
      perfil: '/nosotros/1'
    },
    {
      nombre: 'Soto Valenzuela, Juan Gabriel',
      rol: 'Full Stack',
      imagen: 'assets/img/A02_avatar_hombre.png',
      twitter: '#',
      facebook: '#',
      linkedin: '#',
      perfil: '/nosotros/1'
    },
  ];
}
