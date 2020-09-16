using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaOnline.Logica;
namespace SistemaOnline
{
    public partial class DetalleProducto : System.Web.UI.Page
    {
        ConsultaTablaGeneral cls_metodos = new ConsultaTablaGeneral();
        Constantes cls_constante = new Constantes();
        static string Id_producto;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["ID_USUARIO"] == null)
                {
                    Response.Redirect("AccesoDenegado.aspx");
                }
                else
                {
                    Id_producto = Request.QueryString["IdProducto"];
                    CargarCampos();
                    this.txtcantidad.Attributes.Add("OnKeyPress", "return AcceptNum(event)");
                }
            }
        }

        private void CargarCampos()
        {
            Producto data = cls_metodos.obtenerProducto(Convert.ToInt32(Id_producto));
            img_detalle.ImageUrl = data.Imagen;
            lblProducto.Text = data.Nombre_producto;
            lblprecio.Text = data.Precio.ToString();
        }
        protected void btn_añadir_Click(object sender, EventArgs e)
        {   
            int cantidad_recuperada_catalogo = cls_metodos.cantidad_productos_catalogo(Convert.ToInt32(Id_producto));
            int cantidad_ingresada = Convert.ToInt32(txtcantidad.Text);
            if (cantidad_ingresada > cantidad_recuperada_catalogo)
            {
                lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
                lblmensaje.Text = "Cantidad Supera el stock Actual Ingrese otro gracias.";
                return;
            }
            Factura data = new Factura();
            data.Id_producto = Convert.ToInt32(Id_producto);
            data.Precio = Convert.ToDecimal(cls_metodos.precio(Convert.ToInt32(Id_producto)));
            data.Cantidad = Convert.ToInt32(txtcantidad.Text);
            decimal total = Convert.ToDecimal(txtcantidad.Text) * Convert.ToDecimal(cls_metodos.precio(Convert.ToInt32(Id_producto)));
            data.Id_estado = cls_constante.Estado_Separado;
            data.Id_usuario = Convert.ToInt32(Session["ID_USUARIO"]);
            data.Total = total;
            cls_metodos.Mantenimiento_Factura(data, "add");
            Producto data_producto = new Producto();
            data_producto.Id_producto = Convert.ToInt32(Id_producto);
            data_producto.Id_estado = cls_constante.Estado_Separado;
            cls_metodos.ActualizarEstado(data_producto);

            txtcantidad.Text = string.Empty;
            txtcantidad.Enabled = false;
            //Response.Redirect("DetalleProducto.aspx?IdProducto=" + Id_producto);
            pnl_mensajeFinal.Visible = true;
        }
        protected void lnk_productos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}