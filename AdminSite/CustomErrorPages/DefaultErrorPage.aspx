<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="DefaultErrorPage.aspx.cs" Inherits="AdminSite.CustomErrorPages.DefaultError" %>

<asp:Content ID="headDefaultErrorPage" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="bodyDefaultErrorPage" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row justify-content-center jumbotron">
            <div class="col-sm-8 text-center">
                <h2>Oops! An error has occured!</h2>
            </div>
        </div>
    </div>
</asp:Content>
