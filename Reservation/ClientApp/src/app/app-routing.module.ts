import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ErrorComponent } from './Component/Error/Error.component';
import { ReservationComponent } from "./Component/Reservation/Reservation.component";
import { ThankyouComponent } from './Component/Thankyou/Thankyou.component';

const routes: Routes = [
  {
    path: "",
    component: ErrorComponent,
    
  },
  {
    path: "reservation/:EventId/:CustomerId",
    component: ReservationComponent,
    
  },
  {
    path: 'thankyou',
    component: ThankyouComponent
  },
  {path: '**', component: ErrorComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
