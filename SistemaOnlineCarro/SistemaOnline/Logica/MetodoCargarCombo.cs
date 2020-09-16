using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace SistemaOnline.Logica
{
    public class MetodoCargarCombo
    {
        CarritoDataContext ctx = new CarritoDataContext();
        public void CargarCategorias(DropDownList combo, Boolean Seleccion, Boolean Show)
        {
            var results = (from q in ctx.Categorias
                           select new { ID = q.Id_categoria, DESCRIPCION = q.Nombre_categoria }).Distinct();

            combo.Items.Clear();

            if (Show) { combo.Items.Add(new ListItem(Seleccion ? "--- TODOS ---" : "--- SELECCIONE ---", "")); }
            combo.DataSource = results;
            combo.DataValueField = "ID";
            combo.DataTextField = "DESCRIPCION";
            combo.DataBind();
        }
    }
}