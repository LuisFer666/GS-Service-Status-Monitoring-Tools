import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { DataTablesModule } from "angular-datatables";
import { RouterModule } from '@angular/router';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { RegistroticketComponent } from './registroticket/registroticket.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './login/login.component';
import { MenuComponent } from './menu/menu.component';
import { ServiceStatusComponent } from './service-status/service-status.component';
import { MatTooltipModule } from '@angular/material/tooltip';
import { HeaderComponent } from './header/header.component';
import { NavbarComponent } from './navbar/navbar.component';
import { MonitoreoStatusComponent } from './monitoreo-status/monitoreo-status.component';
import{MatExpansionModule} from '@angular/material/expansion';

@NgModule({
  declarations: [
    AppComponent,
    RegistroticketComponent,
    LoginComponent,
    MenuComponent,
    ServiceStatusComponent,
    HeaderComponent,
    NavbarComponent,
    MonitoreoStatusComponent
  ],
  imports: [
    BrowserModule,
    DataTablesModule,
    AppRoutingModule,
    HttpClientModule,
     MatTooltipModule ,
     RouterModule,
     MatExpansionModule,
   
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
