using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models;

[Table("servicios_estadias")]
public class ServicioEstadia
{
    [Column("idServicio")]
    public int IdServicio { get; set; }

    [Column("idEstadia")]
    public int IdEstadia { get; set; }

    [Column("precio-aplicado")]
    public decimal PrecioAplicado { get; set; }

    public Servicio Servicio { get; set; } = null!;
    public Estadia Estadia { get; set; } = null!;
}
