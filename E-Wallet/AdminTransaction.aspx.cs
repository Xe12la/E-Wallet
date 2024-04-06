using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Wallet
{
    public partial class AdminTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping(); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //grid view of the info(ADMIN)
            Response.Redirect("AdminUpdateProfile.aspx");
            //can edit/ update the admin information
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //will have the user transaction(the grid view also sa tarnsaction)
            Response.Redirect("UserTransactView.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //will have the code for user update info(from usertbl)
            Response.Redirect("UserInformation.aspx");
        }
        //will check the page to avoid skipping the page
        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Response.Redirect("AdminTransaction.aspx");
        }
    }
}