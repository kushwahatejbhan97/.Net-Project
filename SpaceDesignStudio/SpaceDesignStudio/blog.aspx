<%@ Page Title="" Language="C#" MasterPageFile="~/panel.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="SpaceDesignStudio.blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="project-gallery page-block-large" >
   <div class="container" style=" margin-top:80px"> 
	
    
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceblog">
  <ItemTemplate>
  
  
 
 <div class="container" style=" margin-top:30px;">
      <div class="col-md-2 col-sm-6 col-xs-12 content-box wow fadeInLeft" data-wow-duration="0.50s" data-wow-delay="0.75s">
      		<img class="img-responsive "  src='/Admin/img/blog/<%# Eval("id")%>.jpg' alt="About Striking" width="725" height="475" style="height:200px;width:200px" />
      </div>
      <div class="col-md-10 col-sm-6 col-xs-12 content-box wow fadeInRight" data-wow-duration="0.50s" data-wow-delay="0.75s">
      <h2><%# Eval("Header")%></ins>
       <hr/>
          <p class="big" style="text-align:justify;font-size:13px; line-height: 1.75em;font-family:'Roboto Slab', serif;"><%# Eval("Content_text")%></p>
          <hr/>
        
      </div>
	</div>

     </ItemTemplate>
     <AlternatingItemTemplate>
       <div class="container" style=" margin-top:30px;">
      
      <div class="col-md-10 col-sm-6 col-xs-12 content-box wow fadeInRight" data-wow-duration="0.50s" data-wow-delay="0.75s">
      <h2><%# Eval("Header")%></h2>
       <hr/>
          <p class="big" style="text-align:justify;font-size:13px; line-height: 1.75em;font-family:'Roboto Slab', serif;"><%# Eval("Content_text")%></p>
          <hr/>
        
      </div>
      <div class="col-md-2 col-sm-6 col-xs-12 content-box wow fadeInLeft" data-wow-duration="0.50s" data-wow-delay="0.75s">
      		<img class="img-responsive "  src='/Admin/img/blog/<%# Eval("id")%>.jpg' alt="About Striking"  width="725" height="475" style="height:200px;width:200px" />
      </div>
	</div>
     </AlternatingItemTemplate>
  </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSourceblog" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
        SelectCommand="SELECT [id], [Header], [Content_text] FROM [space_design_blog]">

    </asp:SqlDataSource>
      
   </div>
</section>


</asp:Content>
