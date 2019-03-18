<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmSurvey.aspx.cs" Inherits="TechKnowPro.ConfirmSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <title>Survey Confirmation</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid centered" style="margin: 0 auto">
            <table>
                <tr>
                    <td>
                        <h1><b>TechKnow Pro Incident Management Software</b></h1>
                    </td>
                    <td>
                        <asp:Button ID="btnLogout" class="btn btn-outline-primary" runat="server" Text="Logout" OnClick="btnLogout_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>        
            
                
                    
               
        
                    <br />
                    Survey Complete<br />
                    <br />
                    Thank you for your feedback!<br />
                    <asp:Label ID="lblContact" runat="server" Text="A customer service representatative will contact you within 24 hrs"></asp:Label>
                    <br />
        <asp:Button ID="btnHome" class="btn btn-outline-primary" runat="server" OnClick="btnHome_Click" Text="Home" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnReturn" class="btn btn-outline-primary" runat="server" Text="Return To Survey" OnClick="btnReturn_Click" />
        </div>
        <hr />
            <h6 class="font-weight-light">@2019 COMP2139 TechKnow Pro</h6>
    </form>
</body>
</html>
