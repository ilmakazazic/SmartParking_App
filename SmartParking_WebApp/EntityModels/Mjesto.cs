namespace SmartParking_WebApp.EntityModels
{
    public class Mjesto
    {
        public int Id { get; set; }
        public string Oznaka { get; set; }
        public bool OSI_mjesto { get; set; }
        public bool Zauzeto { get; set; }
        public int ParkingLokacijaId { get; set; }
        public ParkingLokacija ParkingLokacija { get; set; }
    }
}
