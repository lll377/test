<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuildHouseKeeperManage.aspx.cs" Inherits="M_Main.HouseNew.BuildHouseKeeperManage" %>



<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="BuildSNum" type="hidden" name="BuildSNum" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">楼宇</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="BuildName" type="text" name="BuildName" runat="server" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">具体岗位</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-searchbox" style="width: 85%" data-options="required:true,editable:false" id="RoleNames" name="RoleNames" searcher="SelDealMan" runat="server" />
                    <input style="width: 16px; height: 22px" id="RoleCodes" size="1" type="hidden" name="RoleCodes" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">楼栋管家</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-searchbox" style="width: 77%" data-options="required:true,editable:false" id="UserName" name="UserName" searcher="SelUserByRole" runat="server" />
                    <input style="width: 16px; height: 22px" id="UserCode" size="1" type="hidden" name="UserCode" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">管家电话</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="Tel" type="text" name="Tel" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            $("#BtnSave").click(function () {
                var str = /^1\d{10}$/;
                if (!str.test($("#Tel").val())) {
                    HDialog.Info('管家热线格式错误');
                    return;
                }
                $.tool.DataPostChk('frmForm', 'HouseKeeper', "AddBuild", $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = _Data.split('|');
                        if (Data[0] == "true") {
                            HDialog.Info(Data[1]);
                            close();
                        }
                        else { HDialog.Info(Data[1]); }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            });

            $("#BtnReturn").click(function () {
                close();
            });

            function SelDealMan() {
                HDialog.Open('640', '480', '../DialogNew/HouseKeeper.aspx', '选择管家角色', false, function callback(_Data) {
                    var arrRet = _Data.split('\t');
                    $("#RoleNames").searchbox("setValue", arrRet[1]);
                    $("#RoleCodes").val(arrRet[0]);
                    $("#UserName").searchbox("setValue", '');
                    $("#UserCode").val('');
                    $("#Tel").val('');
                });
            }

            function SelUserByRole() {
                if ($("#RoleCodes").val() <= '') {
                    HDialog.Info('请先选择管家角色');
                    return;
                }
                HDialog.Open('640', '480', '../DialogNew/SelKeeper.aspx?RoleCodes=' + $("#RoleCodes").val(), '选择管家', false, function callback(_Data) {
                    var obj = JSON.parse(_Data);
                    var arrRet = _Data.split('\t');
                    $("#UserName").searchbox("setValue", obj.UserName);
                    $("#UserCode").val(obj.UserCode);
                    $("#Tel").val(obj.MobileTel);
                });
            }

            function close() {
                HDialog.Close('');
            }
        </script>
    </form>
</body>
</html>
