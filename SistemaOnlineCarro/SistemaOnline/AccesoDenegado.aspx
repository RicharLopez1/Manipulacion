<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="AccesoDenegado.aspx.cs" Inherits="SistemaOnline.AccesoDenegado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content_header" runat="server">
   <style type="text/css">
        h3 {
      color:#000;
      margin-left:100px;
     font-family:Arial;
     margin-top:30px;     
       }
       img {
       margin-left:50px;
       margin-top:20px;
       }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentSlider" runat="server">
    <h3>PARA INGRESAR AL DETALLE DEBE INICIAR SESSION</h3>
    <br />
    <img src="Iconos/login.png" />
</asp:Content>
