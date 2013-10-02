using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Hvis bruger er logget ind
        if (Session["bruger_id"] != null)
        {
            // log bruger ud
            Session.Abandon();
        }
        // Send brugeren tilbage til forsiden
        Response.Redirect("default.aspx");

    }
}