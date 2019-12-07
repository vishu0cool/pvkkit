<%@ Page Title="SBES | PVKKIT" Language="C#" MasterPageFile="~/Content/About/MasterPage_About.master" AutoEventWireup="true" CodeFile="About_Sbes.aspx.cs" Inherits="sbes" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphkeywords" Runat="Server">
    
 <meta name="description" content="About Sri Balaji Educational Society PVKKIT">
 <meta name="keywords" content="courses offered under sbes, sri balaji educational society, balaji education society. courses under society">
       </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="single-post">
						<div class="single-post-thumb">
							<img src="img/Founder.png" alt="Founder" />
							<div class="single-post-thumb-overlay">
								<div class="post-meta">
									<ul>
										<li><a href="#"><i class="fa fa-user"></i>Dr. Palle Raghunatha Reddy, Founder, Correspondent
											& Secretary, Sri Balaji Educational Society</a></li>

									</ul>
								</div>
							</div>

						</div>
						<div style="text-align:center">
							<h2><a href="#">Dr. Palle Raghunatha Reddy <sub> M.Sc., M.Phil., Ph.D</sub></a></h2>
							<div class="event-meta">
								<ul>
									<li><i class="fa fa-user"></i>Founder, Correspondent & Secretary, Sri Balaji Educational
										Society</li>
								</ul>
							</div>
						</div>
						<div class="single-post-text">
							<h2><a href="#"></a></h2>
							 <p >
                                 <strong> Sri Balaji Educational Society </strong>has
                            been established in 1991 by Dr. Palle Raghunatha Reddy Garu, with the motto of providing better education at all
                            levels and creating an opportunity for all deserving students.
                            The society has since then consistently pursued the task of fulfilling its cherished
                            aim of creating talent resource in the field of education and research, thereby adding
                            value to the community, society and the nation at large. Presently the Society is running
                            the following institution which is approved by AICTE, New Delhi, Recognized by Govt. of Andhra
                            Pradesh and affiliated to SKU and JNTUA, Ananthapuramu.
                        </p>
                        <p >
                            Sri Palle Raghunatha Reddy Garu started educational institutions
                            through the “Sri Balaji Educational Society” in varied courses such as Junior college, Degree College and P.G
                            courses like M.B.A and M.C.A to enhance vocationailisation of education he started with professional courses
                            such as pharmacy, T.T.c, B.Ed., and Engineering. In a short span of two years, the Balaji Educational Society
                            has put up good strength and influence providing ample employment opportunities to the educated youth of Anantapur district.
                        </p>
						</div>
			<h2>Colleges established under Society</h2>
              
                <telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" 
                    DataSourceID="SqlDataSource1" GridLines="Both" Skin="Bootstrap"  
                            OnItemDataBound="RadGrid1_ItemDataBound">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                              <telerik:GridTemplateColumn UniqueName="SNO" HeaderText="S.No." AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:Label ID="numberLabel" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Name" 
                                FilterControlAltText="Filter Name column" HeaderText="Name" 
                                SortExpression="Name" UniqueName="Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Type" 
                                FilterControlAltText="Filter Type column" HeaderText="Type" 
                                SortExpression="Type" UniqueName="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LocationName" 
                                FilterControlAltText="Filter LocationName column" HeaderText="LocationName" 
                                SortExpression="LocationName" UniqueName="LocationName">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
								<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>" 
                    
                            
                            SelectCommand="SELECT College.Name, College.Type, Locations.LocationName FROM College INNER JOIN Locations ON College.LocationID = Locations.LocationID ORDER BY College.LocationID, College.Name">
                </asp:SqlDataSource>
					</div>
</asp:Content>

