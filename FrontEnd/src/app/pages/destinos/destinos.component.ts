import { Component } from '@angular/core';
import { DestinosService } from '../../services/destinos.service';

@Component({
  selector: 'app-destinos',
  standalone: true,
  imports: [],
  templateUrl: './destinos.component.html',
  styleUrl: './destinos.component.css'
})
export class DestinosComponent {
  destinosList:any;
  constructor(private DestinoService:DestinosService)
  {
    this.destinosList=DestinoService.obtenerDestino().subscribe({
      next: (destinosList) => {
        this.destinosList=destinosList;
      },
      error: (error) => {
        console.error(error)
      }
    });
  }

}