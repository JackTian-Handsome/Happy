using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using PMSServiceLayer;
using PMSServiceLayer.Service;
using PMSServiceLayer.Object;
using PMSServiceLayer.Constant;
using PMSServiceLayer.Exception;
using PMSWeb.Utility;
using System.Reflection;
using System.Data;
using log4net;
using log4net.Repository.Hierarchy;
using System.IO;
using System.Xml.Serialization;
using PMSWeb.Controls;
using PMSWeb.Constant;
using Ctil.Web.UI.WebControls.Basic.Filters;
using Ctil.Web.UI.WebControls.GridViews.Fields;
using Ctil.Web.UI.WebControls.GridViews.Args;
using Ctil.Web.UI.WebControls.Basic.DataBinders;
using Ctil.Web.UI.WebControls.GridViews;
using System.Web.Configuration;

public partial class AddLine : PMSWeb.Utility.BaseForm
{

    protected static readonly ILog logger = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

    public const string UserSource = "UserSource";
    public const string SubNatureCodeSource = "SubNatureCodeSource";
    public const string EditField = "EditField";
    public const string NatureCodeId = "NatureCode";
    protected const string SkNatureCode = "SkNatureCode";



    #region page event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            this.RegisterPostBackButton(this.btnSave);
            if (!IsPostBack)
            {

                PopUpPage masterPage = this.Master as PopUpPage;
                masterPage.SetTitleText(Resources.LabelResource.TITLE_034);
                //this.Title = Resources.LabelResource.TITLE_034;

                if (this.ActionMode.Equals(PMSWebConstant.ACTION_MODE_EDIT))
                {
                    this.SkLineRespGridItemObject.ClearAll();
                    this.SkLineRespGridItemObject.Pager.PageSize = Int32.MaxValue;
                    this.SkLineRespGridItemObject.Pager.CurrentPage = 1;
                    this.SkLineRespGridItemObject.Pager.SetSortExpression(this.ExGridSkLineResp.DefaultSortField);
                }

                PMSGridViewAdapter.Create(this.ExGridSkLineResp).InitialBindGrid(this.SkLineRespGridItemObject.ItemSkLineResp);
               // gridFooter.setFooter(SkLineRespGridItemObject.Pager, true);


                this.DataBinder.IsDirty = false;
            }
            SetDeleteState();
        }
    }

    protected void SetDeleteState()
    {
        btnDelete.Enabled = !(this.ExGridSkLineResp.IsEdting || this.ExGridSkLineResp.IsEmpty);
    }

    protected void exGridSkLineResp_GridModeChanged(object sender, EventArgs e)
    {
        SetDeleteState();
    }


    #endregion

    #region Base Page Interface

    protected override void OnRetrieveSearchCriteria()
    {
        SmSiteObject smSiteObject = new SmSiteObject();
        SysUserObject sysUserObject = new SysUserObject();
        ArrayList sysUserList = SysUserService.Create().RetriveSysUserAll();
        this.ExGridSkLineResp.SourceBags.Add(AddLine.UserSource, sysUserList);
        this.ExGridSkLineResp.SourceBags.Add(AddLine.UserSource, (ArrayList)sysUserList.Clone());
        sysUserList.Insert(0, new SysUserObject() { UserId = null, StaffName = PMSConstant.DDL_EMPTY_DESC });
        this.DataBinder.SourceBag.Add(AddLine.UserSource, sysUserList);




        this.SubNatureList = PropertySubNatureService.Create().RetrievePropertySubNatureAll();

        ExListFilterCriteriaCollection criterias = new ExListFilterCriteriaCollection();
        criterias.Add(NatureCodeId,this.NatureCode);
        ArrayList subNatureLst = ExListFilter.Create().Filter(this.SubNatureList, criterias);
        subNatureLst.Insert(0, new PropertySubNatureObject() { NatureCode = PMSConstant.DDL_EMPTY_CODE, SubNatureCode = PMSConstant.DDL_EMPTY_CODE, SubNatureDesc = PMSConstant.DDL_ALL_DESC });
        this.ExGridSkLineResp.SourceBags.Add(SubNatureCodeSource, subNatureLst);

        this.DataBinder.SourceBag.Add(SubNatureCodeSource, subNatureLst);


   
   






        this.Search();
    }

    protected override void OnSearch()
    {
        this.SkLineRespGridItemObject.ClearItemSkLineResp();
        this.SkLineRespGridItemObject.Pager.CurrentPage = 1;

        if (this.ActionMode.Equals(PMSWebConstant.ACTION_MODE_EDIT))
        {
            this.SkLineRespGridItemObject.SearchCriteria.LineCode = SkLineObject.LineCode;

        }
        base.OnSearch();

        this.SkLineRespGridItemObject.ClearItemSkLineResp();
        this.SkLineRespGridItemObject.Pager.CurrentPage = 1;
        this.SkLineRespGridItemObject.SearchCriteria.LineCode = SkLineObject.LineCode;

        base.OnSearch();
    }

    protected override void OnRefresh()
    {

        this.SkLineRespGridItemObject = SkLineRespService.Create().RetrieveSkLineRespGridList(this.SkLineRespGridItemObject);
        PMSGridViewAdapter.Create(this.ExGridSkLineResp).InitialBindGrid(this.SkLineRespGridItemObject.ItemSkLineResp);


        if (this.ActionMode.Equals(PMSWebConstant.ACTION_MODE_ADD))
        {
            this.SkLineObject = new SkLineObject();
            this.SkLineObject.LastUpdBy = this.LoginUserObject.UserId;
            this.SkLineObject.CreatedBy = this.LoginUserObject.UserId;

            this.DataBinder.BinderMode = ExBinderMode.Add;
        }
        else if (this.ActionMode.Equals(PMSWebConstant.ACTION_MODE_EDIT))
        {
            this.SkLineObject.LastUpdBy = this.LoginUserObject.UserId;


            this.DataBinder.BinderMode = ExBinderMode.Edit;
        }
        this.DataBinder.InitialDataSource(this.SkLineObject);
        this.DataBinder.Populate();

        base.OnRefresh();
    }

    protected override void OnSave()
    {

        this.lblBusinessErrorSummary.Text = null;
        
        if (Page.IsValid)
        {

            try
            {
                this.SkLineObject = this.DataBinder.BusinessObject as SkLineObject;
                this.SkLineObject.LastUpdBy = this.LoginUserObject.UserId;

                ArrayList skLineRespList = null;
                try
                {
                    skLineRespList = PMSGridViewAdapter.Create(this.ExGridSkLineResp).GetBusinessObjects(LoginUserObject) as ArrayList;
                }
                catch (Exception)
                {
                    skLineRespList = null;
                }

                if (this.ActionMode.Equals(PMSWebConstant.ACTION_MODE_ADD))
                {
                    this.SkLineObject.CreatedBy = this.LoginUserObject.UserId;
                    this.SkLineObject.LastUpdBy = this.LoginUserObject.UserId;

                    this.SkLineObject.Status = PMSConstant.GridObjectStatusInsert;


                    SkLineService.Create().CreateSkLine(this.SkLineObject, skLineRespList);
                }
                else if (this.ActionMode.Equals(PMSWebConstant.ACTION_MODE_EDIT))
                {
                    this.SkLineObject.Status = PMSConstant.GridObjectStatusUpdate;
                    this.SkLineObject.LastUpdBy = this.LoginUserObject.UserId;
                    SkLineService.Create().UpdateSkLine(this.SkLineObject, skLineRespList);
                }


                this.DisablePageLock();
                this.IsUpdated = true;
                this.DataBinder.IsDirty = false;
                this.ScriptHelper.RegisterAlertPopupWithClose(Resources.MessageResource.MSG002);
            }

            catch (PMSException PMSex)
            {
                ErrorMessage.ShowErrMessage(this.lblBusinessErrorSummary, PMSex);

            }
            catch (System.Exception ex)
            {
                logger.Error("", ex);
                ErrorMessage.ShowErrMessage(this.lblBusinessErrorSummary, ex.Message);

            }
        }



        base.OnSave();

    }
    protected override void OnDelete()
    {
        for (int i = 0; i < this.ExGridSkLineResp.Rows.Count; i++)
        {
            if ((this.ExGridSkLineResp.RowActions[i].ActionType == ExGridViewRowActionType.Remove) || (this.ExGridSkLineResp.RowActions[i].ActionType == ExGridViewRowActionType.Delete))
            {
                this.DataBinder.IsDirty = true;
                break;
            }

        }
        this.ExGridSkLineResp.ConfirmRemoveToDelete();
        base.OnDelete();

        this.SetDeleteState();
    }

    protected override void OnAdd()
    {
        PMSGridViewAdapter.Create(this.ExGridSkLineResp).AddNewRow(new SkLineRespObject(this.LoginUserObject.UserId) { NatureCode = this.NatureCode });
        base.OnAdd();
    }


    protected override void OnClose()
    {

        if (this.DataBinder.IsDirty)
            EnablePageLock();
        else
            DisablePageLock();

        this.IsUpdated = false;

        base.OnClose();
    }

    protected void gridFooter_FooterButton(object sender, PMSFooterEventArg e)
    {
        this.SkLineRespGridItemObject.ClearItemSkLineResp();
        PMSGridFooterAdapter.MapFooterEventToPager(this.SkLineRespGridItemObject.Pager, e);
        this.Refresh();
    }


    #endregion


    #region Grid Event

    protected void ExGridControlBinding(object sender, ExGridViewBindEventArgs e)
    {

        //if ((e.Control.GridViewRow[EditField].GridViewCell.Controls[0] as WebControl) == null)
        //{

        //    (e.Control.GridViewRow[EditField].GridViewCell.Controls[0] as WebControl).Visible = false;
            
        //}

        if (this.ExGridSkLineResp.RowActions[e.Row.RowIndex].ActionType == ExGridViewRowActionType.Normal || this.ExGridSkLineResp.RowActions[e.Row.RowIndex].ActionType == ExGridViewRowActionType.Delete ||this.ExGridSkLineResp.RowActions[e.Row.RowIndex].ActionType == ExGridViewRowActionType.Remove  ||this.ExGridSkLineResp.RowActions[e.Row.RowIndex].ActionType == ExGridViewRowActionType.PermenantDelete )
        {
            (e.Control.GridViewRow[EditField].GridViewCell.Controls[0] as Ctil.Web.UI.WebControls.GridViews.Controls.ExGridFieldEditButton).Visible = false;
        }

      

    }

    protected virtual void OnExGridDevelopmentSort(object sender, ExGridViewSortEventArgs e)
    {
        this.SkLineRespGridItemObject.Pager.SetSortExpression(e.GridViewField.SortExpression);
        this.SkLineRespGridItemObject.Pager.CurrentPage = 1;
        this.Search();
    }

    #endregion

    #region Objects Property
    public SkLineObject SkLineObject
    {
        get { return this.SessionBags[PMSSessionConstant.SkLineObject] as SkLineObject; }
        set { this.SessionBags[PMSSessionConstant.SkLineObject] = value; }
    }

    public SkLineRespGridItemObject SkLineRespGridItemObject
    {
        get
        {
            if (this.SessionBags[PMSSessionConstant.SkLineRespGridItemObject] == null)
                this.SessionBags[PMSSessionConstant.SkLineRespGridItemObject] = new SkLineRespGridItemObject();
            return this.SessionBags[PMSSessionConstant.SkLineRespGridItemObject] as SkLineRespGridItemObject;
        }
        set
        {
            this.SessionBags[PMSSessionConstant.SkLineRespGridItemObject] = value;
        }
    }


    public ArrayList SubNatureList
    {
        get { return this.SessionBags[PMSSessionConstant.SubNatures] as ArrayList; }
        set { this.SessionBags[PMSSessionConstant.SubNatures] = value; }
    }

    public string NatureCode
    {
        get {
            SysParamObject sysParamObject = SysParamService.Create().RetriveSystemParamByParamType(new SysParamObject() { ParamTypeCode = PMSConstant.SYS_PARAM_TYPE_SK_NATURE_CODE })[0] as SysParamObject;
            return sysParamObject.ParamValue;
            //return CMAB.CMAB.getAppSettingCMAB(PMSConstant.CMAB_SK_NATURE_CODE);
            //WebConfigurationManager.AppSettings[SkNatureCode].ToString(); 
        }
    }


    #endregion


}
