import { CommonModule, NgFor, NgIf, NgSwitch, NgSwitchCase } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-destinos',
  standalone: true,
  imports: [RouterOutlet, CommonModule, NgFor,NgIf, NgSwitch, NgSwitchCase],
  templateUrl: './destinos.component.html',
  styleUrl: './destinos.component.css'
})
export class DestinosComponent {
  imagenList: { url: string, name: string, description: string }[] = [
    { 
      url: "./assets/img/01_bariloche.png", 
      name: "San Carlos de Bariloche",
      description: "Paisajes majestuosos, lagos cristalinos, montañas imponentes, chocolate artesanal, esquí de clase mundial y encanto alpino."
    },
    { 
      url: "./assets/img/02_villa_carlos_paz.png", 
      name: "Villa Carlos Paz",
      description: "Lago, teatro, naturaleza, diversión, espectáculos, sierras, tranquilidad, gastronomía, balnearios, entretenimiento y relax."
    },
    { 
      url: "./assets/img/03_necochea.png", 
      name: "Necochea",
      description: "Playas extensas, paseos costeros, faro histórico, pesca deportiva, tranquilidad, dunas imponentes, atardeceres espectaculares."
    },
    { 
      url: "./assets/img/04_monte_hermoso.png", 
      name: "Monte Hermoso",
      description: "Playas de arenas doradas, bosques de pinos, reserva natural, actividades acuáticas, descanso, sol, familia, paz, naturaleza."
    },
    { 
      url: "./assets/img/05_pehuenco.png", 
      name: "Pehuenco",
      description: "Majestuosa masa de hielo, imponente belleza natural, aventura glaciar, turquesa resplandeciente, paisaje patagónico único."
    },
    { 
      url: "./assets/img/06_glaciar_perito_moreno.png", 
      name: "Glaciar Perito Moreno",
      description: "Majestuosa masa de hielo, imponente belleza natural, aventura glaciar, turquesa resplandeciente, paisaje patagónico único."
    },
    { 
      url: "./assets/img/07_buzios.png", 
      name: "Búzios",
      description: "Playas paradisíacas, aguas cristalinas, encanto bohemio, gastronomía exquisita, actividades acuáticas, arte y cultura."
    },
    { 
      url: "./assets/img/08_camboriu.png", 
      name: "Camboriú",
      description: "Playas extensas, moderna infraestructura turística, vida nocturna animada, gastronomía diversa, relax."
    }
  ];
}
