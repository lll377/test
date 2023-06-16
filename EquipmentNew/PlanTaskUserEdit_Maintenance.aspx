<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanTaskUserEdit_Maintenance.aspx.cs" Inherits="M_Main.EquipmentNew.PlanTaskUserEdit_Maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/PinYin.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            /*width: 180px;*/
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 120px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: auto;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>
</head>
<body>
    <form id="frmFrom" runat="server">
        <table class="SearchTable" style="width: 100%; padding-top: 5px; line-height: 25px;">
            <tr>
                <td class="TdTitle"><span>现责任岗位:</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="NewTaskRoleName" name="NewTaskRoleName" runat="server" data-options="required:true" style="border: 1px solid #cccccc; width: 80%;" class="easyui-validatebox" onclick="SelTaskRole();" />
                    <input type="hidden" id="NewTaskRoleCode" name="NewTaskRoleCode" />
                </td>
                <td class="TdTitle"><span>现责任人:</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="NewTaskUserName" name="NewTaskUserName" runat="server" style="border: 1px solid #cccccc; width: 80%;" class="easyui-validatebox" onclick="SelTaskUser();" />
                    <input type="hidden" id="NewTaskUserCode" name="NewTaskUserCode" />
                </td>
            </tr>
            <tr>
                <td class="TdContentSearch" colspan="4" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保存</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="Close();">放弃返回</a>
                </td>
            </tr>
        </table>
        <input type="hidden" id="Id" name="Id" runat="server" />
        <script type="text/javascript">
            function Load() {
                $("#Id").val(GetQueryString('Id'));
            }

            function Save() {
                $.tool.DataPostChk('frmFrom', 'CsEquipment', 'SavePlanTaskUserEdit_Maintenance', $('#frmFrom').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("修改成功!");
                        HDialog.Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            Load();

            function Close() {
                HDialog.Close();
            }

            //巡查岗位
            function SelTaskRole() {
                HDialog.Open('650', '600', '../EquipmentNew/SelRole.aspx?CommId=' + GetQueryString('CommId'), '选择岗位', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        var strs = new Array();
                        strs = _Data.split(',');
                        var code = "";
                        var name = "";
                        var all = "";
                        for (var i = 0; i < strs.length; i++) {
                            all = strs[i].trim().split(/\s+/);
                            code = code + all[0] + ",";
                            name = name + all[1] + ",";
                        }
                        code = code.substring(0, code.length - 1);
                        name = name.substring(0, name.length - 1);
                        $("#NewTaskRoleName").val(name);
                        $("#NewTaskRoleCode").val(code);
                        $("#NewTaskUserCode").val('');
                        $("#NewTaskUserName").val('');
                    };
                })
            }

            function SelTaskUser() {
                if ($("#NewTaskRoleCode").val() == "" || $("#NewTaskRoleCode").val() == null) {
                    HDialog.Info("请先选择责任岗位!");
                    return;
                }
                HDialog.Open('650', '600', '../EquipmentNew/SelUser.aspx?RoleCode=' + $("#NewTaskRoleCode").val(), '选择责任人', false, function callback(_Data) {
                    if (_Data) {
                        $("#NewTaskUserCode").val(_Data.split(';')[1]);
                        $("#NewTaskUserName").val(_Data.split(';')[0]);
                    };
                })
            }

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
