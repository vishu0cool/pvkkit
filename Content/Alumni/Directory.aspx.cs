using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Insurance : System.Web.UI.Page
{
    DataSet ds;
    SqlDataAdapter da;
    SqlConnection con;
    DataTable dt;
    SqlCommand cmd;
    string empmobile = "";
    Pvkkit cc = new Pvkkit();
    protected void Page_Load(object sender, EventArgs e)
    {
        //ajax loading panel settings
        RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
        RadAjaxLoadingPanel RadAjaxLoadingPanel1 = (RadAjaxLoadingPanel)this.Master.FindControl("RadAjaxLoadingPanelmasterpage");
        AjaxManager.AjaxSettings.AddAjaxSetting(Panel1, Panel1, RadAjaxLoadingPanel1);
        
        if (!IsPostBack)
        {
            
            Session["s_ClgID"] = ConfigurationManager.AppSettings["ClgID"];
            Session["s_ClgID1"] = ConfigurationManager.AppSettings["ClgID1"];
            //try
            //{
            //    getCon();

            //    string strcmd = "SELECT Alumni.Fullname, College.ClgCode, Branches.BName, Alumni.GradYear FROM Alumni INNER JOIN College ON Alumni.ClgID = College.ClgID INNER JOIN Branches ON Alumni.BranchID = Branches.Bid WHERE (Alumni.ClgID = @clgid) OR (Alumni.ClgID = @ClgID1) ORDER BY Alumni.Ts DESC";
            //    cmd = new SqlCommand(strcmd, con);
            //    cmd.Parameters.AddWithValue("@ClgID", ConfigurationManager.AppSettings["ClgID"]);
            //    cmd.Parameters.AddWithValue("@ClgID1", ConfigurationManager.AppSettings["ClgID1"]);
            //    dt = new DataTable();
            //    da = new SqlDataAdapter(cmd);
            //    da.Fill(dt);
            //    con.Close();

            //    if (dt.Rows.Count >= 1)
            //    {
            //     Alumnitable.InnerHtml=   ConvertDataTableToHTML(dt);
            //    }
            //}
            //catch(Exception ex)
            //{

            //}
        }
    }
    public void getCon()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["pvkkitconnectionstring"].ConnectionString);
        con.Open();
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            int rowCounter = new int();
            Label lbl = e.Item.FindControl("numberLabel") as Label;
            rowCounter = RadGrid1.MasterTableView.PageSize * RadGrid1.MasterTableView.CurrentPageIndex;
            lbl.Text = (e.Item.ItemIndex + 1 + rowCounter).ToString();
        }
    }
    protected void rcname_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        
    }
   
    protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridDataItem item = (GridDataItem)RadGrid1.SelectedItems[0];
        searchalumni(item["FullName"].Text);
    }
    private void searchalumni(string name)
    {
        
        try
        {
            getCon();

            string strcmd = "select * from Alumni,Branches  where fullname= @fullname and (Alumni.clgid=@clgid or Alumni.clgid=@clgid1) and Alumni.branchid=Branches.Bid";
            cmd = new SqlCommand(strcmd, con);
            cmd.Parameters.AddWithValue("@ClgID", ConfigurationManager.AppSettings["ClgID"]);
            cmd.Parameters.AddWithValue("@ClgID1", ConfigurationManager.AppSettings["ClgID1"]);
            cmd.Parameters.AddWithValue("@Fullname", name);

            ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds, "xyz");
            con.Close();

            if (ds.Tables[0].Rows.Count >= 1)
            {
                divmsg.Attributes.Add("class", "hidden");

                Paneldata.Visible = true;

                lblhtno.Text = ds.Tables[0].Rows[0]["Htno"].ToString();
                lblfullname.Text = ds.Tables[0].Rows[0]["Fullname"].ToString();
                lblmobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                lblemailid.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
                lblgender.Text = ds.Tables[0].Rows[0]["Gender"].ToString();
                lblhometown.Text = ds.Tables[0].Rows[0]["HomeTown"].ToString();
                lblgradyear.Text = ds.Tables[0].Rows[0]["GradYear"].ToString();
                lblbranch.Text = ds.Tables[0].Rows[0]["BName"].ToString();
                lblemp.Text = ds.Tables[0].Rows[0]["CurrentEmployer"].ToString();
                lbljobtitle.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();
                lblcurrenttown.Text = ds.Tables[0].Rows[0]["CurrentTown"].ToString();
            }
            else
            {
                divmsg.Attributes.Remove("hidden");
                divmsg.Attributes.Add("class", "alert alert-danger");
                lblmsg.Text = "Unknown values in database..!";
                Paneldata.Visible = false;
            }
            //msgtag.Focus();
            RadWindow1.Title = "Details";
            string script = "function f(){$find(\"" + RadWindow1.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);
        }
        catch (Exception ex)
        {
            divmsg.Attributes.Remove("hidden");
            divmsg.Attributes.Add("class", "alert alert-danger");
            lblmsg.Text = "Unable to connect to database..! Please contact Admin";

        }
    }
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            GridDataItem item = (GridDataItem)e.Item;
            searchalumni(item["FullName"].Text);

        }
    } 
}
