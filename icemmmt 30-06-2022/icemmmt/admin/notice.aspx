<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site1.Master" AutoEventWireup="true" CodeBehind="notice.aspx.cs" Inherits="icemmmt.admin.notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="page-content">
                    <div class="container-fluid">
          
                    
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0 font-size-18">Add Notice</h4>

                                  

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
                                    <label>Headings</label>
                                    <asp:TextBox ID="txtheadings" Placeholder="Title for Content"  CssClass="form-control" runat="server"></asp:TextBox>

                                   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="abc" ControlToValidate="txtheadings" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                    
                                </div>
                                <div class="col-sm-6 col-md-6">
                                    <label>Content</label>
                                    
                                    <asp:TextBox ID="txtcontent" placeholder="Content" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="abc" ControlToValidate="txtcontent" ForeColor="Red" runat="server" ErrorMessage="* Enter Content"></asp:RequiredFieldValidator>
                                </div>
                                
                                </div>
                                </div>
                                
                        
                        <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6 col-md-6">
                                    <label >Date</label>
                                    
                                    <asp:TextBox ID="txtdate" placeholder="Enter date" ValidationGroup="abc" CssClass="form-control"  runat="server"></asp:TextBox>
                                        
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtdate" ValidationGroup="abc" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="*Enter Url"></asp:RequiredFieldValidator>

                                </div>
                                    
                                
                                
                                
                                
                                </div>
                                </div>

                        <div class="form-group">
                            <div class="row">
                            <div class="col-sm-6 col-md-6" style=" text-align:center;">
                                <asp:Button ID="Button1" runat="server" Text="Submit" ValidationGroup="abc" CssClass="btn btn-primary float-lg-right" OnClick="Button1_Click"  class="btn btn-theme03" />
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

                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0 font-size-18">Notices</h4>

                                  

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
                                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="NoticeId" 
                                            DataSourceID="SqlDataSource1" class="table table-responsive table-striped table-box table-bordered"
                                            EmptyDataText="There are no data records to display.">
                                            <Columns>
                                                <asp:BoundField DataField="NoticeId" HeaderText="NoticeId" ReadOnly="True" 
                                                    SortExpression="NoticeId" InsertVisible="False" />
                                               
                                                
                                                <asp:BoundField DataField="Heading" HeaderText="Heading" 
                                                    SortExpression="Heading" />
                                                <asp:BoundField DataField="Content" HeaderText="Content" 
                                                    SortExpression="Content" />
                                                <asp:BoundField DataField="Date" HeaderText="Date" 
                                                    SortExpression="Date" />
                                                <asp:BoundField DataField="URL" HeaderText="URL" 
                                                    SortExpression="URL" />

                                                     <asp:CheckBoxField DataField="Button" HeaderText="Button" SortExpression="Button" />
                                                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                                            
                                            
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:icemmmt %>" 
                                            DeleteCommand="DELETE FROM [NoticeTable] WHERE [NoticeId] = @NoticeId" 
                                            SelectCommand="SELECT [NoticeId], [Heading], [Content], [Date], [URL], [Button] FROM [NoticeTable] WHERE ([Type] = @Type)" 
                                            UpdateCommand="UPDATE [NoticeTable] SET [Heading] = @Heading, [Content] = @Content, [Date] = @Date, [URL] = @URL, [Button] = @Button WHERE [NoticeId] = @NoticeId" InsertCommand="INSERT INTO [NoticeTable] ([Heading], [Content], [Date], [URL], [Button]) VALUES (@Heading, @Content, @Date, @URL, @Button)">
                                            <DeleteParameters>
                                                <asp:Parameter Name="NoticeId" Type="Int32" />
                                            </DeleteParameters>
                                            
                                             <InsertParameters>
                                                 <asp:Parameter Name="Heading" Type="String" />
                                                 <asp:Parameter Name="Content" Type="String" />
                                                 <asp:Parameter Name="Date" Type="String" />
                                                 <asp:Parameter Name="URL" Type="String" />
                                                 <asp:Parameter Name="Button" Type="Boolean" />
                                            </InsertParameters>
                                            
                                             <SelectParameters>
                                                     <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
                                                 </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Heading" Type="String" />
                                                <asp:Parameter Name="Content" Type="String" />
                                                <asp:Parameter Name="Date" Type="String" />
                                                <asp:Parameter Name="URL" Type="String" />
                                                <asp:Parameter Name="Button" Type="Boolean" />
                                                <asp:Parameter Name="NoticeId" Type="Int32" />
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
