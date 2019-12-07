<%@ Page Title="Testimonials | PVKKIT" Language="C#" MasterPageFile="~/Content/Alumni/MasterPage_Alumni.master" AutoEventWireup="true" CodeFile="Testimonials.aspx.cs" Inherits="Insurance" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphkeywords" Runat="Server">
    
 <meta name="description" content="Testimonials of pvkkit">
 <meta name="keywords" content="Testimonials,Testimonials of pvkkit college, students review of pvkk college">
       </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Video Testimonials</h1>
    <div style="width: 800px; height: 400px; overflow-y: scroll; ">
    	<div class="col-md-6">
					<div class="vedio-inner img-responsive">
						
							<iframe  src="https://www.youtube.com/embed/9ncfxabJPh8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>						
				</div>
    <div class="col-md-6">
					<div class="vedio-inner img-responsive">
						
							<iframe  src="https://www.youtube.com/embed/YjLsKvHLRf4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>						
				</div>
 

   <div class="col-md-6">
					<div class="vedio-inner img-responsive">
						
							<iframe  src="https://www.youtube.com/embed/Ut7kxKo5XNw?" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

					</div>						
				</div>
    
    <div class="col-md-6">
					<div class="vedio-inner img-responsive">
						
							<iframe  src="https://www.youtube.com/embed/y4OWl1wE13Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>						
				</div>
     <div class="col-md-6">
					<div class="vedio-inner img-responsive">
						
							<iframe  src="https://www.youtube.com/embed/qrK1vmWz8cM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>						
				</div>
    </div>




</asp:Content>



    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h1>Testimonials</h1>
    <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Skin="Bootstrap" CellSpacing="-1" 
        GridLines="Both" AllowPaging="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <MasterTableView DataSourceID="SqlDataSource1">
            <Columns>
                   <telerik:GridBoundColumn DataField="ClgCode" 
                    FilterControlAltText="Filter ClgCode column" HeaderText="College" 
                    SortExpression="ClgCode" UniqueName="ClgCode">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fullname" 
                    FilterControlAltText="Filter Fullname column" HeaderText="Name" 
                    SortExpression="Fullname" UniqueName="Fullname">
                </telerik:GridBoundColumn>
              
              
                <telerik:GridBoundColumn DataField="GradYear" 
                    FilterControlAltText="Filter GradYear column" HeaderText="Graduation Year" 
                    SortExpression="GradYear" UniqueName="GradYear" DataType="System.Int32">
                </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="BName" 
                    FilterControlAltText="Filter BName column" HeaderText="Branch" 
                    SortExpression="BName" UniqueName="BName">
                </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="Comments" 
                    FilterControlAltText="Filter Comments column" HeaderText="Comments" 
                    SortExpression="Comments" UniqueName="Comments">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>" 
        
        
        SelectCommand="SELECT Alumni.Fullname, Alumni.Comments, Alumni.GradYear, Branches.BName, College.ClgCode FROM Alumni INNER JOIN Branches ON Alumni.BranchID = Branches.Bid INNER JOIN College ON Alumni.ClgID = College.ClgID WHERE (Alumni.ShowAsTestimonial = @ShowAsTestimonial) order by newid()">
        <SelectParameters>
            <asp:Parameter DefaultValue="YES" Name="ShowAsTestimonial" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

