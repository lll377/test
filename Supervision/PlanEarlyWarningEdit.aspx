<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanEarlyWarningEdit.aspx.cs" Inherits="M_Main.Supervision.PlanEarlyWarningEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查项目编辑</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/uuid.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .dlg_table {
            margin-bottom: 53px;
        }

        .datagrid-toolbar tr td {
            padding: 0px;
        }

        .easyui-textbox {
            width: 30%;
        }

        .easyui-numberbox {
            width: 30%;
        }

        .easyui-combobox {
            width: 30%;
        }

        .colspan {
            width: 79.5%;
        }

        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="dlg_table">
                <tr>
                    <td class="title">序号:</td>
                    <td class="text">
                        <input type="text" id="Sort" name="Sort" class="easyui-numberbox" data-options="required: true, precision: 0, min: 1" />
                    </td>
                    <td class="title">预警岗位:</td>
                    <td class="text">
                        <input id="WarningRole" name="WarningRole" class="easyui-textbox" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole(); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">提前预警时间（分钟）:</td>
                    <td class="text">
                        <input type="text" id="WarningMinute" name="WarningMinute" class="easyui-numberbox" data-options="required: false, precision: 0, min: 0" />
                    </td>
                    <td class="title">提前预警时间天数:</td>
                    <td class="text">
                        <input type="text" id="WarningDays" name="WarningDays" class="easyui-numberbox" data-options="required: false, precision: 0, min: 0" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();" id="btnSave">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="PlanId" name="PlanId" />
        <input type="hidden" id="Frequency" name="Frequency" />
        <script type="text/javascript">
            //选择通用岗位
            function SelSysRole() {
                HDialog.Open('500', '350', '../Supervision/SelSysRole.aspx?IsCheck=0', "选择通用岗位", false, function callback(_Data) {
                    if (_Data > '') {
                        $("#WarningRole").textbox('setValue', _Data.split('|')[0]);
                        $("#WarningRole").textbox('setText', _Data.split('|')[1]);
                    }
                });
            }

            function Load() {
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CSSupervision', 'GetPlanEarlyWarningInfo', 'Id=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var obj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            $('#frmForm').form('load', obj[0]);
                            $("#WarningRole").textbox('setText', obj[0].WarningRoleName);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            function Close() {
                HDialog.Close();
            }

            function Save() {
                if ($("#WarningMinute").numberbox('getValue') > '') {
                    if ($("#WarningMinute").numberbox('getValue') % 15 != 0) {
                        HDialog.Info('预警时间只能设置为15的倍数！');
                        return;
                    }
                }
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'SavePlanEarlyWarning', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            HDialog.Info(_Data);
                        }
                        else {
                            HDialog.Close();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#OpType").val(GetQueryString('OpType'));
                $("#Id").val(GetQueryString('Id'));
                $("#PlanId").val(GetQueryString('PlanId'));
                $("#Frequency").val(decodeURI(GetQueryString('Frequency')));
                Load();
                if ($("#Frequency").val() == "1次/半小时"
                    || $("#Frequency").val() == "1次/1小时"
                    || $("#Frequency").val() == "1次/2小时"
                    || $("#Frequency").val() == "1次/3小时"
                    || $("#Frequency").val() == "1次/4小时"
                    || $("#Frequency").val() == "1次/6小时"
                    || $("#Frequency").val() == "1次/8小时"
                    || $("#Frequency").val() == "1次/12小时"
                    || $("#Frequency").val() == "1次/天"
                    || $("#Frequency").val() == "其它频次") {
                    $("#WarningMinute").numberbox({ editable: true });
                    $("#WarningDays").numberbox({ editable: false });
                } else {
                    $("#WarningMinute").numberbox({ editable: false });
                    $("#WarningDays").numberbox({ editable: true });
                }
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
