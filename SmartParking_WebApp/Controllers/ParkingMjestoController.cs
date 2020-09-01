using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SmartParking_WebApp.ArduinoHelper;
using SmartParking_WebApp.EF;
using SmartParking_WebApp.EntityModels;
using SmartParking_WebApp.ViewModels;

namespace SmartParking_WebApp.Controllers
{
    public class ParkingMjestoController : Controller
    {
        private MyContext _context;
        private readonly SerialPortConnector _serialPortConnector;
        public ParkingMjestoController(MyContext context)
        {
            _context = context;
            _serialPortConnector = new SerialPortConnector();
        }
        public IActionResult Index(int ParkingID)
        {
            ParkingLokacija parking = _context.ParkingLokacija.Find(ParkingID);
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
            catch 
            {

            }
           
            MjestoVM vm = new MjestoVM()
            {
                Naziv = parking.Naziv,
                Adresa = parking.Adresa,
                BrojMjesta = parking.BrojMjesta,
                BrojMjesta_OSI = parking.BrojMjesta_OSI,
                BrojMjesta_slobodno = _context.Mjesto.Where(c => c.ParkingLokacijaId == parking.Id && c.Zauzeto == false).Count(),
                BrojMjesta_OSI_slobodno = _context.Mjesto.Where(c => c.ParkingLokacijaId == parking.Id && c.Zauzeto == false && c.OSI_mjesto == true).Count(),

                Mjesta = _context.Mjesto.Where(v=>v.ParkingLokacijaId==parking.Id).Select(x => new MjestoVM.Row()
                {
                    MjestoId = x.Id,
                    OSI_mjesto = x.OSI_mjesto,
                    Oznaka = x.Oznaka,
                    Zauzeto = x.Zauzeto

                }).ToList(),
            };
            return View(vm);
        }

    }
}