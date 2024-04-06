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
    public partial class Create_Admin_Account : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
        }

        protected void btn_Click(object sender, EventArgs e)
        {

            string lName = txtLname.Text;
            string fname = txtFname.Text;
            string eMail = txtEmail.Text;
            string bdate = txtbdate.Text;
            string uname = txtusrn.Text;
            string pwd = txtpwd.Text;

            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM ADMINTBL WHERE USERNAME = @username OR EMAIL = @email";
                    cmd.Parameters.AddWithValue("@username", uname);
                    cmd.Parameters.AddWithValue("@email", eMail);
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {

                        lblWarning.Visible = true;
                        lblWarning.Text = "* Please change either username or email address.";
                        rd.Close();
                    }
                    else
                    {
                        rd.Close();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "INSERT INTO ADMINTBL (LNAME, FNAME, EMAIL, BDATE, USERNAME, PSWD) "
                         + " VALUES (@lName,@fName, @eMail, @bdate,@uname, @pswd)";
                        cmd.Parameters.AddWithValue("@lName", lName);
                        cmd.Parameters.AddWithValue("@fName", fname);
                        cmd.Parameters.AddWithValue("@bdate", bdate);
                        cmd.Parameters.AddWithValue("@uname", uname);
                        cmd.Parameters.AddWithValue("@pswd", pwd);

                        var ctr = cmd.ExecuteNonQuery();

                        if (ctr >= 1)
                        {

                            Response.Write("<script>alert('You created '" + eMail + "' ADMIN account successfully!')</script>");
                            Response.Redirect("LoginADMIN.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Sorry, something went wrong... Please try again.(CTR)')</script>");
                        }

                     }
                        db.Close();
                }
            }
        }
                protected void txtbdate_TextChanged(object sender, EventArgs e)
                {

                }

            protected void txtusrn_TextChanged(object sender, EventArgs e)
            {

            }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
        //will check the page to avoid skipping the page
        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");

        }
    }
   
}

