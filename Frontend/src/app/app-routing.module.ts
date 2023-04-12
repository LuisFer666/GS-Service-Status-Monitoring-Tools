import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegistroticketComponent } from './registroticket/registroticket.component';
import { ServiceStatusComponent } from './service-status/service-status.component';
import { MonitoreoStatusComponent } from './monitoreo-status/monitoreo-status.component';

const routes: Routes = [
  {
    path: 'registroticket',
    component: RegistroticketComponent,
  },
  {
    path: 'monitoreo-status',
    component: MonitoreoStatusComponent,
  },
  {
    path: 'service-status',
    component: ServiceStatusComponent,
  }
  ,{
    path: '',
    redirectTo: '/monitoreo-status',
    pathMatch: 'full',
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
