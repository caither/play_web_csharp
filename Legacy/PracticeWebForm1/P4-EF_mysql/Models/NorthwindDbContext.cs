/**
MySql.Data.EntityFramework 8.0.15 sample
*/

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;

namespace P4_EF_mysql.Models
{

    [DbConfigurationType(typeof(MySql.Data.EntityFramework.MySqlEFConfiguration))]
    public class NorthwindDbContext : DbContext
    {
        public NorthwindDbContext()
            : base("name=NorthwindMySql")
        {
        }

        public DbSet<Product> Products { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>().ToTable("products");
            base.OnModelCreating(modelBuilder);
        }
    }

    [Table("products")]
    public class Product
    {
        [Key]
        [Column("ProductID")]
        public int ProductID { get; set; }

        [Required]
        [StringLength(255)]
        [Column("ProductName")]
        public string ProductName { get; set; }

        [Required]
        [StringLength(255)]
        [Column("Unit")]
        public string Unit { get; set; }

        [Column("Price")]
        public decimal Price { get; set; }
    }
}