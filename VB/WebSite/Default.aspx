<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>How to edit a password field</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="ID"
                ClientInstanceName="grid" OnRowInserting="ASPxGridView1_RowInserting" OnRowUpdating="ASPxGridView1_RowUpdating">
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" />
                    <dx:GridViewDataTextColumn Caption="User ID" FieldName="ID" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="User Name" FieldName="Username" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Password" VisibleIndex="3">
                        <PropertiesTextEdit Password="True" ClientInstanceName="psweditor">
                        </PropertiesTextEdit>
                        <EditItemTemplate>
                            <dx:ASPxTextBox ID="pswtextbox" runat="server" Text='<%#Bind("Password")%>'
                                Visible='<%#ASPxGridView1.IsNewRowEditing%>' Password="True">
                                <ClientSideEvents Validation="function(s,e){e.isValid = s.GetText()>5;}" />
                            </dx:ASPxTextBox>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="popup.ShowAtElement(this); return false;" Visible='<%#Not ASPxGridView1.IsNewRowEditing%>'>Edit password</asp:LinkButton>
                        </EditItemTemplate>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsCommandButton>
                    <NewButton Text="Add user" />
                </SettingsCommandButton>
            </dx:ASPxGridView>
            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Edit password" Width="307px" ClientInstanceName="popup">
                <ContentCollection>
                    <dx:PopupControlContentControl ID="Popupcontrolcontentcontrol1" runat="server">
                        <table>
                            <tr>
                                <td>Enter new password:</td>
                                <td>
                                    <dx:ASPxTextBox ID="npsw" runat="server" Password="True" ClientInstanceName="npsw">
                                        <ClientSideEvents Validation="function(s, e) {e.isValid = (s.GetText().length&gt;5)}" />
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="The password lengt should be more that 6 symbols">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm new password:</td>
                                <td>
                                    <dx:ASPxTextBox ID="cnpsw" runat="server" Password="True" ClientInstanceName="cnpsw">
                                        <ClientSideEvents Validation="function(s, e) {e.isValid = (s.GetText() == npsw.GetText());}" />
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="The password is incorrect">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                        <dx:ASPxButton ID="confirmButton" runat="server" Text="Ok" AutoPostBack="False" OnClick="confirmButton_Click">
                        </dx:ASPxButton>

                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
    </form>
</body>
</html>