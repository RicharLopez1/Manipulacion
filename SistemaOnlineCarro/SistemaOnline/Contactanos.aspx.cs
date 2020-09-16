using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaOnline.Logica;
namespace SistemaOnline
{
    public partial class Contactanos : System.Web.UI.Page
    {
        MetodoCorreo cls_correo = new MetodoCorreo();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnenviar_Click(object sender, EventArgs e)
        {
            String Mensaje = "";
            Mensaje += "<div style='font-family:verdana; font-size:13px;line-height:20px;'>";
            Mensaje += "<h4><strong>Datos del Cliente </strong></h4>";
            Mensaje += "<strong>Nombre Trabajador : </strong>" + txtnombrecompleto.Text + "<br/>";
            Mensaje += "<strong>Correo : </strong>" + txtcorreo.Text + "<br/>";
            Mensaje += "<strong>Sexo : </strong>" + rbt_sexo.SelectedItem.ToString() + "<br/>";
            Mensaje += "<strong>Informe: </strong>" +txtmensaje.Text+ "<br/>";
            cls_correo.SendMail(Mensaje);
           pnl_mensajeFinal.Visible = true;
        }

        protected void lnk_productos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}