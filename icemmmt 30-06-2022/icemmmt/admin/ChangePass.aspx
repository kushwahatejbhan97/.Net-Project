<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="icemmmt.admin.ChangePass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="page-content">
                    <div class="container-fluid">
          
                    
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0 font-size-18">Change Password</h4>

                                  

                                </div>
                            </div>
                        </div>
                       

                        <div class="row">
                            
                            <div class="col-xl-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                      <div class="form-group">
                                                      <div class="form-group">
                                <div class="row">
                                <div class="col-sm-6 col-md-6">
                                    <label >Enter New Password</label>
                                    <asp:TextBox ID="txtnewpass" Placeholder="New Password" TextMode="Password"  CssClass="form-control" runat="server"></asp:TextBox>

                                   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="abc" ControlToValidate="txtnewpass" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                    
                                </div>
                                
                                
                                </div>
                                <div class="row">
                                
                                <div class="col-sm-6 col-md-6">
                                    <label >Re-Enter New Password</label>
                                    
                                    <asp:TextBox ID="txtrenewpass" placeholder="Re-Enter New Password" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="abc" ControlToValidate="txtrenewpass" ForeColor="Red" runat="server" ErrorMessage="* Enter Content"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtrenewpass" ControlToCompare="txtnewpass" Operator="Equal" ForeColor="Red"  ErrorMessage="*Password does not match" ></asp:CompareValidator>
                                </div>
                                
                                </div>

                                                          <div class="row">
                                
                                <div class="col-sm-6 col-md-6">
                                   <asp:Button ID="Button1" CssClass="btn btn-primary float-lg-right" runat="server" OnClick="Button1_Click" Text="Submit Now"  />
                                </div>
                                
                                </div>

 


                                </div>
                                
                        
                        

                        

                        
                                                        
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

                        

                    
                   </div>
                </div>
</asp:Content>
