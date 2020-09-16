<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="Contactanos.aspx.cs" Inherits="SistemaOnline.Contactanos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content_header" runat="server">
    <style type="text/css">
        #bloqueoPagina {
            background: #000000;
            width: 100%;
            height: 1100px;
            opacity: 0.7;
            margin: 0px;
            position: absolute;
            left: 0px;
            top: 0px;
            right: 0px;
            z-index: 1000;
            margin: 0px;
            padding: 0px; /* display: none;*/
        }

        #Mensaje {
            z-index: 10001;
            position: absolute;
            margin: 150px 140px 0 200px;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentSlider" runat="server">
        <asp:Panel runat="server" ID="pnl_mensajeFinal" Visible="false">
        <div id="bloqueoPagina"></div>
        <div id="Mensaje">
            <table>
                <tr>
                    <td>
                        <img src="Iconos/bullet_accept.png" />
                        </td>
                </tr>
                <tr>
                    <td>
                        <p>Mensaje Enviado Correctamente.</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton runat="server" ID="lnk_productos" Text="Aceptar" CausesValidation="false" OnClick="lnk_productos_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>



    <table>
        <tr>
            <td>Nombre Completo</td>
             <td><asp:TextBox runat="server" ID="txtnombrecompleto" Width="300"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ID="rqv_nombre" ControlToValidate="txtnombrecompleto" Display="Dynamic" ErrorMessage="campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
        </tr>
        <tr>
            <td>Correo</td>
             <td><asp:TextBox runat="server" ID="txtcorreo" Width="300"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" ID="rqv_correo" ControlToValidate="txtcorreo" Display="Dynamic" ErrorMessage="campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
        </tr>
        <tr>
            <td>Sexo</td>
             <td><asp:RadioButtonList runat="server" ID="rbt_sexo" RepeatDirection="Vertical">
                 <asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
                 <asp:ListItem Text="Femenino" Value="0"></asp:ListItem>
             </asp:RadioButtonList>
                 <asp:RequiredFieldValidator runat="server" ID="rqv_sexo" ControlToValidate="rbt_sexo" Display="Dynamic" ErrorMessage="campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
        <tr>
            <td>Mensaje</td>
        </tr>
    </table>
<asp:TextBox runat="server" ID="txtmensaje" TextMode="MultiLine" Width="500" Height="300"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="rqv_mensaje" ControlToValidate="txtmensaje" Display="Dynamic" ErrorMessage="campo obligatorio" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Button runat="server" ID="btnenviar" Text="Enviar" OnClick="btnenviar_Click" />
</asp:Content>
