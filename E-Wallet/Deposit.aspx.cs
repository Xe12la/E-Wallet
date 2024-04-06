using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Wallet
{
    public partial class Deposit11 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                string email = Session["username"].ToString();
                string amt = txtdepAmount.Text;
                string type = "D";
                string sendto = "";  
                if (Convert.ToString(txtdepAmount.Text) != "")
                {
                //check the amout  to be deposit if it is divisible by 100
                if(Convert.ToInt32(amt) % 100 == 0)
                {
                    //will check if the amout deposit is in range 100 - 2000 per transaction
                    if(Convert.ToInt32(amt) >= 100 && Convert.ToInt32(amt) <= 2000)
                    using (var db = new SqlConnection(connDB))
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
                                        "swal('Transaction Completed', 'Thank you for banking!', 'success')", true);
                                 clearAmt();
                        
                            }
                            else
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                     "swal('Oooppss..', 'Something went wrong!', 'warning')", true);

                                    }

                                }

                    }
                        else
                        {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                        "swal('Oooppss..', 'Max deposit is Php2,000.00 and Min deposit is Php100.00!', 'info')", true);
                        }
                }
                else
                {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Warning!', 'Amount must be divisible by Php100.00', 'warning')", true);

                    }

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('Must enter an amount!', '', 'warning')", true);

                }
            }

            catch
            {

                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                 "swal('Error', 'Please try again!(c)', 'error')", true);
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
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
            txtdepAmount.Text = "";
        }
    }
}