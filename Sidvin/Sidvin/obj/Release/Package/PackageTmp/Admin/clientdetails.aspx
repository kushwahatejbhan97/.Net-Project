<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="clientdetails.aspx.cs" Inherits="Sidvin.Admin.clientdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-content">
                    
        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title mb-12">Client Data</h4>
                                        
                         
                                        <div class="table-responsive">
                                            <table class="table table-centered table-nowrap mb-0">
                                               
                                                <asp:GridView AutoGenerateColumns="false" ID="GridView1" runat="server" class="table table-bordered table-condensed table-responsive" AllowPaging="True" DataKeyNames="ClientId" AllowSorting="True" DataSourceID="SqlDataSource1" >
                                            <Columns>

                                                 <asp:CommandField ShowDeleteButton="True" />
                                               
                                                <asp:BoundField DataField="ClientId" HeaderText="ClientId" SortExpression="ClientId" />
                                               
                                                
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                  <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                                                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                                               
                                            </Columns>
                                        </asp:GridView>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sidvin %>" SelectCommand="SELECT [ClientId], [Name], [Email], [PhoneNumber], [Message], [Subject] FROM [Client] order by ClientId DESC" DeleteCommand="DELETE FROM [Client] WHERE [ClientId] = @ClientId"
                                            ></asp:SqlDataSource>
                                        
                                                
                                               
                                           </table>
                                        </div>
                                         
                                        
                                       
                                        <br />


                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
</asp:Content>
