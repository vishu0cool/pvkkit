<%@ Page Title="PVKKIT || Links" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Links.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphkeywords" Runat="Server">
    <meta name="keywords" content="Contact, Phone,Email, Map, Location">	
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
							<li><a href="#">Links</a></li>
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
                    <a href="https://docs.google.com/forms/d/1LujHhSnPY3KYOD3eSC4WHelJFwRbgdxtpZ2LVJtysbU" target="_blank">Click to fill Student Contact details</a>
    <br />                
    <a href="https://docs.google.com/forms/d/1uty5DF330OtSjO2-NJ0Y0NSkiU9XLCEHahmeZfwOVKQ" target="_blank">Click to fill Faculty Contact details</a>
					</div>


			</div>
		</div>
	</div>
	
	
</asp:Content>

