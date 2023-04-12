import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistroticketComponent } from './registroticket.component';

describe('RegistroticketComponent', () => {
  let component: RegistroticketComponent;
  let fixture: ComponentFixture<RegistroticketComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RegistroticketComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RegistroticketComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
