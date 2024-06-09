// src/app/pages/auth/iniciar-sesion/iniciar-sesion.component.ts
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, Validators, FormGroup } from '@angular/forms';
import { AuthService } from '../../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule]
})
export class IniciarSesionComponent {
  formGroup: FormGroup;

  constructor(private fb: FormBuilder, private authService: AuthService, private router: Router) {
    this.formGroup = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required],
      rememberMe: [false]
    });
  }

  onSubmit() {
    if (this.formGroup.valid) {
      console.log('Form data:', this.formGroup.value); // Log para verificar datos del formulario
      this.authService.login(this.formGroup.value).subscribe(
        response => {
          console.log('Login successful:', response); // Log para verificar respuesta exitosa
          this.router.navigate(['/']);
        },
        error => {
          console.error('Login failed:', error); // Log para verificar errores
          // Manejar errores de login
        }
      );
    } else {
      console.log('Form is invalid');
    }
  }
}
