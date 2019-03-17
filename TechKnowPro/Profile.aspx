<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TechKnowPro.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            width: 416px;
        }
        .auto-style5 {
            height: 26px;
            width: 418px;
        }
        .auto-style7 {
            height: 23px;
        }
        .auto-style8 {
            width: 418px;
        }
    </style>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <div class="container-fluid centered" style="margin: 0 auto">
        <table class="auto-style1">
            <tr>
                <td>
                    <h1><b>TechKnow Pro Incident Management Software</b></h1>
                </td>
                <td>
                    <asp:Button ID="btnLogout"  class="btn btn-outline-primary" style="margin:5px" runat="server" Text="Logout" OnClick="btnLogout_Click" UseSubmitBehavior="False" />
                </td>
            </tr>
        </table>
        <div>
            <br/>
            <h3>Account Profile<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Secret_Question] FROM [User]">
                </asp:SqlDataSource>
            </h3>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" class="auto-style7"><h4>User Information</h4></td>
                </tr>
                <tr>
                    <td class="auto-style8">*Username:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" Width="353px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Email address must be valid!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblNewPass" runat="server" Text="New Password: " Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" Visible="False" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="validateRegexPass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="Password must be 6-12 characters in length, and must contain at least 1 uppercase letter and 1 special character!" ValidationExpression="^(?=.*[A-Z]+.*)(?=.*[^a-zA-Z0-9]+.*).{6,12}$" ForeColor="Red" Visible="False"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblConfirmPass" runat="server" Enabled="False" Text="Confirm Password:" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
                        <asp:CompareValidator ID="validateConfirm" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" ErrorMessage="Passwords must match!" ForeColor="Red" Visible="False"></asp:CompareValidator>
                    </td>
                </tr>
            </table>            
        </div>
        <br />
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2"><h4>Contact Information</h4></td>
                </tr>
                <tr>
                    <td class="auto-style3">*First Name:</td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="First name must contain only alphabet characters!" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">*Last Name:</td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server" style="height: 22px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regExLastName" runat="server" ErrorMessage="Last Name must only contain alphabet characters!" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">*Secret Question</td>
                    <td>
                        <asp:DropDownList ID="drpSecretQuestion" runat="server" Width="453px" OnSelectedIndexChanged="drpSecretQuestion_SelectedIndexChanged">
                            <asp:ListItem Value="What is your favourite colour?">What is your favourite colour?</asp:ListItem>
                            <asp:ListItem Value="What was the name of your first pet?">What was the name of your first pet?</asp:ListItem>
                            <asp:ListItem Value="What is your dream job?">What is your dream job?</asp:ListItem>
                            <asp:ListItem Value="Who was your childhood best friend?">Who was your childhood best friend?</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">*Secret Answer</td>
                    <td>
                        <asp:TextBox ID="txtSecretAnswer" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">*Address:</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">*Phone Number:</td>
                    <td>
                        <asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regExPhoneNum" runat="server" ControlToValidate="txtPhoneNum" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Please enter valid phone number. (###-###-####)</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br /><asp:Button ID="btnPassChange" class="btn btn-primary" runat="server" CausesValidation="False" OnClick="btnPassChange_Click" Text="Change Password" UseSubmitBehavior="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnClear" class="btn btn-outline-primary" runat="server" OnClick="btnClear_Click" Text="Clear" UseSubmitBehavior="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnUpdate" class="btn btn-primary" runat="server" Text="Update Profile" OnClick="btnUpdate_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnHome" class="btn btn-outline-primary" runat="server" Text="Home" CausesValidation="False" OnClick="btnHome_Click" Height="35px" UseSubmitBehavior="False" />
                        <br />
                        <asp:Label ID="lblUpdate" runat="server" ForeColor="Red"></asp:Label>
                        <asp:CustomValidator ID="CustomValidatorMissingFields" runat="server" ForeColor="Red" OnServerValidate="CustomValidatorMissingFields_ServerValidate"></asp:CustomValidator>
                        
                   </td>
                </tr>
            </table>
        </div>
      </div>
    </form>
    
</body>
</html>
