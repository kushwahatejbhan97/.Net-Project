<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="Sidvin.Admin.Blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-content">
					<div class="container-fluid">
		  
					
						<div class="row">
							<div class="col-12">
								<div class="page-title-box d-flex align-items-center justify-content-between">
									<h4 class="mb-0 font-size-18">Add Blog</h4>

								  

								</div>
							</div>
						</div>
					   
						<div class="row" >
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">

							


								<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-lg-3 col-form-label">Content</label>
										<div class="col-lg-9">
											<asp:TextBox ID="txtcontent" ValidationGroup="vlog"  type="text" TextMode="MultiLine" CssClass="form-control" placeholder="Enter Vlog Content" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ValidationGroup="vlog"  ID="RequiredFieldValidator1" ControlToValidate="txtcontent"   runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="*Enter Content"></asp:RequiredFieldValidator>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-lg-3 col-form-label">Content Header</label>
										<div class="col-lg-9">
											<asp:TextBox ID="txtheading" ValidationGroup="vlog"  type="text"  CssClass="form-control" placeholder="Enter Vlog Header" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ValidationGroup="vlog"  ID="RequiredFieldValidator4" ControlToValidate="txtheading"   runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="*Enter Header"></asp:RequiredFieldValidator>
										</div>
									</div>
								</div>

							</div>

							


							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-lg-3 col-form-label"> Image</label>
										<div class="col-lg-9">
										<asp:FileUpload ID="FileUpload1"  class="form-control" runat="server" />
										<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="FileUpload1" ValidationGroup="abc" ForeColor="Red" Display="Dynamic" runat="server" ErrorMessage="Upload Desktop Image"></asp:RequiredFieldValidator>
								
										</div>
									</div>
								</div>

								

							</div>

							<div class="row">
								<div class="col-md-12" style="text-align: center">
									 <asp:Button ID="Button1" ValidationGroup="abc" CssClass="btn btn-primary" 
											runat="server" Text="Submit" OnClick="Button1_Click1"></asp:Button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
						

						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title mb-12"> Blog</h4>
										
						 
										<div class="table-responsive">
											<table class="table table-centered table-nowrap mb-0">
											   
											   
												
										   </table>
										</div>
										 
										 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
											AllowSorting="True" AutoGenerateColumns="False" 
											class="table table-bordered table-responsive table-condensed"
											EmptyDataText="There are no data records to display." DataKeyNames="BlogId" DataSourceID="SqlDataSource1"  >
                                             <Columns>
                                                 <asp:CommandField ShowDeleteButton="True" />
                                                 <asp:BoundField DataField="BlogId" HeaderText="BlogId" InsertVisible="False" ReadOnly="True" SortExpression="BlogId" />
												 <asp:BoundField DataField="Header" HeaderText="Header" SortExpression="Header" />
                                                 <asp:TemplateField HeaderText="Image" SortExpression="Image">
                                       
                                        <ItemTemplate>

										<img id="img1" src='/Admin/blogs/Desktop/<%# Eval("Image") %>' onerror="this.src='/Admin/Blog/Desktop/NoImage.jpg';" style="height: 90px";alt="" />
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                 <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                                                 <asp:BoundField DataField="Content" HeaderText="Content" SortExpression="Content" />
                                                 <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                                 
                                             </Columns>
											
										</asp:GridView>

									   
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sidvin %>" DeleteCommand="DELETE FROM [Blog] WHERE [BlogId] = @BlogId" InsertCommand="INSERT INTO [Blog] ([Image], [Subject], [Content], [Date], [Header]) VALUES (@Image, @Subject, @Content, @Date, @Header)" SelectCommand="SELECT [BlogId], [Image], [Subject], [Content], [Date], [Header] FROM [Blog]" UpdateCommand="UPDATE [Blog] SET [Image] = @Image, [Subject] = @Subject, [Content] = @Content, [Date] = @Date, [Header] = @Header WHERE [BlogId] = @BlogId">
                                            <DeleteParameters>
                                                <asp:Parameter Name="BlogId" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Image" Type="String" />
                                                <asp:Parameter Name="Subject" Type="String" />
                                                <asp:Parameter Name="Content" Type="String" />
                                                <asp:Parameter Name="Date" Type="String" />
                                                <asp:Parameter Name="Header" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Image" Type="String" />
                                                <asp:Parameter Name="Subject" Type="String" />
                                                <asp:Parameter Name="Content" Type="String" />
                                                <asp:Parameter Name="Date" Type="String" />
                                                <asp:Parameter Name="Header" Type="String" />
                                                <asp:Parameter Name="BlogId" Type="Int32" />
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
