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
    public partial class LoginADMIN : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLOGIN_Click(object sender, EventArgs e)
        {
            string email = txtUserName.Text;
            string pwd = txtPassword.Text;
            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM ADMINTBL WHERE EMAIL = '" + email + "' AND PSWD ='" + pwd + "' ";
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["username"] = reader["email"].ToString();//deposit module where ma sulod ang g deposit sa user
                        Response.Redirect("AdminTransaction.aspx");


                    }
                    else
                        Response.Write("<script>alert('Invalid Credentials')</script>");
                }
            }

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_Admin_Account.aspx");
        }

      
    }
}