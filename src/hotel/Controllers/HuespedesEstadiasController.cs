using Hotel.Data;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HuespedesEstadiasController : ControllerBase
{
    private readonly HotelContext _context;

    public HuespedesEstadiasController(HotelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<HuespedEstadia>>> GetAll()
    {
        return await _context.HuespedesEstadias
            .Include(he => he.Huesped)
            .Include(he => he.Estadia)
            .ToListAsync();
    }

    [HttpGet("{idHuesped}/{idEstadia}")]
    public async Task<ActionResult<HuespedEstadia>> GetById(int idHuesped, int idEstadia)
    {
        var huespedEstadia = await _context.HuespedesEstadias
            .Include(he => he.Huesped)
            .Include(he => he.Estadia)
            .FirstOrDefaultAsync(he => he.IdHuesped == idHuesped && he.IdEstadia == idEstadia);
        if (huespedEstadia == null) return NotFound();
        return huespedEstadia;
    }

    [HttpPost]
    public async Task<ActionResult<HuespedEstadia>> Create(HuespedEstadia huespedEstadia)
    {
        _context.HuespedesEstadias.Add(huespedEstadia);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetById),
            new { idHuesped = huespedEstadia.IdHuesped, idEstadia = huespedEstadia.IdEstadia },
            huespedEstadia);
    }

    [HttpDelete("{idHuesped}/{idEstadia}")]
    public async Task<IActionResult> Delete(int idHuesped, int idEstadia)
    {
        var huespedEstadia = await _context.HuespedesEstadias
            .FirstOrDefaultAsync(he => he.IdHuesped == idHuesped && he.IdEstadia == idEstadia);
        if (huespedEstadia == null) return NotFound();
        _context.HuespedesEstadias.Remove(huespedEstadia);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
