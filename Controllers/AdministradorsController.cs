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
    public class AdministradorsController : Controller
    {
        private Conexion db = new Conexion();

        // GET: Administradors
        public ActionResult Index()
        {
            var administrador = db.Administrador.Include(a => a.CEstados).Include(a => a.CTipoIdentificacion);
            return View(administrador.ToList());
        }

        // GET: Administradors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Administrador administrador = db.Administrador.Find(id);
            if (administrador == null)
            {
                return HttpNotFound();
            }
            return View(administrador);
        }

        // GET: Administradors/Create
        public ActionResult Create()
        {
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion");
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion");
            return View();
        }

        // POST: Administradors/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdAdministrador,IdTipoIdentificacion,NumeroIdentificacion,Nombres,Apellidos,Telefono,Correo,User,Password,IdEstado,Observaciones")] Administrador administrador)
        {
            if (ModelState.IsValid)
            {
                db.Administrador.Add(administrador);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", administrador.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", administrador.IdTipoIdentificacion);
            return View(administrador);
        }

        // GET: Administradors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Administrador administrador = db.Administrador.Find(id);
            if (administrador == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", administrador.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", administrador.IdTipoIdentificacion);
            return View(administrador);
        }

        // POST: Administradors/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdAdministrador,IdTipoIdentificacion,NumeroIdentificacion,Nombres,Apellidos,Telefono,Correo,User,Password,IdEstado,Observaciones")] Administrador administrador)
        {
            if (ModelState.IsValid)
            {
                db.Entry(administrador).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", administrador.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", administrador.IdTipoIdentificacion);
            return View(administrador);
        }

        // GET: Administradors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Administrador administrador = db.Administrador.Find(id);
            if (administrador == null)
            {
                return HttpNotFound();
            }
            return View(administrador);
        }

        // POST: Administradors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Administrador administrador = db.Administrador.Find(id);
            db.Administrador.Remove(administrador);
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
