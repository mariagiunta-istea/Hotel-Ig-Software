using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models;

[Table("estadias")]
public class Estadia
{
    [Key]
    [Column("idEstadia")]
    public int IdEstadia { get; set; }

    [Column("id_reserva")]
    public int? IdReserva { get; set; }

    [Column("id_huesped")]
    public int IdHuesped { get; set; }

    [Column("id_habitacion")]
    public int IdHabitacion { get; set; }

    [Column("fecha_ingreso")]
    public DateTime FechaIngreso { get; set; }

    [Column("fecha_egreso")]
    public DateTime? FechaEgreso { get; set; }

    [Column("cantidad_personas")]
    public int CantidadPersonas { get; set; }

    [Column("precio_noche_aplicado")]
    public decimal PrecioNocheAplicado { get; set; }

    [MaxLength(255)]
    [Column("observaciones")]
    public string? Observaciones { get; set; }

    public Reserva? Reserva { get; set; }
    public Huesped Huesped { get; set; } = null!;
    public Habitacion Habitacion { get; set; } = null!;
    public ICollection<Pago> Pagos { get; set; } = new List<Pago>();
    public ICollection<ServicioEstadia> ServiciosEstadias { get; set; } = new List<ServicioEstadia>();
    public ICollection<HuespedEstadia> HuespedesEstadias { get; set; } = new List<HuespedEstadia>();
}
