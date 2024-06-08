import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CarritoService {
  private carritoUrl = 'http://127.0.0.1:8000/api/v1/carrito/';
  private destinosUrl = 'http://127.0.0.1:8000/api/v1/destinos/';

  constructor(private http: HttpClient) {}

  agregarCarrito(id_destino: number, id_metodoPago: number): Observable<any> {
    return this.http.post(this.carritoUrl + 'agregar', { id_destino, id_metodoPago });
  }

  obtenerCarrito(): Observable<any> {
    return this.http.get(this.carritoUrl);
  }

  eliminarItem(id: number): Observable<any> {
    return this.http.delete(this.carritoUrl + id);
  }

  actualizarItem(id_destino: number, cantidad: number): Observable<any> {
    return this.http.put(this.carritoUrl + id_destino, { cantidad });
  }

  obtenerDestinos(): Observable<any> {
    return this.http.get(this.destinosUrl);
  }
}
