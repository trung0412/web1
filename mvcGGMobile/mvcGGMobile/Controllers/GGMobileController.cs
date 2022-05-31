using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvcGGMobile.Models;

namespace GGMobile.Controllers
{
    public class GGMobileController : Controller
    {
        //database
        dbGGMobileDataContext data = new dbGGMobileDataContext();

        private List<SanPham> LaySanphammoi (int count)
        {
            return data.SanPhames.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        // GET: GGMobile
        public ActionResult Index()
        {
            // lay 5 sp
            var sanphammoi = LaySanphammoi(5);
            return View(sanphammoi);
        }
        public ActionResult Hang()
        {
            var hang = from hangsp in data.Hangs select hangsp;
            return PartialView(hang);
        }
        public ActionResult SPTheoHang(int id)
        {
            var SanPham = from sp in data.SanPhames where sp.MaHang==id select sp;
            return PartialView(SanPham);
        }
        public ActionResult Details(int id)
        {
            var SanPham = from sp in data.SanPhames
                          where sp.MaSP == id
                          select sp;
            return View(SanPham.Single());
        }
    }
}