using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

/// <summary>
/// Summary description for Pvkkit
/// </summary>
public class Pvkkit
{
	DataSet ds;
	SqlDataAdapter da;
	SqlConnection con;
	SqlCommand cmd;
	string getsmsbalanceapistring = "";
	string getbulksmsapistring = "";
	string senderid = "";
	public Pvkkit()
	{
		//
		// TODO: Add constructor logic here
		//
	}
	public DateTime getdate()
	{
		DateTime dt = DateTime.Now.AddHours(12.5);
		//DateTime dt = DateTime.Now;
		return dt;
	}
	public bool IsSmsServerOn()
	{
		try
		{
			using (var client = new WebClient())
			using (var stream = client.OpenRead("http://bulksms.pvkkit.ac.in"))
			{
				return true;
			}
		}
		catch
		{
			return false;
		}
	}
	public string send_sms(string msg, string to)
	{
		string smsquery = "";

		if (cheksmsstatus() == "ON")
		{
			if (IsSmsServerOn())
			{
				try
				{

					smsquery = getbulksmsapistring + "&from=" + senderid + "&to=" + to + "&message=" + msg;
					HttpWebRequest Request;
					StreamReader ResponseReader;
					Request = ((HttpWebRequest)(WebRequest.Create(smsquery)));
					ResponseReader = new StreamReader(Request.GetResponse().GetResponseStream());
					return ResponseReader.ReadToEnd();
				}

				catch (Exception exp)
				{
					return "Error";

				}
			}
			else
			{
				return "Internet is not available";
			}
		}
		else
		{
			return "SMS is OFF";
		}
	}
	public string getSmsCount()
	{
		if (cheksmsstatus() == "ON")
		{
			if (IsSmsServerOn())
			{
				try
				{
					HttpWebRequest Request;
					StreamReader ResponseReader;
					Request = ((HttpWebRequest)(WebRequest.Create(getsmsbalanceapistring)));
					ResponseReader = new StreamReader(Request.GetResponse().GetResponseStream());
					return ResponseReader.ReadToEnd();

				}
				catch (Exception e)
				{
					return "Error";
				}
			}
			else
			{
				return "No Net";
			}
		}
		else
		{
			return "SMS is OFF";
		}
	}
	public void messageQueueSMS()
	{
		getSmsCount();
		try
		{
			getCon();
			ds = new DataSet();
			da = new SqlDataAdapter("SELECT * from messageQueue where [smsStatus] ='Pending'", con);
			da.Fill(ds, "xyz");

			string msgsms = "";
			string to = "";
			if (ds.Tables[0].Rows.Count > 0)
			{
				for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
				{
					to = ds.Tables[0].Rows[i]["mobile"].ToString();

					// msgsms = ds.Tables[0].Rows[i]["subject"].ToString();
					msgsms = ds.Tables[0].Rows[i]["smsbody"].ToString();


					string smsquery = getbulksmsapistring + "&from=" + senderid + "&to=" + to + "&message=" + msgsms;
					HttpWebRequest Request;
					StreamReader ResponseReader;
					Request = ((HttpWebRequest)(WebRequest.Create(smsquery)));
					ResponseReader = new StreamReader(Request.GetResponse().GetResponseStream());


					string strcmd = "update messageQueue set SmsStatus ='Delivered' where empid=@EmpID";
					cmd = new SqlCommand(strcmd, con);
					cmd.Parameters.AddWithValue("@EmpID", ds.Tables[0].Rows[i]["empid"].ToString());

					cmd.CommandType = CommandType.Text;
					cmd.ExecuteNonQuery();


				}
			}
			con.Close();

		}
		catch (Exception ex)
		{
            con.Close();
		}
	}
	public void getCon()
	{
		con = new SqlConnection(ConfigurationManager.ConnectionStrings["pvkkitconnectionstring"].ConnectionString);
		con.Open();
	}
	private string cheksmsstatus()
	{
		try
		{
			getCon();
			ds = new DataSet();
			da = new SqlDataAdapter("SELECT * from SMSSettings where Clgid='" + ConfigurationManager.AppSettings["ClgID"]+"'", con);
			da.Fill(ds, "xyz");
			con.Close();
			if (ds.Tables[0].Rows.Count > 0)
			{

				getsmsbalanceapistring = ds.Tables[0].Rows[0]["BalanceAPIConnection"].ToString();
				getbulksmsapistring = ds.Tables[0].Rows[0]["BulkSMSAPIConnection"].ToString();
				senderid = ds.Tables[0].Rows[0]["SenderID"].ToString();
				return ds.Tables[0].Rows[0]["SendSMS"].ToString();

			}
			else return "ERROR";
		}
		catch (Exception ex)
		{
            con.Close();
			return "ERROR";
		}

	}
	public string sendemail(string to, string subject, string body)
	{
		try
		{
			using (MailMessage mailMessage = new MailMessage())
			{
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"], ConfigurationManager.AppSettings["ClgName"]);
				
				mailMessage.Subject = subject;
				mailMessage.Body = body;
				mailMessage.IsBodyHtml = true;
				mailMessage.To.Add(new MailAddress(to));
				//mailMessage.CC.Add(ConfigurationManager.AppSettings["UserName"]);
				SmtpClient smtp = new SmtpClient();
				smtp.Host = ConfigurationManager.AppSettings["Host"];
				smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);

				System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
				NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
				NetworkCred.Password = ConfigurationManager.AppSettings["Password"];

				smtp.UseDefaultCredentials = true;
				smtp.Credentials = NetworkCred;
				smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);

				smtp.Send(mailMessage);


				return "Successfully mail sent..!";
			}
		}
		catch (Exception ex)
		{
			return ex.ToString();
		}
	}

	public void messageQueueMail()
	{
		try
		{
			getCon();
			ds = new DataSet();
			da = new SqlDataAdapter("SELECT * from messageQueue where [emailStatus] ='Pending'", con);
			da.Fill(ds, "xyz");

			string mailbody = "";
			string subject = "";
			string to = "";
			if (ds.Tables[0].Rows.Count > 0)
			{
				for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
				{
					to = ds.Tables[0].Rows[i]["mailto"].ToString();
					subject = ds.Tables[0].Rows[i]["subject"].ToString();
					mailbody = ds.Tables[0].Rows[i]["mailbody"].ToString();

					sendemail(to, subject, mailbody);

					string strcmd = "update messageQueue set emailStatus ='Delivered' where empid=@EmpID";
					cmd = new SqlCommand(strcmd, con);
					cmd.Parameters.AddWithValue("@EmpID", ds.Tables[0].Rows[i]["empid"].ToString());

					cmd.CommandType = CommandType.Text;
					cmd.ExecuteNonQuery();


				}
			}
			con.Close();

		}
		catch (Exception ex)
		{
            con.Close();
		}
	}

}