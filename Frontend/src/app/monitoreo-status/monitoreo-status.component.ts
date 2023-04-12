import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-monitoreo-status',
  templateUrl: './monitoreo-status.component.html',
  styleUrls: ['./monitoreo-status.component.scss']
})
export class MonitoreoStatusComponent implements OnInit {
  ngOnInit(): void {
    
  }
  selectedData = [{ id: 1}, { id: 2}, { id: 3}, { id: 4}, { id: 5}, { id: 6 }];
}
