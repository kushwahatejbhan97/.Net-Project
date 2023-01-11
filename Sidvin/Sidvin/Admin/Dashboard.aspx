<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Sidvin.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-content">
                    <div class="container-fluid">
          
                    
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0 font-size-18">Dashboard</h4>

                                  

                                </div>
                            </div>
                        </div>
                       

                        <div class="row">
                            
                            <div class="col-xl-12">
                                <div class="row">
                                    
                                    
                                    <div class="col-md-3">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium">Users</p>
                                                        <h4 class="mb-0" ID="H2" runat="server" >
                                                            <asp:Label ID="lblUsers" runat="server" Text="0"></asp:Label>
                                                        </h4>
                                                    </div>

                                                    <div class="avatar-sm rounded-circle bg-primary align-self-center mini-stat-icon">
                                                        <span class="avatar-title rounded-circle bg-primary">
                                                            <i class="bx bx-user  font-size-24"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium">Visitors</p>
                                                        <h4 class="mb-0" ID="H1" runat="server" >
                                                            <asp:Label ID="lblVisit" runat="server" Text="0"></asp:Label>
                                                        </h4>
                                                    </div>

                                                    <div class="avatar-sm rounded-circle bg-primary align-self-center mini-stat-icon">
                                                        <span class="avatar-title rounded-circle bg-primary">
                                                            <i class="bx bx-purchase-tag-alt font-size-24"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                <!-- end row -->

                                
                            </div>
                        </div>
                       
                       
                        







                    </div>
                   


        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title mb-12">Client Data</h4>
                                        
                         
                                        <div class="table-responsive">
                                            <table class="table table-centered table-nowrap mb-0" >
                                               
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" class="table table-bordered table-condensed table-responsive" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" >
                                            <Columns>
                                               
                                                <asp:BoundField DataField="ClientId" HeaderText="ClientId" SortExpression="ClientId" />
                                               
                                                
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                 <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                                                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                                            </Columns>
                                        </asp:GridView>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sidvin %>" SelectCommand="SELECT [ClientId], [Name], [Email], [PhoneNumber], [Message], [Subject] FROM [Client] order by ClientId DESC"></asp:SqlDataSource>
                                        
                                                
                                               
                                           </table>
                                        </div>
                                         
                                        
                                       
                                        <br />


                                    </div>
                                </div>
                            </div>
                        </div>
                </div>

</asp:Content>
