<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="AdminSite.Settings" %>

<asp:Content ID="ContentHeadSettings" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentBodySettings" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <div class="form-group">
                    <asp:Label ID="lblLanguage" runat="server" Text="Language" AssociatedControlID="ddlLanguage" meta:resourcekey="lblLanguage" />
                    <asp:DropDownList
                        ID="ddlLanguage"
                        AutoPostBack="True"
                        OnSelectedIndexChanged="ddlLanguage_OnSelectedIndexChanged"
                        meta:resourcekey="ddlLanguageSelection"
                        CssClass="dropdown form-control"
                        runat="server">
                        <asp:ListItem meta:resourcekey="listSelect" Value="0">--- select ---</asp:ListItem>
                        <asp:ListItem meta:resourcekey="listCroatian" Value="hr">Croatian</asp:ListItem>
                        <asp:ListItem meta:resourcekey="listEnglish" Value="en">English</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
