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
    public class CTipoHabitacionsController : Controller
    {
        private Conexion db = new Conexion();

        // GET: CTipoHabitacions
        public ActionResult Index()
        {
            return View(db.CTipoHabitacion.ToList());
        }

        // GET: CTipoHabitacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTipoHabitacion cTipoHabitacion = db.CTipoHabitacion.Find(id);
            if (cTipoHabitacion == null)
            {
                return HttpNotFound();
            }
            return View(cTipoHabitacion);
        }

        // GET: CTipoHabitacions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CTipoHabitacions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdTipoHabitacion,Descripcion")] CTipoHabitacion cTipoHabitacion)
        {
            if (ModelState.IsValid)
            {
                db.CTipoHabitacion.Add(cTipoHabitacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(cTipoHabitacion);
        }

        // GET: CTipoHabitacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTipoHabitacion cTipoHabitacion = db.CTipoHabitacion.Find(id);
            if (cTipoHabitacion == null)
            {
                return HttpNotFound();
            }
            return View(cTipoHabitacion);
        }

        // POST: CTipoHabitacions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdTipoHabitacion,Descripcion")] CTipoHabitacion cTipoHabitacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cTipoHabitacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cTipoHabitacion);
        }

        // GET: CTipoHabitacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTipoHabitacion cTipoHabitacion = db.CTipoHabitacion.Find(id);
            if (cTipoHabitacion == null)
            {
                return HttpNotFound();
            }
            return View(cTipoHabitacion);
        }

        // POST: CTipoHabitacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CTipoHabitacion cTipoHabitacion = db.CTipoHabitacion.Find(id);
            db.CTipoHabitacion.Remove(cTipoHabitacion);
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
