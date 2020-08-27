<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="AdminSite.Client" %>
<asp:Content ID="ContentHeadClient" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hiddencol
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBodyClient" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div class="table-responsive">
                    <asp:GridView ID="GridViewClient" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-hover" DataKeyNames="IDClient" DataSourceID="SqlDataSourceClient" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="IDClient" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="IDClient" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" >
<HeaderStyle CssClass="hiddencol"></HeaderStyle>

<ItemStyle CssClass="hiddencol"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
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
                    <asp:SqlDataSource ID="SqlDataSourceClient" runat="server" ConnectionString="<%$ ConnectionStrings:PRA20-Kevin-FurjanConnectionString %>" SelectCommand="selectClients" SelectCommandType="StoredProcedure" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Client] WHERE [IDClient] = @original_IDClient AND [Name] = @original_Name AND [Email] = @original_Email" InsertCommand="INSERT INTO [Client] ([Name], [Email]) VALUES (@Name, @Email)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Client] SET [Name] = @Name, [Email] = @Email WHERE [IDClient] = @original_IDClient AND [Name] = @original_Name AND [Email] = @original_Email">
                        <DeleteParameters>
                            <asp:Parameter Name="original_IDClient" Type="Int32" />
                            <asp:Parameter Name="original_Name" Type="String" />
                            <asp:Parameter Name="original_Email" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="original_IDClient" Type="Int32" />
                            <asp:Parameter Name="original_Name" Type="String" />
                            <asp:Parameter Name="original_Email" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="row">
            <asp:Button ID="btnClientFormShow" CssClass="btn btn-primary" runat="server" Text="Add new client" OnClick="btnClientFormShow_OnClick" meta:resourcekey="btnClientFormShow" />
        </div>
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <div id="inputFormClient" runat="server" visible="false">
                    <form>
                        <div class="form-group">
                            <asp:Label ID="lblClient" runat="server" Text="Client's name" AssociatedControlID="txtClient" meta:resourcekey="lblClient"></asp:Label>
                            <asp:TextBox
                                ID="txtClient"
                                placeholder="<%$ Resources: Client.aspx, txtClient %>"
                                CssClass="form-control"
                                runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblClientEmail" runat="server" Text="Email" AssociatedControlID="txtClientEmail" meta:resourcekey="lblClientEmail"></asp:Label>
                            <asp:TextBox
                                ID="txtClientEmail"
                                placeholder="<%$ Resources: Client.aspx, txtClientEmail %>"
                                CssClass="form-control"
                                runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regexValidatorClientEmail" runat="server" ErrorMessage="Please enter valid e-mail" meta:resourcekey="regexValidatorClientEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtClientEmail"/>
                        </div>
                        <asp:Button ID="btnClientAdd" CssClass="btn btn-block btn-outline-primary" runat="server" Text="Add client" OnClick="btnClientAdd_OnClick" meta:resourcekey="btnClientAdd" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
