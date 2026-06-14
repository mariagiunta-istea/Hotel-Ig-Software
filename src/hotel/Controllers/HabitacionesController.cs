using Hotel.Data;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HabitacionesController : ControllerBase
{
    private readonly HotelContext _context;

    public HabitacionesController(HotelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Habitacion>>> GetAll()
    {
        return await _context.Habitaciones.ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Habitacion>> GetById(int id)
    {
        var habitacion = await _context.Habitaciones.FindAsync(id);
        if (habitacion == null) return NotFound();
        return habitacion;
    }

    [HttpGet("disponibles")]
    public async Task<ActionResult<IEnumerable<Habitacion>>> GetDisponibles()
    {
        return await _context.Habitaciones
            .Where(h => h.EstadoHabitacion == EstadoHabitacion.Disponible)
            .ToListAsync();
    }

    [HttpPost]
    public async Task<ActionResult<Habitacion>> Create(Habitacion habitacion)
    {
        _context.Habitaciones.Add(habitacion);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetById), new { id = habitacion.IdHabitacion }, habitacion);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Habitacion habitacion)
    {
        if (id != habitacion.IdHabitacion) return BadRequest();
        _context.Entry(habitacion).State = EntityState.Modified;
        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Habitaciones.Any(e => e.IdHabitacion == id)) return NotFound();
            throw;
        }
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        var habitacion = await _context.Habitaciones.FindAsync(id);
        if (habitacion == null) return NotFound();
        _context.Habitaciones.Remove(habitacion);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
