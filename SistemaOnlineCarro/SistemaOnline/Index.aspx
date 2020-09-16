<%@ Page Title="" Language="C#" MasterPageFile="~/Contenedor.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SistemaOnline.Index" %>
<asp:Content ContentPlaceHolderID="contentSlider" runat="server">
    <div id="slider" class="box">
        <div id="slider-holder">
          <ul>
            <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/banner-descuentos.png" /></a></li>
           <li><a href="#"><img src="css/images/banner_ropa_supremebeing.png" alt="" width="731" height="265" /></a></li>
            <li><a href="#"><img src="css/images/slide3.png" width="731" alt="" height="265" /></a></li>
          </ul>
        </div>
        <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
      </div>
    <!-- Products -->
      <div class="products">
        <div class="cl">&nbsp;</div>
        <ul>
          <li> <a href="#"><img src="css/images/big1.jpg" alt="" /></a>
            <div class="product-info">
              <h3>CASACA CAPUCHA VIAJERO</h3>
              <div class="product-desc">
                <h4>Descripcion</h4>
                <p>Casaca con capucha<br />
                  Viajes</p>
                <strong class="price">S/150.00</strong> </div>
            </div>
          </li>
          <li> <a href="#"><img src="Imagenes/chompa9.jpg" /></a>
            <div class="product-info">
              <h3>CHOMPA DE LANA</h3>
              <div class="product-desc">
                <h4>Descripcion</h4>
                <p>Cafarena de Lana Importada<br />
                  </p>
                <strong class="price">S/150.00</strong> </div>
            </div>
          </li>
          <li class="last"> <a href="#"><img src="Imagenes/chompa8.jpg" /></a>
            <div class="product-info">
              <h3>CHOMPA CAPUCHA</h3>
              <div class="product-desc">
                <h4>Descripcion</h4>
                <p>Chompa Capucha<br />
                  negro</p>
                <strong class="price">S/100.00</strong> </div>
            </div>
          </li>
        </ul>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
</asp:Content>