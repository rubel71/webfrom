<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="StudAttendanceDetails.aspx.cs" Inherits="School_Sys_Application.Admin.StudAttendanceDetails" %>
<%@ Register Src="~/StudentAttendanceUC.ascx" TagPrefix="uc" TagName="studentAttenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc:studentAttenance runat="server" ID="MarkDetail1"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
