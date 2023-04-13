
import { HttpClient } from '@angular/common/http';
import { ChangeDetectorRef, Component, OnInit, ViewChild, AfterViewInit } from '@angular/core';
import { MAT_TOOLTIP_DEFAULT_OPTIONS, MatTooltipDefaultOptions } from '@angular/material/tooltip';
import { environment } from 'src/environments/environment';

import { Router } from '@angular/router';
import { Location, Time } from '@angular/common';
import { interval } from 'rxjs';
export const myCustomTooltipDefaults: MatTooltipDefaultOptions = {
  showDelay: 1000,
  hideDelay: 1000,
  touchendHideDelay: 1000,
};
@Component({
  selector: 'app-monitoreo-status',
  templateUrl: './monitoreo-status.component.html',
  styleUrls: ['./monitoreo-status.component.scss'],
  
  providers: [{ provide: MAT_TOOLTIP_DEFAULT_OPTIONS, useValue: myCustomTooltipDefaults, }],
})
export class MonitoreoStatusComponent implements OnInit, AfterViewInit {
  apiUrl = environment.apiUrl;
  collapsebtg:string | undefined;
  Servicios: Servicio[] = [];
  Incidents: Incident[] = [];
  constructor(private http: HttpClient,
    private ref: ChangeDetectorRef, public _router: Router, public _location: Location) {
      interval(2000).subscribe(() => {
        location.reload();
        });
  }
  ngAfterViewInit(): void {
    const request = this.http.get<Servicio[]>(`${this.apiUrl}BusinessStatus`);
    request.subscribe(data => {
      this.Servicios = data;
      console.log(this.Servicios)
      this.ref.detectChanges();

     
    });
  }
  ngOnInit(): void {
    
  }
  
  selectedData = [{ id: 1}, { id: 2}, { id: 3}, { id: 4}, { id: 5}, { id: 6 }];
}
export interface Servicio {
idbtg:number;
  name:string;
  description:string;
  status:string;
  serviceStatuses: Array<servicestatuses>;
}
export interface servicestatuses {
  idservice:number,
  name: string;
  status: string;
}
export interface Incident {
  incidentNumber:string,
  fecha:Date,
  hora:Time,
  descripcion:string;
  
}