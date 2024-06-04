// src/app/app.routes.ts
import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { IniciarSesionComponent } from './pages/auth/iniciar-sesion/iniciar-sesion.component';
import { RegistroComponent } from './pages/auth/registro/registro.component';
import { NosotrosComponent } from './pages/nosotros/nosotros.component';
import { DestinosComponent } from './pages/destinos/destinos.component';
import { ContactoComponent } from './pages/contacto/contacto.component';
import { Pagina404Component } from './pages/pagina404/pagina404.component';
import { ProfesionalComponent } from './pages/nosotros/profesional/profesional.component';
import { DestinosCartComponent } from './pages/destinos-cart/destinos-cart.component';
import { DestinosDetailsComponent } from './pages/destinos-details/destinos-details.component';


export const routes: Routes = [
    {path: '', component: HomeComponent},
    {path: "Home", component:HomeComponent},
    {path:"destinos", component: DestinosComponent},
    {path:"destinos/:id", component:DestinosDetailsComponent},
    {path:"destinos-cart", component: DestinosCartComponent},
    {path:"contacto", component: ContactoComponent},
    {path:"iniciar-sesion", component:IniciarSesionComponent},
    {path:"registro", component:RegistroComponent},
    {path:"nosotros", component: NosotrosComponent},
    {path:"nosotros/:id", component:ProfesionalComponent},
    {path: '**', component: Pagina404Component},
];
