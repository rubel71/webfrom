<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="School_Sys_Application.Admin.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
        
        <div class="container p-md-4 p-sm-4">
            
            <h3 class="text-center">Add Student</h3>
            <asp:DetailsView ID="DetailsView1" CssClass="table table-bordered" runat="server" Height="50px" Width="300px" AutoGenerateRows="False" DataKeyNames="studentId" DataSourceID="dsAddStudent" OnItemInserting="DetailsView1_ItemInserting" AllowPaging="True" OnItemUpdating="DetailsView1_ItemUpdating">
                <Fields>
                    <asp:BoundField DataField="studentId" HeaderText="studentId" InsertVisible="False" ReadOnly="True" SortExpression="studentId" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:TemplateField HeaderText="Date of Birth" SortExpression="DOB">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("DOB") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("DOB") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("DOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                        <EditItemTemplate>
                             <asp:DropDownList ID="ddlGender" runat="server" SelectedValue='<%# Bind("gender") %>' CssClass="form-control">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlGender" runat="server" SelectedValue='<%# Bind("gender") %>' CssClass="form-control">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="mobile" HeaderText="Mobile" SortExpression="mobile" />
                    <asp:BoundField DataField="rollNo" HeaderText="Roll No" SortExpression="rollNo" />
                    <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                    <asp:TemplateField HeaderText="Photo" SortExpression="photo">
                        <EditItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("photo","~/Image/{0}") %>' Height="40" Width="40" />
                            <br />
                            Change : <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Bind("photo") %>' />
                            <asp:FileUpload ID="fuPictureUpdate" runat="server" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="HiddenField1" runat="server" value='<%# Bind("photo") %>' />
                            <asp:FileUpload ID="fuPicture" runat="server" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo","~/Image/{0}") %>' Height="40" Width="40"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class" SortExpression="classId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("classId") %>'></asp:TextBox>
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
                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True" />
                </Fields>
            </asp:DetailsView>
           
            <asp:SqlDataSource ID="dsAddStudent" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" DeleteCommand="DELETE FROM [Student] WHERE [studentId] = @studentId" InsertCommand="INSERT INTO [Student] ([name], [DOB], [gender], [mobile], [rollNo], [address], [photo], [classId]) VALUES (@name, @DOB, @gender, @mobile, @rollNo, @address, @photo, @classId)" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE [Student] SET [name] = @name, [DOB] = @DOB, [gender] = @gender, [mobile] = @mobile, [rollNo] = @rollNo, [address] = @address, [photo] = @photo, [classId] = @classId WHERE [studentId] = @studentId">
                <DeleteParameters>
                    <asp:Parameter Name="studentId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter DbType="Date" Name="DOB" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="mobile" Type="String" />
                    <asp:Parameter Name="rollNo" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="photo" Type="String" />
                    <asp:Parameter Name="classId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter DbType="Date" Name="DOB" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="mobile" Type="String" />
                    <asp:Parameter Name="rollNo" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="photo" Type="String" />
                    <asp:Parameter Name="classId" Type="Int32" />
                    <asp:Parameter Name="studentId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
           
        </div>
     
    </div>
   
    
</asp:Content>
<asp:Content ID="content3" runat="server" ContentPlaceHolderID="foot">
    <script src="../Scripts/bootstrap-datepicker.js"></script>
     <script>
        $(document).ready(() => {
            $("input[name$='txtDate']").datepicker({ format: "yyyy-mm-dd" });
           
        });
     </script>
   
</asp:Content>
