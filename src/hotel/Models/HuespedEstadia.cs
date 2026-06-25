using System.ComponentModel.DataAnnotations.Schema;

namespace Hotel.Models;

[Table("huespedes_estadias")]
public class HuespedEstadia
{
    [Column("idHuesped")]
    public int IdHuesped { get; set; }

    [Column("idEstadia")]
    public int IdEstadia { get; set; }

    public Huesped Huesped { get; set; } = null!;
    public Estadia Estadia { get; set; } = null!;
}
