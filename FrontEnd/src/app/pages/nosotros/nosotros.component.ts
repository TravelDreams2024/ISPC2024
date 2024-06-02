import { Component } from '@angular/core';
import { NosotrosService } from '../../services/nosotros.service';


@Component({
  selector: 'app-nosotros',
  standalone: true,
  imports: [],
  templateUrl: './nosotros.component.html',
  styleUrl: './nosotros.component.css'
})
export class NosotrosComponent {
  profesionalList:any;

  constructor(private NosotrosService:NosotrosService)

  {
    this.profesionalList=NosotrosService.obtenerProfesionales().subscribe({
      next: (profesionalList) => {
        this.profesionalList=profesionalList;
      },
      error: (error) => {
        console.error(error)
      }
    });
  }

}