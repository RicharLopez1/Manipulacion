using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace SistemaOnline.Logica
{
    public class LimpiarControles
    {
        public void CallLimpiarControl(Control parent)
        {
            foreach (Control c in parent.Controls)
            {
                if ((c.GetType() == typeof(TextBox)))
                    ((TextBox)(c)).Text = string.Empty;
                if ((c.GetType() == typeof(Label)))
                    ((Label)(c)).Text = string.Empty;
                if ((c.GetType() == typeof(DropDownList)))
                    ((DropDownList)(c)).ClearSelection();
                if ((c.GetType() == typeof(RadioButtonList)))
                    ((RadioButtonList)(c)).ClearSelection();
                if ((c.GetType() == typeof(CheckBoxList)))
                    ((CheckBoxList)(c)).ClearSelection();
                if (c.HasControls())
                {
                    CallLimpiarControl(c);
                }
            }
        }
    }
}