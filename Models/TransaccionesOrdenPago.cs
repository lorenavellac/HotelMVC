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
    
    public partial class TransaccionesOrdenPago
    {
        public int IdTransaccionOrdenPago { get; set; }
        public int IdOrdenPago { get; set; }
        public long IdTransaccion { get; set; }
    
        public virtual OrdenPago OrdenPago { get; set; }
        public virtual Transacciones Transacciones { get; set; }
    }
}
