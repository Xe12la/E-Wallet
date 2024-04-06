using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
namespace E_Wallet
{
    public partial class Transaction : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
            string email = Session["username"].ToString();
            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT SUM(AMT) AS BAL FROM TRANSACTBL WHERE EMAIL = '" + email + "' ";
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["bal"] = reader["BAL"].ToString();//BAL ang attribute nga g sudlan sa balance
                    }

                }
            }
        }
        //will check the page to avoid skipping the page
        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");
            if (HttpContext.Current.Session["bal"] == null)
                Response.Redirect("Login.aspx");
        }
    }
}