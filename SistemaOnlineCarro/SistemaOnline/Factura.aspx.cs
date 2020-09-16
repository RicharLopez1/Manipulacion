using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaOnline.Logica;
namespace SistemaOnline
{
    public partial class Factura1 : System.Web.UI.Page
    {
        ConsultaTablaGeneral cls_tablaGeneral = new ConsultaTablaGeneral();
        Factura data_factura = new Factura();
        Constantes cls_constante = new Constantes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
                cargar_facturas();
             
            }
        }

        private void cargar_facturas() 
        {
            rep_facturas.DataSource = cls_tablaGeneral.cargarFacturas();
            rep_facturas.DataBind();
        }
        public string NombreFactura(object valor) 
        {
            Producto dato = cls_tablaGeneral.obtenerProducto(Convert.ToInt32(valor));
            string NombreProducto = dato.Nombre_producto;
            return NombreProducto;
        }

        protected void rep_facturas_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            hf_control.Value = e.CommandArgument.ToString();
            int Codigo_Producto = cls_tablaGeneral.recuperar_IdProducto(Convert.ToInt32(hf_control.Value));
            if (e.CommandName == "editar") 
            {
                pnl_bloqueo.Visible = true;
                Producto dato_producto = cls_tablaGeneral.obtenerProducto(Codigo_Producto);
                lbl_producto.Text = dato_producto.Nombre_producto;
                lblprecio.Text = dato_producto.Precio.ToString();
               }
            if (e.CommandName == "eliminar") 
            {
                data_factura.Id_factura=Convert.ToInt32(hf_control.Value);
                cls_tablaGeneral.EliminarFactura(data_factura);
                Producto data_producto = new Producto();
                data_producto.Id_producto = Codigo_Producto;
                data_producto.Id_estado = cls_constante.Estado_Liberado;
                cls_tablaGeneral.ActualizarEstado(data_producto);
                Response.Redirect("Factura.aspx");
            }
            cargar_facturas();
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            int Codigo_Producto = cls_tablaGeneral.recuperar_IdProducto(Convert.ToInt32(hf_control.Value));
            //cantidad de productos actuales en el catalogo
            int cantidad_recuperada_catalogo = cls_tablaGeneral.cantidad_productos_catalogo(Codigo_Producto);
            int cantidad_ingresada = Convert.ToInt32(txtcantidad.Text);
            if (cantidad_ingresada > cantidad_recuperada_catalogo)
            {
                lbl_mensaje.Visible = true;
                lbl_mensaje.ForeColor = System.Drawing.Color.Red;
                lbl_mensaje.Text = "Cantidad Supera el stock Actual Ingrese otro gracias.";
                return;
            }
             Producto dato_producto = cls_tablaGeneral.obtenerProducto(Codigo_Producto);
            data_factura.Id_factura = Convert.ToInt32(hf_control.Value);
            data_factura.Id_producto = Codigo_Producto;
            data_factura.Precio = dato_producto.Precio;
            data_factura.Cantidad = Convert.ToInt32(txtcantidad.Text);
            data_factura.Id_usuario = Convert.ToInt32(Session["ID_USUARIO"]);
            data_factura.Id_estado = 1;
            decimal total = Convert.ToDecimal(data_factura.Precio * data_factura.Cantidad);
            data_factura.Total = total;
            cls_tablaGeneral.Mantenimiento_Factura(data_factura, "update");
            pnl_bloqueo.Visible = false;
            cargar_facturas();
            Response.Redirect("Factura.aspx");
        }

        protected void btncerrar_Click(object sender, EventArgs e)
        {
            pnl_bloqueo.Visible = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int cantidad_registros = cls_tablaGeneral.numerodedatosFactura();
            if (cantidad_registros > 0) 
            {
                Factura data_factura = new Factura();
                Producto data_producto = new Producto();
                /*primero recuperamos un listados con todos los Ids de Factura Pendientes*/
                List<string> Id_Facturas = new List<string>();
                List<string> Id_Productos = new List<string>();
                Id_Facturas = cls_tablaGeneral.RecuperarIdFactura(Convert.ToInt32(Session["ID_USUARIO"]));
                Id_Productos = cls_tablaGeneral.RecuperarIdProductos(Convert.ToInt32(Session["ID_USUARIO"]));
                foreach (var elementos in Id_Productos)
                {
                    data_producto.Id_producto = Convert.ToInt32(elementos);
                    data_producto.Id_estado = cls_constante.Estado_Liberado;
                    cls_tablaGeneral.ActualizarEstado(data_producto);
                }
                foreach (var elementos in Id_Facturas)
                {
                    int cantidad_facturas=cls_tablaGeneral.cantidad_productos_factura(Convert.ToInt32(elementos));
                    int id_productos = cls_tablaGeneral.recuperamos_id_productos_factura(Convert.ToInt32(elementos));
                    int cantidad_productos = cls_tablaGeneral.cantidad_productos_catalogo(id_productos);
                    int cantidad_actualizado = cantidad_productos - cantidad_facturas;
                    Producto data_prod = new Producto();
                    data_prod.Id_producto = id_productos;
                    data_prod.cantidad = cantidad_actualizado;
                    cls_tablaGeneral.Actualizar_CantidadCatalogo(data_prod);
                    data_factura.Id_factura = Convert.ToInt32(elementos);
                    cls_tablaGeneral.ActualizarFacturaCompra(data_factura);
                    
                }
                cargar_facturas();
                pnl_mensajeFinal.Visible = true;
            }
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            pnl_mensajeFinal.Visible = false;
            Response.Redirect("Index.aspx");
        }
    }
}