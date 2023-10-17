using AdminSiliconZ.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AdminSiliconZ.Controllers
{
    public class ProductController : Controller
    {
        private IWebHostEnvironment Environment;
        public ProductController(IWebHostEnvironment _environment)
        {
            Environment = _environment;
        }

        private string SaveImage(string base64)
        {
            base64 = base64.Replace("data:image/jpeg;base64,", string.Empty);
            base64 = base64.Replace("data:image/jpg;base64,", string.Empty);
            base64 = base64.Replace("data:image/gif;base64,", string.Empty);
            base64 = base64.Replace("data:image/png;base64,", string.Empty);

            string rootFolder = this.Environment.WebRootPath;
            string fileName = Guid.NewGuid() + ".jpg";
            byte[] bytes = Convert.FromBase64String(base64);
            string folderSave = $"/FileUploads/Product/{fileName}";
            string folderDownload = $"{rootFolder}/{folderSave}".Replace("/", "\\");
            System.IO.File.WriteAllBytes(folderDownload, bytes);
            return folderSave;
        }

        private bool ValidateForm(Product item)
        {
            if (item.ProductCategoryId == null || item.ProductCategoryId <= 0)
            {
                ViewBag.MessageText = "Vui lòng chọn 1 thể loại sản phẩm";
                ViewBag.MessageClass = "alert-warning";
                return false;
            }
            else if (string.IsNullOrEmpty(item.Title))
            {
                ViewBag.MessageText = "Vui lòng nhập tiêu đề sản phẩm";
                ViewBag.MessageClass = "alert-warning";
                return false;
            }
            else
            {
                return true;
            }
        }

        [HttpGet]
        [Route("admin/product", Name = "AdminProduct")]
        public IActionResult Index()
        {
            DBContext db = new DBContext();
            var data = db.Products
                         .Include(x => x.ProductCategory)
                         .OrderByDescending(x => x.CreateTime)
                         .Take(20)
                         .ToList();
            return View(data);
        }

        [HttpGet]
        [Route("admin/product-detail/{id?}", Name = "AdminProductDetail")]
        public IActionResult Detail(int? id)
        {
            DBContext db = new DBContext();
            var category = db.ProductCategories
                             .OrderBy(x => x.Position)
                             .ToList();
            ViewBag.ProductCategory = category;

            var item = db.Products.Find(id);
            if (item == null)
            {
                item = new Product();
                item.Avatar = "/Content/images/no-image.png";
                return View(item);
            }
            else
                return View(item);
        }

        [HttpPost]
        [Route("admin/product-detail/{id?}", Name = "AdminProductDetail")]
        public IActionResult Detail(int? id, Product item)
        {
            DBContext db = new DBContext();

            if (!ValidateForm(item))
            {
                var category = db.ProductCategories.OrderBy(x => x.Position).ToList();
                ViewBag.ProductCategories = category;
                return View(item);
            }

            if (id > 0)
            {
                item.ProductId = id.Value;
                var existItem = db.Products.Find(id);
                if (existItem == null)
                    return View();

                existItem.ProductCategoryId = item.ProductCategoryId;

                existItem.Title = item.Title;
                existItem.Description = item.Description;
                existItem.Quantity = item.Quantity;
                existItem.Price = item.Price;
                existItem.Content = item.Content;

                if (item.Avatar != null && item.Avatar.StartsWith("data:image"))
                {
                    existItem.Avatar = SaveImage(item.Avatar);
                }
            }
            else
            {
                item.CreateTime = DateTime.Now;
                item.Status = true;
                item.CreateBy = HttpContext.Session.GetString("Username") ?? null;
                if (item.Avatar != null && item.Avatar.StartsWith("data:image"))
                {
                    item.Avatar = SaveImage(item.Avatar);
                }
                db.Entry(item).State = EntityState.Added;
            }

            db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        [Route("admin/product-delete/{id}", Name = "AdminProductDelete")]
        public IActionResult Delete(int id)
        {
            DBContext db = new DBContext();
            var item = db.Products.Find(id);

            if (item != null)
            {
                db.Products.Remove(item);
                db.SaveChanges();
            }

            return RedirectToAction(nameof(Index));
        }
    }
}
