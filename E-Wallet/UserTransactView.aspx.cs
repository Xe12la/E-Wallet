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
    public partial class UserTransactView : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
            lblEnd.Visible = false;
            lblStart.Visible = false;
            txtStartDate.Visible = false;
            txtEndDate.Visible = false;
            bntViewCustom.Visible = false;
            rbnCustom_TypeofTransaction.Visible = false;
            Button2.Visible = false;
            
        }

        protected void bntViewAll_Click(object sender, EventArgs e)
        {
            notVisible();
            string email = dpEmail.SelectedValue;

            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                SqlCommand cmd = new SqlCommand();
                string sql = "SELECT ID, TYPE, TDATE, SENDTO, AMT, SENDBY FROM TRANSACTBL WHERE EMAIL = '" + email + "'";
                cmd.CommandText = sql;
                cmd.Connection = db;
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                State_Of_Acct.DataSource = dt;
                State_Of_Acct.DataBind();
                int count = State_Of_Acct.Rows.Count;
                if (count == 0)
                {
                    Response.Write("<script>alert('NO TRANSACTION FOUND')</script>");
                }
                db.Close();
            }
        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtEndDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void bntCustom_Click(object sender, EventArgs e)
        {
            lblEnd.Visible = true;
            lblStart.Visible = true;
            txtStartDate.Visible = true;
            txtEndDate.Visible = true;
            State_Of_Acct.Visible = false;
            bntViewCustom.Visible = true;
            rbnCustom_TypeofTransaction.Visible = true;
            Button3.Visible = false;
            Button2.Visible = true;
            bntViewAll.Visible= false;
        }

        void notVisible()
        {
            lblEnd.Visible = false;
            lblStart.Visible = false;
            txtStartDate.Visible = false;
            txtEndDate.Visible = false;
            rbnCustom_TypeofTransaction.Visible = false;
        }

        protected void bntViewCustom_Click(object sender, EventArgs e)
        {
            string email = dpEmail.SelectedValue;
            State_Of_Acct.Visible = true;
            Button2.Visible = true;

            try
            {//g usab
                if (txtStartDate.Text != "" && txtEndDate.Text != "")
                    using (var db = new SqlConnection(connDB))
                    {
                        db.Open();
                        SqlCommand cmd = new SqlCommand();
                        string sql = "SELECT * FROM TRANSACTBL WHERE EMAIL = '" + email + "' AND TDATE BETWEEN '" + txtStartDate.Text + "' AND '" + txtEndDate.Text + "' AND TYPE='" + rbnCustom_TypeofTransaction.SelectedValue + "'";
                        cmd.CommandText = sql;
                        cmd.Connection = db;
                        DataTable dt = new DataTable();
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        sda.Fill(dt);
                        State_Of_Acct.DataSource = dt;
                        State_Of_Acct.DataBind();
                        int count = State_Of_Acct.Rows.Count;
                        if (count == 0)
                        {
                            Response.Write("<script>alert('NO TRANSACTION FOUND')</script>");
                        }
                        db.Close();
                    }
            }//g usab
            catch
            {
                Response.Write("<script>alert('Something went wrong!(c).')</script>");
            }
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
