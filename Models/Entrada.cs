//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HotelMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Entrada
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Entrada()
        {
            this.DetalleEntrada = new HashSet<DetalleEntrada>();
        }
    
        public int IdEntrada { get; set; }
        public System.DateTime FechaHora { get; set; }
        public string NumeroIdentificacion { get; set; }
        public Nullable<decimal> Total { get; set; }
        public short IdEstado { get; set; }
    
        public virtual CEstados CEstados { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DetalleEntrada> DetalleEntrada { get; set; }
        public virtual Proveedores Proveedores { get; set; }
    }
}
