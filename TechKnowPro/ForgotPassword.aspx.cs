using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TechKnowPro
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void CustomValidatorMissingFields_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // custom validator that checks if every textbox has been filled
            string message = "";
            if (string.IsNullOrEmpty(this.txtUsername.Text.Trim()))
                message = message + "Username<br>";
            if (string.IsNullOrEmpty(this.DropDownListSecretQuestion.Text.Trim()))
                message = message + "Secret Question<br>";
            if (string.IsNullOrEmpty(this.txtSecretAnswer.Text.Trim()))
                message = message + "Secret Answer<br>";
            if (message.Length > 0)
            {
                args.IsValid = false;
                ((CustomValidator)source).ErrorMessage = @"&nbsp;Required fields missing:<br>" + message;
            }
        }

        protected void btnVerifyInformation_Click(object sender, EventArgs e)
        {
            string userName = txtUsername.Text.ToLower();
            string secretQuestion = DropDownListSecretQuestion.SelectedItem.Text;
            string secretAnswer = txtSecretAnswer.Text.ToLower();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "select * from [User]" + " where Username='" + userName + "' and Secret_Question='" + secretQuestion + "' and Secret_Answer='"+secretAnswer+"'";
            cmd.ExecuteNonQuery();
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                // if the postal code and security question/answer match the user's previous entries
                lblNewPassword.Visible = true;
                txtNewPassword.Visible = true;
                lblConfirmPassword.Visible = true;
                txtConfirmPassword.Visible = true;
                btnResetPassword.Visible = true;
            }
            else
            {
                // if the user input doesn't match previous entries
                lblResetPasswordMessage.Text = "Information entered is incorrect - please verify!";
                lblNewPassword.Visible = false;
                txtNewPassword.Visible = false;
                lblConfirmPassword.Visible = false;
                txtConfirmPassword.Visible = false;
                btnResetPassword.Visible = false;
            }
            con.Close();
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            // update password on database
            string newPassword = BCrypt.Net.BCrypt.HashPassword(txtNewPassword.Text);
            string userName = txtUsername.Text;
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.CommandText = "update [User] set Password='" + newPassword + "' where Username='" + userName + "'";
            cmd2.ExecuteNonQuery();
            lblResetPasswordMessage.Text = "Password successfully changed! Click <a href='http://localhost:8080/Login.aspx'>here</a> to login!";
            con.Close();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}