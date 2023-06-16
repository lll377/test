<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentRoleManage.aspx.cs" Inherits="M_Main.SysNew.DepartmentRoleManage" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
    <table class="DialogTable">
        <tr>
            <td class="DialogTdTitle">
                岗位名称
            </td>
            <td class="DialogTdContent" colspan="7">
                <input type="text" class="easyui-validatebox" data-options="required:true"
                    id="RoleName" name="RoleName" runat="server" />
            </td>
        </tr>
        <tr id="Organ">
            <td class="DialogTdTitle">
                组织机构
            </td>
            <td class="DialogTdSearchContent" colspan="7">
                <input type="text" class="easyui-searchbox"  id="DepName" name="DepName" searcher="SelDep" runat="server"  style="width:300px;" />
            </td>
        </tr>
        <tr id="CommRole">
            <td class="DialogTdTitle">
                通用岗位</td>
            <td class="DialogTdSearchContent" colspan="7">
                <input type="text" class="easyui-searchbox"  id="SysRoleName" name="SysRoleName" searcher="SelRole" runat="server" style="width:300px;" />
            </td>
        </tr>
        <tr id="trJSgs">
            <td class="DialogTdTitle">
                备注</td>
            <td class="DialogTdContent" colspan="7">
                <textarea   style="height:160px;" id="RoleDescribe" name="RoleDescribe" runat="server"></textarea>
            </td>
        </tr>
        <tr><td colspan="2" style="height:2px;"></td></tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="button" class="button" value="保存" id="BtnSave" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
            </td>
        </tr>
    </table>
        <input id="OpType"  type="hidden" name="OpType" runat="server">
        <input id="RoleCode" type="hidden" name="RoleCode" runat="server">
        <input id="SysRoleCode" type="hidden" name="SysRoleCode" runat="server">
        <input id="DepCode" type="hidden" name="DepCode" runat="server">
        <input id="RoleType" type="hidden" name="RoleType" runat="server" />
        <input id="Type" type="hidden" name="Type" runat="server" />

        <script type="text/javascript">
            //如果部门为空则为通用岗位、为ALL是所有岗位，其它为部门编码
            if ($("#RoleType").val().toLowerCase() == "empty") {
                $("#Organ").css("display", "none");
                $("#CommRole").css("display", "none");
                $("#Type").val("0");//为通用岗位
            }
            else {
                $("#Type").val("1");//为具体岗位
                if ($("#RoleType").val().toLowerCase() == "all") {
                    if ($("#DepCode").val() == "" && $("#OpType").val() == "edit") {
                        $("#Organ").css("display", "none");
                        $("#CommRole").css("display", "none");
                        $("#Type").val("0");//为通用岗位
                    }
                    else {
                        $("#Type").val("1");//为具体岗位
                    }
                }
            }
            function SelRole()
            {
                HDialog.Open('500', '500', '../DialogNew/SelCommRole.aspx', '选择通用岗位', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#SysRoleCode").val(arrRet[0]);
                    $("#SysRoleName").searchbox("setValue", arrRet[1]);
                });
            }

            function SelDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#DepCode").val(arrRet[0]);
                    $("#DepName").searchbox("setValue", arrRet[1]);
                });
            }

            $("#BtnSave").click(function () {
                if ($("#Type").val() == "1") {
                    var DName = $("#DepName").searchbox("getValue");
                    if (DName == "") {
                        $.messager.alert('错误', '非通用岗位部门不能为空', 'error');
                        return;
                    }
                }
                $.tool.DataPostChk('frmForm', 'Role', 'SaveRole', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Close('1');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
        </script>
    </form>
</body>
</html>