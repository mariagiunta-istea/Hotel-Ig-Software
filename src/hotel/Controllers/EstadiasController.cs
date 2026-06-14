using Hotel.Data;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class EstadiasController : ControllerBase
{
    private readonly HotelContext _context;

    public EstadiasController(HotelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Estadia>>> GetAll()
    {
        return await _context.Estadias
            .Include(e => e.Huesped)
            .Include(e => e.Habitacion)
            .Include(e => e.Reserva)
            .ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Estadia>> GetById(int id)
    {
        var estadia = await _context.Estadias
            .Include(e => e.Huesped)
            .Include(e => e.Habitacion)
            .Include(e => e.Reserva)
            .Include(e => e.Pagos)
            .Include(e => e.ServiciosEstadias)
                .ThenInclude(se => se.Servicio)
            .FirstOrDefaultAsync(e => e.IdEstadia == id);
        if (estadia == null) return NotFound();
        return estadia;
    }

    [HttpPost]
    public async Task<ActionResult<Estadia>> Create(Estadia estadia)
    {
        _context.Estadias.Add(estadia);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetById), new { id = estadia.IdEstadia }, estadia);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Estadia estadia)
    {
        if (id != estadia.IdEstadia) return BadRequest();
        _context.Entry(estadia).State = EntityState.Modified;
        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Estadias.Any(e => e.IdEstadia == id)) return NotFound();
            throw;
        }
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        var estadia = await _context.Estadias.FindAsync(id);
        if (estadia == null) return NotFound();
        _context.Estadias.Remove(estadia);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
