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

public partial class Insurance : System.Web.UI.Page
{
    DataSet ds;
    SqlDataAdapter da;
    SqlConnection con;
    SqlCommand cmd;
    string empmobile = "";
    Pvkkit cc = new Pvkkit();
    protected void Page_Load(object sender, EventArgs e)
    {  //ajax loading panel settings
        RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
        RadAjaxLoadingPanel RadAjaxLoadingPanel1 = (RadAjaxLoadingPanel)this.Master.FindControl("RadAjaxLoadingPanel1");
        AjaxManager.AjaxSettings.AddAjaxSetting(Panel1, Panel1, RadAjaxLoadingPanel1);
        if(!IsPostBack)
        {
            Session["s_ClgID"] = ConfigurationManager.AppSettings["ClgID"];
            Session["s_ClgID1"] = ConfigurationManager.AppSettings["ClgID1"];
        }
    }
    public void getCon()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["pvkkitconnectionstring"].ConnectionString);
        con.Open();
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            getCon();

            string strcmd = "insert into Alumni (ClgID,Htno,Fullname,Mobile,EmailID,Gender,HomeTown,GradYear,BranchID,CurrentEmployer,JobTitle,CurrentTown,IntrestedAreas,Comments,ts,ShowAsTestimonial) values (@ClgID,@Htno,@Fullname,@Mobile,@EmailID,@Gender,@HomeTown,@GradYear,@BranchID,@CurrentEmployer,@JobTitle,@CurrentTown,@IntrestedAreas,@Comments,@ts,@ShowAsTestimonial) ";
            cmd = new SqlCommand(strcmd, con);
            cmd.Parameters.AddWithValue("@ClgID", ddlcollege.Text);
            cmd.Parameters.AddWithValue("@Htno", tbhtno.Text);
            cmd.Parameters.AddWithValue("@Fullname", tbfirstname.Text);
            cmd.Parameters.AddWithValue("@Mobile", tbmobile.Text);
            cmd.Parameters.AddWithValue("@EmailID", tbemail.Text);
            cmd.Parameters.AddWithValue("@Gender", ddlgender.Text);
             cmd.Parameters.AddWithValue("@HomeTown",tbhometown.Text);
            cmd.Parameters.AddWithValue("@GradYear",ddlyear.Text);
            cmd.Parameters.AddWithValue("@BranchID",ddlbranch.Text);
            cmd.Parameters.AddWithValue("@CurrentEmployer",tbemp.Text);
            cmd.Parameters.AddWithValue("@JobTitle",tbjobtitle.Text);
            cmd.Parameters.AddWithValue("@CurrentTown",tbcurenttown.Text);
            cmd.Parameters.AddWithValue("@IntrestedAreas",tbareas.Text);
            cmd.Parameters.AddWithValue("@Comments",tbcomments.Text);
            cmd.Parameters.AddWithValue("@ts", new Pvkkit().getdate());
            cmd.Parameters.AddWithValue("@ShowAsTestimonial", "NO");
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            ConfigurationManager.AppSettings["ClgName"] = ddlcollege.SelectedItem.Text;


            //Add to messagequeue
            string message = "Dear <b>" + tbfirstname.Text + "</b>";
            message += "<br/><br/> Greetings from your Alma Mater...";
            message += "<br/><br/> Thank you so much for your time, and your interest in becoming part of PVKKIT again as an Alumni. ";
            
            message += "<br/>One of our Staff will reach you shortly.";
            message += "<br/><br/>PVKKIT ALUMNI";

            string smsbody = "Dear " + tbfirstname.Text  + ",";
            smsbody += "\nThank you for your Alumni registration.";
            smsbody += "\nWe will reach you shortly..\nPVKKIT ALUMNI";

            string subject = "ALUMNI DATA";

            strcmd = "insert into messagequeue (name,mailto,subject,mailbody,smsbody,mobile,empid,pword,smsStatus,emailStatus,TS) values (@name,@mailto,@subject,@mailbody,@smsbody,@mobile,@empid,@pword,@smsStatus,@emailStatus,@TS)";
            cmd = new SqlCommand(strcmd, con);
            cmd.Parameters.AddWithValue("@name", tbfirstname.Text);
            cmd.Parameters.AddWithValue("@mailto", tbemail.Text);
            cmd.Parameters.AddWithValue("@subject", subject);
            cmd.Parameters.AddWithValue("@mailbody", message);
            cmd.Parameters.AddWithValue("@smsbody", smsbody);
            cmd.Parameters.AddWithValue("@mobile", tbmobile.Text);
            cmd.Parameters.AddWithValue("@empid", "");
            cmd.Parameters.AddWithValue("@pword", "");
            cmd.Parameters.AddWithValue("@smsStatus", "PENDING");
            cmd.Parameters.AddWithValue("@emailStatus", "PENDING");
            cmd.Parameters.AddWithValue("@TS", new Pvkkit().getdate());
           
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            con.Close();


            Thread messagequeue = new Thread(delegate()
            {
                cc.messageQueueMail();
                cc.messageQueueSMS();

            });

            messagequeue.IsBackground = true;
            messagequeue.Start();



            divmsg.Attributes.Remove("hidden");
            divmsg.Attributes.Add("class", "alert alert-success");
            lblmsg.Text = "Your data is successfully submitted..!";
            msgtag.Focus();

            tbhtno.Text = "";
            tbfirstname.Text = "";
            ddlcollege.Text = "";
            tbmobile.Text = "";
            tbemail.Text = "";
            ddlgender.SelectedIndex = -1;
            tbhometown.Text = "";
            ddlyear.SelectedIndex = -1;
            ddlbranch.SelectedIndex = -1;
            tbcurenttown.Text = "";
            tbjobtitle.Text ="";
            tbcurenttown.Text = "";
            tbareas.Text = "";
            tbcomments.Text = "";
            tbemp.Text = "";
            

        }
        catch (Exception ex)
        {
            divmsg.Attributes.Remove("hidden");
            divmsg.Attributes.Add("class", "alert alert-danger");
            lblmsg.Text = "Unable to connect to database..!";// +ex.ToString();
            msgtag.Focus();

        }
    }
    protected void ddlcollege_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlbranch.Items.Clear();
        ddlbranch.Items.Add("");
        ddlbranch.DataBind();
    }
}