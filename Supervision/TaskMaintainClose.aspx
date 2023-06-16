<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskMaintainClose.aspx.cs" Inherits="M_Main.Supervision.TaskMaintainClose" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改任务</title>
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

        .dlg_table tr td.title {
            width: 10%;
        }

        .dlg_table tr td.text {
            width: 40%;
        }

        .easyui-textbox {
            width: 35%;
        }

        .easyui-numberbox {
            width: 35%;
        }

        .easyui-combobox {
            width: 35%;
        }

        .colspan {
            width: 84.5%;
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
                    <td class="title">关闭原因:</td>
                    <td class="text">
                        <input id="CloseReason" name="CloseReason" class="easyui-combobox" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title">关闭说明:</td>
                    <td class="text" colspan="3">
                        <input id="CloseRemark" name="CloseRemark" class="easyui-textbox colspan" data-options="
                            editable: true,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: true,
                            height:'200px',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="CommId" name="CommId" value="" />
        <input type="hidden" id="TaskIds" name="TaskIds" value="" />
        <script type="text/javascript">
            //加载关闭原因
            function LoadCloseReason() {
                $('#CloseReason').combobox({
                    required: true,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#CloseReason\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'Name',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'GetDictionaryByDType';
                        param.DType = '关闭原因';
                    }
                });
            }

            function Close() {
                HDialog.Close("");
            }
            
            function Save() {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'CloseTask', $('#frmForm').serialize() + '&CloseReasonName=' + $('#CloseReason').combobox('getText'),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("关闭成功");
                        HDialog.Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#CommId").val(GetQueryString('CommId'));
                $("#TaskIds").val(localStorage.getItem('TaskIds'));
                LoadCloseReason();
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
