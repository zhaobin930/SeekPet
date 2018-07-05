<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SeeHome.ascx.cs" Inherits="SEEKPET.Module.SeeHome" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<div class="mainpage">
    <asp:Repeater runat="server" ID="reList">
        <HeaderTemplate>
            <div>
                <div style="text-align: center; color: #0a97a1">提供线索请随时联系seekpetm公众号</div>
                <ul class='homeul'>
        </HeaderTemplate>
        <ItemTemplate>
            <li class='homeli'>
                <div class="homepetimg">
                    <img src='<%#"/Portals/SEEKPETInfo/"+Eval("Par1").ToString() %>' width="47px" />
                </div>
                <div class="homepetitem">
                    <p class='p1'>
                        <%#Eval("Kind") %>
                    </p>
                    <p class='p2'>
                        特征:<%#Eval("Feature") %>/走失地点:<%#Eval("LossPlace") %>/有偿
                    </p>
                </div>
                <div style='padding-top: 12px; float: right'>
                    <img src='/Portals/0/images/animaltip.png' />
                </div>
                <div style="clear: both">
                </div>
            </li>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <li class='homeli'>
                <div class="homepetimg">
                    <img src='<%#"/Portals/SEEKPETInfo/"+Eval("Par1").ToString() %>' width="47px" />
                </div>
                <div class="homepetitem">
                    <p class='p1'>
                        <%#Eval("Kind") %>
                    </p>
                    <p class='p2'>
                        特征:<%#Eval("Feature") %>/走失地点:<%#Eval("LossPlace") %>/有偿
                    </p>
                </div>
                <div style='padding-top: 12px; float: right'>
                    <img src='/Portals/0/images/animaltip.png' />
                </div>
                <div style="clear: both">
                </div>
            </li>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </ul></div>
        </FooterTemplate>
    </asp:Repeater>
    <div style="clear: both;padding-bottom:15px;">
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" NumericButtonCount="10"
                    CustomInfoHTML="<font color='red'><b>%currentPageIndex%</b></font>/%PageCount%&nbsp;总: %RecordCount%"
                    pagesize="15" UrlPaging="true" NumericButtonTextFormatString="[{0}]" ShowCustomInfoSection="left"
                    FirstPageText="首页" LastPageText="末页" NextPageText="下页" PrevPageText="上页" Font-Names="Arial"
                    AlwaysShow="true" ShowInputBox="Always" SubmitButtonText="跳转" SubmitButtonStyle="botton"
                    OnPageChanged="AspNetPager1_PageChanged">
                </webdiyer:AspNetPager></div>
</div>
