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
    public class EntradasController : Controller
    {
        private readonly Conexion db = new Conexion();

        // GET: Entradas
        public ActionResult Index()
        {
            var entrada = db.Entrada.Include(e => e.CEstados).Include(e => e.Proveedores);
            return View(entrada.ToList());
        }

        // GET: Entradas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Entrada entrada = db.Entrada.Find(id);
            if (entrada == null)
            {
                return HttpNotFound();
            }
            return View(entrada);
        }

        // GET: Entradas/Create
        public ActionResult Create()
        {
            ViewBag.IdEstado = new SelectList(db.CEstados.Where(x => x.Categoria.Equals("Entradas")), "IdEstado", "Descripcion");
            ViewBag.NumeroIdentificacion = new SelectList(db.Proveedores, "NumeroIdentificacion", "RazonSocial");
            return View();
        }

        // POST: Entradas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdEntrada,FechaHora,NumeroIdentificacion,Total,IdEstado")] Entrada entrada)
        {
            if (ModelState.IsValid)
            {
                db.Entrada.Add(entrada);
                db.SaveChanges();
                return RedirectToAction("Create", "DetalleEntradas", entrada.IdEntrada);
            }

            ViewBag.IdEstado = new SelectList(db.CEstados.Where(x => x.Categoria.Equals("Entradas")), "IdEstado", "Descripcion", entrada.IdEstado);
            ViewBag.NumeroIdentificacion = new SelectList(db.Proveedores, "NumeroIdentificacion", "RazonSocial", entrada.NumeroIdentificacion);
            return View(entrada);
        }

        // GET: Entradas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Entrada entrada = db.Entrada.Find(id);
            if (entrada == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstado = new SelectList(db.CEstados.Where(x => x.Categoria.Equals("Entradas")), "IdEstado", "Descripcion", entrada.IdEstado);
            ViewBag.NumeroIdentificacion = new SelectList(db.Proveedores, "NumeroIdentificacion", "RazonSocial", entrada.NumeroIdentificacion);
            return View(entrada);
        }

        // POST: Entradas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdEntrada,FechaHora,NumeroIdentificacion,Total,IdEstado")] Entrada entrada)
        {
            if (ModelState.IsValid)
            {
                db.Entry(entrada).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdEstado = new SelectList(db.CEstados.Where(x => x.Categoria.Equals("Entradas")), "IdEstado", "Descripcion", entrada.IdEstado);
            ViewBag.NumeroIdentificacion = new SelectList(db.Proveedores, "NumeroIdentificacion", "RazonSocial", entrada.NumeroIdentificacion);
            return View(entrada);
        }

        // GET: Entradas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Entrada entrada = db.Entrada.Find(id);
            if (entrada == null)
            {
                return HttpNotFound();
            }
            return View(entrada);
        }

        // POST: Entradas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Entrada entrada = db.Entrada.Find(id);
            db.Entrada.Remove(entrada);
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
