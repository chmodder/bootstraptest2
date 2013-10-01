using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class brugere : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    // Tjek om brugeren er logget ind
        // Hvis brugeren ikke er logget ind videresendes til default.aspx
        if (Session["bruger_id"] == null)
        {
            Response.Redirect("default.aspx");
        }

    }
}