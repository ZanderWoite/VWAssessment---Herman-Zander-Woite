using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VWNewsclipApp.Models;

namespace VWNewsclipApp.Controllers
{
    public class HomeController : Controller
    {
        CarModelDB carModelDB = new CarModelDB();

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult SelectCarModel()
        {
            return Json(carModelDB.SelectCarModel(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult SelectSubModel()
        {
            return Json(carModelDB.SelectSubModel(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult SelectFeature()
        {
            return Json(carModelDB.SelectFeature(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult SelectAll()
        {
            return Json(carModelDB.SelectAll(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public JsonResult DeleteCar(int id)
        {
            return Json(carModelDB.DeleteCar(id), JsonRequestBehavior.AllowGet);
        }

        public JsonResult InsertMake(Make make)
        {
            return Json(carModelDB.InsertMake(make), JsonRequestBehavior.AllowGet);
        }

        public JsonResult InsertFeature(Feature feature)
        {
            return Json(carModelDB.InsertFeature(feature), JsonRequestBehavior.AllowGet);
        }

        public JsonResult InsertSubModel(SubModel subModel)
        {
            return Json(carModelDB.InsertSubModel(subModel), JsonRequestBehavior.AllowGet);
        }

        public JsonResult SelectAvailableModels()
        {
            return Json(carModelDB.SelectAvailableModels(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpdateSubModel(SubModel subModel)
        {
            return Json(carModelDB.UpdateSubModel(subModel), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetSubModelById(int id)
        {
            var subModel = carModelDB.SelectSubModel().Find(x => x.SubModel_ID.Equals(id));
            return Json(subModel, JsonRequestBehavior.AllowGet);
        }
    }
}