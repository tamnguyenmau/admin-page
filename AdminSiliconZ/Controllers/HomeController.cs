using AdminSiliconZ.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace AdminSiliconZ.Controllers
{
    public class HomeController : Controller
    {
        [Route("admin", Name = "AdminHome")]
        public IActionResult Index()
        {
            return View();
        }
    }
}