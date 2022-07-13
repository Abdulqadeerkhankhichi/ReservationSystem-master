using ReservationSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace ReservationSystem.Controllers
{
    public class BookingController : Controller
    {
        ReservationSystemEntities DB = new ReservationSystemEntities();
        // GET: Booking
        public ActionResult Bookings()
        {
            List<BookingData_Result> Data = new List<BookingData_Result>();
            Data = DB.BookingData().ToList();
            return View(Data);
        }
        [HttpPost]
        public JsonResult GetBooking(int Id=0)
        {
            GetBookingData_Result Data = new GetBookingData_Result();
            Data = DB.GetBookingData(Id).FirstOrDefault();
            return Json( new { Data= Data }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ViewBooking(int id=0,string Update=null)
        {
            tblBooking Data = new tblBooking();
            Data = DB.tblBookings.Where(x=>x.BookingId==id).FirstOrDefault();
            ViewBag.Update = Update;
            return View(Data);
        }
        public ActionResult EditBooking(int id=0)
        {
            tblBooking Data = new tblBooking();
            Data = DB.tblBookings.Where(x=>x.BookingId==id).FirstOrDefault();
            ViewBag.Status = DB.tblStatus.ToList();
            ViewBag.Locations = DB.tblLocations.ToList();
            ViewBag.PaymentStatus = DB.tblPaymentStatus.ToList();
            return View(Data);
        }
        public ActionResult TestTemplate(int id=0)
        {
            tblBooking Data = new tblBooking();
            Data = DB.tblBookings.Where(x=>x.BookingId==1).FirstOrDefault();
            ViewBag.Status = DB.tblStatus.ToList();
            ViewBag.Locations = DB.tblLocations.ToList();
            ViewBag.PaymentStatus = DB.tblPaymentStatus.ToList();

            return View(Data);
        }
        [HttpPost]
        public ActionResult EditBooking(tblBooking Booking)
        {
            tblBooking Data = new tblBooking();
            ViewBag.Status = DB.tblStatus.ToList();
            ViewBag.Locations = DB.tblLocations.ToList();
            ViewBag.PaymentStatus = DB.tblPaymentStatus.ToList();

            try
            {
                Data = DB.tblBookings.Where(x => x.BookingId == Booking.BookingId).FirstOrDefault();
                Data.ArrivalPickupId = Booking.ArrivalPickupId;
                Data.ArrivalDropofId = Booking.ArrivalDropofId;
                Data.ArrivalTransportType = Booking.ArrivalTransportType;
                Data.ArrivalDate = Booking.ArrivalDate;
                Data.ArrivalTime = Booking.ArrivalTime;
                Data.Flight_TrainNo = Booking.Flight_TrainNo;
                Data.CommingFrom = Booking.CommingFrom;
                Data.DeparturePickupId = Booking.DeparturePickupId;
                Data.DepartureDropofId = Booking.DepartureDropofId;
                Data.DepartureTransportType = Booking.DepartureTransportType;
                Data.DepartureDate = Booking.DepartureDate;
                Data.DepartureTime = Booking.DepartureTime;
                Data.Adults = Booking.Adults;
                Data.Children = Booking.Children;
                Data.Babies = Booking.Babies;
                Data.Name = Booking.Name;
                Data.Email = Booking.Email;
                Data.Phone = Booking.Phone;
                Data.Message = Booking.Message;
                Data.TripType = Booking.TripType;
                Data.Status = Booking.Status;
                Data.Amount = Booking.Amount;
                Data.PaymentStatus = Booking.PaymentStatus;
                Data.PaymentStatus = Booking.PaymentStatus;
                DB.Entry(Data);
                DB.SaveChanges();
                @ViewBag.Update = "Booking has been updated successfully.";

            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }
            return View(Data);
        }


        public ActionResult ApprovalBooking(int id = 0)
        {
            tblBooking Data = new tblBooking();
            Data = DB.tblBookings.Where(x => x.BookingId == id).FirstOrDefault();
            try
            {
                
                ViewBag.Status = DB.tblStatus.ToList();
                ViewBag.Locations = DB.tblLocations.ToList();
                ViewBag.PaymentStatus = DB.tblPaymentStatus.ToList();

                Data.Status = 6;
                DB.Entry(Data);
                DB.SaveChanges();

                string SenderEmail = System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString();
                string SenderPassword = System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString();
                SmtpClient Client = new SmtpClient("yehtohoga.com", 25);
                Client.EnableSsl = false;
                Client.Timeout = 100000;
                Client.DeliveryMethod = SmtpDeliveryMethod.Network;
                Client.UseDefaultCredentials = false;
                Client.Credentials = new System.Net.NetworkCredential(SenderEmail, SenderPassword);

                string link = Request.Url.ToString();
                link = link.Replace("ApprovalBooking", "ConfirmBooking");

                byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(Data.Email);
                string encrypted = Convert.ToBase64String(b);

                byte[] t = System.Text.ASCIIEncoding.ASCII.GetBytes(DateTime.Now.ToString());
                string encryptedTime = Convert.ToBase64String(t);




                //using (MailMessage mm = new MailMessage(SenderEmail, Data.Email))
                //{

                //    mm.Subject = "Password reset";
                //    string body = "";
                //    //body += "<!DOCTYPE html>";
                //    //body += "<html>< head > ";
                //    //body += "<style> html {background - color: #e3e3e3; margin: 0;padding: 0; }body { margin: 0;padding: 0; font-family: Arial, Helvetica, sans-serif; }.wrapper {width: 100 %;max-width: 700px; margin: 0px auto;}.mainheader {width: 100 %;float: left; padding: 20px 0;float: left;}.logo {width: 100 %; float: left;font-size: 14px;font-weight: bold;}.contact {width: 100 %;float: left;font-size: 14px;text-align: left;}.header {width: 100 %;padding: 10px 0;float: left;background: #044398;text-align: center;color: #FFF;}.content { width: 90 %;padding: 4 % 5 %;float: left;font-size: 14px;text-align: left; background: #FFF;}.footer {width: 100 %;padding: 15px 0;float: left;background: #044398;text-align: center;color: #FFF;}.button {background-color: #ff0000;border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;}p {font-size: 14px;} table {font-size: 13px;border-collapse: collapse;}table, td, th { border: 2px solid #98d2fa;}th, td {padding: 8px;text-align: left;}td {width: 50 %;} </ style ></ head > ";
                //    body += " <body>";
                //    body += " <h1>Hello</h1>";
                //    body += " </body>";
                //    //body += " </html>";
                //    mm.Body = body;
                //    mm.IsBodyHtml = true;
                //    SmtpClient smtp = new SmtpClient();
                //    smtp.Host = "yehtohoga.com";
                //    smtp.EnableSsl = false;
                //    NetworkCredential NetworkCred = new NetworkCredential(SenderEmail, SenderPassword);
                //    smtp.UseDefaultCredentials = true;
                //    smtp.Credentials = NetworkCred;
                //    smtp.Port = 25;


                //    smtp.Send(mm);
                //}
                //"<style>.logo {width: 100 %; float: left;font-size: 14px;font-weight: bold;}.header {width: 100 %;padding: 10px 0;float: left;background: #044398;text-align: center;color: #fff;}.footer {width: 100 %;padding: 15px 0;float: left;background: #044398;text-align: center;color: #fff;}p {font-size: 14px;}  </style>"
                string ImgLink = "https://ci6.googleusercontent.com/proxy/Ejf78rNp4FPSlAGfiz-wggkszrpIhljPoJaICUy7kZU_y0HitefyuZFJrVYVWWKymv1hwTBUXVPx5rgrSuk08nS5LVO0upQfUqTMlap_6-9bHyT1HEJyAM3l3A=s0-d-e1-ft#https://western-tours.com/themes/default/assets/frontend/images/logo.png";

                string body = "";
                body += "<!doctype html>";
                body += "<html style='background-color: #e3e3e3; margin: 0;padding: 0;'><head> ";
                body += "</head> ";
                body += " <body style='margin: 0;padding: 0; font-family: arial, helvetica, sans-serif;'><div class='wrapper' style='width: 100%; max-width: 700px; margin: 0px auto;'><div class='content' style='width: 90%;padding: 4% 5%;float: left;font-size: 14px; background: #fff;'><div style='width:100%; text-align:center;'><img  src='" + ImgLink + "' style='width:400px;' alt=''></div>";
                body += "<h4>Dear Customer,<br>Please verify the details and press the blue button below in order to confirm your reservation:</h4> ";
                body += "<table style='width:100%; font-size:13px;border-collapse:collapse;border: 2px solid #98d2fa;'><tr> <td style = 'padding:8px; text-align:left; width:50%;background-color:#4faef0;border: 2px solid #98d2fa;' ><strong> Booking No:</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.ReferenceNo + " </td></tr> ";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0;border: 2px solid #98d2fa;'><strong>Transfer Type :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblTripType.Name + "</td></tr>";
                body += "<tr style='background-color: #666666;'><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr>";
                body += "<tr><td style='padding:8px; text-align:left; width:50%; background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Visitor Name :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Name + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Visitor Telephone :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Phone + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Adults :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Adults + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Children :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Children + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Babies :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Babies + "</td></tr>";
                body += "<tr style='background-color: #666666; '><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr>";
                if (Data.TripType == 1 || Data.TripType == 2)
                {
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Arrival Date :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.ArrivalDate + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Arrival Time :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.ArrivalTime + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Arrival Place :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation.Name + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Arrival Flight No :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Flight_TrainNo + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Destination :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation1.Name + "</td></tr>";
                    body += "<tr style='background-color: #666666;'><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr>";
                }
                if (Data.TripType == 3 || Data.TripType == 2)
                {
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Departure Date :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.DepartureDate + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Departure Time :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.DepartureTime + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Departure Place :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation3.Name + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Pick up Place :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation2.Name + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Pick up Time :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.DepartureTime + "</td></tr>";
                    body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #4faef0; border: 2px solid #98d2fa;'><strong>Destination :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation3.Name + "</td></tr>";
                    body += "<tr style='background-color: #666666;'><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr>";
                }
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #ffcc00;border: 2px solid #98d2fa;'><strong>Fare :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Amount + "</td></tr>";
                body += "<tr style='background-color: #6633ff;'><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr></table>";
                body += " <div class='contact' style='margin-top:30px; text-align:center;width:100%;font-size:14px;'><a class='button' style='background-color:#0038b7;border: none;color: white;padding: 15px 32px;text-align:center;text-decoration: none;display: inline-block;font-size: 16px;' href='" + link + "'>Confirm the Booking</a></div></div>";

                body += " <div class='mainheader' style='width: 100%;float: left; padding: 20px 0;float: left;'><div class='contact' style='width: 100%;float: left;font-size: 14px;text-align:left;'>* If you have any clarifications, please call us on : (+33) 9814 759 69 or (+33) 6689 845 45<br><br>Thank You<br>";
                body += " Best Regards<br>Western Tours</div></div></div></body></html>";





                MailMessage mailMessage = new MailMessage(SenderEmail, Data.Email, "Booking Details", body);
                mailMessage.IsBodyHtml = true;
                mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                Client.Send(mailMessage);

                //mailMessage = new MailMessage(SenderEmail, Email, "Thank You Email", "Thank You for Contacting Us!!!");
                //mailMessage.IsBodyHtml = true;
                //mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                //Client.Send(mailMessage);

                ViewBag.Update = "Email has been successfully sent";

                return RedirectToAction("ViewBooking", new { id = Data.BookingId, Update = "Email has been successfully sent" });
            }
            catch (Exception)
            {
                return RedirectToAction("ViewBooking", new { id = Data.BookingId, Update = "There is an error in sending email" });
            }
           
        }


        public ActionResult ConfirmBooking(int id = 0)
        {
            return View(id);
        }


        public ActionResult ConfirmBookingDetails(int id = 0)
        {
            tblBooking Data = new tblBooking();
            Data = DB.tblBookings.Where(x => x.BookingId == id).FirstOrDefault();

            Data.Status = 2;
            DB.Entry(Data);
            DB.SaveChanges();

            string SenderEmail = System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString();
            string SenderPassword = System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString();
            SmtpClient Client = new SmtpClient("yehtohoga.com", 25);
            Client.EnableSsl = false;
            Client.Timeout = 100000;
            Client.DeliveryMethod = SmtpDeliveryMethod.Network;
            Client.UseDefaultCredentials = false;
            Client.Credentials = new System.Net.NetworkCredential(SenderEmail, SenderPassword);


            string ImgLink = "https://ci6.googleusercontent.com/proxy/Ejf78rNp4FPSlAGfiz-wggkszrpIhljPoJaICUy7kZU_y0HitefyuZFJrVYVWWKymv1hwTBUXVPx5rgrSuk08nS5LVO0upQfUqTMlap_6-9bHyT1HEJyAM3l3A=s0-d-e1-ft#https://western-tours.com/themes/default/assets/frontend/images/logo.png";

            string body = "";
            body += "<!doctype html>";
            body += "<html style='background-color: #e3e3e3; margin: 0;padding: 0;'><head> ";
            body += "</head> ";
            body += " <body style='margin: 0;padding: 0; font-family: arial, helvetica, sans-serif;'><div class='wrapper' style='width: 100%; max-width: 700px; margin: 0px auto;'><div class='content' style='width: 90%;padding: 4% 5%;float: left;font-size: 14px; background: #fff;'><div style='width:100%; text-align:center;'><img  src='" + ImgLink + "' style='width:400px;' alt=''></div>";
            body += "<h4>Dear Customer,<br>Thank you for choosing Western Tours<br><span style='color:Red;'>Please find your confirmed details below:</span></h4> ";
            body += "<table style='width:100%; font-size:13px;border-collapse:collapse;border: 2px solid #98d2fa;'><tr> <td style = 'padding:8px; text-align:left; width:50%;background-color:#6292fd;border: 2px solid #98d2fa;' ><strong> Booking No:</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.ReferenceNo + " </td></tr> ";
            body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd;border: 2px solid #98d2fa;'><strong>Transfer Type :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblTripType.Name + "</td></tr>";
            body += "<tr style='background-color: #666666;'><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr>";
            body += "<tr><td style='padding:8px; text-align:left; width:50%; background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Visitor Name :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Name + "</td></tr>";
            body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Visitor Telephone :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Phone + "</td></tr>";
            body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Visitor Email :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Email + "</td></tr>";
            body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Adults :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Adults + "</td></tr>";
            body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Children :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Children + "</td></tr>";
            body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Babies :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Babies + "</td></tr>";
            body += "<tr style='background-color: #666666; '><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr>";
            if (Data.TripType == 1 || Data.TripType == 2)
            {
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Arrival Date :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.ArrivalDate + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Arrival Time :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.ArrivalTime + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Arrival Place :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation.Name + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Arrival Flight No :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Flight_TrainNo + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Destination :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation1.Name + "</td></tr>";
                body += "<tr style='background-color: #666666;'><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr>";
            }
            if (Data.TripType == 3 || Data.TripType == 2)
            {
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Departure Date :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.DepartureDate + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Departure Time :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.DepartureTime + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Departure Place :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation3.Name + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Pick up Place :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation2.Name + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Pick up Time :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.DepartureTime + "</td></tr>";
                body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd; border: 2px solid #98d2fa;'><strong>Destination :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.tblLocation3.Name + "</td></tr>";
                body += "<tr style='background-color: #666666;'><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr>";
            }
            body += "<tr><td style='padding:8px;text-align:left;width:50%;  background-color: #6292fd;border: 2px solid #98d2fa;'><strong>Fare :</strong></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'>" + Data.Amount + "</td></tr>";
            body += "<tr style='background-color: #6633ff;'><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td><td style='padding:8px;text-align:left;width:50%; border: 2px solid #98d2fa;'></td></tr></table>";
            //body += " <div class='contact' style='margin-top:30px; text-align:center;width:100%;font-size:14px;'><a class='button' style='background-color:#0038b7;border: none;color: white;padding: 15px 32px;text-align:center;text-decoration: none;display: inline-block;font-size: 16px;' href='" + link + "'>Confirm the Booking</a></div></div>";

            body += " <div class='mainheader' style='width: 100%;float: left; padding: 20px 0;float: left;'><div class='contact' style='width: 100%;float: left;font-size: 14px;text-align:left;'>* Your driver will be waiting for you at the customs exit with your name printed on a board.<br>* Please make sure that you have a copy of this confirmation upon arrival.<br>*Please have your cell phone is switched on as soon as you land, so that our drivers could easily contact you.<br>*If you have any trouble finding your driver, please do not hesitate to contact our hotline(+33) 9814 759 69 or(+33) 6689 845 45 <br>*We provide baby seats and booster seats free of charges<br> <br>Cancellation has to be done before 24 hours.If there is an error, please contact us.<br><br>Thank You<br>Best Regards<br>Western Tours <b>";
            body += "</div></div></div></body></html>";





            MailMessage mailMessage = new MailMessage(SenderEmail, Data.Email, "Booking Details", body);
            mailMessage.IsBodyHtml = true;
            mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

            Client.Send(mailMessage);


            return View();
        }

        public ActionResult DailyBookingReport()
        {
            List<DailyReportData_Result> Data = new List<DailyReportData_Result>();
            Data = DB.DailyReportData(DateTime.Now).ToList();
            ViewBag.SearchDate = DateTime.Now;
            return View(Data);
        }
        [HttpPost]
        public ActionResult DailyBookingReport(DateTime SearchDate)
        {
            List<DailyReportData_Result> Data = new List<DailyReportData_Result>();
            Data = DB.DailyReportData(SearchDate).ToList();

            ViewBag.SearchDate = SearchDate;

            return View(Data);
        }
    }
}