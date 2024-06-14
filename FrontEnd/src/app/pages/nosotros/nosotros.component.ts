import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NosotrosService } from '../../services/nosotros.service'; // Ajusta la ruta según tu estructura de carpetas


@Component({
  selector: 'app-nosotros',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './nosotros.component.html',
  styleUrls: ['./nosotros.component.css']
})
export class NosotrosComponent {
  mision = 'Desde hace 20 años, Travel Dreams ha sido la brújula que guía a aventureros de todas las edades en sus viajes más esperados. Nuestra misión trasciende un simple itinerario; es una promesa de aventura, descubrimiento y recuerdos que perduran toda la vida.';
  profesionalList: any[] = [];
  defaultImage: string = 'ruta/a/imagen/default.png'; // Ruta de imagen por defecto

  constructor(private nosotrosService: NosotrosService) {
    this.nosotrosService.obtenerProfesionales().subscribe({
      next: (profesionalList) => {
        this.profesionalList = profesionalList;
      },
      error: (error) => {
        console.error(error);
      }
    });
  }

  trackById(index: number, nosotros: any): number {
    return nosotros.id_nosotros; 
  }
}
