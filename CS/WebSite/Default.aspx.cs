using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Init(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (Session["data"] == null)
        {
            dt.Columns.Add("ID", typeof(int));
            dt.Columns.Add("Username", typeof(string));
            dt.Columns.Add("Password", typeof(string));
            dt.Rows.Add(new object[] {1,"Testuser","abcdef"});
            Session["data"] = dt;
        }
        else
        {
            dt = Session["data"] as DataTable;
        }

        ASPxGridView1.DataSource = dt;
        ASPxGridView1.DataBind();
    }

    protected void confirmButton_Click(object sender, EventArgs e)
    {
        UpdatePasswordField(cnpsw.Text);
        ASPxPopupControl1.ShowOnPageLoad = false;
    }

    protected void UpdatePasswordField(string newPassword)
    {
        int index = ASPxGridView1.EditingRowVisibleIndex;
        DataTable dt = Session["data"] as DataTable;
        dt.Rows[index]["Password"] = newPassword;
        Session["data"] = dt;

    }
    protected void ASPxGridView1_DataBound(object sender, EventArgs e)
    {

    }

    protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.Cancel = true;
        DataTable dt = Session["data"] as DataTable;
        int test1 = Convert.ToInt32(e.NewValues["ID"]);
        string test2 = e.NewValues["Username"].ToString();
        string test3 = e.NewValues["Password"].ToString();
        dt.Rows.Add(new object[] {Convert.ToInt32(e.NewValues["ID"]), e.NewValues["Username"].ToString(), e.NewValues["Password"].ToString() });
        Session["data"] = dt;
        ((ASPxGridView)sender).CancelEdit();
    }

    protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.Cancel = true;
        int index = ((ASPxGridView)sender).EditingRowVisibleIndex;
        DataTable dt = Session["data"] as DataTable;
        dt.Rows[index]["ID"] = e.NewValues["ID"];
        dt.Rows[index]["Username"] = e.NewValues["Username"];
        Session["data"] = dt;
        ((ASPxGridView)sender).CancelEdit();
    }
}
