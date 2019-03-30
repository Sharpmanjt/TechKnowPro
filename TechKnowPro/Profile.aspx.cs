using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (Session["User Type"] == null || Session["User Type"].ToString() != "customer")
            {
                Session["ErrorMessage"] = "You do not have permission to access this page.";
                if (Session["Username"] == null) Server.Transfer("Login.aspx");
                Server.Transfer("Home.aspx");
            }
                    
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT * FROM [User] WHERE Username = '" + Session["Username"].ToString()+ "'";
            cmd.ExecuteNonQuery();
            SqlDataReader sdr = cmd.ExecuteReader();

            if (!IsPostBack)
            { 
                if (sdr.Read())
                {
                    txtUsername.Text = sdr["Username"].ToString();                
                    txtFirstName.Text = sdr["First_Name"].ToString();
                    txtLastName.Text = sdr["Last_Name"].ToString();
                    drpSecretQuestion.Text = sdr["Secret_Question"].ToString();
                    txtAddress.Text = sdr["Address"].ToString();
                    txtPhoneNum.Text = sdr["Phone_Number"].ToString();
                    txtSecretAnswer.Text = sdr["Secret_Answer"].ToString();
                }
            }
            con.Close();

            
        }
       
        protected void drpSecretQuestion_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;

            cmd.CommandText = "INSERT into [User](Secret_Question) values('" + drpSecretQuestion.SelectedValue + "')";
        }
       

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            if (Page.IsValid)
            {
                string username = txtUsername.Text;
                if (!string.IsNullOrEmpty(txtConfirmPass.Text))
                {
                    string password = txtConfirmPass.Text;
                }
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                string secretQ = drpSecretQuestion.SelectedValue;
                string secretA = txtSecretAnswer.Text;
                string address = txtAddress.Text;
                string phoneNum = txtPhoneNum.Text;

                cmd.CommandType = System.Data.CommandType.Text;

                if (!string.IsNullOrEmpty(txtConfirmPass.Text))
                {
                    string password = txtConfirmPass.Text;
                    cmd.CommandText = "UPDATE [User] SET Password ='" + BCrypt.Net.BCrypt.HashPassword(password) +
                        "' WHERE Username ='" + Session["Username"].ToString() + "'";
                    cmd.ExecuteNonQuery();

                }
                cmd.CommandText = "UPDATE [User] SET " +
                    "Username ='" + username +
                    "', First_Name='" + firstName +
                    "', Last_Name='" + lastName +
                    "', Secret_Question='" + secretQ +
                    "', Secret_Answer='" + secretA +
                    "', Address='" + address +
                    "', Phone_Number='" + phoneNum +
                    "' WHERE Username ='" + Session["Username"].ToString() + "'";

                cmd.ExecuteNonQuery();                
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    //if the username was found in the database/has previously been registered
                    lblUpdate.Text = "An account has already been registered with this email!";
                    con.Close();
                }
                con.Close();
                lblUpdate.Text = "Your profile information has been updated successfully!";
            }
            con.Close();
            txtNewPass.Visible = false;
            txtConfirmPass.Visible = false;
            lblNewPass.Visible = false;
            lblConfirmPass.Visible = false;
        }


        protected void CustomValidatorMissingFields_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string message = "";
            if (string.IsNullOrEmpty(this.txtUsername.Text.Trim()))
                message = message + "Username<br>";
            if (string.IsNullOrEmpty(this.txtNewPass.Text.Trim()) && txtNewPass.Visible == true)
                message = message + "New Password<br>";
            if (string.IsNullOrEmpty(this.txtConfirmPass.Text.Trim()) && txtConfirmPass.Visible == true)
                message = message + "Confirm Password<br>";
            if (string.IsNullOrEmpty(this.txtLastName.Text.Trim()))
                message = message + "Last Name<br>";
            if (string.IsNullOrEmpty(this.txtAddress.Text.Trim()))
                message = message + "Address<br>";
            if (string.IsNullOrEmpty(this.txtPhoneNum.Text.Trim()))
                message = message + "Phone Number<br>";
            if (string.IsNullOrEmpty(this.txtSecretAnswer.Text.Trim()))
                message = message + "Secret Answer<br>";

            if (message.Length > 0)
            {
                args.IsValid = false;
                ((CustomValidator)source).ErrorMessage = @"&nbsp;Required fields missing:<br><br>" + message;
            }
        }

        protected void btnPassChange_Click(object sender, EventArgs e)
        {
            lblNewPass.Visible = true;
            lblConfirmPass.Visible = true;
            txtNewPass.Visible = true;
            txtConfirmPass.Visible = true;
            validateRegexPass.Visible = true;
            validateConfirm.Visible = true;        
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtUsername.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtAddress.Text = "";
            txtSecretAnswer.Text = "";

            if (txtNewPass.Visible == true)
            {
                txtNewPass.Text = "";
                txtConfirmPass.Text = "";
                txtNewPass.Visible = false;
                txtConfirmPass.Visible = false;
                lblNewPass.Visible = false;
                lblConfirmPass.Visible = false;
            }
                
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Server.Transfer("~/Login.aspx");           
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx");
        }
    }
}