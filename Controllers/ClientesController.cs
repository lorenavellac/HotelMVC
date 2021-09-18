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
    public class ClientesController : Controller
    {
        private Conexion db = new Conexion();

        // GET: Clientes
        public ActionResult Index()
        {
            var clientes = db.Clientes.Include(c => c.CEstados).Include(c => c.CTipoIdentificacion);
            return View(clientes.ToList());
        }

        // GET: Clientes/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clientes clientes = db.Clientes.Find(id);
            if (clientes == null)
            {
                return HttpNotFound();
            }
            return View(clientes);
        }

        // GET: Clientes/Create
        public ActionResult Create()
        {
            ViewBag.IdEstado = new SelectList(db.CEstados.Where(x => x.Categoria.Equals("Clientes")).OrderBy(x => x.Descripcion), "IdEstado", "Descripcion");
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion");
            return View();
        }

        // POST: Clientes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdCliente,IdTipoIdentificacion,NumeroIdentificacion,Nombres,Apellidos,Telefono,Correo,Observaciones,IdEstado")] Clientes clientes)
        {
            if (ModelState.IsValid)
            {
                db.Clientes.Add(clientes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", clientes.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", clientes.IdTipoIdentificacion);
            return View(clientes);
        }

        // GET: Clientes/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clientes clientes = db.Clientes.Find(id);
            if (clientes == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstado = new SelectList(db.CEstados.Where(x => x.Categoria.Equals("Clientes")).OrderBy(x => x.Descripcion), "IdEstado", "Descripcion", clientes.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", clientes.IdTipoIdentificacion);
            return View(clientes);
        }

        // POST: Clientes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdCliente,IdTipoIdentificacion,NumeroIdentificacion,Nombres,Apellidos,Telefono,Correo,Observaciones,IdEstado")] Clientes clientes)
        {
            if (ModelState.IsValid)
            {
                db.Entry(clientes).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdEstado = new SelectList(db.CEstados, "IdEstado", "Descripcion", clientes.IdEstado);
            ViewBag.IdTipoIdentificacion = new SelectList(db.CTipoIdentificacion, "IdTipoIdentificacion", "Descripcion", clientes.IdTipoIdentificacion);
            return View(clientes);
        }

        // GET: Clientes/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clientes clientes = db.Clientes.Find(id);
            if (clientes == null)
            {
                return HttpNotFound();
            }
            return View(clientes);
        }

        // POST: Clientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Clientes clientes = db.Clientes.Find(id);
            db.Clientes.Remove(clientes);
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
