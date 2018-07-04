<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnimalSeek.ascx.cs" Inherits="SEEKPET.Module.AnimalSeek" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script>
    jQuery(function () {
        jQuery(".normaltextsearch2").blur(function () {
            if (jQuery(this).val() == '') {
                jQuery(this).val('芯片编码');
            }
        });
        jQuery(".normaltextsearch2").focus(function () {
            if (jQuery(this).val() == '芯片编码') {
                jQuery(this).val('');
            }
        });
    });

    function CheckCode(obj, args) {
        if (jQuery('#<%=chkHasCode.ClientID %>').attr('checked')) {
            if (args.Value != "") {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }
        else {
            args.IsValid = true;
        }
    }
</script>
<div class="mainpage">
    <table border="0" class="moduletable" width="100%">
        <tr>
            <td class='tdLeft' width="30%">种类：
            </td>
            <td class='tdRight'>
                <asp:TextBox runat='server' ID='txtKind' CssClass='normaltext'></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="txtKind" ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>宠物特征：
            </td>
            <td class='tdRight'>
                <asp:TextBox runat='server' ID='txtFeature' CssClass='normaltext'></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="txtFeature" ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>走失地点：
            </td>
            <td class='tdRight'>
                <asp:TextBox runat='server' ID='txtLossPlace' CssClass='normaltext'></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ControlToValidate="txtLossPlace" ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>感谢金：
            </td>
            <td class='tdRight'>
                <asp:TextBox runat='server' ID='txtPay' CssClass='normaltext'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>联系电话：
            </td>
            <td class='tdRight'>
                <asp:TextBox runat='server' ID='txtContract' CssClass='normaltext'></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                    ControlToValidate="txtContract" ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <div style='color: #ff9966;'>
                    <asp:CheckBox runat="server" ID="chkHasCode" CssClass="chkHasCode" />已拥有芯片（如有芯片请填写）
                </div>
                <div>
                    <asp:TextBox
                        runat="server" ID="txtCode" CssClass="normaltextsearch3"></asp:TextBox><asp:CustomValidator
                            ID="CustomValidator1" runat="server" ErrorMessage="*" ClientValidationFunction="CheckCode"
                            ControlToValidate="txtCode" ValidationGroup="edit" Display="Dynamic" ValidateEmptyText="true"></asp:CustomValidator>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="padding-top: 30px;">
                <asp:Button runat="server" ID="btnSubmit" Text="提交报失" ValidationGroup="edit" CssClass="normalbutton2"
                    OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>

</div>
