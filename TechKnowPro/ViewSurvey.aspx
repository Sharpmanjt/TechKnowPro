<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSurvey.aspx.cs" Inherits="TechKnowPro.ViewSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Survey</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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

         <table class="auto-style1">
                 <tr>  
                     <td>
                        Select a customer
                        <p>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Username" DataValueField="Username" AppendDataBoundItems = "true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Value="choose a customer">-- choose a customer --</asp:ListItem>
                    
                            </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select a user." ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [User] WHERE NOT Username='admin@isp.net' AND NOT Username = 'tech@isp.net'">
                        
                            </asp:SqlDataSource>
                        &nbsp;
                         </p>
                      </td>
                     <td>
                         Customer ID: <asp:TextBox ID="txtCustId" runat="server" Enabled="False" Width="329px"></asp:TextBox>
                         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Username] FROM [User] WHERE ([Username] = @Username)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Username" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                     </td>
                    </tr>
                </table>
        <asp:Panel runat="server" ID="selectCustomerPanel" Visible="false">
                    <asp:Label runat="server" ID="surveyListingLabel">Survey Listing</asp:Label>
                    <br/>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [incident_num] FROM [Surveys] "></asp:SqlDataSource>
                    <asp:ListBox ID="ListBox1" runat="server" Width="546px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" >
                        <asp:ListItem Enabled="False">Select a submitted survey</asp:ListItem>
                    </asp:ListBox>
            <br />
            <br />
                    <asp:Button ID="btnRetrieveSurveyInformation" class="btn btn-outline-primary" runat="server" Text="Retrieve Survey Information" CausesValidation="False" OnClick="retrieveSurveyInformation" /> 
        </asp:Panel>
        <asp:Panel runat="server" ID="surveyInfo" Visible="false">
                    <asp:Table ID="customerRatingTable" runat="server" Height="158px" Width="899px" CssClass="auto-style3">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell>Customer Rating</asp:TableHeaderCell> 
                        </asp:TableHeaderRow>
                        <asp:TableRow>
                            <asp:TableCell> Response Time:
                                            <asp:Label ID="lblResponseTime" runat="server"></asp:Label></asp:TableCell>
                            <asp:TableCell> Technician Efficiency:
                                            <asp:Label ID="lblTechEfficiency" runat="server"></asp:Label></asp:TableCell>
                            <asp:TableCell> Problem Resolution:
                                            <asp:Label ID="lblProblemResolution" runat="server"></asp:Label></asp:TableCell>
                        </asp:TableRow>
                   

                        <asp:TableRow>
                            <asp:TableCell>
                                 Contact to discuss incident:
                                 <asp:Label ID="lblRequestContact" runat="server"></asp:Label>
                            </asp:TableCell>

                            <asp:TableCell>
                                  Preferred contact method:
                                  <asp:Label ID="lblContactMethod" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                Additional Information:<br />
                            <asp:Panel ID="Panel2" runat="server" CssClass="auto-style3" Height="230px" Width="450px" BorderStyle="Solid">
                                <asp:Label ID="lblAdditionalInfo" runat="server"></asp:Label>
                            </asp:Panel>
               
                    <br />
       </asp:Panel>

            <center> <asp:Button ID="btnHome" class="btn btn-outline-primary" runat="server" Text="Home" CausesValidation="False" OnClick="btnHome_Click" /></center>
        <br />
        <br />
     <hr />
            <h6 class="font-weight-light">@2019 COMP2139 TechKnow Pro </h6>
        </div>        
    </form>
</body>
</html>
