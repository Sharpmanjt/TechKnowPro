﻿using System;
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
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");

            string userName = txtUsername.Text.ToLower();
            string postalCode = txtPostalCode.Text.ToLower();
            string secretQuestion = DropDownListSecretQuestion.SelectedValue;
            string secretAnswer = txtSecretAnswer.Text.ToLower();
            string newPassword = txtNewPassword.Text.ToLower();

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "select * from [User]" + " where Username='" + userName + "' and Postal_Code ='" + postalCode + "' and Secret_Question ='" + secretQuestion + "' and Secret_Answer='" + secretAnswer + "'";
            cmd.ExecuteNonQuery();
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                Label lblNewPassword = new Label();
                TextBox txtNewPassword = new TextBox();
                Label lblConfirmPassword = new Label();
                TextBox txtConfirmPassword = new TextBox();

                //PlaceHolder.Controls.Add(lblNewPassword, txtNewPassword, lblConfirmPassword, txtConfirmPassword);


                SqlCommand cmd2 = con.CreateCommand();
                cmd2.CommandType = System.Data.CommandType.Text;
                cmd2.CommandText = "update [User] set Password='" + newPassword + "' where Username='" + userName + "'";
                cmd2.ExecuteNonQuery();
                lblResetPasswordMessage.Text = "Password successfully changed! Click <a href='http://localhost:8080/Login.aspx'>here</a> to login!";
            }
            else
            {
                lblResetPasswordMessage.Text = "Information entered is incorrect - please verify!";
            }
        }

        protected void CustomValidatorMissingFields_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string message = "";
            if (string.IsNullOrEmpty(this.txtUsername.Text.Trim()))
            {
                message = message + "Username<br>";
            }
            if (string.IsNullOrEmpty(this.txtPostalCode.Text.Trim()))
            {
                message = message + "Postal Code<br>";
            }
            if (string.IsNullOrEmpty(this.DropDownListSecretQuestion.Text.Trim()))
            {
                message = message + "Secret Question<br>";
            }
            if (string.IsNullOrEmpty(this.txtSecretAnswer.Text.Trim()))
            {
                message = message + "Secret Answer<br>";
            }
            if (string.IsNullOrEmpty(this.txtNewPassword.Text.Trim()))
            {
                message = message + "New Password<br>";
            }
            if (string.IsNullOrEmpty(this.txtConfirmPassword.Text.Trim()))
            {
                message = message + "Password Confirmation<br>";
            }

            if (message.Length > 0)
            {
                args.IsValid = false;
                ((CustomValidator)source).ErrorMessage = @"&nbsp;Required fields missing:<br>" + message;
            }
        }
    }
}