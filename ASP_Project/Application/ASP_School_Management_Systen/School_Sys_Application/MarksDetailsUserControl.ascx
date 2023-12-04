<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarksDetailsUserControl.ascx.cs" Inherits="School_Sys_Application.MarksDetailsUserControl" %>

<div style="background-image:url('../Image/school.pg');width:100%; height:720px; background-repeat:no-repeat;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            
            <h3 class="text-center">Marks Details</h3>
                       
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">
                   <label for="ddlClass">Class</label>                    
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="Teacher is required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Teacher" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtRoll">Roll</label>
                    <asp:TextBox ID="txtRoll" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btngetMark" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Check Attendance" OnClick="btngetMark_Click"/>
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