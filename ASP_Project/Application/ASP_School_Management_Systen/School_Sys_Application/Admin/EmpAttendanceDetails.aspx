<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="EmpAttendanceDetails.aspx.cs" Inherits="School_Sys_Application.Admin.EmpAttendanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image:url('../Image/school.pg');width:100%; height:720px; background-repeat:no-repeat;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            
            <h3 class="text-center">Teacher Attendance Details</h3>
                       
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">
                   <label for="ddlClass">Teachers</label>
                    <label for="ddlTeacher">Teacher</label>
                    <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="Teacher is required" ControlToValidate="ddlTeacher" Display="Dynamic" ForeColor="Red" InitialValue="Select Teacher" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="ddlSubject">Month</label>
                    <asp:TextBox ID="txtMonth" CssClass="form-control" runat="server" TextMode="Month"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Check Attendance" OnClick="btnCheckAttendance_Click" />
                </div>
            </div>
             <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-8">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table table-bordered table-hover">
                        <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                   </asp:GridView>
                   
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
