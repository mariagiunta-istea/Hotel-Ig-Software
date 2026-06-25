using Hotel.Data;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ServiciosController : ControllerBase
{
    private readonly HotelContext _context;

    public ServiciosController(HotelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Servicio>>> GetAll()
    {
        return await _context.Servicios.ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Servicio>> GetById(int id)
    {
        var servicio = await _context.Servicios.FindAsync(id);
        if (servicio == null) return NotFound();
        return servicio;
    }

    [HttpPost]
    public async Task<ActionResult<Servicio>> Create(Servicio servicio)
    {
        _context.Servicios.Add(servicio);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetById), new { id = servicio.IdServicio }, servicio);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Servicio servicio)
    {
        if (id != servicio.IdServicio) return BadRequest();
        _context.Entry(servicio).State = EntityState.Modified;
        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Servicios.Any(e => e.IdServicio == id)) return NotFound();
            throw;
        }
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        var servicio = await _context.Servicios.FindAsync(id);
        if (servicio == null) return NotFound();
        _context.Servicios.Remove(servicio);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
