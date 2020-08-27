<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AdminSite.Login" Culture="auto" UICulture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login page</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="loginForm" runat="server">
        <div class="container jumbotron">
            <div class="row justify-content-center">
                <div class="col-sm-8">
                    <asp:Label ID="lblTitle" runat="server" Text="Login" meta:resourcekey="loginTitle" Font-Bold="True" CssClass="form-text text-center" Font-Size="X-Large"></asp:Label>
                    <br />

                    <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                        <asp:Label ID="lblMessage" Text="User does not exist or doesn't have access to this site!" meta:resourcekey="validationText" runat="server" Font-Bold="True" />
                    </div>
                    
                    <asp:Label ID="lblUsername" runat="server" Text="Username" meta:resourcekey="lblUsername"></asp:Label>
                    <asp:TextBox
                        runat="server"
                        ID="txtUsername"
                        CssClass="form-control"
                        placeholder="<%$ Resources: Login.aspx, UsernamePlaceholder %>"
                        required />
                    <asp:RegularExpressionValidator ID="regexValidatorUsername" runat="server" meta:resourcekey="regexValidatorUsername" ErrorMessage="Please enter valid username" ControlToValidate="txtUsername" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <br />

                    <asp:Label ID="lblPassword" runat="server" Text="Password" meta:resourcekey="lblPassword"></asp:Label>
                    <asp:TextBox
                        runat="server"
                        ID="txtPassword"
                        TextMode="Password"
                        CssClass="form-control"
                        placeholder="<%$ Resources: Login.aspx, PasswordPlaceholder %>"
                        required />
                    <br />

                    <asp:Button
                        runat="server"
                        ID="btnLogin"
                        Text="Login"
                        OnClick="ValidateUser"
                        Class="btn btn-block btn-outline-primary"
                        meta:resourcekey="loginButton"/>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>
