<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="AdminSite.Employee" %>

<asp:Content ID="ContentHeadEmployee" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hiddencol
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBodyEmployee" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div id="divAlert" runat="server" visible="false" class="alert alert-danger">
                    <asp:Label ID="lblAlertMessage" Text="User with this email already exists!" runat="server" Font-Bold="True" meta:resourcekey="lblAlertMessage" />
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="GridViewEmployee" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceEmployee" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-hover" ForeColor="Black" GridLines="Horizontal" DataKeyNames="ID,IDEmployeeType,IDTeam" OnSelectedIndexChanged="GridViewEmployee_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" >
<HeaderStyle CssClass="hiddencol"></HeaderStyle>

<ItemStyle CssClass="hiddencol"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="First name" HeaderText="First name" SortExpression="First name" />
                            <asp:BoundField DataField="Last name" HeaderText="Last name" SortExpression="Last name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Employee type" HeaderText="Employee type" SortExpression="Employee type" />
                            <asp:BoundField DataField="IDEmployeeType" HeaderText="IDEmployeeType" SortExpression="IDEmployeeType" InsertVisible="False" ReadOnly="True" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" >
<HeaderStyle CssClass="hiddencol"></HeaderStyle>

<ItemStyle CssClass="hiddencol"></ItemStyle>
                            </asp:BoundField>
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
                    <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:PRA20-Kevin-FurjanConnectionString %>" SelectCommand="selectEmployees" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Employee] WHERE [IDEmployee] = @original_IDEmployee AND [Firstname] = @original_Firstname AND [Lastname] = @original_Lastname AND [Email] = @original_Email AND [EmployeeTypeID] = @original_EmployeeTypeID AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([TeamID] = @original_TeamID) OR ([TeamID] IS NULL AND @original_TeamID IS NULL))" InsertCommand="INSERT INTO [Employee] ([Firstname], [Lastname], [Email], [EmployeeTypeID], [Phone], [TeamID]) VALUES (@Firstname, @Lastname, @Email, @EmployeeTypeID, @Phone, @TeamID)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Employee] SET [Firstname] = @Firstname, [Lastname] = @Lastname, [Email] = @Email, [EmployeeTypeID] = @EmployeeTypeID, [Phone] = @Phone, [TeamID] = @TeamID WHERE [IDEmployee] = @original_IDEmployee AND [Firstname] = @original_Firstname AND [Lastname] = @original_Lastname AND [Email] = @original_Email AND [EmployeeTypeID] = @original_EmployeeTypeID AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([TeamID] = @original_TeamID) OR ([TeamID] IS NULL AND @original_TeamID IS NULL))" SelectCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="original_IDEmployee" Type="Int32" />
                            <asp:Parameter Name="original_Firstname" Type="String" />
                            <asp:Parameter Name="original_Lastname" Type="String" />
                            <asp:Parameter Name="original_Email" Type="String" />
                            <asp:Parameter Name="original_EmployeeTypeID" Type="Int32" />
                            <asp:Parameter Name="original_Phone" Type="String" />
                            <asp:Parameter Name="original_TeamID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Firstname" Type="String" />
                            <asp:Parameter Name="Lastname" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="EmployeeTypeID" Type="Int32" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="TeamID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Firstname" Type="String" />
                            <asp:Parameter Name="Lastname" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="EmployeeTypeID" Type="Int32" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="TeamID" Type="Int32" />
                            <asp:Parameter Name="original_IDEmployee" Type="Int32" />
                            <asp:Parameter Name="original_Firstname" Type="String" />
                            <asp:Parameter Name="original_Lastname" Type="String" />
                            <asp:Parameter Name="original_Email" Type="String" />
                            <asp:Parameter Name="original_EmployeeTypeID" Type="Int32" />
                            <asp:Parameter Name="original_Phone" Type="String" />
                            <asp:Parameter Name="original_TeamID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="row">
                    <asp:Button ID="btnEmployeeFormShow" CssClass="btn btn-primary" runat="server" Text="Add new employee" OnClick="btnEmployeeFormShow_OnClick" meta:resourcekey="btnEmployeeFormShow"/>
                </div>
                <div class="row justify-content-center">
                    <div class="col-sm-8">
                        <div id="inputEmployee" runat="server" visible="true">
                            <form>
                                <div class="form-group">
                                    <asp:Label ID="lblName" runat="server" Text="First name" AssociatedControlID="txtName" meta:resourcekey="lblName"/>
                                    <asp:TextBox
                                        ID="txtName"
                                        CssClass="form-control"
                                        runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblLastname" runat="server" Text="Last name" AssociatedControlID="txtLastname" meta:resourcekey="lblLastname"/>
                                    <asp:TextBox
                                        ID="txtLastname"
                                        CssClass="form-control"
                                        runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail" meta:resourcekey="lblEmail"/>
                                    <asp:TextBox
                                        ID="txtEmail"
                                        CssClass="form-control"
                                        runat="server" TextMode="Email"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="reqexValidatorEmail" runat="server" ErrorMessage="Please enter valid e-mail!" meta:resourcekey="regexValidatorEmail" Font-Bold="True" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword" meta:resourcekey="lblPassword" Visible="True"/>
                                    <asp:TextBox
                                        ID="txtPassword"
                                        CssClass="form-control"
                                        runat="server" TextMode="Password" Visible="True"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone" AssociatedControlID="txtPhone" meta:resourcekey="lblPhone"/>
                                    <asp:TextBox
                                        ID="txtPhone"
                                        CssClass="form-control"
                                        runat="server" TextMode="Phone"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblEmployeeType" runat="server" Text="Employee type" AssociatedControlID="ddlEmpoyeeTypes" meta:resourcekey="lblEmployeeType"/>
                                    <asp:DropDownList ID="ddlEmpoyeeTypes" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblTeam" runat="server" Text="Team" AssociatedControlID="ddlTeams" meta:resourcekey="lblTeam"/>
                                    <asp:DropDownList ID="ddlTeams" runat="server" CssClass="dropdown form-control"></asp:DropDownList>
                                </div>
                                <asp:Button ID="btnEmployeeEdit" Visible="False" CssClass="btn btn-outline-success" runat="server" Text="Edit" OnClick="btnEmployeeEdit_OnClick" meta:resourcekey="btnEmployeeEdit"/>
                                <asp:Button ID="btnEmployeeDelete" Visible="False" CssClass="btn btn-outline-danger" runat="server" Text="Delete" OnClick="btnEmployeeDelete_OnClick" meta:resourcekey="btnEmployeeDelete"/>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <asp:Button ID="btnEmployeeAdd" Visible="true" CssClass="btn btn-block btn-outline-primary" runat="server" Text="Add" OnClick="btnEmployeeAdd_OnClick" meta:resourcekey="btnEmployeeAdd"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
