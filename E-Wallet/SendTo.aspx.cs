using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace E_Wallet
{
    public partial class SendTo1 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
        }

        protected void btnSendMoney_Click(object sender, EventArgs e)
        {

            try {
            string email = Session["username"].ToString();
            int amt = 0 - Convert.ToInt32(txtAmountToSend.Text);
            string type = "S";
            string sendto = txtSendToEm.Text;
                if(Convert.ToInt32(txtAmountToSend.Text) > 0)
                {
                    if((Convert.ToInt32(txtAmountToSend.Text) != 0) && (sendto != ""))
                    {
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
                            if (ctr >= 0)
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                    "swal('Transaction Completed!', '', 'success')", true);
                                //ddeirectly get the balance of the user to update in transac page
                                getBalance();
                                //send the emout to the reciever
                                sendTo();
                                //clear the input boxes
                                clearBoxes();
                            }
                            else
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                 "swal('Oooppss..', 'Something went wrong!!', 'error')", true);
                            }
                        }

                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                     "swal('Information!', 'Input an reciever and amount!', 'info')", true);

                }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                     "swal('Warning!', 'You enter a negative amount!', 'warning')", true);

                }



            }
            catch {
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
        // deposit the AMT to the reciever
        void sendTo()
        {
            string email = txtSendToEm.Text;
            string sendby = Session["username"].ToString();
            string amt = txtAmountToSend.Text;
            string sendto = txtSendToEm.Text;
            string type = "S";
            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO TRANSACTBL (TYPE, TDATE, AMT, SENDTO, EMAIL, SENDBY) "
                         + " VALUES (@type,@date,@amt,@sendto,@email, @sendby)";
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@amt", amt);
                    cmd.Parameters.AddWithValue("@sendto", sendto);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@sendby", sendby);
                    var ctr = cmd.ExecuteNonQuery();
                    if (ctr >= 1)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                         "swal('Successfully Send!', '', 'success')", true);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                             "swal('Oooppss..', 'Something wrong!', 'error')", true);

                    }

                }

            }
        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Transaction.aspx");
        }
        //will check the page to avoid skipping the page
        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");
            if (HttpContext.Current.Session["bal"] == null)
                Response.Redirect("Login.aspx");
        }

        void clearBoxes()
        {
            txtAmountToSend.Text = "";
            txtSendToEm.Text = "";
        }
    }
}
