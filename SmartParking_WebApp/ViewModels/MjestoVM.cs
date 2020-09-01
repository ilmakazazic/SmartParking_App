using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmartParking_WebApp.ViewModels
{
    public class MjestoVM
    {
        public int ParkingLokacijaId { get; set; }
        public string Naziv { get; set; }
        public string Adresa { get; set; }
        public int BrojMjesta { get; set; }
        public int BrojMjesta_slobodno { get; set; }
        public int BrojMjesta_OSI { get; set; } //OSI-Osoba sa invaliditetom
        public int BrojMjesta_OSI_slobodno { get; set; }

        public List<Row> Mjesta { get; set; }

        public class Row
        {
            public int MjestoId { get; set; }
            public string Oznaka { get; set; }
            public bool OSI_mjesto { get; set; }
            public bool Zauzeto { get; set; }

        }
    }
}
