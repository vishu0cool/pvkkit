using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class _Default : System.Web.UI.Page
{
    DataSet ds;
    SqlDataAdapter da;
    SqlConnection con;
    SqlCommand cmd;
    string empmobile = "";
    Pvkkit cc = new Pvkkit();
    protected void Page_Load(object sender, EventArgs e)
    {
        
           
        
    }

   
}