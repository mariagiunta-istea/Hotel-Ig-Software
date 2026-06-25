using Hotel.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Hotel.Data;

public class HotelContext : DbContext
{
    public HotelContext(DbContextOptions<HotelContext> options) : base(options) { }

    public DbSet<Huesped> Huespedes => Set<Huesped>();
    public DbSet<Habitacion> Habitaciones => Set<Habitacion>();
    public DbSet<Reserva> Reservas => Set<Reserva>();
    public DbSet<Estadia> Estadias => Set<Estadia>();
    public DbSet<Servicio> Servicios => Set<Servicio>();
    public DbSet<ServicioEstadia> ServiciosEstadias => Set<ServicioEstadia>();
    public DbSet<Pago> Pagos => Set<Pago>();
    public DbSet<HuespedEstadia> HuespedesEstadias => Set<HuespedEstadia>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Claves primarias compuestas
        modelBuilder.Entity<ServicioEstadia>()
            .HasKey(se => new { se.IdServicio, se.IdEstadia });

        modelBuilder.Entity<HuespedEstadia>()
            .HasKey(he => new { he.IdHuesped, he.IdEstadia });

        // Conversión de ENUMs a string para MySQL
        modelBuilder.Entity<Habitacion>()
            .Property(h => h.TipoHabitacion)
            .HasConversion<string>();

        // EstadoHabitacion tiene valores con espacios en MySQL
        var estadoHabitacionConverter = new ValueConverter<EstadoHabitacion, string>(
               v => v == EstadoHabitacion.EnLimpieza ? "En limpieza" :
                    v == EstadoHabitacion.FueraDeServicio ? "Fuera de servicio" :
                    v.ToString()!,
               v => v == "En limpieza" ? EstadoHabitacion.EnLimpieza :
                    v == "Fuera de servicio" ? EstadoHabitacion.FueraDeServicio :
                    Enum.Parse<EstadoHabitacion>(v)
           );

        modelBuilder.Entity<Habitacion>()
            .Property(h => h.EstadoHabitacion)
            .HasConversion(estadoHabitacionConverter);

        modelBuilder.Entity<Reserva>()
            .Property(r => r.EstadoReserva)
            .HasConversion<string>();

        modelBuilder.Entity<Servicio>()
            .Property(s => s.NombreServicio)
            .HasConversion<string>();

        modelBuilder.Entity<Pago>()
            .Property(p => p.MedioPago)
            .HasConversion<string>();

        // Relaciones
        modelBuilder.Entity<Estadia>()
            .HasOne(e => e.Reserva)
            .WithMany(r => r.Estadias)
            .HasForeignKey(e => e.IdReserva)
            .IsRequired(false);

        modelBuilder.Entity<ServicioEstadia>()
            .HasOne(se => se.Servicio)
            .WithMany(s => s.ServiciosEstadias)
            .HasForeignKey(se => se.IdServicio);

        modelBuilder.Entity<ServicioEstadia>()
            .HasOne(se => se.Estadia)
            .WithMany(e => e.ServiciosEstadias)
            .HasForeignKey(se => se.IdEstadia);

        modelBuilder.Entity<HuespedEstadia>()
            .HasOne(he => he.Huesped)
            .WithMany(h => h.HuespedesEstadias)
            .HasForeignKey(he => he.IdHuesped);

        modelBuilder.Entity<HuespedEstadia>()
            .HasOne(he => he.Estadia)
            .WithMany(e => e.HuespedesEstadias)
            .HasForeignKey(he => he.IdEstadia);
    }
}
