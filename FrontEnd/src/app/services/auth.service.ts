import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private loginUrl = 'http://127.0.0.1:8000/api/v1/login/';
  private registerUrl = 'http://127.0.0.1:8000/api/v1/register/';
  private refreshTokenUrl = 'http://127.0.0.1:8000/api/v1/token/refresh/';

  constructor(private http: HttpClient) {}

  login(credentials: any): Observable<any> {
    return this.http.post(this.loginUrl, credentials).pipe(
      map((response: any) => {
        localStorage.setItem('access_token', response.access);
        localStorage.setItem('refresh_token', response.refresh);
        return response;
      })
    );
  }

  register(user: any): Observable<any> {
    return this.http.post(this.registerUrl, user).pipe(
      map((response: any) => {
        return response;
      }),
      catchError(err => {
        return throwError(err);
      })
    );
  }

  refreshToken(): Observable<any> {
    const refreshToken = localStorage.getItem('refresh_token');
    return this.http.post(this.refreshTokenUrl, { refresh: refreshToken }).pipe(
      map((response: any) => {
        localStorage.setItem('access_token', response.access);
        return response;
      }),
      catchError(err => {
        this.logout();
        return throwError(err);
      })
    );
  }

  logout(): void {
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');
  }

  getHttpOptions() {
    const token = localStorage.getItem('access_token');
    return {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      })
    };
  }

  isLoggedIn(): boolean {
    return localStorage.getItem('access_token') !== null;
  }
}
