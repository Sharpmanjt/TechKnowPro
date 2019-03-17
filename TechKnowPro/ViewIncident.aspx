<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewIncident.aspx.cs" Inherits="TechKnowPro.ViewIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Incident</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 635px;
        }
        .auto-style3 {
            margin-top: 0px;
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
        <p>
            View Incident</p>
        <table class="auto-style1">
            <tr>
                <td>Select a customer:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Username" DataValueField="Username" AppendDataBoundItems = "true">
                    
                    </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select a user." ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [User] WHERE NOT User_Type='admin' AND NOT User_Type = 'tech'">
                        
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <p>
            Incident List<br />
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource2" DataTextField="LISTITEM" DataValueField="Incident_Num" Width="546px"></asp:ListBox>
        <p>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox1" ErrorMessage="Please select an incident."></asp:RequiredFieldValidator>

        </p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Incident_Num, CONCAT('Incident Number: ', Incident_Num, ', Status: ', Status) AS LISTITEM FROM Incidents WHERE (Username = @Username)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Username" PropertyName="SelectedValue" Type="String" DefaultValue=""/>
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:Button ID="btnRetrieve" class="btn btn-primary" runat="server" Text="Retrieve" OnClick="btnRetrieve_Click" />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Details</td>
                <td>Description</td>
            </tr>
            <tr>
                <td class="auto-style2">
        <asp:Panel ID="Panel1" runat="server" Height="230px" Width="482px" BorderStyle="Solid">
            <br />
            Customer ID:
            <asp:Label ID="lblCustID" runat="server"></asp:Label>
            <br />
            <br />
            Report Date &amp; Time:
            <asp:Label ID="lblDate" runat="server"></asp:Label>
            <br />
            <br />
            Incident#:
            <asp:Label ID="lblIncident" runat="server"></asp:Label>
            <br />
            <br />
            Status:
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="Panel2" runat="server" CssClass="auto-style3" Height="230px" Width="450px" BorderStyle="Solid">
                        <asp:Label ID="lblDesc" runat="server"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnHome" class="btn btn-outline-primary" runat="server" Text="Home" CausesValidation="False" OnClick="btnHome_Click" />
     <hr />
            <h6 class="font-weight-light">@2019 COMP2139 TechKnow Pro</h6>
            </div>
    </form>
</body>
</html>
