import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import { Time } from '@angular/common';
import { Deposito } from '../Interfaces/Deposito';

const url ="https://localhost:44354/api/Deposito";
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

/*
export class Deposito{
  id: number=0;
  //fecha: Date;
  //hora: Time;  
  cvu: number=0;
  tarjeta: number=0;
  monto: number=0;
}
*/



@Injectable({
  providedIn: 'root'
})
export class DepositoService {

  constructor(private http:HttpClient) {
    console.log("Servicio Cuentas está corriendo");
  }

  Depositar(deposito: Deposito):Observable<Deposito>{
    return this.http.post<Deposito>(url, deposito, httpOptions);
  }

  ListarDepositos():Observable<any>{
    return this.http.get<any>(url,httpOptions);
  }
  
}
