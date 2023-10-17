using AdminSiliconZ.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AdminSiliconZ.Controllers
{
    public class ArticleCategoryController : Controller
    {
        private IWebHostEnvironment Environment;
        public ArticleCategoryController(IWebHostEnvironment _environment)
        {
            Environment = _environment;
        }

        private bool ValidateForm(ArticleCategory item)
        {
            if (item.Position == null)
            {
                ViewBag.MessageText = "Vui lòng chọn vị trí";
                ViewBag.MessageClass = "alert-warning";
                return false;
            }
            else if (string.IsNullOrEmpty(item.Title))
            {
                ViewBag.MessageText = "Vui lòng nhập tiêu đề ";
                ViewBag.MessageClass = "alert-warning";
                return false;
            }
            else
            {
                return true;
            }
        }

        [Route("admin/article-category", Name = "AdminArticleCategory")]
        public IActionResult Index()
        {
            DBContext db = new DBContext();
            var data = db.ArticleCategories
                         .Where(x => x.Status == true)
                         .OrderBy(x => x.Position)
                         .ToList();
            return View(data);
        }

        [HttpGet]
        [Route("admin/article-category-detail/{id?}", Name = "AdminArticleCategoryDetail")]
        public IActionResult Detail(int? id)
        {
            DBContext db = new DBContext();
            var category = db.ArticleCategories
                             .OrderBy(x => x.Position)
                             .ToList();
            ViewBag.ArticleCategory = category;

            var item = db.ArticleCategories.Find(id);
            if (item == null)
            {
                item = new ArticleCategory();
                return View(item);
            }
            else
                return View(item);
        }
        [HttpPost]
        [Route("admin/article-category-detail/{id?}", Name = "AdminArticleCategoryDetail")]
        public IActionResult Detail(int? id, ArticleCategory item)
        {
            DBContext db = new DBContext();

            if (!ValidateForm(item))
            {
                var category = db.ArticleCategories.OrderBy(x => x.Position).ToList();
                ViewBag.ArticleCategory = category;
                return View(item);
            }

            if (id > 0)
            {
                item.ArticleCategoryId = id.Value;
                var existItem = db.Articles.Find(id);
                if (existItem == null)
                    return View();


            }
            else
            {
                item.CreateTime = DateTime.Now;
                item.Status = true;
                item.CreateBy = HttpContext.Session.GetString("Username") ?? null;
                db.Entry(item).State = EntityState.Added;
            }

            db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
        [HttpGet]
        [Route("admin/article-category-delete/{id}", Name = "AdminArticleCategoryDelete")]
        public IActionResult Delete(int id)
        {
            DBContext db = new DBContext();
            var item = db.ArticleCategories.Find(id);

            if (item != null)
            {
                db.ArticleCategories.Remove(item);
                db.SaveChanges();
            }

            return RedirectToAction(nameof(Index));
        }
    }
}
