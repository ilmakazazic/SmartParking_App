using Microsoft.EntityFrameworkCore.Migrations;

namespace SmartParking_WebApp.Migrations
{
    public partial class DodavanjeTabela : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ParkingLokacija",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(nullable: true),
                    Adresa = table.Column<string>(nullable: true),
                    Zip = table.Column<string>(nullable: true),
                    BrojMjesta = table.Column<int>(nullable: false),
                    BrojMjesta_OSI = table.Column<int>(nullable: false),
                    Dostupan = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ParkingLokacija", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Mjesto",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Oznaka = table.Column<int>(nullable: false),
                    OSI_mjesto = table.Column<bool>(nullable: false),
                    Zauzeto = table.Column<bool>(nullable: false),
                    ParkingLokacijaId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Mjesto", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Mjesto_ParkingLokacija_ParkingLokacijaId",
                        column: x => x.ParkingLokacijaId,
                        principalTable: "ParkingLokacija",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Mjesto_ParkingLokacijaId",
                table: "Mjesto",
                column: "ParkingLokacijaId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Mjesto");

            migrationBuilder.DropTable(
                name: "ParkingLokacija");
        }
    }
}
