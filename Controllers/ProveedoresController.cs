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
    public class ProveedoresController : Controller
    {
        private readonly Conexion db = new Conexion();

        // GET: Proveedores
        public ActionResult Index()
        {
            var proveedores = db.Proveedores.Include(p => p.CEstados).Include(p => p.CTipoIdentificacion);
            return View(proveedores.ToList());
        }

        // GET: Proveedores/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proveedores proveedores = db.Proveedores.Find(id);
            if (proveedores == null)
            {
                return HttpNotFound();
            }
            return View(proveedores);
        }

        // GET: Proveedores/Create
        public ActionResult Create()
        {
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion");
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion");
            return View();
        }

        // POST: Proveedores/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdProveedor,RazonSocial,IdTipoIdentificacion,NumeroIdentificacion,Direccion,Telefono,Correo,IdEstado,Observaciones")] Proveedores proveedores)
        {
            if (ModelState.IsValid)
            {
                db.Proveedores.Add(proveedores);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", proveedores.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", proveedores.IdTipoIdentificacion);
            return View(proveedores);
        }

        // GET: Proveedores/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proveedores proveedores = db.Proveedores.Find(id);
            if (proveedores == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", proveedores.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", proveedores.IdTipoIdentificacion);
            return View(proveedores);
        }

        // POST: Proveedores/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdProveedor,RazonSocial,IdTipoIdentificacion,NumeroIdentificacion,Direccion,Telefono,Correo,IdEstado,Observaciones")] Proveedores proveedores)
        {
            if (ModelState.IsValid)
            {
                db.Entry(proveedores).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", proveedores.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", proveedores.IdTipoIdentificacion);
            return View(proveedores);
        }

        // GET: Proveedores/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proveedores proveedores = db.Proveedores.Find(id);
            if (proveedores == null)
            {
                return HttpNotFound();
            }
            return View(proveedores);
        }

        // POST: Proveedores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            try
            {
                Proveedores proveedores = db.Proveedores.Find(id);
                db.Proveedores.Remove(proveedores);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ViewBag.Mensaje = "El proveedor no puede ser eliminado.";
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
