﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendanceUC.ascx.cs" Inherits="School_Sys_Application.StudentAttendanceUC" %>


   <div style="background-image:url('../Image/school.pg');width:100%; height:720px; background-repeat:no-repeat;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
           
            <h3 class="text-center">Student's Attendance Details</h3>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">
                    <label for="ddlClass">Subject</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                 
                <div class="col-md-6">
                    <label for="ddlSubject">Subject</label>
                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" AutoPostBack="true" ></asp:DropDownList>
                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Class is required" ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                </div>
            
            </div>

             <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">
                    <label for="txtRollNo">Roll Number</label>
                    <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Roll is required" ControlToValidate="txtRollNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                 
                <div class="col-md-6">
                    <label for="txtMonth">Month</label>
                   <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" TextMode="Month"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Month is required" ControlToValidate="txtMonth" Display="Dynamic" ForeColor="Red"  SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            
            </div>
          
             <div class="row mb-3 mr-lg-5 ml-lg-5 mt-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Check Attendance" OnClick="btnCheckAttendance_Click"/>
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