<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="Sidvin.Admin.changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
  

   
    <div  class="form-group">
     <div class="row">
  <div class="col-sm-6 col-md-6">

      <label>Enter New Password</label>
      <asp:TextBox ID="txtPass" placeholder="New Password" TextMode="Password" ValidationGroup="abc" class="form-control" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtPass" ValidationGroup="abc" ForeColor="Red" runat="server" ErrorMessage="Enter New Password"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPass" ValidationGroup="abc" ForeColor="Red" ErrorMessage="Password must be 8-10 characters long with at least one numeric,</br>one upper case character and one special character." ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$" />
 </div>

     <div class="col-sm-6 col-md-6">
    <label>Re-Enter New Password</label>
    <asp:TextBox ID="txtPasscnf" placeholder="Re-Enter New Password" ValidationGroup="abc" class="form-control" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPasscnf" ValidationGroup="abc" ForeColor="Red" runat="server" ErrorMessage="Re-Enter Password"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" ControlToCompare="txtPass" ControlToValidate="txtPasscnf" ValidationGroup="abc" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Password Not Matched"></asp:CompareValidator>
    </div>
    </div>
    
    <div>
   <asp:Button ID="Button1" runat="server" ValidationGroup="abc" class="btn btn-primary" Text="Submit" 
            onclick="Button1_Click"></asp:Button> 
    
    </div>
    </div>

     
    
    

 
 </div>
                                </div>
                               
                            </div> 
        
                       



                    </div> 




                    
                </div>
               

                
                
            </div>
</asp:Content>
