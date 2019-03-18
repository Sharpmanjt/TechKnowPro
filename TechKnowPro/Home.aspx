<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TechKnowPro.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" style="margin:20px">
                <table class="w-100">
                    <tr>
                        <td><h1 class="font-weight-bold">TechKnowPro - Incident Report Management Software</h1></td>
                        <td><asp:Button ID="btnLogout" class="btn btn-outline-primary" runat="server" OnClick="BtnLogout_Click" Text="Logout" CausesValidation="False" /></td>
                    </tr>
                </table>
                
            
            <h2><asp:Label ID="lblWelcome" runat="server" Text="" CssClass="font-weight-normal"></asp:Label></h2>
        </div>

        <!-- content for admin user -->
        <div runat="server" visible="false" id="homeAdmin" style="margin:20px">
            <br />
            <br />
            <div class="card" style="width: 35rem;">
              <div class="card-body">
                <h5 class="card-title">Getting Started</h5>
                <h6 class="card-subtitle mb-2 text-muted"><a href="Customers.aspx">Customers</a></h6>
                <h6 class="card-subtitle mb-2 text-muted"><a href="ContactList.aspx">Contact List</a></h6>
                <h6 class="card-subtitle mb-2 text-muted"><a href="ViewSurvey.aspx">View Customer Surveys</a></h6>
               
                 
              </div>
            </div>
            <br />
            <br />
        </div>

        <!-- content for tech user -->
        <div runat="server" visible="false" id="homeTech" style="margin:20px">
            <br />
            <br />
            <div class="card" style="width: 35rem;">
              <div class="card-body">
                <h5 class="card-title">Getting Started</h5>
                <h6 class="card-subtitle mb-2 text-muted"><a href="CreateIncident.aspx">Incidents</a></h6>
                <h6 class="card-subtitle mb-2 text-muted"><a href="ViewIncident.aspx">View Incidents</a></h6>
                  <h6 class="card-subtitle mb-2 text-muted"><a href="Customers.aspx">Customers</a></h6>
                  <p class="card-text">Go to Incidents section to search and review customer incident reports</p>
              </div>
            </div>
            <br />
            <br />
        </div>

        <!-- content for VERIFIED customer user -->
        <div runat="server" visible="false" id="homeCustomer" style="margin:20px">
            <br />
            <br />
            <div class="row">
              <div class="col-sm-6">
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">Getting Started</h5>
                      <h6 class="card-subtitle mb-2 text-muted"><a href="Profile.aspx">Profile</a></h6>
                        <p class="card-text">Go to Profile section to update your profile and/or customer information</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">What do you think about our service?</h5>
                      <h6 class="card-subtitle mb-2 text-muted"><a href="CreateSurvey.aspx">Survey</a></h6>
                    <p class="card-text">Submit a survey to provide your feedback for any service we have provided to you recently</p>
                  </div>
                </div>
              </div>
            </div>
            <br />
            <br />
            <br />
        </div>    
        
        <!-- content for UNVERIFIED customer user -->
        <div runat="server" visible="false" id="homeCustomerUnverified" style="margin:20px">
            <br />
            <br />
            <div class="row">
              <div class="col-sm-6">
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">Verify your Email</h5>
                        <p class="card-text">Please verify your email address by clicking the link in the email that was sent during registration. Haven't received an email? Click the button below.</p>
                        <asp:Button ID="btnResendEmail" runat="server" Text="Resend Verification Email" OnClick="btnResendEmail_Click" />
                  </div>
                </div>
              </div>
            </div>
            <br />
            <br />
            <br />
        </div>            

        <div id="footer" style="margin:20px">
            <div id="groupMembers" class="card border-primary mb-3" style="width: 25rem">
                <div class="card-header">GROUP MEMBERS</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">1. Saad Khan - 101157307</li>
                    <li class="list-group-item">2. Veronyque Lemieux - 101106553</li>
                    <li class="list-group-item">3. Ian Miranda - 101163981</li>
                    <li class="list-group-item">4. Jeremy Thibeau - 101157911</li>
                </ul>
            </div>
            <hr />
            <h6 class="font-weight-light">@2019 COMP2139 TechKnow Pro</h6>
        </div>
    </form>
</body>
</html>
