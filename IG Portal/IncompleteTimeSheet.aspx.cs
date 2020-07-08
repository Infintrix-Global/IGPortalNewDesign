using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IG_Portal.BAL_Classes;

namespace IG_Portal
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        clsCommonMasters objCommon = new clsCommonMasters();
        BAL_Task objTask = new BAL_Task();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt = objTask.GetIncompleteTimeSheet();
                foreach (DataRow dr in dt.Rows)
                {
                    objCommon.SendMailIncompleteTimeSheet(dr["Email"].ToString());
                }
            }
        }
    }
}