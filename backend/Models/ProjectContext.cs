using Microsoft.EntityFrameworkCore;

namespace Backend.Models
{
    public class ProjectContext : DbContext
    {
        public ProjectContext(DbContextOptions<ProjectContext> options) : base(options)
        {
        }


    public DbSet<Project> Projects { get; set; }
    }
}