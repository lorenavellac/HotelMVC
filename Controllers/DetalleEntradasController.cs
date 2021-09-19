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
    public class DetalleEntradasController : Controller
    {
        private readonly Conexion db = new Conexion();

        // GET: DetalleEntradas
        public ActionResult Index()
        {
            var detalleEntrada = db.DetalleEntrada.Include(d => d.Entrada).Include(d => d.Productos);
            return View(detalleEntrada.ToList());
        }

        // GET: DetalleEntradas/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleEntrada detalleEntrada = db.DetalleEntrada.Find(id);
            if (detalleEntrada == null)
            {
                return HttpNotFound();
            }
            return View(detalleEntrada);
        }

        // GET: DetalleEntradas/Create
        public ActionResult Create()
        {
            ViewBag.IdEntrada = new SelectList(db.Entrada, "IdEntrada", "NumeroIdentificacion");
            ViewBag.IdProducto = new SelectList(db.Productos, "IdProducto", "NumeroIdentificacion");
            return View();
        }

        // POST: DetalleEntradas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdDetalleEntrada,IdEntrada,IdProducto,Cantidad")] DetalleEntrada detalleEntrada)
        {
            if (ModelState.IsValid)
            {
                db.DetalleEntrada.Add(detalleEntrada);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdEntrada = new SelectList(db.Entrada, "IdEntrada", "NumeroIdentificacion", detalleEntrada.IdEntrada);
            ViewBag.IdProducto = new SelectList(db.Productos, "IdProducto", "NumeroIdentificacion", detalleEntrada.IdProducto);
            return View(detalleEntrada);
        }

        // GET: DetalleEntradas/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleEntrada detalleEntrada = db.DetalleEntrada.Find(id);
            if (detalleEntrada == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEntrada = new SelectList(db.Entrada, "IdEntrada", "NumeroIdentificacion", detalleEntrada.IdEntrada);
            ViewBag.IdProducto = new SelectList(db.Productos, "IdProducto", "NumeroIdentificacion", detalleEntrada.IdProducto);
            return View(detalleEntrada);
        }

        // POST: DetalleEntradas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdDetalleEntrada,IdEntrada,IdProducto,Cantidad")] DetalleEntrada detalleEntrada)
        {
            if (ModelState.IsValid)
            {
                db.Entry(detalleEntrada).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdEntrada = new SelectList(db.Entrada, "IdEntrada", "NumeroIdentificacion", detalleEntrada.IdEntrada);
            ViewBag.IdProducto = new SelectList(db.Productos, "IdProducto", "NumeroIdentificacion", detalleEntrada.IdProducto);
            return View(detalleEntrada);
        }

        // GET: DetalleEntradas/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleEntrada detalleEntrada = db.DetalleEntrada.Find(id);
            if (detalleEntrada == null)
            {
                return HttpNotFound();
            }
            return View(detalleEntrada);
        }

        // POST: DetalleEntradas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            DetalleEntrada detalleEntrada = db.DetalleEntrada.Find(id);
            db.DetalleEntrada.Remove(detalleEntrada);
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
