﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VxPay.aspx.cs" Inherits="SEEKPET.Module.VxPay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>微信支付</title>
    <link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
    <script type="text/javascript">
        //    window.onload = function ()
        //           {
        //               callpay();
        //           };

        //调用微信JS api 支付
        //               function jsApiCall()
        //               {
        //                   WeixinJSBridge.invoke(
        //                   'getBrandWCPayRequest',
        //                   <%=wxJsApiParam%>,//josn串
        //                    function (res)
        //                    {
        //                        WeixinJSBridge.log(res.err_msg);
        //                        alert(res.err_code + res.err_desc + res.err_msg);
        //                     }
        //                    );
        //               }

        //               function callpay()
        //               {
        //                   if (typeof WeixinJSBridge == "undefined")
        //                   {
        //                       if (document.addEventListener)
        //                       {
        //                           document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
        //                       }
        //                       else if (document.attachEvent)
        //                       {
        //                           document.attachEvent('WeixinJSBridgeReady', jsApiCall);
        //                           document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
        //                       }
        //                   }
        //                   else
        //                   {
        //                       jsApiCall();
        //                   }
        //               }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class='mainpage'>
            <div>
                <b>商品一：价格为<asp:Label runat="server" ID="lblPrice" Style="color: #f00; font-size: 50px">1分</asp:Label>钱</b>
            </div>
            <div align="center">
                <asp:Button ID="submit" runat="server" Text="立即支付" Style="width: 210px; height: 50px;
                    border-radius: 15px; background-color: #00CD00; border: 0px #FE6714 solid; cursor: pointer;
                    color: white; font-size: 16px;" OnClick="btnPay_Click" />
            </div>
            <div>
                <%=wxJsApiParam%>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
