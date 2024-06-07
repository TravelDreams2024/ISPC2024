import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CarritoService {
  private baseUrl = 'http://127.0.0.1:8000/api/v1/carrito/';

  constructor(private http: HttpClient) {}

  agregarCarrito(id_destino: number, id_metodoPago: number): Observable<any> {
    return this.http.post(this.baseUrl + 'agregar', { id_destino, id_metodoPago });
  }

  obtenerCarrito(): Observable<any> {
    return this.http.get(this.baseUrl);
  }

  eliminarItem(id: number): Observable<any> {
    return this.http.delete(this.baseUrl + id);
  }
}
