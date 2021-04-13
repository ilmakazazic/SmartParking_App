using System;
using System.Diagnostics;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using SmartParking_WebApp.ArduinoHelper;
using SmartParking_WebApp.EF;
using SmartParking_WebApp.Models;
using SmartParking_WebApp.ViewModels;

namespace SmartParking_WebApp.Controllers
{
    public class HomeController : Controller
    {
        private MyContext _context;
        private readonly SerialPortConnector _serialPortConnector;

        public HomeController(MyContext context)
        {
            _context = context;
            _serialPortConnector = new SerialPortConnector();

        }

        public IActionResult Index()
        {
            var parking = _context.ParkingLokacija.ToList();

            try
            {
                String s1 = _serialPortConnector.Receive();

                if (s1 != null || s1.Length != 6)
                {
                    var arduinoSplit = s1.ToCharArray();
                    var brojac = 1;
                    var arduinoBrojac = 0;

                    var input1 = _context.Mjesto.Where(c => c.ParkingLokacijaId == 1).ToList();
                    var input2 = _context.Mjesto.Where(c => c.ParkingLokacijaId == 2).ToList();

                    foreach (var i in input1)
                    {
                        if (brojac % 2 != 0)
                        {
                            i.Zauzeto = arduinoSplit[arduinoBrojac] == '1' ? true : false;
                            _context.Mjesto.Update(i);
                            arduinoBrojac++;
                        }
                        if (brojac == 6)
                        {
                            break;
                        }
                        brojac++;
                    }

                    brojac = 1;
                    foreach (var i in input2)
                    {
                        if (brojac % 2 != 0)
                        {

                            i.Zauzeto = arduinoSplit[arduinoBrojac] == '1' ? true : false;
                            _context.Mjesto.Update(i);
                            arduinoBrojac++;
                        }
                        if (brojac == 6)
                        {
                            break;
                        }
                        brojac++;
                    }
                    _context.SaveChanges();
                }
            }
            catch {}


            ParkingVM vm = new ParkingVM()
            {
                Parkinzi = _context.ParkingLokacija.Where(p=>p.Dostupan==true).Select(x => new ParkingVM.Row()
                {
                    Naziv = x.Naziv,
                    longitude = x.longitude,
                    Latitude = x.Latitude,
                    Adresa = x.Adresa,
                    BrojMjesta = x.BrojMjesta,
                    BrojMjesta_OSI = x.BrojMjesta_OSI,
                    Dostupan = x.Dostupan,
                    Id = x.Id,
                    Zip = x.Zip,
                    BrojMjesta_slobodno = _context.Mjesto.Where(c => c.ParkingLokacijaId == x.Id && c.Zauzeto == false).Count(),
                    BrojMjesta_OSI_slobodno = _context.Mjesto.Where(c => c.ParkingLokacijaId == x.Id && c.Zauzeto == false && c.OSI_mjesto==true).Count(),

                }).ToList()
            };
            return View(vm);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
