using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SmartParking_WebApp.Areas.Admin.ViewModels;
using SmartParking_WebApp.EF;
using SmartParking_WebApp.EntityModels;

namespace SmartParking_WebApp.Areas.Admin.Controllers
{
    [Authorize]
    [Area("Admin")]
    public class HomeController : Controller
    {
        private MyContext _context;

        public HomeController(MyContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var vm = new ParkingAdminVM()
            {
                BrParkinga = _context.ParkingLokacija.Count(),
                BrParkinga_OSi = _context.ParkingLokacija.Where(c=>c.BrojMjesta_OSI>0).Count(),
                Parkinzi = _context.ParkingLokacija.Select(x => new ParkingAdminVM.Row()
                {
                    Naziv = x.Naziv,
                    Adresa = x.Adresa,
                    BrojMjesta = x.BrojMjesta,
                    BrojMjesta_OSI = x.BrojMjesta_OSI,
                    Dostupan = x.Dostupan,
                    Latitude = x.Latitude,
                    longitude = x.longitude,
                    ParingId = x.Id,
                    Zip = x.Zip,
                    BrojMjesta_slobodno = _context.Mjesto.Where(c => c.ParkingLokacijaId == x.Id && c.Zauzeto == false).Count(),
                    BrojMjesta_OSI_slobodno = _context.Mjesto.Where(c => c.ParkingLokacijaId == x.Id && c.Zauzeto == false && c.OSI_mjesto == true).Count(),

                }).ToList()
            };
            return View(vm);
        }

        [HttpGet]
        public IActionResult PrikazOSI()
        {
            var vm = new ParkingAdminVM()
            {
                Parkinzi = _context.ParkingLokacija.Where(c=>c.BrojMjesta_OSI>0).Select(x => new ParkingAdminVM.Row()
                {
                    Naziv = x.Naziv,
                    Adresa = x.Adresa,
                    BrojMjesta = x.BrojMjesta,
                    Dostupan = x.Dostupan,
                    Latitude = x.Latitude,
                    longitude = x.longitude,
                    ParingId = x.Id,
                    Zip = x.Zip,
                    BrojMjesta_slobodno = _context.Mjesto.Where(c => c.ParkingLokacijaId == x.Id && c.Zauzeto == false).Count(),

                }).ToList()

            };
            return PartialView(vm);
        }

        [HttpGet]
        public IActionResult PrikaziNedostupne()
        {
            var vm = new ParkingAdminVM()
            {
                Parkinzi = _context.ParkingLokacija.Where(c=>c.Dostupan==false).Select(x => new ParkingAdminVM.Row()
                {
                    Naziv = x.Naziv,
                    Adresa = x.Adresa,
                    BrojMjesta = x.BrojMjesta,
                    BrojMjesta_OSI = x.BrojMjesta_OSI,
                    Dostupan = x.Dostupan,
                    Latitude = x.Latitude,
                    longitude = x.longitude,
                    ParingId = x.Id,
                    Zip = x.Zip,
                    BrojMjesta_slobodno = _context.Mjesto.Where(c => c.ParkingLokacijaId == x.Id && c.Zauzeto == false)
                        .Count(),
                    BrojMjesta_OSI_slobodno = _context.Mjesto.Where(c =>
                        c.ParkingLokacijaId == x.Id && c.Zauzeto == false && c.OSI_mjesto == true).Count(),

                }).ToList()
            };
            return PartialView(vm);
        }

        [HttpGet]
        public IActionResult Dodaj()
        {
           return View();
        }

        [HttpPost]
        public IActionResult Dodaj(DodajParkingVM vm)
        {
            if (ModelState.IsValid)
            {
                ParkingLokacija novaLokacija = new ParkingLokacija()
                {
                    Adresa = vm.Adresa,
                    BrojMjesta = vm.BrojMjesta,
                    BrojMjesta_OSI = vm.BrojMjesta_OSI,
                    Latitude = double.Parse(vm.Latitude),
                    longitude = double.Parse(vm.longitude),
                    Dostupan = vm.Dostupan,
                    Naziv = vm.Naziv,
                    Zip = vm.Zip
                };
               _context.ParkingLokacija.Add(novaLokacija);
               _context.SaveChanges();
               var parking = _context.ParkingLokacija
                   .Where(c => c.longitude == double.Parse(vm.longitude) && c.Latitude == double.Parse(vm.Latitude)).FirstOrDefault();
               int brojac = 1;
               
               for (int i = 0; i < vm.BrojMjesta-vm.BrojMjesta_OSI; i++)
               {
                   Mjesto novoMjesto = new Mjesto()
                   {
                       OSI_mjesto = false,
                       Oznaka = vm.OznakaZaMjesta + brojac,
                       Zauzeto = false,
                       ParkingLokacijaId = parking.Id
                   };
                   _context.Mjesto.Add(novoMjesto);
                   brojac++;
                   _context.SaveChanges();
               }
               
               for (int i = 0; i < vm.BrojMjesta_OSI; i++)
               {
                   Mjesto novoMjesto = new Mjesto()
                   {
                       OSI_mjesto = true,
                       Oznaka = vm.OznakaZaMjesta + brojac,
                       Zauzeto = false,
                       ParkingLokacijaId = parking.Id
                   };
                   _context.Mjesto.Add(novoMjesto);
                   brojac++;
                   _context.SaveChanges();
               }
               return RedirectToAction(nameof(Index));
            }
            return View();
        }

        [HttpGet]
        public IActionResult Uredi(int ParkingID)
        {
            ParkingLokacija vm = _context.ParkingLokacija.Find(ParkingID);
            var m = _context.Mjesto.Where(c => c.ParkingLokacijaId == ParkingID).ToList();
            UrediParkingVM model = new UrediParkingVM()
            {
                Id = vm.Id,
                longitude = vm.longitude.ToString(),
                Adresa = vm.Adresa,
                BrojMjesta_OSI = vm.BrojMjesta_OSI,
                BrojMjesta = vm.BrojMjesta,
                Dostupan = vm.Dostupan,
                Latitude = vm.Latitude.ToString(),
                Naziv = vm.Naziv,
                OznakaZaMjesta = m[1].Oznaka,
                Zip = vm.Zip
            };
            return View(model);
        }

        [HttpPost]
        public IActionResult Uredi(UrediParkingVM vm)
        {
            if (ModelState.IsValid)
            {
                ParkingLokacija parking = _context.ParkingLokacija.Find(vm.Id);

                parking.longitude = double.Parse(vm.longitude);
                parking.Latitude = double.Parse(vm.Latitude);
                parking.Adresa = vm.Adresa;
                parking.BrojMjesta_OSI = vm.BrojMjesta_OSI;
                parking.BrojMjesta = vm.BrojMjesta;
                parking.Dostupan = vm.Dostupan;
                parking.Naziv = vm.Naziv;
                parking.Zip = vm.Zip;

                
                _context.ParkingLokacija.Update(parking);
                _context.SaveChanges();

                var mjesto = _context.Mjesto.Where(x => x.ParkingLokacijaId == vm.Id).ToList();

                foreach (var m in mjesto)
                {
                    _context.Mjesto.Remove(m);
                    _context.SaveChanges();
                }

                int brojac = 1;
                for (int i = 0; i < vm.BrojMjesta - vm.BrojMjesta_OSI; i++)
                {
                    Mjesto novoMjesto = new Mjesto()
                    {
                        OSI_mjesto = false,
                        Oznaka = vm.OznakaZaMjesta + brojac,
                        Zauzeto = false,
                        ParkingLokacijaId = parking.Id
                    };
                    _context.Mjesto.Add(novoMjesto);
                    brojac++;
                    _context.SaveChanges();
                }
                for (int i = 0; i < vm.BrojMjesta_OSI; i++)
                {
                    Mjesto novoMjesto = new Mjesto()
                    {
                        OSI_mjesto = true,
                        Oznaka = vm.OznakaZaMjesta + brojac,
                        Zauzeto = false,
                        ParkingLokacijaId = parking.Id
                    };
                    _context.Mjesto.Add(novoMjesto);
                    brojac++;
                    _context.SaveChanges();
                }
                

                return RedirectToAction(nameof(Index));
            }
            return View();
        }

        public IActionResult ParkingNijeDostupan(int id)
        {
            ParkingLokacija p = _context.ParkingLokacija.Find(id);
            p.Dostupan = false;
            _context.SaveChanges();
            return Redirect("/Admin/Home/Index/" + p.Id);
        }

        public IActionResult ParkingDostupan(int id)
        {
            ParkingLokacija p = _context.ParkingLokacija.Find(id);
            p.Dostupan = true;
            _context.SaveChanges();
            return Redirect("/Admin/Home/Index/" + p.Id);
        }
    }
}