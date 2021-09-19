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
    public class HabitacionesController : Controller
    {
        private readonly Conexion db = new Conexion();

        // GET: Habitaciones
        public ActionResult Index()
        {
            var habitaciones = db.Habitaciones.Include(h => h.CEstados).Include(h => h.CEstados1).Include(h => h.CTipoHabitacion);
            return View(habitaciones.ToList());
        }

        // GET: Habitaciones/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Habitaciones habitaciones = db.Habitaciones.Find(id);
            if (habitaciones == null)
            {
                return HttpNotFound();
            }
            return View(habitaciones);
        }

        // GET: Habitaciones/Create
        public ActionResult Create()
        {
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion");
            ViewBag.IdTipoHabitacion = new SelectList(db.CTipoHabitacion, "IdTipoHabitacion", "Descripcion");
            return View();
        }

        // POST: Habitaciones/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdHabitacion,NumeroHabitacion,IdTipoHabitacion,Tarifa,NumeroPersonas,IdEstado,Observaciones")] Habitaciones habitaciones)
        {
            if (ModelState.IsValid)
            {
                db.Habitaciones.Add(habitaciones);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", habitaciones.IdEstado);
            ViewBag.IdTipoHabitacion = new SelectList(db.CTipoHabitacion, "IdTipoHabitacion", "Descripcion", habitaciones.IdTipoHabitacion);
            return View(habitaciones);
        }

        // GET: Habitaciones/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Habitaciones habitaciones = db.Habitaciones.Find(id);
            if (habitaciones == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", habitaciones.IdEstado);
            ViewBag.IdTipoHabitacion = new SelectList(db.CTipoHabitacion, "IdTipoHabitacion", "Descripcion", habitaciones.IdTipoHabitacion);
            return View(habitaciones);
        }

        // POST: Habitaciones/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdHabitacion,NumeroHabitacion,IdTipoHabitacion,Tarifa,NumeroPersonas,IdEstado,Observaciones")] Habitaciones habitaciones)
        {
            if (ModelState.IsValid)
            {
                db.Entry(habitaciones).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", habitaciones.IdEstado);
            ViewBag.IdTipoHabitacion = new SelectList(db.CTipoHabitacion, "IdTipoHabitacion", "Descripcion", habitaciones.IdTipoHabitacion);
            return View(habitaciones);
        }

        // GET: Habitaciones/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Habitaciones habitaciones = db.Habitaciones.Find(id);
            if (habitaciones == null)
            {
                return HttpNotFound();
            }
            return View(habitaciones);
        }

        // POST: Habitaciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            try
            {
                Habitaciones habitaciones = db.Habitaciones.Find(id);
                db.Habitaciones.Remove(habitaciones);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ViewBag.Mensaje = "La habitación no puede ser eliminada.";
                return View();
            }
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
