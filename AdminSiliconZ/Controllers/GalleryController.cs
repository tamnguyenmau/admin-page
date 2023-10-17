using AdminSiliconZ.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AdminSiliconZ.Controllers
{
    public class GalleryController : Controller
    {
        private IWebHostEnvironment Environment;

        public GalleryController(IWebHostEnvironment _environment)
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
        private bool ValidateForm(Article item)
        {
            if (item.Avatar == null)
            {
                ViewBag.MessageText = "Vui lòng chọn 1 hình ảnh";
                ViewBag.MessageClass = "alert-warning";
                return false;
            }
            else
            {
                return true;
            }
        }

        [HttpGet]
        [Route("admin/gallery", Name ="AdminGallery")]
        public IActionResult Index()
        {
            DBContext db = new DBContext();
            var data = db.Galleries
                         .Where(x => x.Status == true)
                         .ToList();
            return View(data);
        }

        [HttpGet]
        [Route("admin/gallery-detail/{id?}", Name = "AdminGalleryDetail")]
        public IActionResult Detail(int? id)
        {
            DBContext db = new DBContext();
            var category = db.Galleries
                             .OrderBy(x => x.Posittion)
                             .ToList();
            ViewBag.GalleryCategory = category;

            var item = db.Galleries.Find(id);
            if (item == null)
            {
                item = new Gallery();
                item.Avatar = "/Content/images/no-image.png";
                return View(item);
            }
            else
                return View(item);
        }

        [HttpPost]
        [Route("admin/gallery-detail/{id?}", Name = "AdminDetailGallery")]
        public IActionResult Detail(int? id, Gallery item)
        {
            DBContext db = new DBContext();

            if (id > 0)
            {
                item.GalleryId = id.Value;
                var existItem = db.Galleries.Find(id);
                if (existItem == null)
                    return View();

                existItem.GalleryId = item.GalleryId;

                if (item.Avatar != null && item.Avatar.StartsWith("data:image"))
                {
                    existItem.Avatar = SaveImage(item.Avatar);
                }
            }
            else
            {
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

    }
}
