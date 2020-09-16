<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="SistemaOnline.Catalogo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="content_header" runat="server">
    <link href="css/style_table.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="contentSlider" runat="server">
    <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="LVGaleria" PageSize="8">
        <Fields>
            <asp:NumericPagerField ButtonType="Button" />
        </Fields>
    </asp:DataPager>
    <br />
    <asp:ListView runat="server" ID="LVGaleria" OnPagePropertiesChanging="LVGaleria_PagePropertiesChanging" OnItemCommand="LVGaleria_ItemCommand" OnDataBound="LVGaleria_DataBound">
        <ItemTemplate>
            <table align="left">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen") %>' Width="140" Height="140" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ForeColor="#000" ID="Label1" Text='<%#MetodoCortarTexto(Eval("Nombre_producto").ToString()) %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td id="valor">S/.<asp:Label runat="server" ForeColor="#000" ID="Label3" Text='<%# Eval("Precio").ToString() %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblstock" ForeColor="#000" Text='<%#MetodoStock(Eval("cantidad").ToString()) %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="IDimagen" runat="server" CommandName="ImgiD" CommandArgument='<%# Eval("Id_producto") %>'
                            Text="ver detalle"></asp:LinkButton>
                            <asp:HiddenField runat="server" ID="hf_controles"  Value='<%#Eval("Id_producto") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
