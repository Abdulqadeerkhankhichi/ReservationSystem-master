using ReservationSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReservationSystem.Controllers
{
    public class RateController : Controller
    {
        ReservationSystemEntities DB = new ReservationSystemEntities();
        // GET: Rate
        public ActionResult Rates(string Update)
        {
            
            List<TourLocationData_Result> Data = new List<TourLocationData_Result>();
            List<RateCatData_Result> Data1 = new List<RateCatData_Result>();
            Data = DB.TourLocationData().ToList();
            ViewBag.RateCatData = DB.RateCatData().ToList();
            ViewBag.Update = Update;
            return View(Data);
        }
        public ActionResult EditRate(int Id=0,float Rate=0.0f)
        {
            tblRate Data = new tblRate();
            Data = DB.tblRates.Where(x=>x.RateId==Id).FirstOrDefault();
            Data.Rate = Rate;
            DB.Entry(Data);
            DB.SaveChanges();
            return Json(1);
        }
    }
}