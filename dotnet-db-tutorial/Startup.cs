using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using TodoList.Models;

namespace TodoList
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        /*
        public void ConfigureDevelopmentServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddDbContext<MyDatabaseContext>(options => options.UseSqlite("Data Source=localdatabase.db"));
        }
        
        public void ConfigureStagingServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddDbContext<MyDatabaseContext>(options =>
                options.UseMySQL(Configuration.GetConnectionString("localdb").Replace(":", ";port=")
                ));
            //            services.AddDbContext<MyDatabaseContext>(options => options.UseSqlite("Data Source=localdatabase.db"));
        }
        public void ConfigureProductionServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddDbContext<MyDatabaseContext>(options =>
                options.UseSqlServer(Configuration.GetConnectionString("mssqldb")
                ));
            //            services.AddDbContext<MyDatabaseContext>(options => options.UseSqlite("Data Source=localdatabase.db"));
        }

        
        public void ConfigureCosmosDBServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddDbContext<MyDatabaseContext>(options =>
                options.UseCosmos(Configuration.GetConnectionString("cosmosdb"), databaseName: "mydb1")
                );
            //            services.AddDbContext<MyDatabaseContext>(options => options.UseSqlite("Data Source=localdatabase.db"));
        }
        */
        public void ConfigureServices(IServiceCollection services)
        {
            var provider = Configuration.GetValue("Provider", "Sqlite");
            var database = Configuration.GetValue("DBName", "Todos");
            services.AddControllersWithViews();
            services.AddDbContext<MyDatabaseContext>(options => _ = provider switch
                {
                    "Sqlite" => options.UseSqlite("Data Source=localdatabase.db"),

                    "SQLAzure" => options.UseSqlServer(Configuration.GetConnectionString(database)),

                    "CosmosDB" => options.UseCosmos(Configuration.GetConnectionString(database), databaseName: database),

                    "MySQL" => options.UseMySQL(Configuration.GetConnectionString(database).Replace(":", ";port=")),

                    _ => throw new Exception($"Unsupported provider: {provider}")
                }
            );
            //            services.AddDbContext<MyDatabaseContext>(options => options.UseSqlite("Data Source=localdatabase.db"));
        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                //app.UseHsts();
            }
            
            //app.UseDeveloperExceptionPage();
            //app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Todos}/{action=Index}/{id?}");
            });

        }
    }
}
