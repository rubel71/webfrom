<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="School_Sys_Application.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="col-md-4">
           <h2>Add New</h2>
         <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="teacherId" DataSourceID="dsAddnew" OnItemInserting="DetailsView1_ItemInserting" OnItemUpdating="DetailsView1_ItemUpdating" CssClass="table table-bordered">
             <Fields>
                 <asp:BoundField DataField="teacherId" HeaderText="teacherId" InsertVisible="False" ReadOnly="True" SortExpression="teacherId" />
                 <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                 <asp:TemplateField HeaderText="DOB" SortExpression="DOB">
                     <EditItemTemplate>
                         <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("DOB") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <InsertItemTemplate>
                         <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("DOB") %>'></asp:TextBox>
                     </InsertItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("DOB") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="gender" SortExpression="gender">
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
                 <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
                 <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                 <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                 <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                 <asp:TemplateField HeaderText="photo" SortExpression="photo">
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
                 <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
             </Fields>
           </asp:DetailsView>
           <asp:SqlDataSource ID="dsAddnew" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" DeleteCommand="DELETE FROM [Teacher] WHERE [teacherId] = @teacherId" InsertCommand="INSERT INTO [Teacher] ([name], [DOB], [gender], [mobile], [address], [email], [password], [photo]) VALUES (@name, @DOB, @gender, @mobile, @address, @email, @password, @photo)" SelectCommand="SELECT * FROM [Teacher]" UpdateCommand="UPDATE [Teacher] SET [name] = @name, [DOB] = @DOB, [gender] = @gender, [mobile] = @mobile, [address] = @address, [email] = @email, [password] = @password, [photo] = @photo WHERE [teacherId] = @teacherId">
               <DeleteParameters>
                   <asp:Parameter Name="teacherId" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter DbType="Date" Name="DOB" />
                   <asp:Parameter Name="gender" Type="String" />
                   <asp:Parameter Name="mobile" Type="String" />
                   <asp:Parameter Name="address" Type="String" />
                   <asp:Parameter Name="email" Type="String" />
                   <asp:Parameter Name="password" Type="String" />
                   <asp:Parameter Name="photo" Type="String" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter DbType="Date" Name="DOB" />
                   <asp:Parameter Name="gender" Type="String" />
                   <asp:Parameter Name="mobile" Type="String" />
                   <asp:Parameter Name="address" Type="String" />
                   <asp:Parameter Name="email" Type="String" />
                   <asp:Parameter Name="password" Type="String" />
                   <asp:Parameter Name="photo" Type="String" />
                   <asp:Parameter Name="teacherId" Type="Int32" />
               </UpdateParameters>
           </asp:SqlDataSource>
       </div>
     <div class="row">
       <div class="col-md-6">
           <h2>Teacher List</h2>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="teacherId" DataSourceID="dsAdTeacher" CssClass="table table-bordered table table-hover">
               <Columns>
                   <asp:CommandField ShowDeleteButton="True" />
                   <asp:BoundField DataField="teacherId" HeaderText="teacherId" InsertVisible="False" ReadOnly="True" SortExpression="teacherId" />
                   <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                   <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                   <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                   <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
                   <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                   <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                   <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                   <asp:TemplateField HeaderText="photo" SortExpression="photo">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("photo") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo","~/Image/{0}") %>' Height="40" Width="40"/>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="dsAdTeacher" runat="server" ConnectionString="<%$ ConnectionStrings:schoolcs %>" DeleteCommand="DELETE FROM [Teacher] WHERE [teacherId] = @teacherId" InsertCommand="INSERT INTO [Teacher] ([name], [DOB], [gender], [mobile], [address], [email], [password], [photo]) VALUES (@name, @DOB, @gender, @mobile, @address, @email, @password, @photo)" SelectCommand="SELECT * FROM [Teacher]" UpdateCommand="UPDATE [Teacher] SET [name] = @name, [DOB] = @DOB, [gender] = @gender, [mobile] = @mobile, [address] = @address, [email] = @email, [password] = @password, [photo] = @photo WHERE [teacherId] = @teacherId">
               <DeleteParameters>
                   <asp:Parameter Name="teacherId" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter DbType="Date" Name="DOB" />
                   <asp:Parameter Name="gender" Type="String" />
                   <asp:Parameter Name="mobile" Type="String" />
                   <asp:Parameter Name="address" Type="String" />
                   <asp:Parameter Name="email" Type="String" />
                   <asp:Parameter Name="password" Type="String" />
                   <asp:Parameter Name="photo" Type="String" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter DbType="Date" Name="DOB" />
                   <asp:Parameter Name="gender" Type="String" />
                   <asp:Parameter Name="mobile" Type="String" />
                   <asp:Parameter Name="address" Type="String" />
                   <asp:Parameter Name="email" Type="String" />
                   <asp:Parameter Name="password" Type="String" />
                   <asp:Parameter Name="photo" Type="String" />
                   <asp:Parameter Name="teacherId" Type="Int32" />
               </UpdateParameters>
           </asp:SqlDataSource>
       </div>
     
   </div>
     
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="../Scripts/bootstrap-datepicker.js"></script>
     <script>
        $(document).ready(() => {
            $("input[name$='txtDate']").datepicker({ format: "yyyy-mm-dd" });
           
        });
     </script>
</asp:Content>
