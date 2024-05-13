import { Component, Input } from '@angular/core';
import { NgSwitch, NgSwitchCase, NgSwitchDefault } from '@angular/common';

@Component({
  selector: 'app-profesional',
  standalone: true,
  imports: [NgSwitch, NgSwitchDefault, NgSwitchCase],
  templateUrl: './profesional.component.html',
  styleUrl: './profesional.component.css'
})
export class ProfesionalComponent {
  @Input() id!: String;
}
