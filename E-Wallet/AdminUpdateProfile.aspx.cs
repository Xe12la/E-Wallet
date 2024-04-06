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
    public partial class AdminUpdateProfile : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
            updateArea();
        }
        void updateArea()
        {
            firstName.Visible = false;
            txtemailAddress.Visible = false;
            lastName.Visible = false;
            txtuserName.Visible = false;
            BntUpdate.Visible = false;
            BntCancel.Visible = false;
            lblemail.Visible = false;
            lblfirstname.Visible = false;
            lblLName.Visible = false;
            lblUsername.Visible = false;
            bntListAdmin.Visible = true;
            lblPersonalD.Visible = false;
            bntUpdateProfile.Visible = true;
            bntBack.Visible = true;
            ListView1.Visible = false;
            lblListadmin.Visible=false;

        }
       

        protected void BntUpdate_Click(object sender, EventArgs e)
        {
            string fname = firstName.Text.ToString();
            string lname = lastName.Text.ToString();
            string mail = txtemailAddress.Text.ToString();
            string username = txtuserName.Text.ToString();
            string eMail = Session["username"].ToString();

            try
            {


                if ((lname != "" && fname != "") && (mail != "" && username != ""))
                {
                    using (var db = new SqlConnection(connDB))
                    {
                        db.Open();
                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "UPDATE AdminTbl SET LNAME='" + lname + "',FNAME='" + fname + "', EMAIL= '" + mail + "',USERNAME= '" + username + "' WHERE EMAIL ='" + eMail + "'";
                            var ctr = cmd.ExecuteNonQuery();
                            if (ctr >= 0)
                            {
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
            }
            catch
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                 "swal('Error', 'Please try again!(c)', 'error')", true);
            }
        }

        protected void BntCancel_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //button update profile
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //button see list of admin info
        }
        //will check the page to avoid skipping the page
        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");
            
        }

        protected void bntUpdateProfile_Click(object sender, EventArgs e)
        {
            //will update my profile
            firstName.Visible = true;
            txtemailAddress.Visible = true;
            lastName.Visible = true;
            txtuserName.Visible = true;
            BntUpdate.Visible = true;
            BntCancel.Visible = true;
            lblemail.Visible = true;
            lblfirstname.Visible = true;
            lblLName.Visible = true;
            lblUsername.Visible = true;
            lblPersonalD.Visible = true;
            bntListAdmin.Visible = false;
            bntUpdateProfile.Visible = false;
            bntBack.Visible = false;
            ListView1.Visible = false;
            lblListadmin.Visible = false;

        }

        protected void bntListAdmin_Click(object sender, EventArgs e)
        {
            //will view all the co-admin details.
            ListView1.Visible = true;
            bntBack.Visible = true;
            bntUpdateProfile.Visible = false;
            bntListAdmin.Visible = false;
            lblListadmin.Visible = true;
        }

        void SuccessfulyUpdate()
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
               "swal('Great job!', 'Profile Updated!', 'success')", true);
            Response.Redirect("LoginADMIN.aspx");
        }
    }
}