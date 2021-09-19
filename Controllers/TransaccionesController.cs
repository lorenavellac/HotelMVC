using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HotelMVC.Models;

namespace HotelMVC.Controllers
{
    public class TransaccionesController : Controller
    {
        private readonly Conexion db = new Conexion();

        // GET: Transacciones
        public ActionResult Index()
        {
            var transacciones = db.Transacciones.Include(t => t.CEstados).Include(t => t.CEstados1).Include(t => t.Clientes).Include(t => t.Habitaciones);
            return View(transacciones.ToList());
        }

        // GET: Transacciones/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transacciones transacciones = db.Transacciones.Find(id);
            if (transacciones == null)
            {
                return HttpNotFound();
            }
            return View(transacciones);
        }

        // GET: Transacciones/Create
        public ActionResult Create()
        {
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion");
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "IdTipoIdentificacion");
            ViewBag.NumeroHabitacion = new SelectList(db.Habitaciones, "NumeroHabitacion", "NumeroHabitacion");
            return View();
        }

        // POST: Transacciones/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdTransaccion,IdTipoIdentificacion, NumeroIdentificacion,NumeroHabitacion,FechaHoraIngreso,FechaHoraSalida,NumeroPersonas,IdEstado,Total")] Transacciones transacciones)
        {
            if (ModelState.IsValid)
            {
                db.Transacciones.Add(transacciones);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", transacciones.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "IdTipoIdentificacion", transacciones.IdTipoIdentificacion);
            ViewBag.NumeroHabitacion = new SelectList(db.Habitaciones, "NumeroHabitacion", "NumeroHabitacion", transacciones.NumeroHabitacion);
            return View(transacciones);
        }

        // GET: Transacciones/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transacciones transacciones = db.Transacciones.Find(id);
            if (transacciones == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", transacciones.IdEstado);
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", transacciones.IdEstado);
            ViewBag.NumeroIdentificacion = new SelectList(db.Clientes, "NumeroIdentificacion", "IdTipoIdentificacion", transacciones.NumeroIdentificacion);
            ViewBag.NumeroHabitacion = new SelectList(db.Habitaciones, "NumeroHabitacion", "Observaciones", transacciones.NumeroHabitacion);
            return View(transacciones);
        }

        // POST: Transacciones/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdTransaccion,NumeroIdentificacion,NumeroHabitacion,FechaHoraIngreso,FechaHoraSalida,NumeroPersonas,IdEstado,Total")] Transacciones transacciones)
        {
            if (ModelState.IsValid)
            {
                db.Entry(transacciones).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", transacciones.IdEstado);
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", transacciones.IdEstado);
            ViewBag.NumeroIdentificacion = new SelectList(db.Clientes, "NumeroIdentificacion", "IdTipoIdentificacion", transacciones.NumeroIdentificacion);
            ViewBag.NumeroHabitacion = new SelectList(db.Habitaciones, "NumeroHabitacion", "Observaciones", transacciones.NumeroHabitacion);
            return View(transacciones);
        }

        // GET: Transacciones/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Transacciones transacciones = db.Transacciones.Find(id);
            if (transacciones == null)
            {
                return HttpNotFound();
            }
            return View(transacciones);
        }

        // POST: Transacciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Transacciones transacciones = db.Transacciones.Find(id);
            db.Transacciones.Remove(transacciones);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
