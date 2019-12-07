<%@ Page Title="Error" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Error500.aspx.cs" Inherits="Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- 404 Section Start -->	
	<div class="error-page-sec pt-100 pb-100">
		<div class="container">	
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="error-page-content">
						<h1>500 Error</h1>
						<h2> Ooops...Something went wrong.</h2>
						<h3>Sorry, for the inconvenience we're working on it...</h3>	
						<a href="Default.aspx">Back To Home</a>
					</div>										
				</div>
				<div class="col-md-3"></div>				
			</div>
		</div>		
	</div>	
	<!-- 404 Section End -->
</asp:Content>

