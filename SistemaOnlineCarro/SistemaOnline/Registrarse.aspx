<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="SistemaOnline.Registrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content_header" runat="server">
    <style type="text/css">
        img {
        float:left;
        }
        h1 {
        margin-top:7px;
        }
        .modelos {
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
        }

        .loading {
            font-family: Arial;
            font-size: 10pt;
            width: 180px;
            height: 120px;
            display: none;
            position: fixed;
            background-color: White;
            z-index: 999;
        }
            .loading img {
            float:left;
            margin-left:50px;
            }
    </style>
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modelos");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 200);
        }
        $('form').live("submit", function () {
            ShowProgress();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentSlider" runat="server">
        <asp:Panel runat="server" ID="pnl_load" Visible="false">
        <div class="loading" align="center">
            Procesando. Por favor, espere.<br />
            <br />
            <img src="load/load.gif" />
        </div>
    </asp:Panel>
<img src="Iconos/user_add.png" /> <h1> Registrar Nueva Cuenta</h1>
   <br /> 
    <table>
        <tr>
            <td>Nombres</td>
            <td><asp:TextBox runat="server" ID="txtnombres" Width="300"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Apellidos</td>
            <td><asp:TextBox runat="server" ID="txtapellidos" Width="300"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Correo</td>
            <td><asp:TextBox runat="server" ID="txtcorreos" Width="300"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Sexo</td>
            <td><asp:RadioButtonList runat="server" ID="rbtsexo" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Text="MASCULINO"></asp:ListItem>
                <asp:ListItem Value="0" Text="FEMENINO"></asp:ListItem>
                </asp:RadioButtonList> </td>
        </tr>
        <tr>
            <td>Usuario</td>
            <td><asp:TextBox runat="server" ID="txtusuario" Width="300"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Contraseña</td>
            <td><asp:TextBox runat="server" ID="txtcontraseña" TextMode="Password" Width="300"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Button runat="server" ID="btnadd" Text="Agregar" OnClick="btnadd_Click" /></td>
            <td><asp:Button runat="server" ID="btncancelar" Text="Cancelar" /></td>
        </tr>
    </table>
</asp:Content>
