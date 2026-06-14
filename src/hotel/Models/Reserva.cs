using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models;

public enum EstadoReserva { Pendiente, Confirmada, Cancelada, Finalizada }

[Table("reservas")]
public class Reserva
{
    [Key]
    [Column("idReserva")]
    public int IdReserva { get; set; }

    [Column("id_huesped")]
    public int IdHuesped { get; set; }

    [Column("id_habitacion")]
    public int IdHabitacion { get; set; }

    [Column("fecha_reserva")]
    public DateTime FechaReserva { get; set; }

    [Column("fecha_ingreso")]
    public DateTime FechaIngreso { get; set; }

    [Column("fecha_egreso")]
    public DateTime FechaEgreso { get; set; }

    [Column("cantidad_personas")]
    public int CantidadPersonas { get; set; }

    [Column("precio_noche_reservado")]
    public decimal PrecioNocheReservado { get; set; }

    [Column("estado_reserva")]
    public EstadoReserva EstadoReserva { get; set; }

    [MaxLength(255)]
    [Column("observaciones")]
    public string? Observaciones { get; set; }

    public Huesped Huesped { get; set; } = null!;
    public Habitacion Habitacion { get; set; } = null!;
    public ICollection<Estadia> Estadias { get; set; } = new List<Estadia>();
}
