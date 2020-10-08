using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IG_Portal
{
    public partial class ClientDashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Raise_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName=="Chat")
            {
                Response.Redirect("~/Chat.aspx");
            }
            if (e.CommandName == "Raise")
            {
                Response.Redirect("~/ClientSupport.aspx");
            }
            if (e.CommandName == "View")
            {
                Response.Redirect("~/ViewSupportTicket.aspx");
            }
        }
    }
}