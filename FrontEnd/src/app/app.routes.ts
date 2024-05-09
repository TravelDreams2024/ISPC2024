import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { IniciarSesionComponent } from './pages/auth/iniciar-sesion/iniciar-sesion.component';
import { RegistroComponent } from './pages/auth/registro/registro.component';
import { NosotrosComponent } from './pages/nosotros/nosotros.component';
import { DestinosComponent } from './pages/destinos/destinos.component';
import { ContactoComponent } from './pages/contacto/contacto.component';
import { Pagina404Component } from './pages/pagina404/pagina404.component';
import { FooterComponent } from './shared/footer/footer.component';

export const routes: Routes = [
    {path: "home", component:HomeComponent},
    {path:"iniciar-sesion", component:IniciarSesionComponent},
    {path:"registro", component:RegistroComponent},
    {path:"nosotros", component: NosotrosComponent},
    {path:"destinos", component: DestinosComponent},
    {path:"contacto", component: ContactoComponent},
<<<<<<< HEAD
    {path: '**', component: Pagina404Component}
=======
    {path:"footer", component: FooterComponent},
    {path: '**', component: Pagina404Component},
    { path: '',   redirectTo: '/home', pathMatch: 'full' },
>>>>>>> RominaNavarrete
];
