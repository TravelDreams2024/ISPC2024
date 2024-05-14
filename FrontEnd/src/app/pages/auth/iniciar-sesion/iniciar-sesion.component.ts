import { Component,  } from '@angular/core';
import { FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-iniciar-sesion',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './iniciar-sesion.component.html',
  styleUrl: './iniciar-sesion.component.css'
})
export class IniciarSesionComponent {

  formGroup = this.formBuilder.group({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required]),
      rememberMe: new FormControl(false, Validators.requiredTrue)

  });
  constructor(private formBuilder: FormBuilder) { }

  onSubmit() {
    console.log(this.formGroup.value);
}
clickRegister(): void{
  // console.log(this.formGroup.get('name')?.value as string);
  const name = this.formGroup.controls.email.value
  console.log(name)
}
onEnviar(event: Event) {
  console.log(this.formGroup.value);
  event.preventDefault();
  if (this.formGroup.valid) {
    alert("Enviar al servidor...");
  } else {
    this.formGroup.markAllAsTouched();
  }
}

}
