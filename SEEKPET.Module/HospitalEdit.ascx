<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HospitalEdit.ascx.cs"
    Inherits="SEEKPET.Module.HospitalEdit" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script src="/DesktopModules/SEEKPET.Module/js/AjaxUpload.js" type="text/javascript"></script>
<script type="text/javascript">
    window.onload = function () {
        init();  //初始化  
    }
    //初始化
    function init() {

        //初始化图片上传
        var btnImg = document.getElementById("btnUploadImg");
        var img = document.getElementById("<%=imgShow.ClientID %>");
        var hidImgName = document.getElementById("<%=hidImgName.ClientID %>");
        document.getElementById("btnDeleteImg").onclick = function () { DelImg(img, hidImgName); };
        g_AjxUploadImg(btnImg, img, hidImgName);
    }
    var g_AjxTempDir = "/Portals/SEEKPETInfo/";
    //图片上传
    function g_AjxUploadImg(btn, img, hidPut) {
        var button = btn, interval;
        new AjaxUpload(button, {
            action: '/DesktopModules/SEEKPET.Module/appservices/UploadHandler.ashx?fileType=img',
            data: {},
            name: 'myfile',
            onSubmit: function (file, ext) {
                if (!(ext && /^(jpg|JPG|png|PNG|gif|GIF)$/.test(ext))) {
                    alert("您上传的图片格式不对，请重新选择！");
                    return false;
                }
            },
            onComplete: function (file, response) {
                flagValue = response;
                if (flagValue == "1") {
                    alert("您上传的图片格式不对，请重新选择！");
                }
                else if (flagValue == "2") {
                    alert("您上传的图片大于2M，请重新选择！");
                }
                else if (flagValue == "3") {
                    alert("图片上传失败！");
                }
                else {
                    hidPut.value = response;
                    img.src = g_AjxTempDir + response;
                }
            }
        });
    }
    //删除图片
    function DelImg(img, hidPut) {
        hidPut.value = "";
        img.src = "/images/thumbnail.jpg";
    }
    
</script>
<style type="text/css">
    /*上传文件*/.uploadFile
    {
        margin-bottom: 10px;
    }
    /*上传图片*/.uploadImg
    {
    }
    .uploadImg img
    {
        width: 102px;
        height: 64px;
        border: 1px solid #CCCCCC;
        display: block;
    }
    .typeclass
    {
        font-size: larger;
        width: 100%;
        text-align: center;
    }
</style>
<!--******************************编辑信息页面代码********************************-->
<table class='moduletable' cellpadding='3' cellspacing='1' border='0' style="width: 100%">
    <tr>
        <td class='tdLeft' width="20%">
            医院名称：
        </td>
        <td class='tdRight'>
            <asp:TextBox ID='txtHospitalName' MaxLength='50' runat='server' CssClass='normaltext' />
        </td>
    </tr>
    <tr>
        <td class='tdLeft'>
            医院地址：
        </td>
        <td class='tdRight'>
            <asp:TextBox ID='txtAddress' MaxLength='50' runat='server' CssClass='normaltext' />
        </td>
    </tr>
    <%--<tr>
		<td class='tdLeft'><asp:Label runat='server' ID='lryCoorX' resourcekey='CoorX' CssClass='subHead'>CoorX</asp:Label></td>
		<td class='tdRight'><asp:TextBox ID='txtCoorX' MaxLength='50' runat='server' CssClass='normal' /></td>
	</tr>

	<tr>
		<td class='tdLeft'><asp:Label runat='server' ID='lryCoorY' resourcekey='CoorY' CssClass='subHead'>CoorY</asp:Label></td>
		<td class='tdRight'><asp:TextBox ID='txtCoorY' MaxLength='50' runat='server' CssClass='normal' /></td>
	</tr>--%>
    <tr>
        <td class='tdLeft'>
            照片：
        </td>
        <td class='tdRight'>
            <div class="uploadImg">
                <img id="imgShow" src="/images/thumbnail.jpg" alt="图片" runat="server" />
                <input type="hidden" id="hidImgName" runat="server" />
                <input type="button" id="btnUploadImg" value="上传" />
                <input type="button" id="btnDeleteImg" value="删除" />
            </div>
        </td>
    </tr>
    <tr>
        <td class='tdLeft'>
            描述：
        </td>
        <td class='tdRight'>
            <asp:TextBox ID='txtDescription' MaxLength='500' TextMode="MultiLine" Height="100px"
                runat='server' CssClass='normaltext' />
        </td>
    </tr>
</table>
<table cellpadding='0' cellspacing='3' border='0' align='center'>
    <tr>
        <td>
            <asp:LinkButton runat='server' ID='cmdCommand' CssClass='normallinkbutton' OnClick="cmdCommand_Click">确定</asp:LinkButton>&nbsp;&nbsp;&nbsp;<asp:HyperLink
                runat='server' ID='hlkExit' CssClass='normallinkbutton'>取消</asp:HyperLink>
        </td>
    </tr>
</table>
