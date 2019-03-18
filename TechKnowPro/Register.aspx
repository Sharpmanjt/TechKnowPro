<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TechKnowPro.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body class="text-center">
    <form id="form1" method="post" runat="server">
        <div class="container-fluid centered" style="margin: 0 auto; text-align:center">
            <h1 style="margin:5px">Register</h1>
            <asp:CustomValidator ID="CustomValidatorMissingFields" runat="server" ErrorMessage="" ForeColor="Red" OnServerValidate="CustomValidatorMissingFields_ServerValidate"></asp:CustomValidator>
            <div class="form-group col-md-4" style="margin:auto">
                <div class="form-row">
                    <div class="col" style="margin:5px">
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name*"></asp:Label>
                        <asp:TextBox ID="txtFirstName" class="form-control" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regExFirstName" runat="server" ErrorMessage="First Name must only contain alphabet characters!" ControlToValidate="txtFirstName" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col" style="margin:5px">
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name*"></asp:Label>
                        <asp:TextBox ID="txtLastName" class="form-control" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regExLastName" runat="server" ErrorMessage="Last Name must only contain alphabet characters!" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" style="margin:5px">
                    <asp:Label ID="lblAddress" runat="server" Text="Address*"></asp:Label>
                    <asp:TextBox ID="txtAddress" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group" style="margin:5px">
                    <asp:Label ID="lblPhoneNum" runat="server" Text="Phone Number*"></asp:Label>
                    <asp:TextBox ID="txtphone" class="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regExPhoneNum" runat="server" ControlToValidate="txtphone" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Please enter valid phone number. (###-###-####)</asp:RegularExpressionValidator>
                </div>
                <div class="form-group" style="margin:5px">
                    <asp:Label ID="lblEmail" runat="server" Text="Email*"></asp:Label>
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regExValEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ErrorMessage="Email address must be valid!" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-row">
                    <div class="col" style="margin:5px">
                        <asp:Label ID="lblPassword" runat="server" Text="Password*"></asp:Label>
                        <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ErrorMessage="Password must be 6-12 characters in length, and must contain at least 1 uppercase letter and 1 special character!" ControlToValidate="txtPassword" ValidationExpression="^(?=.*[A-Z]+.*)(?=.*[^a-zA-Z0-9]+.*).{6,12}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col" style="margin:5px">
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Password Confirmation*"></asp:Label>
                        <asp:TextBox ID="txtConfirmPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="valComparePassword" runat="server" ForeColor="Red" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Password confirmation must match password!"></asp:CompareValidator>
                    </div>
                </div>
            </div>
            <div style="margin:5px">
                <asp:CheckBox ID="cbTerms" runat="server" Text="I agree to the terms of service*" /><br />
            </div>
            <div>
                <asp:Button ID="btnRegister" class="btn btn-outline-primary" style="margin:5px" runat="server" Text="Register" OnClick="btnRegister_Click" />
                <asp:Button ID="btnCancel" class="btn btn-primary" runat="server" style="margin:5px" Text="Cancel" CausesValidation="false" PostBackUrl="~/Login.aspx"/><br />
            </div>
            <div>
                <asp:Label ID="lblSuccessfulRegistration" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
