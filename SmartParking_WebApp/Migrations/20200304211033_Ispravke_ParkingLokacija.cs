using Microsoft.EntityFrameworkCore.Migrations;

namespace SmartParking_WebApp.Migrations
{
    public partial class Ispravke_ParkingLokacija : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<double>(
                name: "Latitude",
                table: "ParkingLokacija",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.AddColumn<double>(
                name: "longitude",
                table: "ParkingLokacija",
                nullable: false,
                defaultValue: 0.0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Latitude",
                table: "ParkingLokacija");

            migrationBuilder.DropColumn(
                name: "longitude",
                table: "ParkingLokacija");
        }
    }
}
