<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="Marks.aspx.cs" Inherits="School_Sys_Application.Admin.Marks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
        <div class="container p-md-4 p-sm-4">
            <h1>Add Marks</h1>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="300px" CssClass="table table-bordered" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ExamId" DataSourceID="dsAddMarks">
                <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <Fields>
                    <asp:BoundField DataField="ExamId" HeaderText="ExamId" InsertVisible="False" ReadOnly="True" SortExpression="ExamId" />
                    <asp:TemplateField HeaderText="Class" SortExpression="classId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="className" DataValueField="classId" SelectedValue='<%# Bind ("classId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="className" DataValueField="classId" SelectedValue='<%# Bind ("classId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("classId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject" SortExpression="subjectId">
                        <EditItemTemplate>
                           <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="dsSubject" DataTextField="subjectName" DataValueField="subjectId" SelectedValue='<%# Bind("subjectId") %>' CssClass="form-control">
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
                    <asp:BoundField DataField="rollNo" HeaderText="Roll No" SortExpression="rollNo" />
                    <asp:BoundField DataField="totalMarks" HeaderText="Total Marks" SortExpression="totalMarks" />
                    <asp:BoundField DataField="outOfMarks" HeaderText="Out Of Marks" SortExpression="outOfMarks" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsAddMarks" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" DeleteCommand="DELETE FROM [Exam] WHERE [ExamId] = @ExamId" InsertCommand="INSERT INTO [Exam] ([classId], [subjectId], [rollNo], [totalMarks], [outOfMarks]) VALUES (@classId, @subjectId, @rollNo, @totalMarks, @outOfMarks)" SelectCommand="SELECT * FROM [Exam]" UpdateCommand="UPDATE [Exam] SET [classId] = @classId, [subjectId] = @subjectId, [rollNo] = @rollNo, [totalMarks] = @totalMarks, [outOfMarks] = @outOfMarks WHERE [ExamId] = @ExamId">
                <DeleteParameters>
                    <asp:Parameter Name="ExamId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="classId" Type="Int32" />
                    <asp:Parameter Name="subjectId" Type="Int32" />
                    <asp:Parameter Name="rollNo" Type="String" />
                    <asp:Parameter Name="totalMarks" Type="Int32" />
                    <asp:Parameter Name="outOfMarks" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="classId" Type="Int32" />
                    <asp:Parameter Name="subjectId" Type="Int32" />
                    <asp:Parameter Name="rollNo" Type="String" />
                    <asp:Parameter Name="totalMarks" Type="Int32" />
                    <asp:Parameter Name="outOfMarks" Type="Int32" />
                    <asp:Parameter Name="ExamId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
