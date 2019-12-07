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
        
            //ajax loading panel settings
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            RadAjaxLoadingPanel RadAjaxLoadingPanel1 = (RadAjaxLoadingPanel)this.Master.FindControl("RadAjaxLoadingPanel1");
            AjaxManager.AjaxSettings.AddAjaxSetting(Panel1, Panel1, RadAjaxLoadingPanel1);
        
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

            string strcmd = "insert into WebSiteContactUs (ClgID,FirstName,LastName,mobile,emailid,message,ts) values (@ClgID,@FirstName,@LastName,@mobile,@emailid,@message,@ts) ";
            cmd = new SqlCommand(strcmd, con);
            cmd.Parameters.AddWithValue("@ClgID", ConfigurationManager.AppSettings["ClgID"]);
            cmd.Parameters.AddWithValue("@FirstName", tbfirstname.Text);
            cmd.Parameters.AddWithValue("@LastName", tblastname.Text);
            cmd.Parameters.AddWithValue("@mobile", tbmobile.Text);
            cmd.Parameters.AddWithValue("@emailid", tbemail.Text);
            cmd.Parameters.AddWithValue("@message", tbmessage.Text);
            cmd.Parameters.AddWithValue("@ts", new Pvkkit().getdate());
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();



            //Add to messagequeue
            string message = "Dear <b>" + tbfirstname.Text +' '+tblastname.Text+ "</b>";
            message += "<br/><br/> Greetings ...";
            message += "<br/><br/> Thank you so much for your time.";
            message += "<br/>We are very glad to hear from you.";
            message += "<br/>We will reach you shortly.";
            message += "<br/><br/>WebAdmin";

            string smsbody = "Dear " + tbfirstname.Text  +' '+tblastname.Text+ ",";
            smsbody += "\nThank you for your message.";
            smsbody += "\nWe will reach you shortly..\nWebAdmin";
         
            string subject = "ContactUs Message";

            strcmd = "insert into messagequeue (name,mailto,subject,mailbody,smsbody,mobile,empid,pword,smsStatus,emailStatus,TS) values (@name,@mailto,@subject,@mailbody,@smsbody,@mobile,@empid,@pword,@smsStatus,@emailStatus,@TS)";
            cmd = new SqlCommand(strcmd, con);
            cmd.Parameters.AddWithValue("@name", tbfirstname.Text+' '+tblastname.Text);
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
            lblmsg.Text = "Your message is successfully submitted..!";
            msgtag.Focus();
            tbfirstname.Text = "";
            tblastname.Text = "";
            tbmobile.Text = "";
            tbemail.Text = "";
            tbmessage.Text = "";

        }
        catch (Exception ex)
        {
            divmsg.Attributes.Remove("hidden");
            divmsg.Attributes.Add("class", "alert alert-danger");
            lblmsg.Text = "Unable to connect to database..!";// +ex.ToString();

        }
    }
}