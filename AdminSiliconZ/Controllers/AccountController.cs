using AdminSiliconZ.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace AdminSiliconZ.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;

        [HttpGet]
        [Route("/", Name = "Default")]
        [Route("/admin/login", Name = "AdminLogin")]
        public IActionResult Login()
        {
            ViewBag.LoginMessage = "Xin mời đăng nhập tài khoản";
            ViewBag.LoginClass = "alert-info";
            return View();
        }

        [HttpPost]
        [Route("/admin/login", Name = "AdminLogin")]
        public IActionResult Login(Account data)
        {
            DBContext context = new DBContext();
            var item = context.Accounts.FirstOrDefault(x => x.Username == data.Username && x.Password == data.Password);

            if (item == null)
            {
                ViewBag.LoginMessage = "Tài khoản không hợp lệ";
                ViewBag.LoginClass = "alert-danger";
                return View();
            }
            else
            {
                ViewBag.LoginMessage = "Đăng nhập thành công";
                ViewBag.LoginClass = "alert-success";
                ModelState.Clear();

                HttpContext.Session.SetString("Username", item.Username);
                HttpContext.Session.SetString("Fullname", item.FullName ?? string.Empty);
                HttpContext.Session.SetString("Avatar", item.Avatar ?? string.Empty);
                HttpContext.Session.SetString("Email", item.Email ?? string.Empty);
                HttpContext.Session.SetString("Mobile", item.Mobile ?? string.Empty);
                HttpContext.Session.SetString("Address", item.Address ?? string.Empty);
                HttpContext.Session.SetString("AccountCategory", item.AccountCategoryId ?? string.Empty);
                return RedirectToRoute("AdminHome");
            }

        }

        [HttpGet]
        [Route("/admin/profile", Name = "AdminProfile")]
        public IActionResult Profile()
        {
            return View();
        }
        [HttpPost]
        [Route("/admin/profile", Name = "AdminProfile")]
        public IActionResult Profile(Account data)
        {
            return View();
        }
        [HttpGet]
        [Route("/admin/change-password", Name = "AdminChangePassword")]
        public IActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        [Route("/admin/change-password", Name = "AdminChangePassword")]
        public async Task<IActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await _userManager.GetUserAsync(User);
                if (user == null)
                {
                    return NotFound();
                }

                var changePasswordResult = await _userManager.ChangePasswordAsync(user, model.OldPassword, model.NewPassword);

                if (changePasswordResult.Succeeded)
                {
                    // Xử lý khi đổi mật khẩu thành công
                    return RedirectToAction("ChangePasswordConfirmation");
                }
                else
                {
                    foreach (var error in changePasswordResult.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }
                }
            }

            return View(model);
        }

        [HttpPost]
        [Route("admin/logout", Name = "AdminLogout")]
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }

        [HttpGet]
        [Route("/admin/account", Name = "AdminAccount")]
        public IActionResult Index()
        {
            DBContext db = new DBContext();
            var data = db.Accounts
                         .Where(x => x.Status == true)
                         .ToList();
            return View(data);
        }
    }
}