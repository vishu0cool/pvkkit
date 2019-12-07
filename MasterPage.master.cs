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

public partial class MasterPage : System.Web.UI.MasterPage
{
    DataSet ds;
    SqlDataAdapter da;
    SqlConnection con;
    SqlCommand cmd;
    Pvkkit cc = new Pvkkit();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["s_ClgID"] = ConfigurationManager.AppSettings["ClgID"];
        }
    }
    protected void btnnewsletter_Click(object sender, EventArgs e)
    {
        if (tbemail.Text == "")
        {
            divmsg.Attributes.Remove("hidden");
            divmsg.Attributes.Add("class", "alert alert-danger");
            lblmsg.Text = "Enter E-Mail ID";// +ex.ToString();
        }
        else
        {
            try
            {
                getCon();

                string strcmd = "insert into NewsletterSubscription (ClgID,EmailID,ts) values (@ClgID,@EmailID,@Ts) ";
                cmd = new SqlCommand(strcmd, con);
                cmd.Parameters.AddWithValue("@ClgID", Session["s_ClgID"].ToString());
                cmd.Parameters.AddWithValue("@EmailID", tbemail.Text);
                cmd.Parameters.AddWithValue("@ts", new Pvkkit().getdate());
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();

                //Add to messagequeue
                string message = "Dear <b>" + tbemail.Text + "</b>";
                message += "<br/><br/> Greetings from your Alma Mater...";
                message += "<br/><br/> Thank you so much for your time, and your interest in becoming part of PVKKIT again with subscription for Newsletter. ";

                message += "<br/>You will receive Newsletters from College in regular intervals.";
                message += "<br/><br/>PVKKIT";

                string smsbody = "Dear " + tbemail.Text + ",";
                smsbody += "\nThank you for your subscribing Newsletter.";
                smsbody += "\nYou will receive Newsletters from College in regular intervals.\nPVKKIT";

                string subject = "Newsletter Subscription";

                strcmd = "insert into messagequeue (name,mailto,subject,mailbody,smsbody,mobile,empid,pword,smsStatus,emailStatus,TS) values (@name,@mailto,@subject,@mailbody,@smsbody,@mobile,@empid,@pword,@smsStatus,@emailStatus,@TS)";
                cmd = new SqlCommand(strcmd, con);
                cmd.Parameters.AddWithValue("@name", tbemail.Text);
                cmd.Parameters.AddWithValue("@mailto", tbemail.Text);
                cmd.Parameters.AddWithValue("@subject", subject);
                cmd.Parameters.AddWithValue("@mailbody", message);
                cmd.Parameters.AddWithValue("@smsbody", smsbody);
                cmd.Parameters.AddWithValue("@mobile", "");
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
                lblmsg.Text = "You are successfully subscribed to Newsletter..!";
                //msgtag.Focus();


                tbemail.Text = "";



            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    divmsg.Attributes.Remove("hidden");
                    divmsg.Attributes.Add("class", "alert alert-danger");
                    lblmsg.Text = "You are already subscribed..!";// +ex.ToString();
                    //msgtag.Focus();
                }
                else
                {
                    divmsg.Attributes.Remove("hidden");
                    divmsg.Attributes.Add("class", "alert alert-danger");
                    lblmsg.Text = "Unable to connect to database..!";// +ex.ToString();
                    // msgtag.Focus();
                }
            }
        }
    }
    public void getCon()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["pvkkitconnectionstring"].ConnectionString);
        con.Open();
    }
}
