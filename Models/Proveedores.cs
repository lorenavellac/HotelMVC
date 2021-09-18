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
    
    public partial class Proveedores
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Proveedores()
        {
            this.Entrada = new HashSet<Entrada>();
            this.Productos = new HashSet<Productos>();
        }
    
        public int IdProveedor { get; set; }
        public string RazonSocial { get; set; }
        public string IdTipoIdentificacion { get; set; }
        public string NumeroIdentificacion { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public Nullable<short> IdEstado { get; set; }
        public string Observaciones { get; set; }
    
        public virtual CEstados CEstados { get; set; }
        public virtual CTipoIdentificacion CTipoIdentificacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Entrada> Entrada { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Productos> Productos { get; set; }
    }
}
