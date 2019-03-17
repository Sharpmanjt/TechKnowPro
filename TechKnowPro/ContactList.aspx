<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="TechKnowPro.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact List</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 635px;
        }
        .auto-style4 {
            width: 635px;
            height: 193px;
        }
        .auto-style5 {
            height: 193px;
        }
    </style>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid centered" style="margin: 0 auto">
        <div>
            <table class="auto-style1">
                <tr>
                    <td><h1><b>TechKnow Pro - Incident Management Software</b></h1></td>
                    <td>
                        <asp:Button ID="btnLogout" class="btn btn-outline-primary" runat="server" Text="Logout" OnClick="btnLogout_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </div>
            <br />
            <h2>Contact List - Manage your contact list</h2>
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    Contact List<br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT Username, CONCAT(Last_Name, ', ', First_Name, ': ', Phone_Number, ', ', Username) AS LISTITEM FROM [User] WHERE ([Require_Contact] = @Require_Contact)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="true" Name="Require_Contact" QueryStringField="true" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="LISTITEM" DataValueField="Username" Width="546px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>

                </td>
                <td class="auto-style5">
            <asp:Button ID="btnRemoveContact" class="btn btn-outline-primary" runat="server" Text="Remove Contact" OnClick="removeContact" PostBackUrl="ContactList.aspx" /> <br />
            <asp:Button ID="btnEmptyList" class="btn btn-outline-primary" runat="server" Text="Empty List" CausesValidation="False" OnClick="emptyList" PostBackUrl="ContactList.aspx" /></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListBox1" ErrorMessage="Select a user." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
                    <asp:Button ID="btnSelectAdditionalCustomers" class="btn btn-outline-primary" runat="server" Text="Select Additional Customers" CausesValidation="False" OnClick="selectAdditionalCustomers" /></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <center>
            <br />
            <asp:Button ID="btnHome" class="btn btn-outline-primary" runat="server" Text="Home" CausesValidation="False" OnClick="btnHome_Click" /></center>
        <br />
        <br />
     <hr />
            <h6 class="font-weight-light">@2019 COMP2139 TechKnow Pro</h6>
      </div>
    </form>
</body>
</html>
