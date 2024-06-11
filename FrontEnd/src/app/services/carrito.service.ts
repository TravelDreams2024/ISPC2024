import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CarritoService {
  private baseUrl = 'http://127.0.0.1:8000/api/v1';  // Django server URL base

  constructor(private http: HttpClient) {}

  agregarCarrito(id_destino: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/agregar-al-carrito/`, { id_destino });
  }

  obtenerCarrito(): Observable<any> {
    return this.http.get(`${this.baseUrl}/carrito/`);
  }

  eliminarItem(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/eliminar-item-carrito/${id}/`);
  }

  actualizarItem(id_destino: number, cantidad: number): Observable<any> {
    return this.http.put(`${this.baseUrl}/carrito/${id_destino}/`, { cantidad });
  }

  obtenerDestinos(): Observable<any> {
    return this.http.get(`${this.baseUrl}/destinos/`);
  }
}
