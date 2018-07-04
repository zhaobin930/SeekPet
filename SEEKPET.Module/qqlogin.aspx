﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qqlogin.aspx.cs" Inherits="SEEKPET.Module.qqlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>qq互联</title>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript">
        jQuery.noConflict();
    </script>
    <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js"
        data-appid="101443949" data-redirecturi="http://www.seekpetm.xin/qqlogin.aspx"
        charset="utf-8"></script>
    <script type="text/javascript">
        //从页面收集OpenAPI必要的参数。get_user_info不需要输入参数，因此paras中没有参数
        var paras = {};
        //用JS SDK调用OpenAPI
        QC.api("get_user_info", paras)
        //指定接口访问成功的接收函数，s为成功返回Response对象
	.success(function (s) {
	    //成功回调，通过s.data获取OpenAPI的返回数据
	    //alert("获取用户信息成功！当前用户昵称为：" + s.data.nickname);
	    if (QC.Login.check()) {//如果已登录  
	        QC.Login.getMe(function (openId, accessToken) {
	            //alert(["当前登录用户的", "openId为：" + openId, "accessToken为：" + accessToken].join("\n"));
	            var url = "/DesktopModules/SEEKPET.Module/appservices/userlogin.ashx";
	            //alert(openId+','+accessToken+','+s.data.nickname);
	            jQuery.post(url, { openid: openId, token: accessToken, nickname: s.data.nickname }, function (data) {
	                if (data != "1") {
	                    alert(data);
	                }
	                else {
	                    location.href = '/tabid/40/Default.aspx?ran=' + Math.random();
	                }

	            }
        );
	        });
	    }
	})
        //指定接口访问失败的接收函数，f为失败返回Response对象
	.error(function (f) {
	    //失败回调
	    alert("获取用户信息失败！");
	})
        //指定接口完成请求后的接收函数，c为完成请求返回Response对象
	.complete(function (c) {
	    //完成请求回调
	    //alert("获取用户信息完成！");
	});
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>
            数据传输中，请稍后...</h3>
    </div>
    </form>
</body>
</html>
