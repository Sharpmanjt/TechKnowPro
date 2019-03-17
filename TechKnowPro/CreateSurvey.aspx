<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateSurvey.aspx.cs" Inherits="TechKnowPro.CreateSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid centered" style="margin: 0 auto">
         &nbsp;<table class="auto-style1">
            <tr>
                <td>
                    <h1><b>TechKnow Pro Incident Management Software</b></h1>
                </td>
                <td>
                    <asp:Button ID="btnLogout" class="btn btn-outline-primary" runat="server" Text="Logout" OnClick="btnLogout_Click" CausesValidation="False" />
                </td>
            </tr>
        </table>
        <div>
            Surveys - Collect feedback form Customers<asp:SqlDataSource ID="dbIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *, CONCAT('Incident Number: ', Incident_Num, ', Status: ', Status) AS LISTITEM FROM [Incidents] WHERE (([Username] = @Username) AND ([Status] = @Status) AND [Survey_Submitted] = 'false')">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" Type="String" />
                    <asp:QueryStringParameter Name="Status" QueryStringField="Closed" Type="String" DefaultValue="Closed" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dbSurveys" runat="server"></asp:SqlDataSource>
            <br />
            Customer ID:
            <asp:Label ID="lblCustomerID" runat="server"></asp:Label>
         </div>
         <asp:ListBox ID="listIncidents" runat="server" DataSourceID="dbIncidents" DataTextField="LISTITEM" DataValueField="Incident_Num"></asp:ListBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="listIncidents" ErrorMessage="You must select an incident" ForeColor="Red"></asp:RequiredFieldValidator>
         <br />
         <br />
         <h3>Please rate this incident by the following categories:</h3>Response Time:
         <asp:RadioButtonList ID="radListResponse" runat="server" RepeatDirection="Horizontal" Width="815px">
             <asp:ListItem Value="Not Satisfied">Not Satisfied</asp:ListItem>
             <asp:ListItem Value="Somewhat Satisfied">Somewhat Satisfied</asp:ListItem>
             <asp:ListItem>Satisfied</asp:ListItem>
             <asp:ListItem>Completely Satisifed</asp:ListItem>
         </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="radListResponse" ErrorMessage="Please select a response." ForeColor="Red"></asp:RequiredFieldValidator>
         <br />
         Technician Efficiency:
         <asp:RadioButtonList ID="radListTech" runat="server" RepeatDirection="Horizontal" Width="815px">
             <asp:ListItem Value="Not Satisfied">Not Satisfied</asp:ListItem>
             <asp:ListItem Value="Somewhat Satisfied">Somewhat Satisfied</asp:ListItem>
             <asp:ListItem>Satisfied</asp:ListItem>
             <asp:ListItem>Completely Satisifed</asp:ListItem>
         </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="reqTechEff" runat="server" ControlToValidate="radListTech" ErrorMessage="Please select a response. " ForeColor="Red"></asp:RequiredFieldValidator>
         <br />
         Problem Resolution:
         <asp:RadioButtonList ID="radListResolution" runat="server" RepeatDirection="Horizontal" Width="818px">
             <asp:ListItem Value="Not Satisfied">Not Satisfied</asp:ListItem>
             <asp:ListItem Value="Somewhat Satisfied">Somewhat Satisfied</asp:ListItem>
             <asp:ListItem>Satisfied</asp:ListItem>
             <asp:ListItem>Completely Satisifed</asp:ListItem>
         </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="radListResolution" ErrorMessage="Please select a response." ForeColor="Red"></asp:RequiredFieldValidator>
         <br />
         Additional Comments:<br />
         <asp:TextBox ID="txtAddComments" runat="server" Height="82px" Width="415px" TextMode="MultiLine"></asp:TextBox>
         <br />
         <asp:CheckBox ID="chkContact" runat="server" Text="Please contact me to discuss this incident" AutoPostBack="True" OnCheckedChanged="chkContact_CheckedChanged" />
         <asp:RadioButtonList ID="radListContact" runat="server" RepeatDirection="Horizontal" Visible="False">
             <asp:ListItem Value="Email">Contact via Email</asp:ListItem>
             <asp:ListItem Value="phone">Contact via phone</asp:ListItem>
         </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="validatorContact" runat="server" ErrorMessage="Please choose a contact method" ForeColor="Red" Visible="False" ControlToValidate="radListContact"></asp:RequiredFieldValidator>
            <br />
         <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
         
    <hr />
            <h6 class="font-weight-light">@2019 COMP2139 TechKnow Pro</h6>
        </div>

   </form>
</body>
</html>
