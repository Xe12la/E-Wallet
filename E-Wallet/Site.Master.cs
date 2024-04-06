using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Wallet
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string CheckForPageSkipping()
        {
            var redirectTo = "";
            if (HttpContext.Current.Session["username"] == null) redirectTo = "Login.aspx";
            if (HttpContext.Current.Session["bal"] == null) redirectTo = "Login.aspx";
            return redirectTo;
        }
    }

}