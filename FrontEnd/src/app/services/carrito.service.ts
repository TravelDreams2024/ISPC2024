import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CarritoService {
  private baseUrl = 'http://127.0.0.1:8000/api/v1/carrito/';

  constructor(private http: HttpClient) {}

  getCarrito(): Observable<any> {
    return this.http.get(`${this.baseUrl}ver/`, this.getHttpOptions());
  }

  agregarCarrito(id_destino: number, id_metodoPago: number): Observable<any> {
    const body = {
      id_destino: id_destino,
      id_metodoPago: id_metodoPago,
      cantidad: 1
    };
    return this.http.post(`${this.baseUrl}`, body, this.getHttpOptions());
  }

  eliminarCarrito(id: number): Observable<any> {
    return this.http.post(`${this.baseUrl}${id}/eliminar/`, {}, this.getHttpOptions());
  }

  checkout(): Observable<any> {
    return this.http.post(`${this.baseUrl}checkout/`, {}, this.getHttpOptions());
  }

  private getHttpOptions() {
    const token = localStorage.getItem('access_token');
    return {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      })
    };
  }
}
