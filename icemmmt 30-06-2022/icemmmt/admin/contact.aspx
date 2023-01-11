<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="icemmmt.admin.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="page-content">
        <div class="container-fluid">
            
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0 font-size-18">Contacts</h4>
                             </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                       
                                    <div class="table-responsive">
                                            <table class="table table-centered table-nowrap mb-0">
                                     
                                           </table>
                                        </div>
                                         
                                         
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ContactId" 
                                            DataSourceID="SqlDataSource1" class="table table-responsive table-striped table-box table-bordered"
                                            EmptyDataText="There are no data records to display.">
                                            <Columns>
                                                <asp:BoundField DataField="ContactId" HeaderText="ContactId" ReadOnly="True" 
                                                    SortExpression="ContactId" InsertVisible="False" />
                                               
                                                
                                                <asp:BoundField DataField="Name" HeaderText="Name" 
                                                    SortExpression="Name" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" 
                                                    SortExpression="Email" />
                                                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                                                    SortExpression="PhoneNumber" />
                                                <asp:BoundField DataField="Message" HeaderText="Message" 
                                                    SortExpression="Message" />

                                                     <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                                            
                                            
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:icemmmt %>" 
                                            DeleteCommand="DELETE FROM [ContactTable] WHERE [ContactId] = @ContactId" 
                                            SelectCommand="SELECT [ContactId], [Name], [Email], [PhoneNumber], [Message] FROM [ContactTable]" 
                                            UpdateCommand="UPDATE [ContactTable] SET [Name] = @Name, [Email] = @Email, [PhoneNumber] = @PhoneNumber, [Message] = @Message WHERE [ContactId] = @ContactId" InsertCommand="INSERT INTO [ContactTable] ([Name], [Email], [PhoneNumber], [Message]) VALUES (@Name, @Email, @PhoneNumber, @Message)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ContactId" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Name" Type="String" />
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="PhoneNumber" Type="String" />
                                                <asp:Parameter Name="Message" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Name" Type="String" />
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="PhoneNumber" Type="String" />
                                                <asp:Parameter Name="Message" Type="String" />
                                                <asp:Parameter Name="ContactId" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                         
                                         
                                        <br />


                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
</asp:Content>
