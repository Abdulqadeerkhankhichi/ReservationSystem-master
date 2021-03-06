//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class tblTour
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblTour()
        {
            this.tblRates = new HashSet<tblRate>();
        }
    
        public int TourId { get; set; }
        public string Type { get; set; }
        public Nullable<int> FromLocation { get; set; }
        public Nullable<int> ToLocation { get; set; }
        public Nullable<int> PickupHours { get; set; }
    
        public virtual tblLocation tblLocation { get; set; }
        public virtual tblLocation tblLocation1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblRate> tblRates { get; set; }
    }
}
