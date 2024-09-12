import { Component, OnInit } from '@angular/core';
import * as _ from 'lodash';
import { map, filter } from "rxjs/operators";
import Swal from 'sweetalert2'
import { Router, ActivatedRoute, ParamMap  } from '@angular/router';
import { ReservationService } from "../../Service/Reservation.service";
import { ApiResponseModel } from 'src/app/Interface/ApiResponseModel';


declare var bootstrap: any;

@Component({
  selector: 'app-Reservation',
  templateUrl: './Reservation.component.html',
  styleUrls: ['./Reservation.component.css']
})
export class ReservationComponent implements OnInit {

  Tables = [] as any;
  Result = [] as any;
  TablesRowData = [] as any;
  IsVisible = "";
  Events = [] as any;
  Customers = [] as any;
  IsEvents = Boolean as any;
  IsLoaded = Boolean as any;
  Selected :any = undefined;
  Seat : any;
  IsChanged : Boolean = false;

  
  constructor(private _router: Router, private route: ActivatedRoute,private ReservationService: ReservationService) { }

  ngOnInit() {
    debugger
        sessionStorage.clear();
        this.GetInitialData();
        this.IsEvents = true;
        this.IsLoaded = false;
  }

    GetInitialData = () => {
      var postdata = {
        CustomerId : this.route.snapshot.params['CustomerId'],
        EventId : this.route.snapshot.params['EventId']
      }
    this.ReservationService.GetInitialData(postdata).subscribe((response : ApiResponseModel) => {
        if(response.isValid == true){
          debugger
          this.TablesRowData = response.data.tables;
          this.Events = response.data.event;
          this.Customers = response.data.customer;
          this.Seat = response.data.reservationSeatNo;
          if(this.Events == null || this.Customers == null){
            this._router.navigate(['']);
          }
          else if(response.data.reservationSeatNo){
            this.RedirectToThankyou();
          }
          if(this.TablesRowData != null){
            var rowWiseList = new Set(this.TablesRowData.map((item:any) => item.tableRow));
            this.Result = [];
            rowWiseList.forEach(r => 
                this.Result.push({
                    Row: r, 
                    Tables: this.TablesRowData.filter((i:any) => i.tableRow === r)
                }
            ))
            }
            this.IsLoaded = true;
        }
      },(error :any) =>{
        this._router.navigate(['']);
      });
  }

  Reserve = () => {
    if(this.Selected != null || this.Selected != undefined)
    {
        var reservationSeatNo = this.Selected.TableName+"-"+this.Selected.SeatName;
        Swal.fire({
          title: 'Are you sure?',
          text: "Are you sure want to reserved "+ reservationSeatNo+" seat?",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: 'green',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes'
        }).then((result : any) => {
          if (result.isConfirmed) {
            this.ReservationService.ReserveSeat(this.Selected).subscribe((response : ApiResponseModel) => {
                if(response.isValid == true){
                    if(response.message == "Success")
                    {
                        this.Seat = reservationSeatNo;
                        Swal.fire(
                         'Reserved!',
                         'Your Seat No is '+reservationSeatNo+' Reserved Successfully.',
                         'success'
                       ).then((result : any) => {
                         this.RedirectToThankyou();
                       });
                    }
                  else{
                    this.Selected = null;
                    this.Result.forEach((row :any )=> {
                      row.Tables.forEach((table :any )=> {
                          table.seats.forEach((seat :any )=> {
                              if(seat.IsChanged)
                              {
                                  seat.IsChanged = false;
                              }
                          });
                      });
                    });
                    Swal.fire({
                        icon: 'error',
                        title: 'oops..',
                        text: 'Something went wrong, Please try agian.'
                      });
                  }
                  
                }
            });
          }
          else{
            this.Selected = null;
            this.Result.forEach((row :any )=> {
              row.Tables.forEach((table :any )=> {
                  table.seats.forEach((seat :any )=> {
                      if(seat.IsChanged)
                      {
                          seat.IsChanged = false;
                      }
                  });
              });
            });
          }
        });
    }
    else{
        Swal.fire({
            icon: 'error',
            title: 'Required',
            text: 'Please Select Seat!'
          })
    }
  }
 
  SelectedSeat = (data : any,tableName:string) => {
    debugger
if(!data.isBooked){
  this.Result.forEach((row :any )=> {
    row.Tables.forEach((table :any )=> {
        table.seats.forEach((seat :any )=> {
            if(seat.IsChanged)
            {
                seat.IsChanged =false;
            }
        });
    });
  });
  this.Selected = {
    CustomerId : this.route.snapshot.params['CustomerId'],
    EventId : this.route.snapshot.params['EventId'],
    TableName : tableName,
    SeatName:data.seatName,
    SeatId : data.id
  }
  data.IsChanged = true;
}
    
    }

  RedirectToThankyou = () => {
    var ReserveInfo = {
        CustomerName : this.Customers.fullName,
        EventName : this.Events.eventName,
        EventDate : this.Events.eventDate,
        Seat : this.Seat
    }
    sessionStorage.setItem('ReservationInfo', JSON.stringify(ReserveInfo));
    this._router.navigate(['thankyou']);
  }

}
