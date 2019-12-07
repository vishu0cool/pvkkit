<%@ Page Title="Directory | PVKKIT" Language="C#" MasterPageFile="~/Content/Alumni/MasterPage_Alumni.master"
    AutoEventWireup="true" CodeFile="Directory.aspx.cs" Inherits="Insurance" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphkeywords" Runat="Server">
    
 <meta name="description" content="Alumni Details of pvkkit">
 <meta name="keywords" content="Alumni Details, Old Students Details, Alumni Directory">
       </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>

    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
  <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="Panel1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
	</telerik:RadAjaxManager>
    <h1>Directory</h1>
    <asp:Panel ID="Panel1" runat="server">
        <div class="table-responsive">
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" FilterType="CheckList"
                AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Skin="Bootstrap"
                OnItemDataBound="RadGrid1_ItemDataBound"
                AllowFilteringByColumn="True" OnItemCommand="RadGrid1_ItemCommand">

                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <SortingSettings SortedBackColor="Aqua" />
                <ClientSettings Selecting-AllowRowSelect="true" >
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView DataSourceID="SqlDataSource1">
                    <Columns>
                        <telerik:GridTemplateColumn UniqueName="SNO" HeaderText="#" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:Label ID="numberLabel" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle />
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="ClgCode"
                            HeaderText="College"
                            SortExpression="ClgCode" UniqueName="ClgCode">
                            <FilterTemplate>
                                <telerik:RadComboBox ID="RadCombocode" runat="server" Filter="Contains" MarkFirstMatch="true"
                                    Width="120" DataSourceID="SqlDataSource2" class="form-control"
                                    DataTextField="Clgcode" DataValueField="Clgcode" OnClientSelectedIndexChanged="codeChanged"
                                    Height="150"
                                    AppendDataBoundItems="true"
                                    SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("ClgCode").CurrentFilterValue %>'
                                    Skin="Bootstrap">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                                    <script type="text/javascript">
                                        function codeChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                    tableView.filter("ClgCode", args.get_item().get_value(), "EqualTo");

                                                }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="Fullname"
                            HeaderText="Name"
                            SortExpression="Fullname" UniqueName="Fullname">
                            <FilterTemplate>
                                <telerik:RadComboBox ID="RadComboFullname" runat="server" Filter="Contains" MarkFirstMatch="true"
                                    DataSourceID="SqlDataSource3" class="form-control"
                                    DataTextField="Fullname" DataValueField="Fullname" OnClientSelectedIndexChanged="FullnameChanged"
                                    Height="150"
                                    AppendDataBoundItems="true"
                                    SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Fullname").CurrentFilterValue %>'
                                    Skin="Bootstrap">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
                                    <script type="text/javascript">
                                        function FullnameChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                    tableView.filter("Fullname", args.get_item().get_value(), "EqualTo");

                                                }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>

                                <telerik:GridBoundColumn DataField="BName"
                            HeaderText="Branch"
                            SortExpression="BName" UniqueName="BName">
                            <FilterTemplate>
                                <telerik:RadComboBox ID="RadComboBName" runat="server" Filter="Contains" MarkFirstMatch="true"
                                    DataSourceID="SqlDataSource4" class="form-control"
                                    DataTextField="BName" DataValueField="BName" OnClientSelectedIndexChanged="BNameChanged"
                                    Height="150"
                                    AppendDataBoundItems="true"
                                    SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("BName").CurrentFilterValue %>'
                                    Skin="Bootstrap">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock4" runat="server">
                                    <script type="text/javascript">
                                        function BNameChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                            tableView.filter("BName", args.get_item().get_value(), "EqualTo");

                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="GradYear"
                            HeaderText="Year"
                            SortExpression="GradYear" UniqueName="GradYear">
                            <FilterTemplate>
                                <telerik:RadComboBox ID="RadComboGradYear" runat="server" Filter="Contains" MarkFirstMatch="true"
                                    DataSourceID="SqlDataSource5" class="form-control"
                                    DataTextField="GradYear" DataValueField="GradYear" OnClientSelectedIndexChanged="GradYearChanged"
                                    Height="150" Width="80"
                                    AppendDataBoundItems="true"
                                    SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("GradYear").CurrentFilterValue %>'
                                    Skin="Bootstrap">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock5" runat="server">
                                    <script type="text/javascript">
                                        function GradYearChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                            tableView.filter("GradYear", args.get_item().get_value(), "EqualTo");

                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>

                        <telerik:GridButtonColumn 
                            FilterControlAltText="Filter column column" 
                            Text="View Details" UniqueName="column" CommandName="view">
                        </telerik:GridButtonColumn>

                    </Columns>
                </MasterTableView>
                <FilterMenu CssClass="RadFilterMenu_CheckList">
                </FilterMenu>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>"
                SelectCommand="SELECT Alumni.Fullname, College.ClgCode, Branches.BName, Alumni.GradYear FROM Alumni INNER JOIN College ON Alumni.ClgID = College.ClgID INNER JOIN Branches ON Alumni.BranchID = Branches.Bid WHERE (Alumni.ClgID = @clgid) OR (Alumni.ClgID = @ClgID2) ORDER BY Alumni.Ts DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="ClgID" SessionField="s_ClgID" Type="Int32" />
                    <asp:SessionParameter Name="ClgID2" SessionField="s_ClgID1" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>"
                SelectCommand="SELECT  ClgCode, ClgID FROM College WHERE (ClgID = @clgid1) OR (ClgID = @clgid2)">
                <SelectParameters>
                    <asp:SessionParameter Name="clgid1" SessionField="s_ClgID" />
                    <asp:SessionParameter Name="ClgID2" SessionField="s_ClgID1" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>"
                SelectCommand="SELECT  Fullname FROM Alumni WHERE (ClgID = @clgid1) OR (ClgID = @clgid2)">
                <SelectParameters>
                    <asp:SessionParameter Name="clgid1" SessionField="s_ClgID" />
                    <asp:SessionParameter Name="ClgID2" SessionField="s_ClgID1" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>"
                
                SelectCommand="SELECT distinct Branches.BName FROM Alumni INNER JOIN Branches ON Alumni.BranchID = Branches.Bid WHERE (Alumni.ClgID = @clgid) OR (Alumni.ClgID = @ClgID2) ORDER BY BName DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="ClgID" SessionField="s_ClgID" Type="Int32" />
                    <asp:SessionParameter Name="ClgID2" SessionField="s_ClgID1" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>"
                
                SelectCommand="SELECT distinct GradYear FROM Alumni WHERE (ClgID = @clgid) OR (ClgID = @ClgID2) ORDER BY GradYear">
                <SelectParameters>
                    <asp:SessionParameter Name="ClgID" SessionField="s_ClgID" Type="Int32" />
                    <asp:SessionParameter Name="ClgID2" SessionField="s_ClgID1" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <br />
         <telerik:RadWindow  ID="RadWindow1" runat="server" Width="500px" Height="550px" Modal="true" RenderMode="Lightweight">
        <ContentTemplate>
               <asp:Panel ID="Paneldata" runat="server" Visible="false">

            <div class="table-responsive">
                <table class="table table-hover table-bordered table-responsive">
                    <tr>
                        <td><b>Hall Ticket</b></td>
                        <td>
                            <asp:Label ID="lblhtno" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Full Name</b></td>
                        <td>
                            <asp:Label ID="lblfullname" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Mobile</b></td>
                        <td>
                            <asp:Label ID="lblmobile" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Email ID</b></td>
                        <td>
                            <asp:Label ID="lblemailid" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Gender</b></td>
                        <td>
                            <asp:Label ID="lblgender" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Home Town</b></td>
                        <td>
                            <asp:Label ID="lblhometown" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Graduation Year</b></td>
                        <td>
                            <asp:Label ID="lblgradyear" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Branch</b></td>
                        <td>
                            <asp:Label ID="lblbranch" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Current Employer</b></td>
                        <td>
                            <asp:Label ID="lblemp" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Job Title</b></td>
                        <td>
                            <asp:Label ID="lbljobtitle" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><b>Current Town</b></td>
                        <td>
                            <asp:Label ID="lblcurrenttown" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </div>

        </asp:Panel>
        </ContentTemplate>
    </telerik:RadWindow>

     
        <br />
        <div class="alert alert-danger hidden" id="divmsg" runat="server">
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        </div>
        <a runat="server" id="msgtag" name="alert"></a>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

