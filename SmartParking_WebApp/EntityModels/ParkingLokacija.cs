namespace SmartParking_WebApp.EntityModels
{
    public class ParkingLokacija
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public double longitude { get; set; }
        public double Latitude { get; set; }
        public string Adresa { get; set; }
        public string Zip { get; set; }
        public int BrojMjesta { get; set; }
        public int BrojMjesta_OSI { get; set; } //OSI-Osoba sa invaliditetom
        public bool Dostupan { get; set; }
    }
}
