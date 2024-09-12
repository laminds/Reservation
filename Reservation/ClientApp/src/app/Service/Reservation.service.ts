import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ApiResponseModel } from '../Interface/ApiResponseModel';
import { environment } from "../../environments/environment";
@Injectable({
  providedIn: 'root'
})
export class ReservationService {
public apiurl : string = environment.apiUrl;
constructor(private http: HttpClient ) { }

  GetInitialData(postdata: any): Observable<any> {
    debugger
    return this.http.post<ApiResponseModel>(this.apiurl + '/Reservation/GetInitialReservationDetails', postdata);
  }

  ReserveSeat(postdata: any): Observable<any>{
    return this.http.post<ApiResponseModel>(this.apiurl + '/Reservation/ReserveSeat', postdata);
  }

}
