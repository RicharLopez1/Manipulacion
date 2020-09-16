using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace SistemaOnline.Logica
{
    public class MetodoCorreo
    {
        public void SendMail(string mensaje)
        {

            //Configuración del Mensaje
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com", 587);
            //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
            mail.From = new MailAddress("mundonetsise@gmail.com ", "SISTEMA CARRO ONLINE", Encoding.UTF8);
            //Aquí ponemos el asunto del correo
            mail.Subject = "FORMULARIO CONTACTANOS.";
            //Aquí ponemos el mensaje que incluirá el correo
            mail.Body = mensaje;
            //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
            mail.To.Add("chico_pipers@hotmail.com");
            mail.IsBodyHtml = true;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            ////Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran

            //mail.Attachments.Add(new System.Net.Mail.Attachment(fichero));
            //Configuracion del SMTP
            SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
            //Especificamos las credenciales con las que enviaremos el mail
            SmtpServer.Credentials = new System.Net.NetworkCredential("mundonetsise@gmail.com", "Melgarejosise20");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
        }
    }
}