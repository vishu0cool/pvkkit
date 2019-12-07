<%@ Page Title="Contact Us | PVKKIT" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphkeywords" Runat="Server">
    <meta name="keywords" content="Contact, Phone Number, Email, Address, Map, Location">	
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

   <!-- Page Heading Section Start -->	
	<div class="pagehding-sec">
			<%--<div class="images-overlay"></div>	--%>	
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-heading">
						<h1>Contact</h1>
					</div>
					<div class="breadcrumb-list">
						<ul>
							<li><a href="Default.aspx">Home</a></li>
							<li><a href="#">About</a></li>
						</ul>
					</div>					
				</div>				
			</div>
		</div>
	</div>
	<!-- Page Heading Section End -->	
	
	<!-- Contact Page Section Start -->
	<div class="contact-page-sec pt-100 pb-100">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<h2>We are here !</h2>
					<div class="contact-page-map">
						<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d30879.879318446536!2d77.57220268502317!3d14.656797544877994!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bb14a8485a7d51f%3A0x678c7ea1062f27b3!2sPVKK+Intitute+of+Technology!5e0!3m2!1sen!2sin!4v1395926330507" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>	
					</div>	
					<br />
							<div class="row">
                                  <asp:Panel ID="Panel1" runat="server">
                                  
                                      <br />
					<div class="contact-page-form">
						<h2>Send your message</h2>	
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">First Name</label> <span class="text-danger"> *</span>
								<asp:TextBox ID="tbfirstname" runat="server" placeholder="First Name" class="form-control placeholder-no-fix"></asp:TextBox>
							   
							</div>
							 <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
														runat="server" ErrorMessage="Enter First Name" SetFocusOnError="true"
														ControlToValidate="tbfirstname" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>							
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Last Name</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tblastname" runat="server" placeholder="Last Name" class="form-control placeholder-no-fix"></asp:TextBox>
								
							</div>
							   <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
														runat="server" ErrorMessage="Enter Last Name" SetFocusOnError="true"
														ControlToValidate="tblastname" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>								
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="single-input-field">
                                 <label class="control-label">Mobile</label> <span class="text-danger"> *</span>
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
						<div class="col-md-12 message-input">
							<div class="single-input-field">
                                 <label class="control-label">Message</label> <span class="text-danger"> *</span>
								 <asp:TextBox ID="tbmessage" runat="server" class="form-control" TextMode="MultiLine" ></asp:TextBox>
											  
							</div>
							  <span class="help-block danger">
													<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
														runat="server" ErrorMessage="Enter Message" SetFocusOnError="true"
														ControlToValidate="tbmessage" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

												</span>
						</div>	
                        
                        																							
													
					</div>				

                                     
					<div class="single-input-fieldsbtn">
							   <asp:Button ID="btnsave" runat="server" Text="Send Message" class="btn green" 
													OnClick="btnsave_Click" />
                        
						</div>	

                                         <br />  
								  <a runat="server" id="msgtag" name="alert"></a>
                         
		<div class="alert alert-danger hidden" id="divmsg" runat="server">
			<button class="close" data-close="alert">
			</button>
			<asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
		</div>
                                      </asp:Panel>		
				</div>			
				</div>
		
				<div class="col-md-4">				
					<div class="contact-info">
						<div class="contact-info-item">
							<div class="contact-info-icon">
								<i class="fa fa-map-marker"></i>
							</div>
							<div class="contact-info-text">
								<h2>address</h2>
								<span><strong>P V K K Institute of Technology : </strong><br/>Sanapa Road, Alamuru(P), Rudrampet,<br/> Anantapuramu - 515 001<br/>Andhra Pradesh, India</span> 
							</div>
						</div>						
					</div>	
					<div class="contact-info">
						<div class="contact-info-item">
							<div class="contact-info-icon">
								<i class="fa fa-mobile"></i>
							</div>
							<div class="contact-info-text">
								<h2>Phone</h2>
								<span>  Mobile No:+91-9550616861</span>
							</div>
						</div>						
					</div>					
					<div class="contact-info">
						<div class="contact-info-item">
							<div class="contact-info-icon">
								<i class="fa fa-envelope"></i>
							</div>
							<div class="contact-info-text">
								<h2>E-Mail</h2>
								<span>principal.3n@jntua.ac.in</span> 
							</div>
						</div>						
					</div>								
					<div class="contact-info">
						<div class="contact-info-item">
							<div class="contact-info-icon">
								<i class="fa fa-clock-o"></i>
							</div>
							<div class="contact-info-text">
								<h2>College Timings</h2>
								<span>Mon - Sat  9:30 am - 4.30 pm</span>
								<span>Sunday Holiday</span> 
							</div>
						</div>						
					</div>					
						<div class="contact-info">
						<div class="contact-info-item">
							<div class="contact-info-icon">
								<i class="fa fa-connectdevelop"></i>
							</div>
							<div class="contact-info-text">
								<h2>Contact Us @</h2>
							<p><strong>Founder & Correspondent:</strong><br/>Dr. Palle Raghunath Reddy garu </p>
							<p><strong>Chairman:</strong><br/>Sri. Palle Kishore garu </p>
							<p><strong>Treasurer:</strong><br/>Smt. Palle Sindhura garu </p>
							<p><strong>Management Representative:</strong><br/>Mr. K. Sreekanth Reddy<br/>Mobile No:+91-8688810055 </p>
							<p><strong>Principal:</strong><br/>Dr. B. Ramesh Babu<br/>Email id: principal.3n@jntua.ac.in<br/>Mobile No:+91-9550616861</p>
							<p><strong>Vice-Principal:</strong><br/>Dr. B.Raghavendra Prasad<br/> Mobile No:+91-8886630029 </p>
							<p><strong>Diploma Principal:</strong><br/>Mr. G N S Vaibhav<br/> Mobile No:+91-8886630024</p>
                                <p><strong>Administrative Officer:</strong><br/>Mr. D. Ramana Naik<br/> Mobile No:+91-8886630031</p>
							</div>
						</div>						
					</div>		
				</div>				
				


			</div>
		</div>
	</div>
	
	
</asp:Content>

