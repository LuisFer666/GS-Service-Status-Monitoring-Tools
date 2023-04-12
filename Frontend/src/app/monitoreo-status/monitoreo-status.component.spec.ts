import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MonitoreoStatusComponent } from './monitoreo-status.component';

describe('MonitoreoStatusComponent', () => {
  let component: MonitoreoStatusComponent;
  let fixture: ComponentFixture<MonitoreoStatusComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MonitoreoStatusComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MonitoreoStatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
