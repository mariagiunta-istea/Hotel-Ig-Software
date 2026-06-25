using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models;

[Table("huespedes")]
public class Huesped
{
    [Key]
    [Column("idHuesped")]
    public int IdHuesped { get; set; }

    [Required]
    [MaxLength(50)]
    [Column("nombre")]
    public string Nombre { get; set; } = null!;

    [Required]
    [MaxLength(50)]
    [Column("apellido")]
    public string Apellido { get; set; } = null!;

    [Required]
    [MaxLength(20)]
    [Column("dni")]
    public string Dni { get; set; } = null!;

    [MaxLength(30)]
    [Column("telefono")]
    public string? Telefono { get; set; }

    [MaxLength(100)]
    [Column("email")]
    public string? Email { get; set; }

    [MaxLength(150)]
    [Column("direccion")]
    public string? Direccion { get; set; }

    [Column("fecha_registro")]
    public DateTime FechaRegistro { get; set; }

    public ICollection<Reserva> Reservas { get; set; } = new List<Reserva>();
    public ICollection<Estadia> Estadias { get; set; } = new List<Estadia>();
    public ICollection<HuespedEstadia> HuespedesEstadias { get; set; } = new List<HuespedEstadia>();
}
