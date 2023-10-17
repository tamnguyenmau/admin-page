using System;
using System.Collections.Generic;

namespace AdminSiliconZ.Models;

public partial class Gallery
{
    public int GalleryId { get; set; }

    public string? Avatar { get; set; }

    public int? Posittion { get; set; }

    public bool? Status { get; set; }

    public string? CreateBy { get; set; }

    public virtual Account? CreateByNavigation { get; set; }
}
