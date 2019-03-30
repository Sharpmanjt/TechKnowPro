using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace TechKnowPro
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["User Type"] == null || (Session["User Type"].ToString() != "tech" && Session["User Type"].ToString() != "admin"))
            {
                Session["ErrorMessage"] = "You do not have permission to access this page.";
                if (Session["UserName"] == null) Server.Transfer("Login.aspx");
                Server.Transfer("Home.aspx");
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT * FROM [User] WHERE Username='" + DropDownList1.SelectedValue.ToString() + "'";
            cmd.ExecuteNonQuery();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                lblAddress.Text = sdr["Address"].ToString();
                lblEmail.Text = sdr["Username"].ToString();
                lblPhone.Text = sdr["Phone_Number"].ToString();
                Session["CheckContact"] = sdr["Require_Contact"].ToString();
            }
            con.Close();
            lblSuccess.Visible = false;
            lblFail.Visible = false;
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Server.Transfer("Login.aspx");
        }

        protected void btnAddContact_Click(object sender, EventArgs e)
        {
            if(Session["CheckContact"] != null && Session["CheckContact"].ToString() == "true")
            {
                lblFail.Visible = true;
                lblSuccess.Visible = false;
            }
            else
            {

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "Update [User] set Require_Contact='true' where Username='" + DropDownList1.SelectedValue.ToString() + "'";
                cmd.ExecuteNonQuery();
                con.Close();
                lblSuccess.Visible = true;
                lblFail.Visible = false;
                Session["CheckContact"] = "true";
            }
        }
        protected void FormView1_DataBound(object sender, EventArgs e)
        {
            //drop down list value not available on page load, so databound form view used to read its value after page load
            FormView FormView1 = sender as FormView;
            if (FormView1.SelectedValue != null)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "SELECT * FROM [User] WHERE Username='" + DropDownList1.SelectedValue.ToString() + "'";
                cmd.ExecuteNonQuery();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    lblAddress.Text = sdr["Address"].ToString();
                    lblEmail.Text = sdr["Username"].ToString();
                    lblPhone.Text = sdr["Phone_Number"].ToString();
                    Session["CheckContact"] = sdr["Require_Contact"].ToString();
                }
                con.Close();
            }
            FormView1.Visible = false;
        }
    }
}