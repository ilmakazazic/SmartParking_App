using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmartParking_WebApp.ViewModels
{
    public class ParkingVM
    {
        public List<Row> Parkinzi { get; set; }
        public class Row
        {
            public int Id { get; set; }
            public double longitude { get; set; }
            public double Latitude { get; set; }
            public string Naziv { get; set; }
            public string Adresa { get; set; }
            public string Zip { get; set; }
            public int BrojMjesta { get; set; }
            public int BrojMjesta_slobodno { get; set; }
            public int BrojMjesta_OSI { get; set; } //OSI-Osoba sa invaliditetom
            public int BrojMjesta_OSI_slobodno { get; set; }
            public bool Dostupan { get; set; }

        }


    }
}
