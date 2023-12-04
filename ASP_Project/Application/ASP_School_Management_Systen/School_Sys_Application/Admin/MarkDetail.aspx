<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmst.Master" AutoEventWireup="true" CodeBehind="MarkDetail.aspx.cs" Inherits="School_Sys_Application.Admin.AdminHome" %>
<%@ Register Src="~/MarksDetailsUserControl.ascx" TagPrefix="uc" TagName="MarksDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <uc:MarksDetails runat="server" ID="MarkDetail1"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
