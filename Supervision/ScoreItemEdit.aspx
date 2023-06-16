<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScoreItemEdit.aspx.cs" Inherits="M_Main.Supervision.ScoreItemEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>评分项目编辑</title>
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
        .easyui-textbox {
            width: 30%;
        }

        .easyui-combobox {
            width: 30%;
        }

        .easyui-numberbox {
            width: 30%;
        }

        .colspan {
            width: 73%;
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
                    <td class="title">评分项目:</td>
                    <td class="text">
                        <input type="text" id="ScoreItem" name="ScoreItem" class="easyui-textbox" data-options="required:true" />
                    </td>
                    <td class="title">单项满分:</td>
                    <td class="text">
                        <input type="text" id="ItemScore" name="ItemScore" class="easyui-numberbox" data-options="required: true, precision: 2, min: 0" />
                    </td>
                </tr>
                <tr>
                    <td class="title">所占权重（%）:</td>
                    <td class="text">
                        <input type="text" id="Weighting" name="Weighting" class="easyui-numberbox" data-options="required: true, precision: 2, min: 0, max: 100" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title" style="text-align: left;" colspan="4">说明：“按设定权重”计算综合得分时，同一评分类型下面所有评分项目的所占权重之和应该等于100%；</td>
                </tr>
                <tr>
                    <td class="title">备注:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="Remark" name="Remark" class="easyui-textbox colspan" data-options="required:false" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 10px 0;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();" style="display: none" id="btnSave">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="CheckTypeId" name="CheckTypeId" />
        <input type="hidden" id="ScoreTypeId" name="ScoreTypeId" />
        <input type="hidden" id="OpType" name="OpType" />
        <script type="text/javascript">
            function Load() {
                if ($("#OpType").val() != 'insert') {
                    $.tool.DataGet('CSSupervision', 'GetScoreItemInfo', 'Id=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var obj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            $('#frmForm').form('load', obj[0]);
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
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'SaveScoreItem', $('#frmForm').serialize(),
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
                $("#CheckTypeId").val(GetQueryString('CheckTypeId'));
                $("#ScoreTypeId").val(GetQueryString('ScoreTypeId'));
                if (GetQueryString('IsScore') == "1") {
                    $("#ItemScore").numberbox({
                        required: true
                    });
                } else {
                    $("#ItemScore").numberbox({
                        required: false
                    });
                }
                if (GetQueryString('CalculationRule') == "2") {
                    $("#Weighting").numberbox({
                        required: true
                    });
                } else {
                    $("#Weighting").numberbox({
                        required: false,
                        editable: false
                    });
                }
                $("#ItemScore").numberbox('setValue', GetQueryString('FullMarks'));
                if ($("#OpType").val() != 'see')
                    $("#btnSave").show();
                Load();
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
