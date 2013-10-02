using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Hvis bruger er logget ind
        if (Session["bruger_id"] != null)
        {
            logout.Visible = true;
        }
    }

    protected void logoutClick(object sender, EventArgs e)
    {
        Session["Bruger_id"] = null;
        Response.Redirect("default.aspx");
    }
}

