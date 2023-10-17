﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace AdminSiliconZ.Models;

public partial class DBContext : DbContext
{
    public DBContext()
    {
    }

    public DBContext(DbContextOptions<DBContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<Article> Articles { get; set; }

    public virtual DbSet<ArticleCategory> ArticleCategories { get; set; }

    public virtual DbSet<Contact> Contacts { get; set; }

    public virtual DbSet<ContactCategory> ContactCategories { get; set; }

    public virtual DbSet<Gallery> Galleries { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<ProductCategory> ProductCategories { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=AdminSiliconZDB;Persist Security Info=True;User ID=sa;Password=123456;TrustServerCertificate=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.HasKey(e => e.Username);

            entity.ToTable("Account");

            entity.Property(e => e.Username).HasMaxLength(50);
            entity.Property(e => e.AccountCategoryId)
                .HasMaxLength(50)
                .HasColumnName("AccountCategoryID");
            entity.Property(e => e.Address).HasMaxLength(255);
            entity.Property(e => e.Avatar).HasMaxLength(255);
            entity.Property(e => e.CreateTime).HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.FullName).HasMaxLength(255);
            entity.Property(e => e.Mobile).HasMaxLength(15);
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.Thumb).HasMaxLength(255);
        });

        modelBuilder.Entity<Article>(entity =>
        {
            entity.ToTable("Article");

            entity.Property(e => e.ArticleId).HasColumnName("ArticleID");
            entity.Property(e => e.ArticleCategoryId).HasColumnName("ArticleCategoryID");
            entity.Property(e => e.Avatar).HasMaxLength(255);
            entity.Property(e => e.Content).HasColumnType("ntext");
            entity.Property(e => e.CreateBy).HasMaxLength(50);
            entity.Property(e => e.CreateTime).HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(4000);
            entity.Property(e => e.Thumb).HasMaxLength(255);
            entity.Property(e => e.Title).HasMaxLength(255);

            entity.HasOne(d => d.ArticleCategory).WithMany(p => p.Articles)
                .HasForeignKey(d => d.ArticleCategoryId)
                .HasConstraintName("FK_Article_ArticleCategory");

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.Articles)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_Article_Account");
        });

        modelBuilder.Entity<ArticleCategory>(entity =>
        {
            entity.ToTable("ArticleCategory");

            entity.Property(e => e.ArticleCategoryId).HasColumnName("ArticleCategoryID");
            entity.Property(e => e.Avatar).HasMaxLength(255);
            entity.Property(e => e.CreateBy).HasMaxLength(50);
            entity.Property(e => e.CreateTime).HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(4000);
            entity.Property(e => e.Thumb).HasMaxLength(255);
            entity.Property(e => e.Title).HasMaxLength(255);

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.ArticleCategories)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_ArticleCategory_Account");
        });

        modelBuilder.Entity<Contact>(entity =>
        {
            entity.ToTable("Contact");

            entity.Property(e => e.ContactId).HasColumnName("ContactID");
            entity.Property(e => e.Address).HasMaxLength(255);
            entity.Property(e => e.ApproveBy).HasMaxLength(50);
            entity.Property(e => e.ContactCategoryId).HasColumnName("ContactCategoryID");
            entity.Property(e => e.Content).HasColumnType("ntext");
            entity.Property(e => e.CreateTime).HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.FullName).HasMaxLength(50);
            entity.Property(e => e.Mobile).HasMaxLength(15);

            entity.HasOne(d => d.ApproveByNavigation).WithMany(p => p.Contacts)
                .HasForeignKey(d => d.ApproveBy)
                .HasConstraintName("FK_Contact_Account");

            entity.HasOne(d => d.ContactCategory).WithMany(p => p.Contacts)
                .HasForeignKey(d => d.ContactCategoryId)
                .HasConstraintName("FK_Contact_ContactCategory");
        });

        modelBuilder.Entity<ContactCategory>(entity =>
        {
            entity.ToTable("ContactCategory");

            entity.Property(e => e.ContactCategoryId).HasColumnName("ContactCategoryID");
            entity.Property(e => e.Avatar).HasMaxLength(255);
            entity.Property(e => e.CreateBy).HasMaxLength(50);
            entity.Property(e => e.CreateTime).HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(4000);
            entity.Property(e => e.Thumb).HasMaxLength(255);
            entity.Property(e => e.Title).HasMaxLength(255);

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.ContactCategories)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_ContactCategory_Account");
        });

        modelBuilder.Entity<Gallery>(entity =>
        {
            entity.ToTable("Gallery");

            entity.Property(e => e.GalleryId).HasColumnName("GalleryID");
            entity.Property(e => e.Avatar).HasMaxLength(255);
            entity.Property(e => e.CreateBy).HasMaxLength(50);

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.Galleries)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_Gallery_Account");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.ToTable("Product");

            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.Avatar).HasMaxLength(255);
            entity.Property(e => e.Content).HasColumnType("ntext");
            entity.Property(e => e.CreateBy).HasMaxLength(50);
            entity.Property(e => e.CreateTime).HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(4000);
            entity.Property(e => e.ProductCategoryId).HasColumnName("ProductCategoryID");
            entity.Property(e => e.Thumb).HasMaxLength(255);
            entity.Property(e => e.Title).HasMaxLength(255);

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.Products)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_Product_Account");

            entity.HasOne(d => d.ProductCategory).WithMany(p => p.Products)
                .HasForeignKey(d => d.ProductCategoryId)
                .HasConstraintName("FK_Product_ProductCategory");
        });

        modelBuilder.Entity<ProductCategory>(entity =>
        {
            entity.ToTable("ProductCategory");

            entity.Property(e => e.ProductCategoryId).HasColumnName("ProductCategoryID");
            entity.Property(e => e.Avatar).HasMaxLength(255);
            entity.Property(e => e.CreateBy).HasMaxLength(50);
            entity.Property(e => e.CreateTime).HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(4000);
            entity.Property(e => e.Thumb).HasMaxLength(255);
            entity.Property(e => e.Title).HasMaxLength(255);

            entity.HasOne(d => d.CreateByNavigation).WithMany(p => p.ProductCategories)
                .HasForeignKey(d => d.CreateBy)
                .HasConstraintName("FK_ProductCategory_Account");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
