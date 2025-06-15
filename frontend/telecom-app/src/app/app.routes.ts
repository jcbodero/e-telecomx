
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './auth/login/login.component';
import { DashboardComponent } from './dashboard/dashboard/dashboard.component';
import { ServiciosContratadosComponent } from './dashboard/servicios-contratados/servicios-contratados.component';
import { ValoresAPagarComponent } from './dashboard/valores-a-pagar/valores-a-pagar.component';
import { ConsumoTiempoRealComponent } from './dashboard/consumo-tiempo-real/consumo-tiempo-real.component';

export const routes: Routes = [
  { path: '', component: LoginComponent },
  {
    path: 'dashboard',
    component: DashboardComponent,
    children: [
      { path: 'servicios', component: ServiciosContratadosComponent },
      { path: 'valores', component: ValoresAPagarComponent },
      { path: 'consumo', component: ConsumoTiempoRealComponent },
      { path: '', redirectTo: 'servicios', pathMatch: 'full' }
    ]
  }
];
