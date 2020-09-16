using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaOnline.Logica;
namespace SistemaOnline
{
    public partial class Registrarse : System.Web.UI.Page
    {
        ConsultaTablaGeneral cls_general = new ConsultaTablaGeneral();
        Registro data_registro = new Registro();
        Usuario data_usuario = new Usuario();
        LimpiarControles Limpiar = new LimpiarControles();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
                string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            string usuario = cls_general.Verificar_Usuario(txtusuario.Text);
            if (usuario == "") //no existe la cuenta
            {
                data_registro.Nombres = txtnombres.Text;
                data_registro.Apellidos = txtapellidos.Text;
                data_registro.Correo = txtcorreos.Text;
                data_registro.sexo = Convert.ToChar(rbtsexo.SelectedValue.ToString());
                int CodigoRegistro = cls_general.Mantenimiento_registrarse(data_registro);
                data_usuario.codigo = txtusuario.Text;
                data_usuario.clave = txtcontraseña.Text;
                data_usuario.Id_registro = CodigoRegistro;
                cls_general.Mantenimiento_usuario(data_usuario);
                Limpiar.CallLimpiarControl(this);
                System.Threading.Thread.Sleep(4000);
                Response.Redirect("Index.aspx");
            }
        }
    }
}