import { Component,  } from '@angular/core';
import { FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-registro',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './registro.component.html',
  styleUrl: './registro.component.css'
})
export class RegistroComponent {

  formGroup = this.formBuilder.group({
    name: new FormControl('', Validators.required),
    lastName: new FormControl('', Validators.required),
    email: new FormControl('', [Validators.required, Validators.email]),
    password: new FormControl('', [Validators.required, Validators.minLength(8), Validators.maxLength(16)]),
    password2: new FormControl('', Validators.required),
  });

  constructor(private formBuilder: FormBuilder) { }

  onSubmit() {
    console.log(this.formGroup.value);
}
clickRegister(): void{
  // console.log(this.formGroup.get('name')?.value as string);
  const name = this.formGroup.controls.name.value
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