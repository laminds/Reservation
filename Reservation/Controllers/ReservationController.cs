using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReservationData;
using ReservationData.DTO;
using ReservationData.Model;
using ReservationData.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Reservation.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReservationController : ControllerBase
    {
        private readonly IReservation _reservation;
        public ReservationController(IReservation reservation)
        {
            _reservation = reservation;
        }


        [HttpPost("GetInitialReservationDetails")]
        public async Task<IActionResult> GetInitialReservationData(IntialRequestDTO request)
        {
            ApiResponseModel<InitialReservationViewModel> Response = new ApiResponseModel<InitialReservationViewModel>();
            try
            {
                Response.IsValid = true;
                Response.Data = await _reservation.GetInitialReservationData(request.CustomerId, request.EventId);
            }
            catch (Exception ex)
            {
                Response.IsValid = false;
                Response.Message = ex.ToString();
            }
            return Ok(Response);
        }


        [HttpPost("ReserveSeat")]
        public async Task<IActionResult> ReserveSeat(SeatReservedDTO seat)
        {
            ApiResponseModel<ReservationDTO> Response = new();
            try
            {
                var result = await _reservation.ReserveSeat(seat);
                if(result.Message == "Success")
                {
                    Response.Data = result.Item1;
                }
                Response.Message = result.Message;
                Response.IsValid = true;
            }
            catch (Exception ex)
            {
                Response.IsValid = false;
                Response.Message = ex.ToString();
            }
            return Ok(Response);

        }



        [HttpGet("GenerateShortCode")]
        public IActionResult GenerateShortCode()
        {
            Random random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var data = new string(Enumerable.Repeat(chars, 10)
              .Select(s => s[random.Next(s.Length)]).ToArray());

            return Ok(data);
        }

    }
}
