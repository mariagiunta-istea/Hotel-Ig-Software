using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models;

public enum NombreServicio { WiFi, Lavanderia, Cochera, Desayuno, Almuerzo, Cena, Piscina, Minibar }

[Table("servicios")]
public class Servicio
{
    [Key]
    [Column("idServicio")]
    public int IdServicio { get; set; }

    [Column("nombre-servicio")]
    public NombreServicio NombreServicio { get; set; }

    [Column("precio-base")]
    public decimal PrecioBase { get; set; }

    public ICollection<ServicioEstadia> ServiciosEstadias { get; set; } = new List<ServicioEstadia>();
}
