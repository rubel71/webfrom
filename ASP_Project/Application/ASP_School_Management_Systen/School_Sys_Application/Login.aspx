﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="School_Sys_Application.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>School Management System</title>     
    <link href="../Content/bootstrap.css" rel="stylesheet" /> 
    <script src="../Scripts/popper.min.js"></script>
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <style>
        .login,
        .image{
            min-height:100vh;
        }
        .bg-image{
            background-image:url('../Image/school.jpg');
            background-size:cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container-fluid">
           <div class="row no-gutters">
               <%--The image half--%>
               <div class="col-md-6 d-none d-md-flex bg-image"></div>
              <%-- The content half--%>
               <div class="col-md-6 bg-light">
                   <div class="login d-flex align-items-center py-5">
                      <%-- demo content--%>
                       <div class="container">
                           <div class="row">
                               <div class="col-lg-10 col-xl-7 mx-auto">
                                   <h3 class="display-4 pb-3">Sign In</h3>
                                   <p class="text-muted mb-4">Login page for Admin and Teacher</p>
                                   <div class="form-group mb-3">
                                       <input id="inputEmail" placeholder="Email Address" required="" runat="server" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4"/>
                                   </div>
                                   <div class="form-group mb-3 mb-2">
                                       <input id="inputPassword" type="password" placeholder="Password" required="" runat="server" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary"/>
                                   </div>
                                   <asp:Button ID="btnLogin" runat="server" Text="Sign in" CssClass="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm" BackColor="#5558C9" OnClick="btnLogin_Click"/>
                                   <div class="text-center d-flex justify-content-between mt-4">
                                       <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </form>
</body>
</html>
