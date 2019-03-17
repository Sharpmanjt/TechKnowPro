using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechKnowPro
{
    public partial class CreateSurvey : System.Web.UI.Page
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

            /*
             * testing if sql command necessary
             * SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT * FROM [User] WHERE Username = '" + Session["Username"].ToString() + "'";
            cmd.ExecuteNonQuery();
            SqlDataReader sdr = cmd.ExecuteReader();
            
            if (sdr.Read())
            {
                lblCustomerID.Text = sdr["Username"].ToString();
            }
            con.Close();*/
            lblCustomerID.Text = Session["Username"].ToString();

        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int surveynum = 1;
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
                SqlCommand cmd = con.CreateCommand();
                
                con.Open();                
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "select survey_num from Surveys";
                cmd.ExecuteNonQuery();
                SqlDataReader sdr = cmd.ExecuteReader();
                //retrieves the highest incident number and increments by 1 for the next number
                //returns empty if no items in table, case already handled above
                while (sdr.Read())
                {
                    surveynum = (1 + Convert.ToInt32(sdr["survey_num"]));
                }
                con.Close();
                

                Survey newsurvey = new Survey(surveynum, Convert.ToInt32(listIncidents.SelectedValue), Session["Username"].ToString(), radListResponse.SelectedValue, radListTech.SelectedValue, radListResolution.SelectedValue, txtAddComments.Text, chkContact.Checked, radListContact.SelectedValue);
                newsurvey.addSurveyToDatabase();

                Session["survey_num"] = surveynum;
                Response.Redirect("ConfirmSurvey.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Server.Transfer("~/Login.aspx");
        }

        protected void chkContact_CheckedChanged(object sender, EventArgs e)
        {
            
            validatorContact.Visible = true;
            radListContact.Visible = true;
            radListContact.CausesValidation = true;                
            
            if(chkContact.Checked == false)
            {
                validatorContact.Visible = false;
                radListContact.Visible = false;
                radListContact.CausesValidation = false;
            }
        }
    }
}