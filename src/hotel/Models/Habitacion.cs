using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models;

public enum TipoHabitacion { Simple, Doble, Triple, Suite }
public enum EstadoHabitacion { Disponible, Reservada, Ocupada, EnLimpieza, FueraDeServicio }

[Table("habitaciones")]
public class Habitacion
{
    [Key]
    [Column("idHabitacion")]
    public int IdHabitacion { get; set; }

    [Required]
    [MaxLength(10)]
    [Column("numero")]
    public string Numero { get; set; } = null!;

    [Column("piso")]
    public int Piso { get; set; }

    [Column("tipo_habitacion")]
    public TipoHabitacion TipoHabitacion { get; set; }

    [Column("capacidad")]
    public int Capacidad { get; set; }

    [Column("precio_noche-base")]
    public decimal PrecioNocheBase { get; set; }

    [Column("estado_habitacion")]
    public EstadoHabitacion EstadoHabitacion { get; set; }

    public ICollection<Reserva> Reservas { get; set; } = new List<Reserva>();
    public ICollection<Estadia> Estadias { get; set; } = new List<Estadia>();
}
