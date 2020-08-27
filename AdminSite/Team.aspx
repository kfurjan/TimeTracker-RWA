<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="AdminSite.Team" %>
<asp:Content ID="ContentHeadTeam" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hiddencol
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBodyTeam" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div class="table-responsive">
                    <asp:GridView ID="GridViewTeam" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-hover" DataSourceID="SqlDataSourceTeam" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridViewTeam_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Team lead" HeaderText="Team lead" ReadOnly="True" SortExpression="Team lead" />
                            <asp:BoundField DataField="IDTeamLead" HeaderText="IDTeamLead" InsertVisible="False" ReadOnly="True" SortExpression="IDTeamLead" Visible="False" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceTeam" runat="server" ConnectionString="<%$ ConnectionStrings:PRA20-Kevin-FurjanConnectionString %>" SelectCommand="selectTeams" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="row">
            <asp:Button ID="btnTeamFormShow" CssClass="btn btn-primary" runat="server" Text="Add new team" OnClick="btnTeamFormShow_Click"  meta:resourcekey="btnTeamFormShow"/>
        </div>
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <div id="inputFormTeam" runat="server" visible="false">
                    <form>
                        <div class="form-group">
                            <asp:Label ID="lblTeam" runat="server" Text="Team name" AssociatedControlID="txtTeam" meta:resourcekey="lblTeam"></asp:Label>
                            <asp:TextBox
                                ID="txtTeam"
                                CssClass="form-control"
                                runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblTeamLead" runat="server" Text="Team lead" AssociatedControlID="ddlTeamLead" meta:resourcekey="lblTeamLead"></asp:Label>
                            <asp:DropDownList ID="ddlTeamLead" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                        </div>
                        <asp:Button ID="btnTeamEdit" Visible="False" CssClass="btn btn-outline-success" runat="server" Text="Edit" OnClick="btnTeamEdit_Click" meta:resourcekey="btnTeamEdit" />
                        <asp:Button ID="btnTeamDelete" Visible="False" CssClass="btn btn-outline-danger" runat="server" Text="Delete" OnClick="btnTeamDelete_Click" meta:resourcekey="btnTeamDelete" />
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <asp:Button ID="btnTeamAdd" Visible="False" CssClass="btn btn-block btn-outline-primary" runat="server" Text="Add" OnClick="btnTeamAdd_Click" meta:resourcekey="btnTeamAdd"/>
            </div>
        </div>
    </div>
</asp:Content>
