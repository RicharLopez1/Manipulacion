using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaOnline.Logica;
namespace SistemaOnline
{
    public partial class Catalogo : System.Web.UI.Page
    {
        ConsultaTablaGeneral cls_metodos = new ConsultaTablaGeneral();
        static string Id_categoria;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Id_categoria = Request.QueryString["IdCategoria"];
                CargarCatalogos();
            }
        }

        protected void LVGaleria_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            lvDataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            CargarCatalogos();
        }
        private void CargarCatalogos()
        {
            if (Id_categoria != null)
            {
                LVGaleria.DataSource = cls_metodos.CargarCategoria(Convert.ToInt32(Id_categoria));
                LVGaleria.DataBind();
            }
            else
            {
                int Idcategoria = Convert.ToInt32(Session["Categoria"]);
                decimal PrecioInicial = Convert.ToDecimal(Session["PrecioInicio"]);
                decimal PrecioFinal = Convert.ToDecimal(Session["PrecioFin"]);
                string Descripcion=Convert.ToString(Session["Descripcion"]);
                LVGaleria.DataSource = cls_metodos.CargarCatalogoFiltrado(Idcategoria, PrecioInicial, PrecioFinal,Descripcion);
                LVGaleria.DataBind();
            }
        }
        public string MetodoCortarTexto(object valor)
        {
            string camporecortado = "";
            string campo = valor.ToString();
            /*averiguamos el tamaño*/
            int tamaño = campo.Length;
            if (tamaño > 17)
            {
                camporecortado = campo.Substring(0, 17) + "..";
            }
            else
            {
                camporecortado = campo;
            }
            return camporecortado;
        }


        public string MetodoStock(object valor)
        {
            int cantidadStock = Convert.ToInt32(valor);
            string mensaje="";
            if (cantidadStock == 0)
            {
                mensaje = "<font face='arial' style='color:#FE2E2E'><b>" + "Producto Agotado" + "</b></font>"; 
            }
            else 
            {
                mensaje = "<font face='arial' style='color:#01DF3A'><b>" + "En Stock : " + cantidadStock.ToString() + "</b></font>"; 
            }
            return mensaje;
        }

        protected void LVGaleria_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string codigo = e.CommandArgument.ToString();
            Response.Redirect("DetalleProducto.aspx?IdProducto=" + codigo);
        }

        protected void LVGaleria_DataBound(object sender, EventArgs e)
        {
            foreach (ListViewItem item in LVGaleria.Items)
            {
                HiddenField hf_controles = item.FindControl("hf_controles") as HiddenField;
                LinkButton lnk_detalles = item.FindControl("IDimagen") as LinkButton;
                int cantidad_productos = cls_metodos.cantidad_productos_catalogo(Convert.ToInt32(hf_controles.Value));
                if (cantidad_productos == 0)
                {
                    lnk_detalles.Text = "Agotado!!!";
                    lnk_detalles.Enabled = false;
                }
                else 
                {
                    if (cantidad_productos > 0) 
                    {
                        lnk_detalles.Enabled = true;
                    }
                }
            }
        }
    }
}