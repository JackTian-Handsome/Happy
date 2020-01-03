<%@ Page Language="C#" MasterPageFile="~/PopupPage.master" AutoEventWireup="true"
    CodeFile="AddLine.aspx.cs" Inherits="AddLine" Title="" %>

<%@ Register Assembly="Ctil.Web.UI.WebControls.Basic" Namespace="Ctil.Web.UI.WebControls.Basic"
    TagPrefix="ctil" %>
<%@ Register TagPrefix="pmsFooter" TagName="PMSFooter" Src="~/PMSGridFooter.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Ctil.Web.UI.WebControls.Basic" Namespace="Ctil.Web.UI.WebControls.Basic.DataBinders"
    TagPrefix="ctil" %>
<%@ Register TagPrefix="loader" TagName="Loader" Src="~/UserContorls/Loader.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <loader:Loader ID="Loader2" runat="server" AssociatedUpdatePanelID="UpdatePanel1" />
    <loader:Loader ID="Loader1" runat="server" AssociatedUpdatePanelID="UpdatePanel2" />
    <loader:Loader ID="Loader3" runat="server" AssociatedUpdatePanelID="UpdatePanel3" />
    <loader:Loader ID="Loader4" runat="server" AssociatedUpdatePanelID="UpdatePanel4" />
    <loader:Loader ID="Loader5" runat="server" AssociatedUpdatePanelID="UpdatePanel5" />
    <loader:Loader ID="Loader6" runat="server" AssociatedUpdatePanelID="UpdatePanel6" />
    <loader:Loader ID="Loader7" runat="server" AssociatedUpdatePanelID="UpdatePanel7" />

    <div class="Section">
        <ctil:ExDataBinder ID="DataBinder" runat="server">
        </ctil:ExDataBinder>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:ValidationSummary ID="vsErrorSummary" runat="server" ValidationGroup="linemaint" />
                <asp:Label ID="lblBusinessErrorSummary" runat="server" Text="" ForeColor="Red"></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnClose" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <div class="Section">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td height="35" width="300" style="padding-left: 10px">
                            <asp:Label ID="lblLineCode" runat="server" Text="<%$ Resources:LabelResource,LINE_CODE%>"
                                CssClass="MLabel"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:LabelResource,COLON%>"
                                CssClass="MLabel"></asp:Label>
                        </td>
                        <td width="400">
                            <ctil:ExTextBox ID="txtLineCode" runat="server" MaxLength="3" Width="100px" AddActionMode="Normal"
                                EditActionMode="Disable" BinderName="DataBinder" DataFieldName="LineCode"></ctil:ExTextBox>
                            <ctil:ExValidatorRequiredField ID="rfvLineCode" runat="server" ControlToValidate="txtLineCode"
                                ErrorMessage="<%$Resources:ErrorResource, ERR002 %>" ValidationGroup="linemaint"
                                Display="None"></ctil:ExValidatorRequiredField>
                            <ctil:ExValidatorParameterList ID="ExValidatorParameterList1" ValidatorToPass="rfvLineCode"
                                runat="server">
                                <ctil:ExValidatorParameter ID="ExValidatorParameter1" runat="server" Text="<%$ Resources:LabelResource,LINE_CODE%>"></ctil:ExValidatorParameter>
                            </ctil:ExValidatorParameterList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px" height="35">
                            <asp:Label ID="lblEnDesc" runat="server" Text="<%$ Resources:LabelResource,ENGLISH_LINE_DESCRIPTION%>"
                                CssClass="MLabel"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:LabelResource,COLON%>"
                                CssClass="MLabel"></asp:Label>
                        </td>
                        <td>
                            <ctil:ExTextBox ID="txtEnDesc" runat="server" MaxLength="40" Width="300px" BinderName="DataBinder"
                                DataFieldName="EnDesc"></ctil:ExTextBox>
                            <ctil:ExValidatorRequiredField ID="rfvEnDesc" runat="server" ControlToValidate="txtEnDesc"
                                ErrorMessage="<%$Resources:ErrorResource, ERR002 %>" ValidationGroup="linemaint"
                                Display="None"></ctil:ExValidatorRequiredField>
                            <ctil:ExValidatorParameterList ID="ExValidatorParameterList2" ValidatorToPass="rfvEnDesc"
                                runat="server">
                                <ctil:ExValidatorParameter ID="ExValidatorParameter2" runat="server" Text="<%$ Resources:LabelResource,ENGLISH_LINE_DESCRIPTION%>"></ctil:ExValidatorParameter>
                            </ctil:ExValidatorParameterList>
                        </td>
                    </tr>
                    <tr>
                        <td height="35" style="padding-left: 10px">
                            <asp:Label ID="lblZhDesc" runat="server" Text="<%$ Resources:LabelResource,TRADITIONAL_CHINESE_LINE_DESCRIPTION%>"></asp:Label>
                            <asp:Label ID="lblColon3" runat="server" Text="<%$ Resources:LabelResource,COLON%>"></asp:Label>
                        </td>
                        <td>
                            <ctil:ExTextBox ID="txtZhDesc" runat="server" MaxLength="40" Width="300px" BinderName="DataBinder"
                                DataFieldName="ZhDesc"></ctil:ExTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td height="35" style="padding-left: 10px">
                            <asp:Label ID="lblGbDesc" runat="server" Text="<%$ Resources:LabelResource,SIMPLIFIED_CHINESE_LINE_DESCRIPTION%>"></asp:Label>
                            <asp:Label ID="lblColon4" runat="server" Text="<%$ Resources:LabelResource,COLON%>"></asp:Label>
                        </td>
                        <td>
                            <ctil:ExTextBox ID="txtGbDesc" runat="server" MaxLength="40" Width="300px" BinderName="DataBinder"
                                DataFieldName="GbDesc"></ctil:ExTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="Section">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td>
                            <div class="GridOutterHeader">
                                <asp:Label ID="lblRes" runat="server" Text="<%$Resources:LabelResource,RESPONSIBLE_STAFF%>"
                                    CssClass="MLabel"></asp:Label>
                            </div>
                            <asp:Panel ID="pnlGrid" runat="server">
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                    <ContentTemplate>
                                        <ctil:ExGridView ID="ExGridSkLineResp" runat="server" AutoGenerateColumns="False"
                                            Width="100%" OnExGridViewSort="OnExGridDevelopmentSort" DefaultSortField="line_code" OnExGridControlBinding="ExGridControlBinding"
                                            OnExGridModeChanged="exGridSkLineResp_GridModeChanged">
                                            <HeaderStyle CssClass="GridHeader" />
                                            <RowStyle CssClass="GridRow" />
                                            <AlternatingRowStyle CssClass="GridAtlRow" />
                                            <Columns>
                                                <ctil:ExGridViewEditField FieldId="EditField" DisplayControlType="ExGridFieldEditButton"
                                                    EditControlType="ExGridFieldCancelButton" AddControlType="ExGridFieldCancelAddButton"
                                                    ImageUrlNormal="~/Images/edit.png" ImageUrlEdit="~/Images/undo.png" ImageUrlAdd="~/Images/file_delete.png"
                                                    HeaderText="<%$ Resources:LabelResource, ACTION_EDIT%>" AllowSorting="False">
                                                </ctil:ExGridViewEditField>
                                                <ctil:ExGridViewRemoveField FieldId="RemoveField" AddControlType="ExGridFieldRemoveCheckBox"
                                                    DisplayControlType="ExGridFieldRemoveCheckBox" EditControlType="ExGridFieldRemoveCheckBox"
                                                    HeaderText="<%$ Resources:LabelResource, ACTION_DELETE%>" AllowSorting="False"
                                                    AutoPostBack="true">
                                                </ctil:ExGridViewRemoveField>
                                                <ctil:ExGridViewField FieldId="StaffNameField" DisplayField="StaffName" EditField="UserId"
                                                    AddField="UserId" HeaderText="<%$ Resources:LabelResource,STAFF%>" AllowSorting="true"
                                                    SortExpression="staff_name" DisplayControlType="ExGridFieldLabel" LookupDisplayField="StaffName"
                                                    LookupDataField="UserId" LookupSourceName="UserSource" EditControlType="ExGridFieldReadonlyTextBox"
                                                    AddControlType="ExGridFieldDropDownList" HeaderStyle-Width="50%" ControlStyle-Width='340px' IsAutoExtend="true">
                                                    <ExGridFieldValidatorTemplates>
                                                        <ctil:ExGridFieldRequiredFieldValidatorTemplate ValidationGroup="linemaint" Display="None"
                                                            ErrorMessage="<%$ Resources:ErrorResource, ERR051%>" />
                                                    </ExGridFieldValidatorTemplates>
                                                </ctil:ExGridViewField>
                                                <ctil:ExGridViewField FieldId="SubNatureDescID" DisplayField="SubNatureDesc" EditField="SubNatureDesc"
                                                    AddField="SubNatureCode" DisplayControlType="ExGridFieldLabel" EditControlType="ExGridFieldReadonlyTextBox"
                                                    AddControlType="ExGridFieldDropDownList" HeaderText="<%$ Resources:LabelResource, SUB_NATURE%>"
                                                    AllowSorting="True" SortExpression="sub_nature_desc" AutoPostBack="false" HeaderStyle-Width="50%"
                                                    LookupDisplayField="PropertySubNatureDisp" LookupDataField="SubNatureCode" ControlStyle-Width='340px' LookupSourceName="SubNatureCodeSource" IsAutoExtend="true">
                                                    <ExGridFieldValidatorTemplates>
                                                        <ctil:ExGridFieldRequiredFieldValidatorTemplate ValidationGroup="linemaint" Display="None"
                                                            ErrorMessage="<%$ Resources:ErrorResource, ERR051%>" />
                                                    </ExGridFieldValidatorTemplates>
                                                </ctil:ExGridViewField>
                                            </Columns>
                                        </ctil:ExGridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:Panel>
                            <div class="GridOutterFooter">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <%-- <pmsFooter:PMSFooter ID="gridFooter" runat="server" OnFooterButtonEvent="gridFooter_FooterButton" />--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnAdd" runat="server" Text="<%$ Resources:LabelResource, ACTION_ADD_NEW%>"
                                        Width="70px" OnClick="AddCallBack" CssClass="Button" />
                                    <asp:Button ID="btnDelete" runat="server" Text="<%$ Resources:LabelResource, ACTION_DELETE %>"
                                        Width="70px" ValidationGroup="grid" OnClick="DeleteCallBack" CssClass="Button" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="Section" style="text-align: right; vertical-align: middle">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <table style="padding-bottom: 4;" width="100%">
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:LabelResource, ACTION_SAVE%>"
                                Width="70px" ValidationGroup="linemaint" OnClick="SaveCallBack" CssClass="Button" />
                            <asp:Button ID="btnClose" runat="server" Text="<%$ Resources:LabelResource, ACTION_CLOSE%>"
                                OnClick="CloseCallBack" CausesValidation="false" Width="70px" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
