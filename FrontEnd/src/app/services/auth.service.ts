// src/app/auth.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private loginUrl = 'http://127.0.0.1:8000/api/v1/login/';
  private registerUrl = 'http://127.0.0.1:8000/api/v1/register/';

  constructor(private http: HttpClient) {}

  login(credentials: any): Observable<any> {
    return this.http.post(this.loginUrl, credentials);
  }

  register(data: any): Observable<any> {
    return this.http.post(this.registerUrl, data);
  }
}

