<%@ Page Title="Add Mall" Language="C#" MasterPageFile="~/PopupPage.master" AutoEventWireup="true" CodeFile="AddMall.aspx.cs" Inherits="AddMall" %>
<%@ Register Assembly="Ctil.Web.UI.WebControls.Basic" Namespace="Ctil.Web.UI.WebControls.Basic"
    TagPrefix="ctil" %>
<%@ Register    Assembly="AjaxControlToolkit"    Namespace="AjaxControlToolkit"    TagPrefix="ajaxToolkit" %>
<%@ Register assembly="Ctil.Web.UI.WebControls.Basic" namespace="Ctil.Web.UI.WebControls.Basic.DataBinders" tagprefix="ctil" %>
<%@ Register TagPrefix="loader" TagName ="Loader" Src="~/UserContorls/Loader.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<loader:Loader ID="Loader1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" />
<loader:Loader ID="Loader2" runat="server" AssociatedUpdatePanelID="UpdatePanel2" />
<loader:Loader ID="Loader3" runat="server" AssociatedUpdatePanelID="UpdatePanel4" />
<script language="javascript">
    function CheckBoxIfChecked(src, arg) {
        var cbGross = document.getElementById("<%= cbGross.ClientID %>");
        var cbNet = document.getElementById("<%= cbNet.ClientID %>");
        if (!cbGross.checked && !cbNet.checked) {
            arg.IsValid = false;
        }
        else {
            arg.IsValid = true;
        }
        
    }
</script>
<div class="Section">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional"> 
            <ContentTemplate >

               <asp:ValidationSummary ID="vsErrorSummary" runat="server" 
                  ValidationGroup="mallmaint" />
               <asp:Label ID="lblBusinessErrorSummary" runat="server" Text="" ForeColor = "Red"></asp:Label>    
                        
            </ContentTemplate> 
                <Triggers>
                  <%-- <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />--%>
                </Triggers>
            </asp:UpdatePanel>
            </div>
            
                <div class="Section">
                <ctil:ExDataBinder ID="DataBinder" runat="server"></ctil:ExDataBinder>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate >
                <table cellpadding="0" cellspacing="0" width="97%" style="padding:3px 8px 3px 8px">
                    <tr>
                        <td width="40%">
                            <asp:Label ID="lblMallNo" runat="server" Text="<%$ Resources:LabelResource,MALL_NO%>" CssClass="MLabel"></asp:Label>:
                        </td>
                        <td width="60%">
                        <ctil:ExTextBox ID="txtMallNo" CssClass="TextBox" runat="server" Width="30px" MaxLength="2" AddActionMode="Normal" EditActionMode="Hidden" BinderName="DataBinder" DataFieldName="MallNo" ></ctil:ExTextBox>
                        <ctil:ExReadonlyTextBox ID="txtMallNoReadOnly" runat="server" Width="30px" MaxLength="2" DataFieldName="MallNo" BinderName="DataBinder" CssClass="pms_textbox_readonly" EditActionMode="Normal" AddActionMode="Hidden"></ctil:ExReadonlyTextBox>
                        <ctil:ExValidatorRequiredField ID="rfvSmMallNo" runat="server" ControlToValidate="txtMallNo" ErrorMessage="<%$Resources:ErrorResource, ERR002 %>" ValidationGroup="mallmaint"  Display="None"></ctil:ExValidatorRequiredField>
                                <ctil:ExValidatorParameterList ID="ExValidatorParameterList1" ValidatorToPass="rfvSmMallNo" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter1" runat="server" Text="<%$ Resources:LabelResource,MALL_NO_NO_DOT%>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                                    <ctil:ExValidatorRegularExpression ID="RegExpSmMallNo" runat="server" ControlToValidate="txtMallNo" ErrorMessage="<%$Resources:ErrorResource, ERR019 %>" ValidationGroup="mallmaint"  Display="None" ValidationExpression="<%$Resources:GeneralResource, REG_INT_POSITIVE %>"></ctil:ExValidatorRegularExpression>
                                     <ctil:ExValidatorParameterList ID="ExValidatorParameterList2" ValidatorToPass="RegExpSmMallNo" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter2" runat="server" Text="<%$ Resources:LabelResource,MALL_NO%>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                        </td>
                        </tr>
                        <tr>
                        <td width="40%">
                            <asp:Label ID="lblSiteNo" runat="server" Text="<%$ Resources:LabelResource,SITE%>" CssClass="MLabel"></asp:Label>:
                        </td>
                        <td width="60%">
                            <ctil:ExDropDownList ID="ddlSiteNo" runat="server" BinderName="DataBinder" CssClass="DropDownList" AddActionMode="Normal" EditActionMode="Disable" DataFieldName="SiteNo" DataTextField="EnLongDesc" DataValueField="SmSiteNo" LookupSourceName="SiteSource" Width="505px"></ctil:ExDropDownList>
                                            <ctil:ExValidatorRequiredField ID="ExRfvSite" runat="server" ControlToValidate="ddlSiteNo"
                                                ErrorMessage="<%$Resources:ErrorResource, ERR003 %>" ValidationGroup="mallmaint"
                                                Display="None"></ctil:ExValidatorRequiredField>
                                            <ctil:ExValidatorParameterList ID="ExVpLstSite" ValidatorToPass="ExRfvSite"
                                                runat="server">
                                                <ctil:ExValidatorParameter ID="ExVpSite" runat="server" Text="<%$Resources:LabelResource, SITE %>"></ctil:ExValidatorParameter>
                                            </ctil:ExValidatorParameterList>
                        </td>
                        </tr>
                    
                    <tr>
                        <td>
                             <asp:Label ID="lblRentalDevCode" runat="server" CssClass="MLabel" Text="<%$Resources:LabelResource, RENTAL_DEV_CODE %>"></asp:Label>:
                        </td>
                        
                        <td>
                             <ctil:ExDropDownList ID="ddlRentalDevCode" runat="server" Width="505px" BinderName="DataBinder" CssClass="DropDownList" DataFieldName="RentalDevCode" DataTextField="EnLongDesc" DataValueField="DevCode" LookupSourceName="DevSource" ></ctil:ExDropDownList>
                            <ctil:ExValidatorRequiredField ID="ExRfvRentalDevCode" runat="server" ControlToValidate="ddlRentalDevCode"
                                                ErrorMessage="<%$Resources:ErrorResource, ERR003 %>" ValidationGroup="mallmaint"
                                                Display="None"></ctil:ExValidatorRequiredField>
                                            <ctil:ExValidatorParameterList ID="ExValidatorParameterList3" ValidatorToPass="ExRfvRentalDevCode"
                                                runat="server">
                                                <ctil:ExValidatorParameter ID="ExValidatorParameter3" runat="server" Text="<%$Resources:LabelResource, RENTAL_DEV_CODE %>"></ctil:ExValidatorParameter>
                                            </ctil:ExValidatorParameterList>
                        </td>
                        </tr>
                        <tr>
                        
                        <td>
                            <asp:Label ID="lblServiceDevCode" runat="server" CssClass="MLabel"  Text="<%$Resources:LabelResource, SERVICE_DEV_CODE %>"></asp:Label>:
                        </td>
                        
                        <td>
                         <ctil:ExDropDownList ID="ddlServiceDevCode" runat="server" Width="505px" BinderName="DataBinder" CssClass="DropDownList" DataFieldName="ServiceDevCode" DataTextField="EnLongDesc" DataValueField="DevCode" LookupSourceName="DevSource" ></ctil:ExDropDownList>
                            <ctil:ExValidatorRequiredField ID="ExRfvServiceDevCode" runat="server" ControlToValidate="ddlServiceDevCode"
                                                ErrorMessage="<%$Resources:ErrorResource, ERR003 %>" ValidationGroup="mallmaint"
                                                Display="None"></ctil:ExValidatorRequiredField>
                                            <ctil:ExValidatorParameterList ID="ExValidatorParameterList4" ValidatorToPass="ExRfvServiceDevCode"
                                                runat="server">
                                                <ctil:ExValidatorParameter ID="ExValidatorParameter4" runat="server" Text="<%$Resources:LabelResource, SERVICE_DEV_CODE %>"></ctil:ExValidatorParameter>
                                            </ctil:ExValidatorParameterList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="lblEnDesc" runat="server" CssClass="MLabel"  Text="<%$Resources:LabelResource, MALL_DESC_EN %>"></asp:Label>:
                        </td>
                        
                        <td>
                             <ctil:ExTextBox ID="txtEnDesc" CssClass="TextBox" runat="server" Width="500px" MaxLength="40"  BinderName="DataBinder" DataFieldName="EnDesc" ></ctil:ExTextBox>
                             <ctil:ExValidatorRequiredField ID="ExRfvEnDesc" runat="server" ControlToValidate="txtEnDesc" ErrorMessage="<%$Resources:ErrorResource, ERR002 %>" ValidationGroup="mallmaint"  Display="None"></ctil:ExValidatorRequiredField>
                                <ctil:ExValidatorParameterList ID="ExValidatorParameterList5" ValidatorToPass="ExRfvEnDesc" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter5" runat="server" Text="<%$ Resources:LabelResource,MALL_DESC_EN%>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="lblZhDesc" runat="server" CssClass="Label"  Text="<%$Resources:LabelResource, MALL_DESC_ZH %>"></asp:Label>:
                        </td>
                        
                        <td >
                             <ctil:ExTextBox ID="txtZhDesc" CssClass="TextBox" runat="server" Width="500px" MaxLength="40"  BinderName="DataBinder" DataFieldName="ZhDesc" ></ctil:ExTextBox>
                             
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="lblGbDesc" runat="server" CssClass="Label"  Text="<%$Resources:LabelResource, MALL_DESC_GB %>"></asp:Label>:
                        </td>
                        
                        <td >
                             <ctil:ExTextBox ID="txtGbDesc" CssClass="TextBox" runat="server" Width="500px" MaxLength="40"  BinderName="DataBinder" DataFieldName="GbDesc" ></ctil:ExTextBox>
                             
                        </td>
                    </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" width="97%">
                    <tr>
                        <td colspan="2"  height="40" valign="bottom">
                           <asp:Label ID="lblFree" runat="server" Text="<%$Resources:LabelResource, FOR_NOTICE_OF_TERM %>" CssClass="MLabel"></asp:Label>
                        </td>
                    </tr>
                   </table>
                   <table cellpadding="0" cellspacing="0" width="97%"  style="border-style:solid;border-width:3px;border-color:#B5C5EE; padding:5px">
                    <tr>
                    
                        <td width="40%">
                            <asp:Label ID="lblMgrName" runat="server" Text="<%$Resources:LabelResource, MALL_MGR_NAME %>" CssClass="MLabel"></asp:Label>:
                        </td>
                        
                        <td width="60%">
                            <ctil:ExTextBox ID="txtMgrName" CssClass="TextBox" runat="server" Width="500px" MaxLength="50"  BinderName="DataBinder" DataFieldName="MgrName" ></ctil:ExTextBox>
                             <ctil:ExValidatorRequiredField ID="ExRfvMgrName" runat="server" ControlToValidate="txtMgrName" ErrorMessage="<%$Resources:ErrorResource, ERR002 %>" ValidationGroup="mallmaint"  Display="None"></ctil:ExValidatorRequiredField>
                                <ctil:ExValidatorParameterList ID="ExValidatorParameterList6" ValidatorToPass="ExRfvMgrName" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter6" runat="server" Text="<%$ Resources:LabelResource,MALL_MGR_NAME%>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                        </td>
                       
                        </tr>
                        <tr>
                        
                        <td>
                            <asp:Label ID="lblMgrTitle" runat="server" Text="<%$Resources:LabelResource, MALL_MGR_TITLE %>" CssClass="MLabel"></asp:Label>:
                        </td>
                        
                        <td >
                            <ctil:ExTextBox ID="txtMgrTitle" CssClass="TextBox" runat="server" Width="500px" MaxLength="50"  BinderName="DataBinder" DataFieldName="MgrTitle" ></ctil:ExTextBox>
                             <ctil:ExValidatorRequiredField ID="ExRfvMgrTitle" runat="server" ControlToValidate="txtMgrTitle" ErrorMessage="<%$Resources:ErrorResource, ERR002 %>" ValidationGroup="mallmaint"  Display="None"></ctil:ExValidatorRequiredField>
                                <ctil:ExValidatorParameterList ID="ExValidatorParameterList7" ValidatorToPass="ExRfvMgrTitle" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter7" runat="server" Text="<%$ Resources:LabelResource,MALL_MGR_TITLE%>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                        </td>
                    </tr>
                   
                    
                    </table>
                    <table cellpadding="0" cellspacing="0" width="97%">
                    <tr>
                        <td width="100%" height="40" valign="bottom">
                           <asp:Label ID="lblCom" runat="server" Text="<%$Resources:LabelResource, FOR_COMM_FACT_SHEET %>" CssClass="MLabel"></asp:Label>
                        </td>
                    </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" width="97%" style="border-style:solid;border-width:3px;border-color:#B5C5EE; padding:5px">
                    <tr>
                        <td width="40%">
                            <asp:Label ID="lblAirLabel" runat="server" Text="<%$Resources:LabelResource, AIR_LABEL %>" CssClass="MLabel"></asp:Label>:
                        </td>
                        
                        <td width="60%" >
                             <ctil:ExTextBox ID="txtAirLabel" CssClass="TextBox" runat="server" Width="500px" MaxLength="50"  BinderName="DataBinder" DataFieldName="AirLabel" ></ctil:ExTextBox>
                             <ctil:ExValidatorRequiredField ID="ExRfvAirLabel" runat="server" ControlToValidate="txtAirLabel" ErrorMessage="<%$Resources:ErrorResource, ERR002 %>" ValidationGroup="mallmaint"  Display="None"></ctil:ExValidatorRequiredField>
                                <ctil:ExValidatorParameterList ID="ExValidatorParameterList8" ValidatorToPass="ExRfvAirLabel" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter8" runat="server" Text="<%$ Resources:LabelResource,AIR_LABEL%>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                        </td>
                        </tr>
                        <tr>
                        
                        <td>
                            <asp:Label ID="lblMgtLabel" runat="server" Text="<%$Resources:LabelResource, MGT_LABEL %>" CssClass="MLabel"></asp:Label>:
                        </td>
                        
                        <td>
                             <ctil:ExTextBox ID="txtMgtLabel" CssClass="TextBox" runat="server" Width="500px" MaxLength="50"  BinderName="DataBinder" DataFieldName="MgtLabel" ></ctil:ExTextBox>
                             <ctil:ExValidatorRequiredField ID="ExRfvMgtLabel" runat="server" ControlToValidate="txtMgtLabel" ErrorMessage="<%$Resources:ErrorResource, ERR002 %>" ValidationGroup="mallmaint"  Display="None"></ctil:ExValidatorRequiredField>
                                <ctil:ExValidatorParameterList ID="ExValidatorParameterList9" ValidatorToPass="ExRfvMgtLabel" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter9" runat="server" Text="<%$ Resources:LabelResource,MGT_LABEL%>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="lblShowPromoFee" runat="server" Text="<%$Resources:LabelResource, SHOW_PROMO_FEE %>" CssClass="MLabel"></asp:Label>:
                        </td>
                        
                        <td>
                            <asp:RadioButtonList ID="rblShowPromoFee" runat="server" 
                            RepeatDirection="Horizontal" Width="200px">
                                <asp:ListItem Value="Y" Selected="True" Text="<%$Resources:LabelResource, YES %>"></asp:ListItem>
                                <asp:ListItem Value="N" Text="<%$Resources:LabelResource, NO %>"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" width="97%" style="padding: 3px 8px 3px 8px"> 
                    <tr>
                        <td colspan="2"><br /></td>
                    </tr>
                    <tr>
                        <td width="40%">
                            <asp:Label ID="lblShowArea" runat="server" Text="<%$Resources:LabelResource, SHOW_AREA %>" CssClass="MLabel"></asp:Label>:
                        </td>
                        <td width="60%">
                            <ctil:ExCheckBox ID="cbGross" runat="server" Text="<%$Resources:LabelResource, GROSS %>" />
                            <ctil:ExCheckBox ID="cbNet" runat="server" Text="<%$Resources:LabelResource, NET %>" />
                             <ctil:ExValidatorCustom ID="ExValidatorCustomGrossNetCheckbox" runat="server" 
                                 ClientValidationFunction="CheckBoxIfChecked" ValidationGroup="mallmaint"  Display="None" ErrorMessage="<%$Resources:ErrorResource, ERR003%>"></ctil:ExValidatorCustom>
                              <ctil:ExValidatorParameterList ID="ExValidatorParameterList12" ValidatorToPass="ExValidatorCustomGrossNetCheckbox" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter13" runat="server" Text="<%$ Resources:LabelResource, EITHER_GROSS_OR_NET %>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                            <%--<asp:RadioButtonList ID="rblShowArea" runat="server" 
                                 RepeatDirection="Horizontal" Width="185px">
                                 <asp:ListItem Value="Y" Selected="True" Text="<%$Resources:LabelResource, GROSS %>"></asp:ListItem>
                                 <asp:ListItem Value="N" Text="<%$Resources:LabelResource, NET %>"></asp:ListItem>
                             </asp:RadioButtonList>--%>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="lblNTQ" runat="server" Text="<%$Resources:LabelResource, NTQ_TEMPLATE %>" CssClass="Label"></asp:Label>:
                        </td>
                        
                        <td>
                            <asp:FileUpload  ID="fuNTQTemplateId"  runat="server" Width="505px"/>
                            <ctil:ExValidatorCustom ID="ExValidatorNTQTemplateExt" runat="server" ControlToValidate="fuNTQTemplateId" 
                                OnServerValidate="ValidateNTQTemplateExt" ValidateEmptyText="true" ErrorMessage="<%$Resources:ErrorResource, ERR048%>" 
                    ValidationGroup="mallmaint"  Display="None">
                    
                          </ctil:ExValidatorCustom>
                          <ctil:ExValidatorParameterList ID="ExValidatorParameterList10" ValidatorToPass="ExValidatorNTQTemplateExt" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter10" runat="server" Text="<%$ Resources:LabelResource,WORD_DOC %>"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                                    <ctil:ExValidatorCustom ID="ExValidatorNTQTemplateId" runat="server" ControlToValidate="fuNTQTemplateId" 
                                        OnServerValidate="ValidateNTQTemplateLength" ValidateEmptyText="true" ErrorMessage="<%$Resources:ErrorResource, ERR030%>" 
                                    ValidationGroup="mallmaint"  Display="None">
                    
                                    </ctil:ExValidatorCustom>
                                    <ctil:ExValidatorParameterList ID="ExValidatorParameterList11" ValidatorToPass="ExValidatorNTQTemplateId" runat="server">
                                        <ctil:ExValidatorParameter ID="ExValidatorParameter11" runat="server" Text="<%$ Resources:LabelResource,NTQ_TEMPLATE %>"></ctil:ExValidatorParameter>
                                         <ctil:ExValidatorParameter ID="ExValidatorParameter12" runat="server" Text="40"></ctil:ExValidatorParameter>
                                    </ctil:ExValidatorParameterList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:LinkButton ID="lblNTQTemplate" runat="server" Text="" Visible="false" ></asp:LinkButton>
                        </td>
                    </tr>
                    </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID ="btnSave" />
                    </Triggers>
                    </asp:UpdatePanel>
                    </div>
                    <div class="Section">
                   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate >
                    <table cellpadding="0" cellspacing="0" width="97%" style="padding:8px">
                    <tr>
                        <td  width="100%" align="right">
                            <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:LabelResource, ACTION_SAVE%>" 
                            onclick="SaveCallBack" Width="70px" ValidationGroup="mallmaint"/>
                            &nbsp;<asp:Button ID="btnClose" runat="server" Text="<%$ Resources:LabelResource, ACTION_CLOSE%>" 
                            onclick="CloseCallBack" CausesValidation="false" Width="70px"  />
                        </td>
                    </tr>
                    </table>
                </ContentTemplate> 
            </asp:UpdatePanel> 
            </div>



</asp:Content>

