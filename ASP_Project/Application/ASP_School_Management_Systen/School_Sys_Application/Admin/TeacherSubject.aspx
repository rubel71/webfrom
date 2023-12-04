<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="TeacherSubject.aspx.cs" Inherits="School_Sys_Application.Admin.TeacherSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
        <div class="container p-md-4 p-sm-4">
            <h3 class="text-center">Teacher Subject</h3>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="300px" CssClass="table table-bordered" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="dsTeacherSubject">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />

                    <asp:TemplateField HeaderText="Class" SortExpression="classId">
                        <EditItemTemplate>
                           <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="dsAddStudent" DataTextField="className" DataValueField="classId" SelectedValue='<%# Bind("classId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsAddStudent" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                             <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsAddStudent" DataTextField="className" DataValueField="classId" SelectedValue='<%# Bind("classId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsAddStudent" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind ("classId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject" SortExpression="subjectId">
                        <EditItemTemplate>
                             <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsSubject" DataTextField="subjectName" DataValueField="subjectId" SelectedValue='<%# Bind("subjectId") %>' CssClass="form-control">
                            </asp:DropDownList>
                           <asp:SqlDataSource ID="dsSubject" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                           <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsSubject" DataTextField="subjectName" DataValueField="subjectId" SelectedValue='<%# Bind("subjectId") %>' CssClass="form-control">
                            </asp:DropDownList>
                           <asp:SqlDataSource ID="dsSubject" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("subjectId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Teacher Name" SortExpression="teacherId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="dsTeacher" DataTextField="name" DataValueField="teacherId" SelectedValue='<%# Bind("teacherId") %>' CssClass="form-control">
                            </asp:DropDownList>
                           <asp:SqlDataSource ID="dsTeacher" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Teacher]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                           <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="dsTeacher" DataTextField="name" DataValueField="teacherId" SelectedValue='<%# Bind("teacherId") %>' CssClass="form-control">
                            </asp:DropDownList>
                           <asp:SqlDataSource ID="dsTeacher" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" SelectCommand="SELECT * FROM [Teacher]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("teacherId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsTeacherSubject" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" DeleteCommand="DELETE FROM [TeacherSubject] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TeacherSubject] ([classId], [subjectId], [teacherId]) VALUES (@classId, @subjectId, @teacherId)" SelectCommand="SELECT * FROM [TeacherSubject]" UpdateCommand="UPDATE [TeacherSubject] SET [classId] = @classId, [subjectId] = @subjectId, [teacherId] = @teacherId WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="classId" Type="Int32" />
                    <asp:Parameter Name="subjectId" Type="Int32" />
                    <asp:Parameter Name="teacherId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="classId" Type="Int32" />
                    <asp:Parameter Name="subjectId" Type="Int32" />
                    <asp:Parameter Name="teacherId" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
