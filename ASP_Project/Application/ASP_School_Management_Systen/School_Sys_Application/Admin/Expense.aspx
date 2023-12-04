<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="School_Sys_Application.Admin.Expense" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
        <div class="container p-md-4 p-sm-4">
            <h3>Expense</h3>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="300px" CssClass="table table-bordered" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="expenseId" DataSourceID="dsExpense">
                <Fields>
                    <asp:BoundField DataField="expenseId" HeaderText="expenseId" InsertVisible="False" ReadOnly="True" SortExpression="expenseId" />
                    <asp:TemplateField HeaderText="Class" SortExpression="classId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsAddStudent" DataTextField="className" DataValueField="classId" SelectedValue='<%# Bind("classId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsAddStudent" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                             <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsAddStudent" DataTextField="className" DataValueField="classId" SelectedValue='<%# Bind("classId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsAddStudent" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("classId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject" SortExpression="subjectId">
                        <EditItemTemplate>
                             <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsSubject" DataTextField="subjectName" DataValueField="subjectId" SelectedValue='<%# Bind("subjectId") %>' CssClass="form-control">
                            </asp:DropDownList>
                           <asp:SqlDataSource ID="dsSubject" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                             <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="dsSubject" DataTextField="subjectName" DataValueField="subjectId" SelectedValue='<%# Bind("subjectId") %>' CssClass="form-control">
                            </asp:DropDownList>
                           <asp:SqlDataSource ID="dsSubject" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("subjectId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="chargeAmount" HeaderText="chargeAmount" SortExpression="chargeAmount" />
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsExpense" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" DeleteCommand="DELETE FROM [Expense] WHERE [expenseId] = @expenseId" InsertCommand="INSERT INTO [Expense] ([classId], [subjectId], [chargeAmount]) VALUES (@classId, @subjectId, @chargeAmount)" SelectCommand="SELECT * FROM [Expense]" UpdateCommand="UPDATE [Expense] SET [classId] = @classId, [subjectId] = @subjectId, [chargeAmount] = @chargeAmount WHERE [expenseId] = @expenseId">
                <DeleteParameters>
                    <asp:Parameter Name="expenseId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="classId" Type="Int32" />
                    <asp:Parameter Name="subjectId" Type="Int32" />
                    <asp:Parameter Name="chargeAmount" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="classId" Type="Int32" />
                    <asp:Parameter Name="subjectId" Type="Int32" />
                    <asp:Parameter Name="chargeAmount" Type="Int32" />
                    <asp:Parameter Name="expenseId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <h3>Expense Information</h3>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table table-hover" AllowPaging="True" CellPadding="4" PageSize="5" DataSourceID="dsExpense" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
