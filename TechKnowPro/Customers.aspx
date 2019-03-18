<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="TechKnowPro.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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
                        <asp:Button ID="btnLogout" class="btn btn-outline-primary" runat="server" CausesValidation="False" Text="Logout" OnClick="btnLogout_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <p>
            Customer - Search and view your customer contact information</p>
        <p>
            Select a customer:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Names" DataValueField="Username" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Username, CONCAT(Last_Name, ', ', First_Name) as Names FROM [User] where NOT User_Type='admin' AND NOT User_Type = 'tech' order by Names"></asp:SqlDataSource>
        </p>
        <p>
            Address:
            <asp:Label ID="lblAddress" runat="server"></asp:Label>
        </p>
        <p>
            Phone:
            <asp:Label ID="lblPhone" runat="server"></asp:Label>
        </p>
        <p>
            Email: <asp:Label ID="lblEmail" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnAddContact" class="btn btn-outline-primary" runat="server" Text="Add To Contact List" OnClick="btnAddContact_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnGoContact" class="btn btn-primary" runat="server" Text="Display Contact List"  PostBackUrl="ContactList.aspx" />
        </p>
            <p>
                <asp:Label ID="lblSuccess" runat="server" Text="User added to contact List." Visible="False"></asp:Label>
        </p>
         <hr />
            <h6 class="font-weight-light">@2019 COMP2139 TechKnow Pro</h6>
            </div>
    </form>
</body>
</html>
