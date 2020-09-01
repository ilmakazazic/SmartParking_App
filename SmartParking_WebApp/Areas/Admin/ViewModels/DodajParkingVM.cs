using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SmartParking_WebApp.Areas.Admin.ViewModels
{
    public class DodajParkingVM
    {
        [Required(ErrorMessage = "Obavezno polje!")]
        public string Naziv { get; set; }
        [RegularExpression(@"(180(\,0+)?|((1[0-7]\d)|([1-9]?\d))(\,\d+)?)$", ErrorMessage = "Potrebno je upisati u formatu xx,xxxxxx")]
        public string longitude { get; set; }
        [RegularExpression(@"^([0-9]?\d(\,\d+)?|90(\,0+)?)$", ErrorMessage = "Potrebno je upisati u formatu xx,xxxxxx")]
        public string Latitude { get; set; }
        [Required(ErrorMessage = "Obavezno polje!")]
        public string Adresa { get; set; }
        [Required(ErrorMessage = "Obavezno polje!")]
        public string Zip { get; set; }
        [RegularExpression(@"([1-6])", ErrorMessage = "Potrebno je upisati 1-6")]
        public int BrojMjesta { get; set; }
        [RegularExpression(@"([1-6])", ErrorMessage = "Potrebno je upisati 1-6")]
        public int BrojMjesta_OSI { get; set; } //OSI-Osoba sa invaliditetom
        public bool Dostupan { get; set; }
        [Required(ErrorMessage = "Obavezno polje!")]
        public string OznakaZaMjesta { get; set; }

    }
}
