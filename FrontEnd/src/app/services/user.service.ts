// user.service.ts

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private baseUrl = 'http://127.0.0.1:8000/api/v1';

  constructor(private http: HttpClient) {}

  obtenerPerfil(): Observable<any> {
    return this.http.get(`${this.baseUrl}/perfil/`);
  }

  listarCompras(): Observable<any> {
    return this.http.get(`${this.baseUrl}/listar-compras/`);
  }
}