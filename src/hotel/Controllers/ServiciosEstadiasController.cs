using Hotel.Data;
using Hotel.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Hotel.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ServiciosEstadiasController : ControllerBase
{
    private readonly HotelContext _context;

    public ServiciosEstadiasController(HotelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ServicioEstadia>>> GetAll()
    {
        return await _context.ServiciosEstadias
            .Include(se => se.Servicio)
            .Include(se => se.Estadia)
            .ToListAsync();
    }

    [HttpGet("{idServicio}/{idEstadia}")]
    public async Task<ActionResult<ServicioEstadia>> GetById(int idServicio, int idEstadia)
    {
        var servicioEstadia = await _context.ServiciosEstadias
            .Include(se => se.Servicio)
            .Include(se => se.Estadia)
            .FirstOrDefaultAsync(se => se.IdServicio == idServicio && se.IdEstadia == idEstadia);
        if (servicioEstadia == null) return NotFound();
        return servicioEstadia;
    }

    [HttpPost]
    public async Task<ActionResult<ServicioEstadia>> Create(ServicioEstadia servicioEstadia)
    {
        _context.ServiciosEstadias.Add(servicioEstadia);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetById),
            new { idServicio = servicioEstadia.IdServicio, idEstadia = servicioEstadia.IdEstadia },
            servicioEstadia);
    }

    [HttpDelete("{idServicio}/{idEstadia}")]
    public async Task<IActionResult> Delete(int idServicio, int idEstadia)
    {
        var servicioEstadia = await _context.ServiciosEstadias
            .FirstOrDefaultAsync(se => se.IdServicio == idServicio && se.IdEstadia == idEstadia);
        if (servicioEstadia == null) return NotFound();
        _context.ServiciosEstadias.Remove(servicioEstadia);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
