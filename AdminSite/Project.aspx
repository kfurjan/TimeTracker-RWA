<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="AdminSite.Project" %>
<asp:Content ID="ContentHeadProject" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hiddencol
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBodyProject" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div class="table-responsive">
                    <asp:GridView ID="GridViewProject" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-hover" DataSourceID="SqlDataSourceProject" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridViewProject_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                            <asp:BoundField DataField="IDProject" HeaderText="IDProject" InsertVisible="False" ReadOnly="True" SortExpression="ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" >
<HeaderStyle CssClass="hiddencol"></HeaderStyle>

<ItemStyle CssClass="hiddencol"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Project name" HeaderText="Project name" SortExpression="Project name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="Client name" HeaderText="Client name" SortExpression="Client name" />
                            <asp:BoundField DataField="Team name" HeaderText="Team name" SortExpression="Team name" />
                            <asp:BoundField DataField="IDTeam" HeaderText="IDTeam" InsertVisible="False" ReadOnly="True" SortExpression="IDTeam" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" >
<HeaderStyle CssClass="hiddencol"></HeaderStyle>

<ItemStyle CssClass="hiddencol"></ItemStyle>
                            </asp:BoundField>
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
                    <asp:SqlDataSource ID="SqlDataSourceProject" runat="server" ConnectionString="<%$ ConnectionStrings:PRA20-Kevin-FurjanConnectionString %>" SelectCommand="selectProjects" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="row">
            <asp:Button ID="btnProjectFormShow" CssClass="btn btn-primary" runat="server" Text="Add new project" OnClick="btnProjectFormShow_Click" meta:resourcekey="btnProjectFormShow" />
        </div>
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <div id="inputProjectTeam" runat="server" visible="false">
                    <form>
                        <div class="form-group">
                            <asp:Label ID="lblProject" runat="server" Text="Project name" AssociatedControlID="txtProject" meta:resourcekey="lblProject"/>
                            <asp:TextBox
                                ID="txtProject"
                                CssClass="form-control"
                                runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblDescription" runat="server" Text="Description" AssociatedControlID="txtDescription" meta:resourcekey="lblDescription"/>
                            <asp:TextBox
                                ID="txtDescription"
                                CssClass="form-control"
                                runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblClientName" runat="server" Text="Client" AssociatedControlID="ddlClients" meta:resourcekey="lblClientName"/>
                            <asp:DropDownList ID="ddlClients" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblTeam" runat="server" Text="Team" AssociatedControlID="ddlTeams" meta:resourcekey="lblTeam"/>
                            <asp:DropDownList ID="ddlTeams" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                        </div>
                        <asp:Button ID="btnProjectEdit" Visible="False" CssClass="btn btn-outline-success" runat="server" Text="Edit" OnClick="btnProjectEdit_Click" meta:resourcekey="btnProjectEdit"/>
                        <asp:Button ID="btnProjectAddTeam" Visible="False" CssClass="btn btn-outline-secondary" runat="server" Text="Add team to existing project" OnClick="btnProjectAddTeam_Click" meta:resourcekey="btnProjectAddTeam"/>
                        <asp:Button ID="btnProjectDelete" Visible="False" CssClass="btn btn-outline-danger" runat="server" Text="Delete" OnClick="btnProjectDelete_Click" meta:resourcekey="btnProjectDelete"/>
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <asp:Button ID="btnProjectAdd" Visible="False" CssClass="btn btn-block btn-outline-primary" runat="server" Text="Add" OnClick="btnProjectAdd_Click" meta:resourcekey="btnProjectAdd"/>
            </div>
        </div>
    </div>
</asp:Content>
