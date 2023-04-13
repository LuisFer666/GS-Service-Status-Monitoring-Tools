
import { HttpClient } from '@angular/common/http';
import { ChangeDetectorRef, Component, OnInit, ViewChild, AfterViewInit } from '@angular/core';
import { MAT_TOOLTIP_DEFAULT_OPTIONS, MatTooltipDefaultOptions } from '@angular/material/tooltip';
import { environment } from 'src/environments/environment';
import { FormControl } from '@angular/forms';
import { DataTableDirective } from 'angular-datatables';
import { Router } from '@angular/router';
import { Location } from '@angular/common';

export const myCustomTooltipDefaults: MatTooltipDefaultOptions = {
  showDelay: 1000,
  hideDelay: 1000,
  touchendHideDelay: 1000,
};
@Component({
  selector: 'app-service-status',
  templateUrl: './service-status.component.html',
  styleUrls: ['./service-status.component.scss'],
  providers: [{ provide: MAT_TOOLTIP_DEFAULT_OPTIONS, useValue: myCustomTooltipDefaults, }],

})

export class ServiceStatusComponent implements OnInit, AfterViewInit{
  dtOptions: DataTables.Settings = {};
 
  searchText: any;
  [x: string]: any;
  apiUrl = environment.apiUrl;
  Servicios: Servicio[] = [];
  filter = new FormControl('', { nonNullable: true });
  pageOfItems?: Array<any>;
  sortProperty: string = 'id';
  sortOrder = 1;
  loading = false;

  @ViewChild(DataTableDirective)
  datatableElement!: DataTableDirective;



  constructor(private http: HttpClient,
    private ref: ChangeDetectorRef, public _router: Router, public _location: Location) {
    this.dtOptions = {
      language: {
        url: "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
      },
      responsive: true
    };
  }

  ngAfterViewInit(): void {
    const request = this.http.get<Servicio[]>(`${this.apiUrl}BusinessStatus`);
    request.subscribe(data => {
      this.Servicios = data;
      console.log(this.Servicios)
      this.ref.detectChanges();

      this.datatableElement.dtOptions
    });
  }
  ngOnInit():void{
  } 
}
export interface Servicio {
  // Datos del Log
  name:string;
  description:string;
  status:string;
  serviceStatuses: Array<servicestatuses>;
}
export interface servicestatuses {
  name: string;
  status: string;
}

