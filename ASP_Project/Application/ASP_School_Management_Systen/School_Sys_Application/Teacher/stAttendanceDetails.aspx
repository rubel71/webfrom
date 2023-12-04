<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMst.Master" AutoEventWireup="true" CodeBehind="stAttendanceDetails.aspx.cs" Inherits="School_Sys_Application.Teacher.stAttendanceDetails" %>
<%@ Register Src="~/StudentAttendanceUC.ascx" TagPrefix="uc" TagName="studentAttenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <uc:studentAttenance runat="server" ID="MarkDetail1"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
