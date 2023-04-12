import { HttpClient } from '@angular/common/http';
import { AfterViewInit, ChangeDetectorRef, Component, OnDestroy, OnInit } from '@angular/core';
import {  Subscription } from 'rxjs';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Time } from '@angular/common';
@Component({
  selector: 'app-registroticket',
  templateUrl: './registroticket.component.html',
  styleUrls: ['./registroticket.component.scss']
})
export class RegistroticketComponent implements OnInit, OnDestroy, AfterViewInit {
  User:User | undefined;
  registerForm!: FormGroup;
    submitted = false;
    today = new Date();
  loading = false;

 private unsubscribe: Subscription[] = [];
  
  constructor(
    private http: HttpClient,
    private cdr: ChangeDetectorRef,private formBuilder: FormBuilder)
  {
   
  }
  
  ngAfterViewInit(): void {
    const request = this.http.get<User>(`https://astrazeneca-ejemplo1.azurewebsites.net/User`);
    request.subscribe(data =>{
      console.log(data);
      this.User = data;
      this.cdr.detectChanges();
    });
  }
 
  
  
  ngOnInit(): void {
    
  } 
  

  
  saveSettings() {
    this.submitted = true;
  
    // stop here if form is invalid
    if (this.registerForm.invalid) {
        return;
    }
    if(this.registerForm.valid){
     
    }
  
    // display form values on success
   // alert('SUCCESS!! :-)\n\n' + JSON.stringify(this.registerForm.value, null, 4));
    
    
    
  }
  
  ngOnDestroy() {
    this.unsubscribe.forEach((sb) => sb.unsubscribe());
  }
  
  
  

  }
  
  export interface User {
    username: string,
    fecha: Date,
    hora: Time,
    btg:string,
    sistema:string,
    problema:string,
    prioridad:string,
    imagen:ImageData,
    descripcion: string,
  }
  
 