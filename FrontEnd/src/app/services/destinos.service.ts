import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Destino } from '../models/destinos';

@Injectable({
  providedIn: 'root'
})
export class DestinosService {
  private baseUrl = 'http://127.0.0.1:8000/api/v1/destinos';

  constructor(private http: HttpClient) {}

  obtenerDestinos(): Observable<Destino[]> {
    return this.http.get<Destino[]>(this.baseUrl);
  }

  obtenerDestinoPorId(id: number): Observable<Destino> {
    return this.http.get<Destino>(`${this.baseUrl}/${id}`);
  }
}
