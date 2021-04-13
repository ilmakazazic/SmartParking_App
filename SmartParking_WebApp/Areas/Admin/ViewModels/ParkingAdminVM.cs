using System.Collections.Generic;

namespace SmartParking_WebApp.Areas.Admin.ViewModels
{
    public class ParkingAdminVM
    {
        public int BrParkinga { get; set; }
        public int BrParkinga_OSi { get; set; }

        public List<Row> Parkinzi { get; set; }

        public class Row
        {
            public int ParingId { get; set; }
            public string Naziv { get; set; }
            public double longitude { get; set; }
            public double Latitude { get; set; }
            public string Adresa { get; set; }
            public string Zip { get; set; }
            public int BrojMjesta { get; set; }
            public int BrojMjesta_OSI { get; set; } //OSI-Osoba sa invaliditetom
            public bool Dostupan { get; set; }
            public int BrojMjesta_slobodno { get; set; }
            public int BrojMjesta_OSI_slobodno { get; set; }
        }
    }
}
