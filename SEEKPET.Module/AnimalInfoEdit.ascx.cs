using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class AnimalInfoEdit : EasySite.Entities.Modules.PortalModuleBase
    {
        string _filedir = "/Portals/SEEKPETInfo/";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindInfo();
                }
            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
        }


        private void BindInfo()
        {
            //实体基类 
            See_AnimalInfo objSee_AnimalInfo = new See_AnimalInfo();

            //以主键查询数据 
            objSee_AnimalInfo = SqlDataProvider.SqlDataProvider.GetInfoSee_AnimalInfoByUserID(this.UserId);
            if ((objSee_AnimalInfo != null))
            {
                //加载绑定数
                //txtNo.Text = objSee_AnimalInfo.No.ToString();
                txtName.Text = objSee_AnimalInfo.Name.ToString();
                ddlSex.SelectedValue = objSee_AnimalInfo.Sex.ToString();
                txtKind.Text = objSee_AnimalInfo.Kind.ToString();
                txtAge.Text = objSee_AnimalInfo.Age.ToString();
                txtColor.Text = objSee_AnimalInfo.Color.ToString();
                txtDescription.Text = objSee_AnimalInfo.Description.ToString();
                ddlIsImmune.SelectedValue = Convert.ToBoolean(objSee_AnimalInfo.IsImmune) == true ? "是" : "否";
                ddlIsJY.SelectedValue = objSee_AnimalInfo.Par1;
                imgShow.Src = _filedir+objSee_AnimalInfo.Picture.ToString();
                if (objSee_PersonInfo.Code != "")
                {
                    chkHasCode.Checked = true;
                    txtCode.Enabled = false;
                }
                txtCode.Text = objSee_PersonInfo.Code.ToString();
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                See_AnimalInfo objSee_AnimalInfo = new See_AnimalInfo();
                EasySite.Common.Utilities.CBO.InitializeObject(objSee_AnimalInfo, typeof(See_AnimalInfo));

                //绑定更新数据信息

                objSee_AnimalInfo.UserID = this.UserId;

                //objSee_AnimalInfo.No = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtNo.Text);
                objSee_AnimalInfo.Name = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtName.Text);
                objSee_AnimalInfo.Sex = ddlSex.SelectedValue;
                objSee_AnimalInfo.Kind = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtKind.Text);
                objSee_AnimalInfo.Age = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtAge.Text);
                objSee_AnimalInfo.Color = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtColor.Text);
                objSee_AnimalInfo.Description = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtDescription.Text);
                objSee_AnimalInfo.IsImmune = ddlIsImmune.SelectedValue == "是" ? true : false;
                objSee_AnimalInfo.Par1 = ddlIsJY.SelectedValue;
                objSee_AnimalInfo.Picture = hidImgName.Value;

                objSee_AnimalInfo.CreateTime = DateTime.Now;

                //objSee_AnimalInfo.Par1 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar1.Text);
                //objSee_AnimalInfo.Par2 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar2.Text);
                //objSee_AnimalInfo.Par3 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar3.Text);
                //objSee_AnimalInfo.Par4 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar4.Text);
                //objSee_AnimalInfo.Par5 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar5.Text);
                SqlDataProvider.SqlDataProvider.InsertOrUpdateSee_AnimalInfo(objSee_AnimalInfo);
                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('提交成功！');window.location.href=window.location.href;</script>");
            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
    }
}