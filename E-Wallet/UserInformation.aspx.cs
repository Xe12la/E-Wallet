using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Wallet
{
    public partial class UserInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");

        }
    }
}