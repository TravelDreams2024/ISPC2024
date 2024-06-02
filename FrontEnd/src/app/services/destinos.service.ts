import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DestinosService {
  url: string= "http://localhost:3000/destinos";

  constructor(private http:HttpClient) { }

  obtenerDestino(): Observable<any>
  {
    return this.http.get(this.url).pipe(
      catchError(this.handleError)
    );
  }

  private handleError(error: HttpErrorResponse) {
    if (error.status === 0) {
      // Error del lado del cliente, como un error de red, etc.
      console.error('An error occurred:', error.error);
    } else {
      // Backend rechazó la petición y devuelve una respuesta con un código de estado.
      console.error(
        `Backend returned code ${error.status}, body was: `, error.error);
    }
    // Observable falla, retorna un mensaje de error genérico para el usuario.
    return throwError(() => new Error('Something bad happened; please try again later.'));
}
}