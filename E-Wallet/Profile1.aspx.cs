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
    public partial class Profile1 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();

        }
       

        protected void BntUpdate_Click(object sender, EventArgs e)
        { 
                

            try
            {
               string fname = firstName.Text.ToString();
                string lname = lastName.Text.ToString();
                string mail = emailAddress.Text.ToString();
                string username = userName.Text.ToString();
                string eMail = Session["username"].ToString();

                if ((lname != "" && fname !="") &&  (mail !="" && username !=""))
                {
                    using (var db = new SqlConnection(connDB))
                    {
                        db.Open();
                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "UPDATE USERTBL SET LNAME='" + lname + "',FNAME='" + fname + "', EMAIL= '"+mail+"',USRNAME= '"+username+"' WHERE EMAIL ='"+eMail+"'";
                            updateTransactionMail();
                            setUser();
                            var ctr = cmd.ExecuteNonQuery();
                            if (ctr >= 0)
                            {
                                getBalance();
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                "swal('Profile Updated!', 'Successfully Updated', 'success')", true);
                                SuccessfulyUpdate();
                            }
                            else
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                "swal('Opppsss!..', 'Something went wrong!', 'error')", true);
                            }
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Information!', 'Complete the information needed!', 'info')", true);

                }
            }
            catch
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                 "swal('Error', 'Please try again!(c)', 'error')", true);
            }
        }
        //set the session user to updated username or email
        void setUser()
        {
           
            string mail = emailAddress.Text.ToString();
            using (var db = new SqlConnection(connDB))
            {

                db.Open();
                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandText = "SELECT * FROM USERTBL WHERE EMAIL = '" + mail + "'";
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["username"] = reader["email"].ToString();
                        
                    }
                    //else
                      // Response.Write("<script>alert('Invalid Credentials')</script>");
                }
            }
        }
        //get the balance of the updated username
        void getBalance()
        {
            string email = emailAddress.Text.ToString();
            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT SUM (AMT) AS BAL FROM TRANSACTBL WHERE EMAIL = '" + email + "' ";
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["bal"] = reader["BAL"].ToString();
                    }

                }
            }

        }
        //update the user email to the table of transaction
        void updateTransactionMail()
        {
            string mail = emailAddress.Text.ToString();
            string eMail = Session["username"].ToString();
            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE TRANSACTBL SET EMAIL='" + mail + "' WHERE EMAIL='" + eMail + "'";
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["username"] = reader["email"].ToString();
                        getBalance();
                    }
                    //else
                    //    Response.Write("<script>alert('Invalid Credentials')</script>");
                }
            }
        }

        protected void BntCancel_Click(object sender, EventArgs e)
        {

        }
        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");
            if (HttpContext.Current.Session["bal"] == null)
                Response.Redirect("Login.aspx");
        }

        void SuccessfulyUpdate()
        {
            Response.Redirect("Login.aspx");
        }
    }
}
