using Hotel.Data;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HuespedesController : ControllerBase
{
    private readonly HotelContext _context;

    public HuespedesController(HotelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Huesped>>> GetAll()
    {
        return await _context.Huespedes.ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Huesped>> GetById(int id)
    {
        var huesped = await _context.Huespedes.FindAsync(id);
        if (huesped == null) return NotFound();
        return huesped;
    }

    [HttpPost]
    public async Task<ActionResult<Huesped>> Create(Huesped huesped)
    {
        huesped.FechaRegistro = DateTime.Now;
        _context.Huespedes.Add(huesped);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetById), new { id = huesped.IdHuesped }, huesped);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Huesped huesped)
    {
        if (id != huesped.IdHuesped) return BadRequest();
        _context.Entry(huesped).State = EntityState.Modified;
        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Huespedes.Any(e => e.IdHuesped == id)) return NotFound();
            throw;
        }
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        var huesped = await _context.Huespedes.FindAsync(id);
        if (huesped == null) return NotFound();
        _context.Huespedes.Remove(huesped);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
