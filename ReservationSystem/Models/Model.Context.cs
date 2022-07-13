﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReservationSystem.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class ReservationSystemEntities : DbContext
    {
        public ReservationSystemEntities()
            : base("name=ReservationSystemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<tblBooking> tblBookings { get; set; }
        public virtual DbSet<tblCat> tblCats { get; set; }
        public virtual DbSet<tblContactU> tblContactUs { get; set; }
        public virtual DbSet<tblLocation> tblLocations { get; set; }
        public virtual DbSet<tblPaymentStatu> tblPaymentStatus { get; set; }
        public virtual DbSet<tblRate> tblRates { get; set; }
        public virtual DbSet<tblReview> tblReviews { get; set; }
        public virtual DbSet<tblStatu> tblStatus { get; set; }
        public virtual DbSet<tblTour> tblTours { get; set; }
        public virtual DbSet<tblTripType> tblTripTypes { get; set; }
        public virtual DbSet<tblUser> tblUsers { get; set; }
    
        public virtual ObjectResult<RateData_Result> RateData()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RateData_Result>("RateData");
        }
    
        public virtual ObjectResult<RateCatData_Result> RateCatData()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RateCatData_Result>("RateCatData");
        }
    
        public virtual ObjectResult<TourLocationData_Result> TourLocationData()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<TourLocationData_Result>("TourLocationData");
        }
    
        public virtual ObjectResult<DailyReportData_Result> DailyReportData(Nullable<System.DateTime> date)
        {
            var dateParameter = date.HasValue ?
                new ObjectParameter("Date", date) :
                new ObjectParameter("Date", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<DailyReportData_Result>("DailyReportData", dateParameter);
        }
    
        public virtual ObjectResult<BookingData_Result> BookingData()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<BookingData_Result>("BookingData");
        }
    
        public virtual ObjectResult<GetBookingData_Result> GetBookingData(Nullable<int> iD)
        {
            var iDParameter = iD.HasValue ?
                new ObjectParameter("ID", iD) :
                new ObjectParameter("ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetBookingData_Result>("GetBookingData", iDParameter);
        }
    }
}
