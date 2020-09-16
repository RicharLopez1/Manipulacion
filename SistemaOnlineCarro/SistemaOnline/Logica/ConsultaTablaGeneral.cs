using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaOnline.Logica
{
    public class ConsultaTablaGeneral
    {
        CarritoDataContext ctx = new CarritoDataContext();
        Constantes cls_constante = new Constantes();
        public string Load_categorias()
        {
            string cadena_categoria = "";
            var query = from q in ctx.Categorias
                        select q;
            foreach (var elemento in query)
            {
                cadena_categoria = cadena_categoria + "<li><a href='Catalogo.aspx?IdCategoria=" + elemento.Id_categoria + "'>" + elemento.Nombre_categoria + "</a></li>";
            }
            return cadena_categoria;
        }

        /*cargar Catalogo por la categoria*/

        public IQueryable CargarCategoria(int Id_categoria)
        {
            var query = from c in ctx.Productos
                        where c.Id_categoria == Id_categoria && c.Id_estado==cls_constante.Estado_Liberado
                        select c;
            return query;
        }
        /*recuperar el conteo de Articulos Separados*/
        public int Cantidad_Articulos(int Id_usuario)
        {
            int cantidad = 0;
            var query = (from c in ctx.Facturas
                         where c.Id_estado == 1 && c.Id_usuario == Id_usuario
                         select c).Count();
            cantidad = query;
            return cantidad;
        }


        //recuperar los datos de producto por el id
        public Producto obtenerProducto(int Id_producto)
        {
            Producto data = ctx.Productos.FirstOrDefault(r => r.Id_producto == Id_producto);
            return data;
        }

        /*retornar la ruta de la imagen*/
        public string retornar_imagen(int Id_producto)
        {
            string ruta = "";
            var query = from c in ctx.Productos
                        where c.Id_producto == Id_producto
                        select c;
            foreach (var elementos in query)
            {
                ruta = elementos.Imagen;
            }
            return ruta;
        }
        /*insertar un factura*/
        public void Mantenimiento_Factura(Factura parametro, string accion)
        {
            Factura data = new Factura();
            switch (accion)
            {
                case "add":
                    ctx.Facturas.InsertOnSubmit(data);
                    break;
                case "update":
                    data = ctx.Facturas.FirstOrDefault(r => r.Id_factura == parametro.Id_factura);
                    break;
            }
            data.Id_producto = parametro.Id_producto;
            data.Id_usuario = parametro.Id_usuario;
            data.Precio = parametro.Precio;
            data.Cantidad = parametro.Cantidad;
            data.Total = parametro.Total;
            data.Id_estado = parametro.Id_estado;
            ctx.SubmitChanges();
        }

        /*Eliminar Una Factura*/
        public void EliminarFactura(Factura parametro) 
        {
            Factura data = ctx.Facturas.FirstOrDefault(r => r.Id_factura == parametro.Id_factura);
            ctx.Facturas.DeleteOnSubmit(data);
            ctx.SubmitChanges();
        }
        /*cargar las facturas*/
        public IQueryable cargarFacturas()
        {
            var query = from c in ctx.Facturas
                            where c.Id_estado==cls_constante.Estado_Separado
                        select c;
            return query;
        }

        /*realizamos un conteo de los datos actuales*/
        public int numerodedatosFactura()
        {
            var query = (from c in ctx.Facturas
                        where c.Id_estado == cls_constante.Estado_Separado
                        select c).Count();
            return query;
        }


        /*recuperar el precio segun el producto*/
        public double precio(int Id_producto)
        {
            double precio = 0;
            var query = from a in ctx.Productos
                        where a.Id_producto == Id_producto
                        select a;
            foreach (var elementos in query)
            {
                precio = Convert.ToDouble(elementos.Precio);
            }
            return precio;
        }
        /*mantenimiento de usuario*/
        public int Mantenimiento_registrarse(Registro parametro)
        {
            Registro data = new Registro();
            data.Nombres = parametro.Nombres;
            data.Apellidos = parametro.Apellidos;
            data.Correo = parametro.Correo;
            data.sexo = parametro.sexo;
            ctx.Registros.InsertOnSubmit(data);
            ctx.SubmitChanges();
            return data.Id_registro;
        }
        public void Mantenimiento_usuario(Usuario parametro)
        {
            Usuario data = new Usuario();
            data.codigo = parametro.codigo;
            data.clave = parametro.clave;
            data.Id_registro = parametro.Id_registro;
            ctx.Usuarios.InsertOnSubmit(data);
            ctx.SubmitChanges();
        }
        /*verificar si el usuario ingresado ya existe*/
        public string Verificar_Usuario(string usuario)
        {
            string valores = "";
            var query = from c in ctx.Usuarios
                        where c.codigo == usuario
                        select c;
            foreach (var elementos in query)
            {
                valores = elementos.Id_usuario.ToString();
            }
            return valores;
        }
        /*verificar si el login funciona*/
        public string Verificar_Campos_usuario(string codigo, string clave)
        {
            string Id_usuario = "";
            var query = from c in ctx.Usuarios
                        where c.codigo == codigo && c.clave == clave
                        select c;
            foreach (var elementos in query)
            {
                Id_usuario = elementos.Id_usuario.ToString();
            }
            return Id_usuario;
        }
        /*Suma de Precios*/
        public double Precio_total_carrito(int Id_usuario)
        {
            double total = 0.00;
            var query = (from o in ctx.Facturas
                         where o.Id_usuario == Id_usuario && o.Id_estado == 1
                         select o
                      ).ToList();
            var sum = query.Select(c => c.Total).Sum();
            return total = Convert.ToDouble(sum);
        }
        /**/
        public int recuperar_IdProducto(int Id_Factura) 
        {
            int codigo_Producto = 0;
            var query = from c in ctx.Facturas
                        where c.Id_factura == Id_Factura
                        select c;
            foreach (var elementos in query) 
            {
                codigo_Producto = Convert.ToInt32(elementos.Id_producto);
            }
            return codigo_Producto;
        }
        /*actualizar el estado*/
        public void ActualizarEstado(Producto parametro) 
        {
            Producto data = new Producto();
            data = ctx.Productos.FirstOrDefault(r => r.Id_producto == parametro.Id_producto);
            data.Id_estado = parametro.Id_estado;
            ctx.SubmitChanges();
        }

        public List<string> RecuperarIdFactura(int Id_usuario) 
        {
            List<string> ListadoFacturasLibres = new List<string>();
            var query = from c in ctx.Facturas
                        where c.Id_estado == cls_constante.Estado_Separado && c.Id_usuario == Id_usuario
                        select c;
            foreach (var elementos in query) 
            {
                ListadoFacturasLibres.Add(elementos.Id_factura.ToString());  
          }
            return ListadoFacturasLibres;
        }
        /*actualizamos los productos a estados libre*/
        public List<string> RecuperarIdProductos(int Id_usuario)
        {
            List<string> ListadoProductos = new List<string>();
            var query = from c in ctx.Facturas
                        where c.Id_estado == cls_constante.Estado_Separado && c.Id_usuario == Id_usuario
                        select c;
            foreach (var elementos in query)
            {
                ListadoProductos.Add(elementos.Id_producto.ToString());
            }
            return ListadoProductos;
        }

        /*actualizar facturas cambiando el estado a comprado tecnicamente*/
        public void ActualizarFacturaCompra(Factura parametro) 
        {
            Factura data=ctx.Facturas.FirstOrDefault(r=>r.Id_factura==parametro.Id_factura);
            data.Id_estado = cls_constante.Estado_Comprado;
            ctx.SubmitChanges();
        }

        /*cargar los productos segun los precios indicados*/
        public IQueryable CargarCatalogoFiltrado(int IdCategoria, decimal precioInicio, decimal precioFinal,string valor) 
        {
            var query = from c in ctx.Productos
                        where c.Id_categoria == IdCategoria && c.Precio >= precioInicio && c.Precio <= precioFinal
                        select c;
            if (valor != "") 
            {
                    query = query.Where(x => x.Nombre_producto.Contains(valor));
            }
            return query;
        }
        /*metodo para actualizar la cantidad de productos comprados*/
        //recuperamos la cantidad del producto en la factura
        public int cantidad_productos_factura(int id_factura) 
        {
            int cantidad_encontrada = 0;
            var query = from c in ctx.Facturas
                        where c.Id_estado == cls_constante.Estado_Separado && c.Id_factura == id_factura
                        select c;
            foreach (var elementos in query) 
            {
                cantidad_encontrada = Convert.ToInt32(elementos.Cantidad);
            }
            return cantidad_encontrada;
        }

        public int recuperamos_id_productos_factura(int id_factura)
        {
            int id_productos = 0;
            var query = from c in ctx.Facturas
                        where c.Id_estado == cls_constante.Estado_Separado && c.Id_factura == id_factura
                        select c;
            foreach (var elementos in query)
            {
                id_productos = Convert.ToInt32(elementos.Id_producto);
            }
            return id_productos;
        }
        
        //recuperamos la cantidad de producto que tiene
        public int cantidad_productos_catalogo(int Id_producto) 
        {
            int cantidad_encontrada = 0;
            var query = from c in ctx.Productos
                        where c.Id_producto == Id_producto
                        select c;
            foreach (var elementos in query) 
            {
                cantidad_encontrada = Convert.ToInt32(elementos.cantidad);
            }
            return cantidad_encontrada;
        }

        //actualizamos el catalogo
        public void Actualizar_CantidadCatalogo(Producto parametro) 
        {
            Producto data = ctx.Productos.FirstOrDefault(r => r.Id_producto == parametro.Id_producto);
            data.cantidad = parametro.cantidad;
            ctx.SubmitChanges();
        }
    }
}










