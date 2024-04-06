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
    public partial class Login : System.Web.UI.Page
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
                    cmd.CommandText = "SELECT * FROM USERTBL WHERE EMAIL = '" + email + "' AND PSWD ='" + pwd + "' ";
                    
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["username"] = reader["email"].ToString();//deposit module where ma sulod ang g deposit sa user
                        getBalance();
                        
                        Response.Redirect("Transaction");
                        
                    }
                    else
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                "swal('LOG IN ERROR', 'Invalid Credentials!', 'error')", true);


                }
            }
        }


                void getBalance()
                {
                    using (var db = new SqlConnection(connDB))
                    {
                        db.Open();
                            using (var cmd = db.CreateCommand())
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "SELECT SUM (AMT) AS BAL FROM TRANSACTBL WHERE EMAIL = '" + txtUserName.Text + "' ";
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
            Response.Redirect("createAccount.aspx");
        }

    }
    }
