<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="SistemaOnline.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content_header" runat="server">
    <style type="text/css">
        td {
            color: #000;
            font-family: Arial;
            font-size: 15px;
        }

            td img {
                float: left;
            }

            td p {
                margin-top: 11px;
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
                float: left;
                margin-left: 50px;
            }

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

            #Mensaje p {
                color: #000;
            }
    </style>
    <link href="css/style_table.css" rel="stylesheet" />
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
                        <p>Producto Añadido Al carrito Correctamente</p>
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

    <asp:Panel runat="server" ID="pnl_load">
        <div class="loading">
            Procesando. Por favor, espere.<br />
            <br />
            <img src="load/load.gif" />
        </div>
    </asp:Panel>
    <br />
    <h1><u>Detalle Del Producto</u></h1>
    <br />
    <br />
    <table>
        <tr>
            <td>
                <asp:Image runat="server" ID="img_detalle" Height="320" Width="320" />
            </td>
        </tr>
        <tr>
            <td>Producto :<asp:Label runat="server" ID="lblProducto"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Precio :
                <asp:Label runat="server" ID="lblprecio"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Cantidad
                <asp:TextBox runat="server" ID="txtcantidad"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="rfv_control" ControlToValidate="txtcantidad" ForeColor="Red" ErrorMessage="campo obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label runat="server" ID="lblmensaje" Visible="false"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="btn_añadir" Text="Añadir al Carrito de Compras" CausesValidation="true" OnClick="btn_añadir_Click" />
            </td>
        </tr>
    </table>

</asp:Content>
