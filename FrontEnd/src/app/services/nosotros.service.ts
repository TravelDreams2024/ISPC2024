import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class NosotrosService {
  private url: string = "http://127.0.0.1:8000/api/v1/nosotros/";

  constructor(private http: HttpClient) { }

  obtenerProfesionales(): Observable<any> {
    return this.http.get<any[]>(this.url).pipe(
      catchError(this.handleError)
    );
  }

  private handleError(error: HttpErrorResponse) {
    if (error.status === 0) {
      // Error del lado del cliente, como un error de red, etc.
      console.error('An error occurred:', error.error);
    } else {
      // Backend rechazó la petición y devuelve una respuesta con un código de estado.
      console.error(`Backend returned code ${error.status}, body was: `, error.error);
    }
    // Observable falla, retorna un mensaje de error genérico para el usuario.
    return throwError(() => new Error('Something bad happened; please try again later.'));
  }
}
