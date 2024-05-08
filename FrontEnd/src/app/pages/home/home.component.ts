import { Component } from '@angular/core';
import { RouterLink, RouterOutlet } from '@angular/router';
import { DestinosComponent } from '../destinos/destinos.component';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [RouterOutlet, RouterLink, DestinosComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {

}
