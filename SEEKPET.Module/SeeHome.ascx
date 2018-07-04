<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SeeHome.ascx.cs" Inherits="SEEKPET.Module.SeeHome" %>
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
                    <img src='/DesktopModules/SEEKPET.Module/image/home1.gif' width="47px" />
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
                    <img src='/DesktopModules/SEEKPET.Module/image/home2.gif' width="47px" />
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
</div>
