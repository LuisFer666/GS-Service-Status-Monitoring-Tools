using Microsoft.EntityFrameworkCore;

namespace Backend
{
    public class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options)
            : base(options)
        {
        }
    }
}
