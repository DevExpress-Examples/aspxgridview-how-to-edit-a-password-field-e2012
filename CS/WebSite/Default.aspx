<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ register Assembly="DevExpress.Web.v13.1, Version=13.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ register Assembly="DevExpress.Web.v13.1, Version=13.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ register Assembly="DevExpress.Web.v13.1, Version=13.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="ID" 
        ClientInstanceName="grid" OnRowInserting="ASPxGridView1_RowInserting" OnRowUpdating="ASPxGridView1_RowUpdating">
        <columns>
            <dx:gridviewcommandcolumn VisibleIndex="0">
                <editbutton Visible="True">
                </editbutton>
                <newbutton Text="Add user" Visible="True">
                </newbutton>
            </dx:gridviewcommandcolumn>
            <dx:gridviewdatatextcolumn Caption="User ID" FieldName="ID" VisibleIndex="1">
            </dx:gridviewdatatextcolumn>
            <dx:gridviewdatatextcolumn Caption="User Name" FieldName="Username" VisibleIndex="2">
            </dx:gridviewdatatextcolumn>
            <dx:gridviewdatatextcolumn FieldName="Password" VisibleIndex="3">
                <propertiestextedit Password="True" ClientInstanceName="psweditor">
                </propertiestextedit>
                <edititemtemplate>
                    <dx:aspxtextbox ID="pswtextbox" runat="server" Text='<%# Bind("Password") %>' 
                        Visible='<%# ASPxGridView1.IsNewRowEditing %>' Password="True">
                        <clientsideevents Validation="function(s,e){e.isValid = s.GetText()>5;}" />
                    </dx:aspxtextbox>
                    <asp:linkbutton ID="LinkButton1" runat="server" OnClientClick="popup.ShowAtElement(this); return false;" Visible='<%#!ASPxGridView1.IsNewRowEditing%>'>Edit password</asp:linkbutton>
                </edititemtemplate>
            </dx:gridviewdatatextcolumn>
        </columns>
        </dx:aspxgridview>
        <dx:aspxpopupcontrol ID="ASPxPopupControl1" runat="server" HeaderText="Edit password" Width="307px" ClientInstanceName="popup">
            <contentcollection>
                <dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol1" runat="server">
                <table>
                  <tr>
                    <td>Enter new password:</td>
                    <td>
                      <dx:aspxtextbox ID="npsw" runat="server" Password="True"  ClientInstanceName="npsw">
                          <clientsideevents Validation="function(s, e) {e.isValid = (s.GetText().length&gt;5)}" />
                          <validationsettings ErrorDisplayMode="ImageWithTooltip" ErrorText="The password lengt should be more that 6 symbols">
                          </validationsettings>
                      </dx:aspxtextbox>
                    </td>
                  </tr>
                  <tr>
                    <td>Confirm new password:</td>
                    <td>
                      <dx:aspxtextbox ID="cnpsw" runat="server" Password="True" ClientInstanceName="cnpsw">
                          <clientsideevents Validation="function(s, e) {e.isValid = (s.GetText() == npsw.GetText());}" />
                          <validationsettings ErrorDisplayMode="ImageWithTooltip" ErrorText="The password is incorrect">
                          </validationsettings>
                      </dx:aspxtextbox>
                    </td>
                  </tr>
                </table>
                <dx:aspxbutton ID="confirmButton" runat="server" Text="Ok" AutoPostBack="False" OnClick="confirmButton_Click">
                   
                </dx:aspxbutton>
                
                </dx:popupcontrolcontentcontrol>
            </contentcollection>
        </dx:aspxpopupcontrol>
    </div>
    </form>
</body>
</html>

