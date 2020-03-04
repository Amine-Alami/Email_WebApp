<%@ Page Title="" Language="C#" MasterPageFile="~/Model.Master" AutoEventWireup="true" CodeBehind="Carousel.aspx.cs" Inherits="Email_WebApp.Carousel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Caroussel/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Caroussel/css/Customizable-Carousel-swipe-enabled.css">
    <link rel="stylesheet" href="Caroussel/css/styles.css">

    <style>
        .margin{
            margin : 3%;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="margin">
        <div id="Div_Promo_Carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active"><img class="d-block w-100" alt="Slide Image" src="Images/carousel_image_1.png"></div>
                <div class="carousel-item"><img class="d-block w-100" alt="Slide Image" src="Images/carousel_image_2.jpg"></div>
                <div class="carousel-item"><img class="d-block w-100" alt="Slide Image" src="Images/carousel_image_3.jpg"></div>
            </div>
            <div><a class="carousel-control-prev" role="button" data-slide="prev" href="#Div_Promo_Carousel"> <span class="carousel-control-prev-icon" aria-hidden="true"> </span><span class="sr-only">Prev </span></a><a class="carousel-control-next" role="button"
                    data-slide="next" href="#Div_Promo_Carousel"> <span class="carousel-control-next-icon" aria-hidden="true"> </span><span class="sr-only">Next </span></a></div>
            <ul class="carousel-indicators" role="">
                <li class="active" data-slide-to="0" data-target="#Div_Promo_Carousel">Item 1</li>
                <li data-slide-to="1" data-target="#Div_Promo_Carousel">Item 1</li>
                <li data-slide-to="2" data-target="#Div_Promo_Carousel">Item 1</li>
            </ul>
        </div>
    </div>
    <script src="Caroussel/js/jquery.min.js"></script>
    <script src="Caroussel/bootstrap/js/bootstrap.min.js"></script>
    <script src="Caroussel/js/Customizable-Carousel-swipe-enabled.js"></script>
</asp:Content>
