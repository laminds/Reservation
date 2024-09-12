import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-Thankyou',
  templateUrl: './Thankyou.component.html',
  styleUrls: ['./Thankyou.component.css']
})
export class ThankyouComponent implements OnInit {

  constructor(private _router: Router) { }
  ReservationInfo : any;
  ngOnInit() {


    var Session : any = sessionStorage.getItem('ReservationInfo');
    this.ReservationInfo = JSON.parse(Session);
    if(!this.ReservationInfo)
    {
      this._router.navigate(['']);
    }
   
  }


}
