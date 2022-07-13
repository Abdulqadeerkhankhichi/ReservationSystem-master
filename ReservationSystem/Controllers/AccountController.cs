using ReservationSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ReservationSystem.Controllers
{
    public class AccountController : Controller
    {
        ReservationSystemEntities DB = new ReservationSystemEntities();
        // GET: Account
        public ActionResult Login()
        {
            FormsAuthentication.SignOut();
            return View();
        }


        [HttpPost]
        public ActionResult Login(string Email, string Password)
        {
            //string pass = null;
            


            try
            {
                //if (Password != null)
                //{
                //    byte[] EncDataBtye = new byte[Password.Length];
                //    EncDataBtye = System.Text.Encoding.UTF8.GetBytes(Password);
                //    pass = Convert.ToBase64String(EncDataBtye);
                //}

                if (DB.tblUsers.Select(r => r).Where(x => x.Email == Email && x.Password == Password && x.isActive != false).FirstOrDefault() != null)
                {
                    var User = DB.tblUsers.Select(r => r).Where(x => x.Email == Email).FirstOrDefault();

                    HttpCookie cookie = new HttpCookie("User");

                    cookie["Email"] = User.Email;
                    cookie["UserId"] = User.UserId.ToString();
                    cookie.Expires = DateTime.Now.AddMonths(1);
                    Response.Cookies.Add(cookie);

                    FormsAuthentication.SetAuthCookie(Email, false);

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    var UserCheck = DB.tblUsers.Select(r => r).Where(x => x.Email == Email && x.Password == Password).FirstOrDefault();
                    if (UserCheck != null && UserCheck.isActive == false)
                    {
                        ViewBag.Error = "User is in-active";
                    }
                    else
                    {
                        ViewBag.Error = "Invalid Email or Password";
                    }

                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Index", "Home");
        }
    }
}