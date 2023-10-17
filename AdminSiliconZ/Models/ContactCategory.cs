﻿using System;
using System.Collections.Generic;

namespace AdminSiliconZ.Models;

public partial class ContactCategory
{
    public int ContactCategoryId { get; set; }

    public string? Avatar { get; set; }

    public string? Thumb { get; set; }

    public string? Title { get; set; }

    public string? Description { get; set; }

    public int? Position { get; set; }

    public bool? Status { get; set; }

    public DateTime? CreateTime { get; set; }

    public string? CreateBy { get; set; }

    public virtual ICollection<Contact> Contacts { get; set; } = new List<Contact>();

    public virtual Account? CreateByNavigation { get; set; }
}
