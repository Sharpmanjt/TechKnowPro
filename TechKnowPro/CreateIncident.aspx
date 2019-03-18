<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateIncident.aspx.cs" Inherits="TechKnowPro.CreateIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Incident</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 165px;
            height: 32px;
        }
        .auto-style3 {
            height: 32px;
        }
        .auto-style4 {
            width: 919px;
        }
        .auto-style5 {
            width: 902px;
        }
        .auto-style6 {
            width: 153px;
        }
        .auto-style7 {
            margin-left: 292;
        }
    </style>
     <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" >
        <div class="container-fluid centered" style="margin: 0 auto">
        <table class="auto-style1">

            <tr>

                <td class="auto-style4"><h1 class="font-weight-bold">TechKnow Pro Incident Management Software</h1></td>

                <td>

                    <asp:Button ID="btnLogout" class="btn btn-outline-primary" style="margin:5px" runat="server" Text="Logout" OnClick="btnLogout_Click" CausesValidation="False" />

                </td>

            </tr>

        </table>

        <div>

            <br />

            Incident Report Page</div>

        <table class="auto-style1">

            <tr>

                <td>Select a customer:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Names" DataValueField="Username" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AppendDataBoundItems = "true">
                    <asp:ListItem Selected = "True" Text = "" Value = ""></asp:ListItem>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Username], CONCAT(Last_Name, ', ', First_Name) as Names FROM [User] where NOT User_Type='admin' AND NOT User_Type = 'tech'"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please select a customer." ForeColor="Red"></asp:RequiredFieldValidator>

                </td>

                <td>Report Date and Time:<asp:Label ID="lblDate" runat="server"></asp:Label>
                </td>

            </tr>

            <tr>

                <td>Customer ID:<asp:TextBox ID="txtCustId" runat="server" Enabled="False"></asp:TextBox>

                </td>

                <td>Incident#: 
                    <asp:Label ID="lblIncidentNum" runat="server"></asp:Label>
                </td>

            </tr>

            <tr>

                <td>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Username" DataSourceID="SqlDataSource1" OnDataBound="FormView1_DataBound">
                        <EditItemTemplate>
                            Username:
                            <asp:Label ID="UsernameLabel1" runat="server" Text='<%# Eval("Username") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Username:
                            <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            Username:
                            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                            <br />

                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Username] FROM [User] WHERE ([Username] = @Username)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Username" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>

                <td>Status: 
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Selected="True" Value="New">NEW</asp:ListItem>
                        <asp:ListItem Value="In Progress">IN PROGRESS</asp:ListItem>
                        <asp:ListItem Value="Closed">CLOSED</asp:ListItem>
                    </asp:DropDownList>
                </td>

            </tr>

            <tr>

                <td>Description of Problem:</td>

                <td>&nbsp;</td>

            </tr>

        </table>

        <asp:TextBox ID="txtDescription" runat="server" Height="149px" MaxLength="300" TextMode="MultiLine" Width="1022px"></asp:TextBox>
        <table class="auto-style1">
            <tr>
                <td>

                    <asp:RequiredFieldValidator ID="descReq" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description required." ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="lblSuccess" runat="server" Text="Incident created." ForeColor="Red"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">Method of Contact:</td>
                <td class="auto-style3">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="Email">Email</asp:ListItem>
                        <asp:ListItem Value="Phone">Phone</asp:ListItem>
                        <asp:ListItem Value="In Person">In Person</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            </table>
        <table>
            <tr>
                <td class="auto-style6">
                    <asp:Button ID="btnSubmit" class="btn btn-primary" style="margin:5px" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
                <td class="auto-style5">
                    
                    <asp:Button ID="btnHome" class="btn btn-outline-primary" style="margin:5px" runat="server" Text="Home" CausesValidation="False" OnClick="btnHome_Click" />

                </td>
            </tr>
        </table>
         <hr />
            <h6 class="font-weight-light">@2019 COMP2139 TechKnow Pro</h6>
            </div>
    </form>
</body>
</html>
