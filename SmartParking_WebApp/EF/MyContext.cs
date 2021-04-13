using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using SmartParking_WebApp.Models;
using SmartParking_WebApp.EntityModels;

namespace SmartParking_WebApp.EF
{
    public class MyContext : IdentityDbContext
    {
        public MyContext()
        {
        }
        public MyContext(DbContextOptions<MyContext> options)
        : base(options)
        {
        }

        public DbSet<ParkingLokacija> ParkingLokacija { get; set; }
        public DbSet<Mjesto> Mjesto { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
                    .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)
                    .AddJsonFile("appsettings.json")
                    .Build();
                optionsBuilder.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            }
            base.OnConfiguring(optionsBuilder);
        }
    }
}
