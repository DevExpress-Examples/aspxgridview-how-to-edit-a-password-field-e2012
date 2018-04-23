Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim dt As New DataTable()
        If Session("data") Is Nothing Then
            dt.Columns.Add("ID", GetType(Integer))
            dt.Columns.Add("Username", GetType(String))
            dt.Columns.Add("Password", GetType(String))
            dt.Rows.Add(New Object() {1,"Testuser","abcdef"})
            Session("data") = dt
        Else
            dt = TryCast(Session("data"), DataTable)
        End If

        ASPxGridView1.DataSource = dt
        ASPxGridView1.DataBind()
    End Sub

    Protected Sub confirmButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        UpdatePasswordField(cnpsw.Text)
        ASPxPopupControl1.ShowOnPageLoad = False
    End Sub

    Protected Sub UpdatePasswordField(ByVal newPassword As String)
        Dim index As Integer = ASPxGridView1.EditingRowVisibleIndex
        Dim dt As DataTable = TryCast(Session("data"), DataTable)
        dt.Rows(index)("Password") = newPassword
        Session("data") = dt

    End Sub
    Protected Sub ASPxGridView1_DataBound(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

    Protected Sub ASPxGridView1_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.Cancel = True
        Dim dt As DataTable = TryCast(Session("data"), DataTable)
        Dim test1 As Integer = Convert.ToInt32(e.NewValues("ID"))
        Dim test2 As String = e.NewValues("Username").ToString()
        Dim test3 As String = e.NewValues("Password").ToString()
        dt.Rows.Add(New Object() {Convert.ToInt32(e.NewValues("ID")), e.NewValues("Username").ToString(), e.NewValues("Password").ToString() })
        Session("data") = dt
        DirectCast(sender, ASPxGridView).CancelEdit()
    End Sub

    Protected Sub ASPxGridView1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
        e.Cancel = True
        Dim index As Integer = DirectCast(sender, ASPxGridView).EditingRowVisibleIndex
        Dim dt As DataTable = TryCast(Session("data"), DataTable)
        dt.Rows(index)("ID") = e.NewValues("ID")
        dt.Rows(index)("Username") = e.NewValues("Username")
        Session("data") = dt
        DirectCast(sender, ASPxGridView).CancelEdit()
    End Sub
End Class
