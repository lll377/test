<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RightFrameCommunityRightManage.aspx.cs" Inherits="M_Main.HouseInspect.RightFrameCommunityRightManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="overflow: scroll;">
    <form id="frmForm" runat="server">
        <input id="SelReturn" name="SelReturn" style="display: none;" />
        <input type="hidden" id="returnValue" name="returnValue" runat="server" />
        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <table class="DialogTable">
            <tr>
                <td>机构部门：<input id="DepName" name="DepName" type="text" class="easyui-validatebox" onclick="SelDepSer();"  runat="server" /><input type="hidden" id="DepCode" name="DepCode" value="" runat="server" />&nbsp;岗位名称：<input type="text" id="SearchRoleName" name="SearchRoleName" style="height: 15px;" runat="server" />&nbsp;<input type="button" id="BtnSearchRole" runat="server" onserverclick="BtnSearchRole_ServerClick" value="查询" />
                    <asp:DataList ID="DList" runat="server" ShowFooter="False" RepeatColumns="4" RepeatDirection="Horizontal">
                        <HeaderTemplate>
                            <input onclick=" checkFormAll(this)" type="checkbox" id="SelAll" name="SelAll">全选
                        </HeaderTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                        <ItemTemplate>
                            <input type="checkbox" id="cbSel" value='<%# DataBinder.Eval(Container.DataItem,"RoleCode") + "\t" + DataBinder.Eval(Container.DataItem,"RoleName") %>' runat="server" name="cbSel" onclick="checkFormOne(this)"><%# DataBinder.Eval(Container.DataItem,"RoleName") %>
                        </ItemTemplate>
                    </asp:DataList>

                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 10px; padding-bottom: 10px;">
                    <input type="button" class="button" value="确定筛选" onclick="Search();" />
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        $(function () {
            var checks = $('#returnValue').val();
            if (checks) {
                var check = checks.substr(1).split(',');
                for (var i = 0; i < check.length; i++) {
                    var objs = $(":checkbox[value='" + check[i] + "']");
                    objs.prop("checked", true);
                }
                var checkCount = $(":checkbox").length;
                if (check.length == checkCount - 1) {
                    $('#SelAll').prop("checked", true);
                }
                $("#SelReturn").val(checks);
            }
        });

        //选择机构
        function SelDepSer() {
            HDialog.Open('500', '500', '../HouseInspect/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                if (_Data != '') {
                    var arrRet = _Data.split(',');
                    $("#DepCode").val(arrRet[0]);
                    $("#DepName").val(arrRet[1]);
                }
            });
        }

        function checkFormAll(chk) {
            var val = $("#SelReturn").val();
            var form = document.getElementById("frmForm");
            var chkval = "";
            for (var i = 0; i < form.elements.length; i++) {

                //赋值
                if (form.elements[i].type == "checkbox") {
                    if (form.elements[i].value != "on") {
                        chkval = "," + form.elements[i].value
                        if (chk.checked) {
                            if (val.indexOf(chkval) < 0) {
                                val = val + chkval;
                            }
                        }
                        else {
                            val = val.replace(chkval, "")
                        }
                        form.elements[i].checked = chk.checked
                    }
                }
            }

            $("#SelReturn").val(val);
        }

        function checkFormOne(chk) {
            var val = $("#SelReturn").val();
            var chkval = "";
            chkval = "," + chk.value;
            if (chk.checked) {

                if (val.indexOf(chkval) < 0) {
                    val = val + chkval;
                }
            }
            else {
                val = val.replace(chkval, "");

            }
            $("#SelReturn").val(val);
        }

        function Search() {
            HDialog.ReturnIsJson = false;
            var returnValue = $("#SelReturn").val();
            HDialog.Close(returnValue);
        }
    </script>
</body>
</html>
