<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="AdminSite.Report" %>

<asp:Content ID="ContentHeadReport" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentBodyReport" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <%--Button for showing forms--%>
        <div class="row justify-content-center">
            <div class="col-sm-4">
                <asp:Button ID="btnReportEmployeeForm" runat="server"
                    Text="Report for employees"
                    CssClass="btn btn-block btn-info"
                    meta:resourcekey="btnReportEmployeeForm"
                    OnClick="btnReportEmployeeForm_OnClick" />
            </div>
            <div class="col-sm-4">
                <asp:Button ID="btnReportClientForm" runat="server"
                    Text="Report for clients"
                    CssClass="btn btn-block btn-info"
                    meta:resourcekey="btnReportClientForm"
                    OnClick="btnReportClientForm_OnClick" />
            </div>
        </div>

        <%--Form for employee report--%>
        <div id="divReportEmployee" class="container" visible="false" runat="server">
            <div class="row justify-content-center">
                <div class="col-sm-4">
                    <form>
                        <div class="form-group">
                            <asp:Label ID="lblEmployee" runat="server" Text="Employee" AssociatedControlID="ddlEmployees" meta:resourcekey="lblEmployee" />
                            <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                        </div>
                        <asp:Button ID="btnReportEmployee" Visible="True" CssClass="btn btn-block btn-outline-primary" runat="server" Text="Export" meta:resourcekey="btnReportEmployee" OnClick="btnReportEmployee_Click" />
                    </form>
                </div>
            </div>
        </div>

        <%--Form for client report--%>
        <div id="divReportClient" class="container" visible="false" runat="server">
            <div class="row justify-content-center">
                <div class="col-sm-4">
                    <form>
                        <div class="form-group">
                            <asp:Label ID="lblClient" runat="server" Text="Client" AssociatedControlID="ddlClients" meta:resourcekey="lblClient" />
                            <asp:DropDownList ID="ddlClients" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                        </div>
                        <asp:Button ID="btnReportClient" Visible="True" CssClass="btn btn-block btn-outline-primary" runat="server" Text="Export" meta:resourcekey="btnReportClient" OnClick="btnReportClient_Click" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
