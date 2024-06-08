import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-banner',
  standalone: true,
  imports: [RouterOutlet, CommonModule],
  templateUrl: './banner.component.html', 
  styleUrl: './banner.component.css'
})
export class BannerComponent {
  titulo1: string = "Hacemos Realidad tus Sueños";
  subtitulo1: string = "¡Viví la mejor experiencia con nosotros!";
  titulo2: string = "¡Viajes que inspiran, destinos que cautivan!";
  subtitulo2: string = "Descubre nuevos horizontes con nosotros";
  titulo3: string = "Explora el mundo con confianza";
  subtitulo3: string = "¡Donde cada destino es una aventura, cada experiencia es inolvidable!";
}
