using P4_EF_mysql.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P4_EF_mysql
{
    public partial class CategoryMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Product> GetCategories()
        {
            int minimumPrice = 25;
            var _db = new NorthwindDbContext();
            IQueryable<Product> query = _db.Products.Where(product => product.Price > minimumPrice)
                .OrderByDescending(product => product.Price);
            return query;
        }
    }
}