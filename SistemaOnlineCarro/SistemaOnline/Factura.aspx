<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="SistemaOnline.Factura1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content_header" runat="server">
    <link href="css/style_table.css" rel="stylesheet" />
    <style type="text/css">
        table {
            width: 100%;
        }
        #css img {
        float:left;
        }
        #apk {
        margin-top:15px;
        }
        #Bloqueo {
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
        #formularios {
            z-index: 10001;
            position: absolute;
            margin: 150px 140px 0 200px;
            background-color: #FFFFFF;
        }

        #Mensaje {
            z-index: 10001;
            position: absolute;
            margin: 150px 140px 0 200px;
            background-color: #FFFFFF;
        }
            #Mensaje p {
           color:#000;
                 }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentSlider" runat="server">
    <asp:Panel runat="server" ID="pnl_mensajeFinal" Visible="false">
        <div id="bloqueoPagina"></div>
        <div id="Mensaje">
            <table>
                <tr>
                    <td><img src="Iconos/regalo.png" /></td>
                </tr>
                <tr>
                    <td><p>gracias por su preferencia.su pedido se realizo correctamente</p></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" ID="btn_cancelar" Text="Aceptar" OnClick="btn_cancelar_Click" ></asp:Button>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>



    <asp:Panel runat="server" ID="pnl_bloqueo" Visible="false">
        <div id="Bloqueo"></div>
        <div id="formularios">
            <table>
                <tr>
                    <td>Producto</td>
                    <td>
                        <asp:Label runat="server" ID="lbl_producto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td>
                        <asp:Label ID="lblprecio" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Cantidad</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtcantidad"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" ID="btnactualizar" Text="Actualizar" OnClick="btnactualizar_Click" PostBackUrl="~/Factura.aspx" />
                    </td>
                    <td>
                        <asp:Button runat="server" ID="btncerrar" Text="Cancelar" OnClick="btncerrar_Click" /></td>
                </tr>
            </table>
              <br />
           <asp:Label runat="server" ID="lbl_mensaje" Visible="false"></asp:Label>
        </div>
    </asp:Panel>
    <asp:HiddenField runat="server" ID="hf_control" />
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Total</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rep_facturas" runat="server" OnItemCommand="rep_facturas_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Id_factura") %></td>
                        <td><%#NombreFactura(Eval("Id_producto")) %></td>
                        <td><%#Eval("Precio") %></td>
                        <td><%#Eval("Cantidad") %></td>
                        <td><%#Eval("Total") %></td>
                        <td>
                            <asp:LinkButton ID="lnk_editar" CausesValidation="false" runat="server" CommandName="editar" CommandArgument='<%#Eval("Id_factura") %>'>
                                                            <img src="Iconos/basket_edit.png" />
                            </asp:LinkButton></td>
                        <td>
                            <asp:LinkButton ID="lnk_eliminar" CausesValidation="false" PostBackUrl="~/Factura.aspx" runat="server" CommandName="eliminar" CommandArgument='<%#Eval("Id_factura") %>'>
                                                                <img src="Iconos/basket_deny.png" />
                            </asp:LinkButton></td>

                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
    <br />
    <div id="css">
    <img src="Iconos/bags.png" height="50"  width="50"/>
    </div>
    <div id="apk">
        <asp:LinkButton ID="LinkButton1" runat="server" Text="Realizar Compra" CssClass="hola" OnClick="LinkButton1_Click">
        Realizar Compra     
        </asp:LinkButton>
    </div>
</asp:Content>
