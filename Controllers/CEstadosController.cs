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
    public class CEstadosController : Controller
    {
        private Conexion db = new Conexion();

        // GET: CEstados
        public ActionResult Index()
        {
            return View(db.CEstados.ToList());
        }

        // GET: CEstados/Details/5
        public ActionResult Details(short? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CEstados cEstados = db.CEstados.Find(id);
            if (cEstados == null)
            {
                return HttpNotFound();
            }
            return View(cEstados);
        }

        // GET: CEstados/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CEstados/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdEstado,Descripcion,Categoria")] CEstados cEstados)
        {
            if (ModelState.IsValid)
            {
                db.CEstados.Add(cEstados);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(cEstados);
        }

        // GET: CEstados/Edit/5
        public ActionResult Edit(short? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CEstados cEstados = db.CEstados.Find(id);
            if (cEstados == null)
            {
                return HttpNotFound();
            }
            return View(cEstados);
        }

        // POST: CEstados/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdEstado,Descripcion,Categoria")] CEstados cEstados)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cEstados).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cEstados);
        }

        // GET: CEstados/Delete/5
        public ActionResult Delete(short? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CEstados cEstados = db.CEstados.Find(id);
            if (cEstados == null)
            {
                return HttpNotFound();
            }
            return View(cEstados);
        }

        // POST: CEstados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(short id)
        {
            CEstados cEstados = db.CEstados.Find(id);
            db.CEstados.Remove(cEstados);
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
