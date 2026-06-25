using Hotel.Data;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PagosController : ControllerBase
{
    private readonly HotelContext _context;

    public PagosController(HotelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Pago>>> GetAll()
    {
        return await _context.Pagos
            .Include(p => p.Estadia)
            .ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Pago>> GetById(int id)
    {
        var pago = await _context.Pagos
            .Include(p => p.Estadia)
            .FirstOrDefaultAsync(p => p.IdPago == id);
        if (pago == null) return NotFound();
        return pago;
    }

    [HttpPost]
    public async Task<ActionResult<Pago>> Create(Pago pago)
    {
        pago.FechaPago = DateTime.Now;
        _context.Pagos.Add(pago);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetById), new { id = pago.IdPago }, pago);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Pago pago)
    {
        if (id != pago.IdPago) return BadRequest();
        _context.Entry(pago).State = EntityState.Modified;
        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Pagos.Any(e => e.IdPago == id)) return NotFound();
            throw;
        }
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        var pago = await _context.Pagos.FindAsync(id);
        if (pago == null) return NotFound();
        _context.Pagos.Remove(pago);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
