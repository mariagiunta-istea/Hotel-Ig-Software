using Hotel.Data;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ReservasController : ControllerBase
{
    private readonly HotelContext _context;

    public ReservasController(HotelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Reserva>>> GetAll()
    {
        return await _context.Reservas
            .Include(r => r.Huesped)
            .Include(r => r.Habitacion)
            .ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Reserva>> GetById(int id)
    {
        var reserva = await _context.Reservas
            .Include(r => r.Huesped)
            .Include(r => r.Habitacion)
            .FirstOrDefaultAsync(r => r.IdReserva == id);
        if (reserva == null) return NotFound();
        return reserva;
    }

    [HttpPost]
    public async Task<ActionResult<Reserva>> Create(Reserva reserva)
    {
        reserva.FechaReserva = DateTime.Now;
        _context.Reservas.Add(reserva);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetById), new { id = reserva.IdReserva }, reserva);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Reserva reserva)
    {
        if (id != reserva.IdReserva) return BadRequest();
        _context.Entry(reserva).State = EntityState.Modified;
        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Reservas.Any(e => e.IdReserva == id)) return NotFound();
            throw;
        }
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        var reserva = await _context.Reservas.FindAsync(id);
        if (reserva == null) return NotFound();
        _context.Reservas.Remove(reserva);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
