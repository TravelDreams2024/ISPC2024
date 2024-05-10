import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { DestinosComponent } from '../destinos/destinos.component';
import { CommonModule } from '@angular/common';
import { BannerComponent } from '../banner/banner.component';


@Component({
  selector: 'app-home',
  standalone: true,
  imports: [RouterOutlet, CommonModule, BannerComponent, DestinosComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  titulo: string = "Nuestros Destinos";
}
