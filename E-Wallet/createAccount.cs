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
    public partial class createAccount : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string lName = txtLname.Text;
            string fname = txtFname.Text;
            string eMail = txtEmail.Text;
            string bdate = txtbdate.Text;
            string uname = txtusrn.Text;
            string pwd = txtpwd.Text;
            double amount = 2000.00;
            string type = "";
            string sendto = "";

            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                using (var cmd = db.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM USERTBL WHERE USRNAME = @username OR EMAIL = @email";
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
                        cmd.CommandText = "INSERT INTO USERTBL (LNAME, FNAME, EMAIL, BDATE, USRNAME, PSWD) "
                            + " VALUES (@lName,@fName, @eMail, @bdate,@uname, @pswd)";
                        cmd.Parameters.AddWithValue("@lName", lName);
                        cmd.Parameters.AddWithValue("@fName", fname);
                        cmd.Parameters.AddWithValue("@bdate", bdate);
                        cmd.Parameters.AddWithValue("@uname", uname);
                        cmd.Parameters.AddWithValue("@pswd", pwd);

                        var ctr = cmd.ExecuteNonQuery();

                        if (ctr >= 1)
                        {
                            Response.Write("<script>alert('Congratulations, you created your account successfully!')</script>");
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "INSERT INTO TRANSACTBL (TDATE, AMT, EMAIL, TYPE, SENDTO) "
                                + " VALUES (,@date,@amt,@email,@type,@sendto)";
                            cmd.Parameters.AddWithValue("@date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@amt", amount);
                            cmd.Parameters.AddWithValue("@email", eMail);
                            cmd.Parameters.AddWithValue("@type",type );
                            cmd.Parameters.AddWithValue("@sendto", sendto);
                            setInBalance();
                        }
                        else
                        {
                            Response.Write("<script>alert('Sorry, something went wrong... Please try again.')</script>");
                        }

                    }
                    db.Close();
                }
                void setInBalance()
                {
                    using (var cmd = db.CreateCommand())

                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "INSERT INTO TRANSACTBL (TDATE, AMT, EMAIL)" + "VALUES (@date, @bal, @username)";
                        cmd.Parameters.AddWithValue("@date", DateTime.Now);
                        cmd.Parameters.AddWithValue("@bal", amount);
                        cmd.Parameters.AddWithValue("@username", eMail);
                        var ctr = cmd.ExecuteNonQuery();
                        if(ctr >= 1)
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                  "swal('Congatulation!', 'You gain ₱2000.00 as your rewards!', 'info')", true);
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                                "swal('Sorry', 'you Failed to get your reward.!', 'error')", true);

                        }
                    }
                }
            }
        }
        protected void txtbdate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtusrn_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtpwd_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtcpwd_TextChanged(object sender, EventArgs e)
        {

        }
    }
}



