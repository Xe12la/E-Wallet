using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Wallet
{
    public partial class Withdraw : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
        }

        protected void bntWithdraw_Click(object sender, EventArgs e)
        {
                string email = Session["username"].ToString();
            if (Convert.ToString(txtwdrawAmt.Text) == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Oooppss..!', 'Input an amount Please!', 'info')", true);
            }
                string type = "W";
                string sendto = "";
                using (var db = new SqlConnection(connDB))
                try
                {
                    if(Convert.ToInt32(txtwdrawAmt.Text) > 0)
                    {
                    int amt = 0 - Convert.ToInt32(txtwdrawAmt.Text);
                    if ((Convert.ToInt32(txtwdrawAmt.Text) < Convert.ToDecimal(Session["bal"].ToString())))
                    {
                        db.Open();
                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "INSERT INTO TRANSACTBL (TYPE, TDATE, AMT, SENDTO, EMAIL) "
                                + " VALUES (@type,@date,@amt,@sendto,@email)";
                            cmd.Parameters.AddWithValue("@type", type);
                            cmd.Parameters.AddWithValue("@date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@amt", amt);
                            cmd.Parameters.AddWithValue("@sendto", sendto);
                            cmd.Parameters.AddWithValue("@email", email);
                            var ctr = cmd.ExecuteNonQuery();
                            if (ctr >= 1)
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                    "swal('Successfully withdraw!', 'Thank you for banking!', 'success')", true);
                                getBalance();
                                clearAmt();
                            }
                            else
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                     "swal('Oooppss..!', 'Something went wrong!', 'warning')", true);
                            }
                        }
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                             "swal('Oooppss..!', 'Insufficient Balance!', 'warning')", true);
                    }
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                       "swal('Information', 'You enter negative amount!', 'info')", true);
                    }



                }
                catch
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Error', 'Please try again!(c)', 'error')", true);
                }

                }
        void getBalance()
        {
            string email = Session["username"].ToString();
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
     

        protected void Button1_Click(object sender, EventArgs e)
            {

            }

        //will check the page to avoid skipping the page
        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");
            if (HttpContext.Current.Session["bal"] == null)
                Response.Redirect("Login.aspx");
        }

        void clearAmt()
        {
            txtwdrawAmt.Text = "";
        }
    }
}