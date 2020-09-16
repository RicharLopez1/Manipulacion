using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaOnline.Logica;
namespace SistemaOnline
{
    public partial class Contenedor : System.Web.UI.MasterPage
    {
        ConsultaTablaGeneral cls_general = new ConsultaTablaGeneral();
        MetodoCargarCombo cls_cargar_combo = new MetodoCargarCombo();
        Constantes cls_constante = new Constantes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargar_categoria();
                cls_cargar_combo.CargarCategorias(ddl_categorias, false, true);
            }

            lblcantidad.Text = "0";
            lbl_total.Text = "S/ 0.00 ";
            if (Session["ID_USUARIO"] != null)
            {
                lblcantidad.Text = (cls_general.Cantidad_Articulos(Convert.ToInt32(Session["ID_USUARIO"]))).ToString();
                lbl_total.Text = "S/ " + (cls_general.Precio_total_carrito(Convert.ToInt32(Session["ID_USUARIO"]))).ToString();
                lnk_estado.Text = "CONECTADO";
                lnk_salir.Visible = true;
                pnl_salir.Visible = true;
            }
        }
        /*cargamos la categoria*/
        private void cargar_categoria()
        {
            lbl_categorias.Text = cls_general.Load_categorias();
        }

        protected void lnk_carro_Click(object sender, EventArgs e)
        {
            if (Session["ID_USUARIO"] == null)
            {
                pnl_login.Visible = true;
            }
            else
            {
                Response.Redirect("Factura.aspx");
                pnl_login.Visible = false;
            }
        }

        protected void lnk_registra_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrarse.aspx");
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string codigo, clave;
            codigo = txtusuario.Text;
            clave = txtcontraseña.Text;
            string Id_usuario = cls_general.Verificar_Campos_usuario(codigo, clave);
            if (Id_usuario != "")
            {
                Session["ID_USUARIO"] = Id_usuario;
                pnl_login.Visible = false;
                lblcantidad.Text = (cls_general.Cantidad_Articulos(Convert.ToInt32(Session["ID_USUARIO"]))).ToString();
                lbl_total.Text = "S/ " + (cls_general.Precio_total_carrito(Convert.ToInt32(Session["ID_USUARIO"]))).ToString();
            }
            else
            {
                txtusuario.Text = string.Empty;
                txtcontraseña.Text = string.Empty;
                pnl_login.Visible = false;
            }
            Response.Redirect("Index.aspx");
        }

        protected void btncerrar_Click(object sender, EventArgs e)
        {
            pnl_login.Visible = false;
        }

        protected void lnk_salir_Click(object sender, EventArgs e)
        {
            int cantidad_registros = cls_general.numerodedatosFactura();
            if (cantidad_registros > 0)
            {
                Factura data_factura = new Factura();
                Producto data_producto = new Producto();
                List<string> Id_Facturas = new List<string>();
                List<string> Id_Productos = new List<string>();
                Id_Facturas = cls_general.RecuperarIdFactura(Convert.ToInt32(Session["ID_USUARIO"]));
                Id_Productos = cls_general.RecuperarIdProductos(Convert.ToInt32(Session["ID_USUARIO"]));
                foreach (var elementos in Id_Productos)
                {
                    data_producto.Id_producto = Convert.ToInt32(elementos);
                    data_producto.Id_estado = cls_constante.Estado_Liberado;
                    cls_general.ActualizarEstado(data_producto);
                }
                foreach (var elementos in Id_Facturas)
                {
                    data_factura.Id_factura = Convert.ToInt32(elementos);
                    cls_general.EliminarFactura(data_factura);
                }
            }
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }

        protected void lnk_ayuda_Click(object sender, EventArgs e)
        {
            pnl_ayuda.Visible = true;
            frmvideo.Src = "http://www.youtube.com/embed/" + "vmx6z3xYvtQ";
        }

        protected void btn_cerrado_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            int Categoria = Convert.ToInt32(ddl_categorias.SelectedValue);
            string Descripcion = txtbusqueda.Text;
            decimal PrecioInicial = Convert.ToDecimal(ddl_precioInicio.SelectedValue);
            decimal PrecioFinal = Convert.ToDecimal(ddl_precioFinal.SelectedValue);
            Session["Categoria"] = Categoria;
            Session["PrecioInicio"] = PrecioInicial;
            Session["PrecioFin"] = PrecioFinal;
            Session["Descripcion"] = Descripcion;
            Response.Redirect("Catalogo.aspx");
        }

        protected void lnk_estado_Click(object sender, EventArgs e)
        {
            if (Session["ID_USUARIO"] == null)
            {
                pnl_login.Visible = true;
            }
        }
    }
}