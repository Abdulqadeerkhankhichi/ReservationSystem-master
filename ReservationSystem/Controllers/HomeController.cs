using ReservationSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReservationSystem.Controllers
{
    public class HomeController : Controller
    {
        ReservationSystemEntities DB = new ReservationSystemEntities();
        public ActionResult Index()
        {
            DateTime v = DateTime.Today;
            ViewBag.TotalBooking = DB.tblBookings.Where(x => x.CreatedDate == DateTime.Today).Count();
            ViewBag.NewBooking = DB.tblBookings.Where(x => x.CreatedDate == DateTime.Today && x.Status==1).Count();
            ViewBag.ConfirmBooking = DB.tblBookings.Where(x => x.CreatedDate == DateTime.Today && x.Status == 2).Count();
            ViewBag.CancelBooking = DB.tblBookings.Where(x => x.CreatedDate == DateTime.Today && x.Status == 5).Count();
            List<BookingData_Result> Data = new List<BookingData_Result>();
            Data = DB.BookingData().ToList();
            return View(Data);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}