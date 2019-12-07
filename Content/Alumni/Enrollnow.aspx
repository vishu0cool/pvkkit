<%@ Page Title="Alumni Enroll | PVKKIT" Language="C#" MasterPageFile="~/Content/Alumni/MasterPage_Alumni.master" AutoEventWireup="true" CodeFile="Enrollnow.aspx.cs" Inherits="Insurance" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphkeywords" Runat="Server">
    
 <meta name="description" content="PVKK Alumni enrollment">
 <meta name="keywords" content="PVKK Alumni enrollment">
       </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Enroll now</h1>
<p>Thank you so much for showing interest in becoming a part of our continued success  at PVKKIT. Please complete the form below so you are added to our growing database of Alumni and one of Staff members will be in touch with you shortly.</p> 
    <p>For questions, please call us </p>     

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
 
		 <asp:Panel ID="Panel1" runat="server">								
					<div class="contact-page-form">
						<h2>Enroll Now</h2>	
                        <div class="row">
                            <div class="col-md-12">
                        	<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Hall Ticket Number</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tbhtno" runat="server" placeholder="Hall Ticket" class="form-control placeholder-no-fix"></asp:TextBox>
								
							</div>
							   <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
														runat="server" ErrorMessage="Enter Hall Ticket Number" SetFocusOnError="true"
														ControlToValidate="tbhtno" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>		
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Full Name</label> <span class="text-danger"> *</span>
								<asp:TextBox ID="tbfirstname" runat="server" placeholder="Full Name" class="form-control placeholder-no-fix"></asp:TextBox>
							   
							</div>
							 <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
														runat="server" ErrorMessage="Enter Full Name" SetFocusOnError="true"
														ControlToValidate="tbfirstname" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>							
							
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Mobile Number</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tbmobile" runat="server" class="form-control placeholder-no-fix"
														TextMode="Number"
														placeholder="10 Digit Mobile" MaxLength="10" onkeypress="return this.value.length<10"></asp:TextBox>
												 
							</div>
							  <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator8" SetFocusOnError="true"
														runat="server" ErrorMessage="Enter 10 Digit Mobile Number"
														ControlToValidate="tbmobile" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" SetFocusOnError="true"
														ControlToValidate="tbmobile" ValidationExpression="^[0-9]{10}$" Display="Dynamic"
														ForeColor="Red" ErrorMessage="Enter 10 Digit Mobile Number"></asp:RegularExpressionValidator>
												</span>
						</div>							
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">E-Mail ID</label> <span class="text-danger"> *</span>
								   <asp:TextBox ID="tbemail" runat="server" class="form-control placeholder-no-fix"
														placeholder="E-Mail ID"></asp:TextBox>
							   
							</div>
							  <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator7" SetFocusOnError="true"
														runat="server" ErrorMessage="Enter E-Mail ID"
														ControlToValidate="tbemail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>    
													<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
													Display="Dynamic" ForeColor="Red" ErrorMessage="Invalid E-Mail ID" SetFocusOnError="true"
													ControlToValidate="tbemail"
													ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
												</span>
						</div>	
						<div class="col-md-6 col-sm-6 col-xs-12">
                                                 <label class="control-label">Gender</label> <span class="text-danger"> *</span>
                                                <asp:DropDownList ID="ddlgender" runat="server" class="form-control select2" data-live-search="true" data-size="8" >
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                </asp:DropDownList>
                                                <span class="help-block danger">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" SetFocusOnError="true"
                                                        runat="server" ErrorMessage="Select Gender" InitialValue=""
                                                        ControlToValidate="ddlgender" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></span>
							
						</div>	
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Home Town</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tbhometown" runat="server" placeholder="Home Town" class="form-control placeholder-no-fix"></asp:TextBox>
								
							</div>
							   <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
														runat="server" ErrorMessage="Enter Home Town" SetFocusOnError="true"
														ControlToValidate="tbhometown" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>		
                           							
						<div class="col-md-6 col-sm-6 col-xs-12">
                                                 <label class="control-label">Graduated Year</label> <span class="text-danger"> *</span>
                                                <asp:DropDownList ID="ddlyear" runat="server" class="form-control select2" data-live-search="true" data-size="8" >
                                                      <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>2019</asp:ListItem>
                                                    <asp:ListItem>2018</asp:ListItem>
                                                    <asp:ListItem>2017</asp:ListItem>
                                                     <asp:ListItem>2016</asp:ListItem>
                                                     <asp:ListItem>2015</asp:ListItem>
                                                     <asp:ListItem>2014</asp:ListItem>
                                                     <asp:ListItem>2013</asp:ListItem>
                                                     <asp:ListItem>2012</asp:ListItem>
                                                </asp:DropDownList>
                                                <span class="help-block danger">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true"
                                                        runat="server" ErrorMessage="Select Year" InitialValue=""
                                                        ControlToValidate="ddlyear" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></span>
							
						</div>	
                                   	<div class="col-md-6 col-sm-6 col-xs-12">
                                                 <label class="control-label">College</label> <span class="text-danger"> *</span>
                                                <asp:DropDownList ID="ddlcollege" runat="server" class="form-control select2" 
                                                     data-live-search="true" data-size="8" DataSourceID="SqlDataSource2" 
                                                     DataTextField="Name" DataValueField="ClgID" AppendDataBoundItems="True" 
                                                     AutoPostBack="True" OnSelectedIndexChanged="ddlcollege_SelectedIndexChanged" >
                                                      <asp:ListItem></asp:ListItem>
                                                   
                                                </asp:DropDownList>
                                                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                     ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>" 
                                                     
                                                     SelectCommand="SELECT [Name], [ClgID] FROM [College] WHERE (([ClgID] = @ClgID) OR ([ClgID] = @ClgID2))">
                                                     <SelectParameters>
                                                         <asp:SessionParameter Name="ClgID" SessionField="s_ClgID" Type="Int32" />
                                                         <asp:SessionParameter Name="ClgID2" SessionField="s_ClgID1" Type="Int32" />
                                                     </SelectParameters>
                                                   
                                                 </asp:SqlDataSource>
                                                <span class="help-block danger">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" SetFocusOnError="true"
                                                        runat="server" ErrorMessage="Select College" InitialValue=""
                                                        ControlToValidate="ddlcollege" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></span>
							
						</div>    	

                   		<div class="col-md-6 col-sm-6 col-xs-12">
                                                 <label class="control-label">Branch</label> <span class="text-danger"> *</span>
                                                <asp:DropDownList ID="ddlbranch" runat="server" class="form-control select2" 
                                                     data-live-search="true" data-size="8" DataSourceID="SqlDataSource1" 
                                                     DataTextField="BName" DataValueField="Bid" AppendDataBoundItems="true" >
                                                      <asp:ListItem></asp:ListItem>
                                                   
                                                </asp:DropDownList>
                                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                     ConnectionString="<%$ ConnectionStrings:pvkkitconnectionstring %>" 
                                                     SelectCommand="SELECT [BName], [Bid] FROM [Branches] WHERE ([ClgID] = @ClgID)">
                                                     <SelectParameters>
                                                         <asp:ControlParameter ControlID="ddlcollege" Name="ClgID" 
                                                             PropertyName="SelectedValue" />
                                                     </SelectParameters>
                                                   
                                                 </asp:SqlDataSource>
                                                <span class="help-block danger">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" SetFocusOnError="true"
                                                        runat="server" ErrorMessage="Select Branch" InitialValue=""
                                                        ControlToValidate="ddlyear" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></span>
							
						</div>	
                                           <div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Currently working in</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tbemp" runat="server" placeholder="Currently woring in" class="form-control placeholder-no-fix"></asp:TextBox>
								
							</div>
							   <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator9"
														runat="server" ErrorMessage="Currently working in" SetFocusOnError="true"
														ControlToValidate="tbemp" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>
                                           <div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Job Title</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tbjobtitle" runat="server" placeholder="Job Title" class="form-control placeholder-no-fix"></asp:TextBox>
								
							</div>
							   <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator10"
														runat="server" ErrorMessage="Enter Job Title" SetFocusOnError="true"
														ControlToValidate="tbjobtitle" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Currently resides in</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tbcurenttown" runat="server" placeholder="Current Town" class="form-control placeholder-no-fix"></asp:TextBox>
								
							</div>
							   <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator11"
														runat="server" ErrorMessage="Enter Current Town" SetFocusOnError="true"
														ControlToValidate="tbcurenttown" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Interested Areas</label> <span class="text-danger"> *</span>
								   <asp:DropDownList ID="tbareas" runat="server" class="form-control select2" data-live-search="true" data-size="8" >
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>Giving a Guest Lecture</asp:ListItem>
                                                    <asp:ListItem>Volunteer at PVKKIT</asp:ListItem>
                                        <asp:ListItem>Being an Industry Expert</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
							</div>
							   <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator12"
														runat="server" ErrorMessage="Intrested Areas" SetFocusOnError="true"
														ControlToValidate="tbareas" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>
                                         <div class="col-md-12 col-sm-12 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Comments</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tbcomments" runat="server" placeholder="Comments" class="form-control placeholder-no-fix" TextMode="MultiLine" Rows="3"></asp:TextBox>
								
							</div>
							   <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator13"
														runat="server" ErrorMessage="Comments" SetFocusOnError="true"
														ControlToValidate="tbcomments" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>
                            </div>
                        </div>
                        <div class="row">	
                            													
							<div class="single-input-fieldsbtn">
                               <asp:Button ID="btnsave" runat="server" Text="Enroll" 
													OnClick="btnsave_Click" BackColor="#FFFF66" />
		<div class="alert alert-danger hidden" id="divmsg" runat="server">
			<button class="close" data-close="alert">
			</button>
			<asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>

		</div>
  <a runat="server" id="msgtag" name="alert"></a>
							   
								 
						</div>		
                            				
					</div>	
                        	</div>
                        			
								
             </asp:Panel>
</asp:Content>

