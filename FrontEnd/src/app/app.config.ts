import { ApplicationConfig, importProvidersFrom } from '@angular/core';
import { provideRouter, withComponentInputBinding } from '@angular/router';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { routes } from './app.routes';
import { AuthInterceptor } from './interceptors/auth.interceptor';
import { AuthGuard } from './interceptors/auth.guard'; // Importa AuthGuard
import { CarritoService } from './services/carrito.service';
import { AlertaComponent } from '../app/alerta/alerta.component'; // Corrige la ruta de importación

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes, withComponentInputBinding()),
    importProvidersFrom(HttpClientModule),
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true
    },
    AlertaComponent ,
    AuthGuard, // Asegúrate de que AuthGuard esté registrado
    CarritoService  // Añadir el servicio del carrito aquí
  ]
};
