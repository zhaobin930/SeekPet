using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SEEKPET.Module
{
    public partial class SeeHome : EasySite.Entities.Modules.PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            string city = "北京市";
            if (Request.Cookies["city"] != null)
            {
                city = Server.UrlDecode(Request.Cookies["city"].Value).Trim();
            }
            string str = "select top 7 * from See_Seek where city='"+city+"' order by createtime desc";
            DataTable da = SqlDataProvider.SqlDataProvider.GetSQLTable(str);
            reList.DataSource = da;
            reList.DataBind();
            
        }
    }
}