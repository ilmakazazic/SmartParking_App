using Microsoft.EntityFrameworkCore;
using SmartParking_WebApp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Metadata;
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
            optionsBuilder.UseSqlServer("Server=.;Database=SmartParking;Trusted_Connection=True;MultipleActiveResultSets=True");

            //optionsBuilder.UseSqlServer("Server=p1851rsdbserver.database.windows.net;Database=p1851RS_db;Trusted_Connection=False;MultipleActiveResultSets=true; User ID=Ilma; Password=123456Merima");


            base.OnConfiguring(optionsBuilder);
        }
    }
}
