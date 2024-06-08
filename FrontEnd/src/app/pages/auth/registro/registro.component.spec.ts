import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, Validators, FormGroup } from '@angular/forms';
import { AuthService } from '../../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule]
})
export class RegistroComponent {
  formGroup: FormGroup;

  constructor(private fb: FormBuilder, private authService: AuthService, private router: Router) {
    this.formGroup = this.fb.group({
      first_name: ['', Validators.required],
      last_name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20)]],
      password2: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20)]]
    });
  }

  onSubmit() {
    if (this.formGroup.valid) {
      console.log('Datos del formulario:', this.formGroup.value);
      this.authService.register(this.formGroup.value).subscribe(
        (response: any) => {
          // Manejar respuesta de registro
          this.router.navigate(['/iniciar-sesion']);
          console.log('Registro exitoso:', response);
        },
        (error: any) => {
          console.error('Error en el registro:', error);
          // Manejar errores de registro
        }
      );
    }
  }
}
