import { Component } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-contacto',
  standalone: true,
  imports: [ReactiveFormsModule],
  templateUrl: './contacto.component.html',
  styleUrl: './contacto.component.css'
})
export class ContactoComponent {
formgroup = new FormGroup({

  name: new FormControl('', Validators.required),
  email: new FormControl('', [Validators.required, Validators.email]),
  phone: new FormControl('', Validators.required),
  message: new FormControl('', Validators.required)

});

clickContacto(): void {
  if (this.formgroup.valid) {
    const name = this.formgroup.controls.name.value;
    const email = this.formgroup.controls.email.value;
    const phone = this.formgroup.controls.phone.value;
    const message = this.formgroup.controls.message.value;
    console.log('Name:', name, 'Email:', email, 'Phone:', phone, 'Message:', message);
    
    // Lógica para enviar el formulario a un servidor, mostrar un mensaje de exito
    alert('Mensaje enviado correctamente');
  } else {
    // Muestra mensajes de error o alguna indicación de que el formulario no es valido
    alert('Por favor, completa todos los campos correctamente.');
  }
}
}
