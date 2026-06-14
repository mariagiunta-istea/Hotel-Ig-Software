using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models;

public enum MedioPago { Efectivo, Tarjeta, Transferencia, MercadoPago }

[Table("pagos")]
public class Pago
{
    [Key]
    [Column("idPago")]
    public int IdPago { get; set; }

    [Column("id_estadia")]
    public int IdEstadia { get; set; }

    [Column("fecha_pago")]
    public DateTime FechaPago { get; set; }

    [Column("monto")]
    public decimal Monto { get; set; }

    [Column("medio_pago")]
    public MedioPago MedioPago { get; set; }

    [MaxLength(255)]
    [Column("observaciones")]
    public string? Observaciones { get; set; }

    public Estadia Estadia { get; set; } = null!;
}
