﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="School_Sys_Application.Admin.ClassFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">New Fees</h3>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-lg-5">
                <div class="col-md-6">
                    <label for="ddlClass">Class</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required" ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="select class" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtFeeAmount">Fees(Annual)</label>
                    <asp:TextBox ID="txtFeeAmount" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Class" OnClick="btnAdd_Click" />
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table table-bordered"></asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
