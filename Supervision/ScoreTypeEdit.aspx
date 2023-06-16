<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScoreTypeEdit.aspx.cs" Inherits="M_Main.Supervision.ScoreTypeEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>评分类型编辑</title>
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
                    <td class="title">评分类型:</td>
                    <td class="text">
                        <input id="ScoreType" name="ScoreType" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '专业条线'},
                                {id: '2',text: '类别维度'},
                                {id: '3',text: '机构部门'}
                            ]" />
                    </td>
                    <td class="title">综合满分:</td>
                    <td class="text">
                        <input type="text" id="FullMarks" name="FullMarks" class="easyui-numberbox" data-options="required: true, precision: 2, min: 0" />
                    </td>
                </tr>
                <tr>
                    <td class="title">计算规则:</td>
                    <td class="text">
                        <input id="CalculationRule" name="CalculationRule" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '按自然权重'},
                                {id: '2',text: '按设定权重'}
                            ]" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
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
        <input type="hidden" id="OpType" name="OpType" />
        <script type="text/javascript">
            function Load() {
                if ($("#OpType").val() != 'insert') {
                    $.tool.DataGet('CSSupervision', 'GetScoreTypeInfo', 'Id=' + $("#Id").val(),
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
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'SaveScoreType', $('#frmForm').serialize(),
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
                if (GetQueryString('IsScore') == "1") {
                    $("#FullMarks").numberbox({
                        required: true
                    });
                } else {
                    $("#FullMarks").numberbox({
                        required: false
                    });
                }
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
