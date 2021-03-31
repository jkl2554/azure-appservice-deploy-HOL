using Microsoft.EntityFrameworkCore;
using System;

namespace TodoList.Models
{
    public class MyDatabaseContext : DbContext
    {
        public MyDatabaseContext (DbContextOptions<MyDatabaseContext> options)
            : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            
            string container = Environment.GetEnvironmentVariable("Container") ?? "Todos_container";
            modelBuilder.HasDefaultContainer(container);
            //modelBuilder.HasDefaultContainer("Todos_container");
        }

        public DbSet<TodoList.Models.Todo> Todo { get; set; } = null!;
    }
}
