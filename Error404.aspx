<%@ Page Title="Page not found" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Error404.aspx.cs" Inherits="Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- 404 Section Start -->	
	<div class="error-page-sec pt-100 pb-100">
		<div class="container">	
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="error-page-content">
						<h1>404, Not Found</h1>
						<h2>Oops! This page can't be found</h2>
						<p>Sorry, the page you are looking for does not exists or  had its name changed, or is temporarily unavailable..!</p>	
						<a href="Default.aspx">Back To Home</a>
					</div>										
				</div>
				<div class="col-md-3"></div>				
			</div>
		</div>		
	</div>	
	<!-- 404 Section End -->
</asp:Content>

