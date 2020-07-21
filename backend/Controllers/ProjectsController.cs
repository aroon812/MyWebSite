using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Backend.Models;

namespace backend.Controllers
{
    [Route("api/Projects")]
    [ApiController]
    public class ProjectsController : ControllerBase
    {
        private readonly ProjectContext _context;

        public ProjectsController(ProjectContext context)
        {
            _context = context;
        }

        // GET: api/Projects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProjectDTO>>> GetProjects()
        {
            return await _context.Projects
            .Select(x => ItemToDTO(x))
            .ToListAsync();
        }

        // GET: api/Projects/5
        //ASP.NET Core automatically serializes the returned ActionResult to json
        //clarification: is a Task or ActionResult object returned?
        [HttpGet("{id}")]
        public async Task<ActionResult<ProjectDTO>> GetProject(long id)
        {
            var project = await _context.Projects.FindAsync(id);

            if (project == null)
            {
                return NotFound();
            }

            return ItemToDTO(project);
        }

        // PUT: api/Projects/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProject(long id, ProjectDTO projectDTO)
        {
            if (id != projectDTO.Id)
            {
                return BadRequest();
            }

            var project = await _context.Projects.FindAsync(id);
            if (project == null)
            {
                return NotFound();
            }

            project.Name = projectDTO.Name;
            project.Description = projectDTO.Description;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException) when (!ProjectExists(id))
            {
                return NotFound();
            }

            return NoContent();
        }

        // POST: api/Projects
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<ProjectDTO>> PostProject(ProjectDTO projectDTO)
        {
            var project = new Project
            {
                Description = projectDTO.Description,
                Name = projectDTO.Name
            };


            _context.Projects.Add(project);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetProject), new { id = project.Id }, ItemToDTO(project));
        }

        // DELETE: api/Projects/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Project>> DeleteProject(long id)
        {
            var project = await _context.Projects.FindAsync(id);
            if (project == null)
            {
                return NotFound();
            }

            _context.Projects.Remove(project);
            await _context.SaveChangesAsync();

            return project;
        }

        private bool ProjectExists(long id) =>
            _context.Projects.Any(e => e.Id == id);
        
        private static ProjectDTO ItemToDTO(Project project) =>
            new ProjectDTO
            {
                Id = project.Id,
                Name = project.Name,
                Description = project.Description
            };
    }
}
