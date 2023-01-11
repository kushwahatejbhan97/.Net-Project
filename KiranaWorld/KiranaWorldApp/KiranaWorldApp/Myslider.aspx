<%@ Page Language="C#" AutoEventWireup="true"  Inherits="KiranaWorldApp.Myslider" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/revolution-slider.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

    

    <link href="css/revolution-slider.css" rel="stylesheet" />
    
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('.tp-banner').revolution(
                  {
                      delay: 3000,
                      startwidth: 1170,
                      startheight: 530,
                      hideThumbs: 10,

                      navigationType: "bullet",
                      navigationStyle: "preview1",

                      hideArrowsOnMobile: "on",

                      touchenabled: "on",
                      onHoverStop: "on",
                      spinner: "spinner4"
                  });
        });
</script>

 
</head>
<body >

    <form id="form1" runat="server">

    

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <HeaderTemplate>
                    
                    <div class="main-slider">
                    <div class="swiper-viewport">
                    <div id="slideshow0" class="swiper-container">
                    <div class="swiper-wrapper">
                    
                    </HeaderTemplate>

                            <ItemTemplate>

                                     <div class="swiper-slide text-center">
                            
                            <img src="/Admin/Slider/Mobile/<%# Eval("MblImg") %>" alt="<%# Eval("name") %>" class="img-responsive" />
                            
                            </div>

                            </ItemTemplate>


                            <FooterTemplate>
                            </div>
                            </div>


               
                             <div class="swiper-pager mainbanner">
                    <div class="swiper-button-next">
                    </div>
                    <div class="swiper-button-prev">
                    </div>
                </div>
                            </div>

                            </div>
                            
                            </FooterTemplate>
                            </asp:Repeater>
                       
                      
                            
                        
                    

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                    DeleteCommand="DELETE FROM [Slider] WHERE [id] = @id" InsertCommand="INSERT INTO [Slider] ([name], [MblImg], [show]) VALUES (@name, @text1, @text2, @show)"
                    ProviderName="<%$ ConnectionStrings:theOMartMSConnectionString1.ProviderName %>"
                    SelectCommand="SELECT [id], [name], [MblImg], [show] FROM [Slider]" UpdateCommand="UPDATE [Slider] SET [name] = @name, [MblImg] = @MblImg, [show] = @show WHERE [id] = @id">
                </asp:SqlDataSource>




     
                
    </form>
    

     <script src="/js/jquery-2.1.1.min.js" type="text/javascript"></script>
         <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/jscript" src="/catalog/view/javascript/jquery/swiper/js/swiper.jquery.js"></script>
    <link href="/catalog/view/javascript/jquery/swiper/css/swiper.min.css" rel="stylesheet"
        media="screen" />

        <script><!--
            $('#slideshow0').swiper({
                mode: 'horizontal',
                slidesPerView: 1,

                paginationClickable: true,
                nextButton: '.swiper-button-next',
                prevButton: '.swiper-button-prev',
                spaceBetween: 0,
                autoplay: 2000,
                autoplayDisableOnInteraction: true,
                loop: true
            });
--></script>


    
</body>
</html>
