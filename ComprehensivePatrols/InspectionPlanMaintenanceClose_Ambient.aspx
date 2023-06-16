<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InspectionPlanMaintenanceClose_Ambient.aspx.cs" Inherits="M_Main.ComprehensivePatrols.InspectionPlanMaintenanceClose_Ambient" %>

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
            width: 150px;
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
                <td class="TdTitle">关闭原因</td>
                <td class="TdContentSearch">
                    <select id="CloseReason" name="CloseReason" runat="server" isdctype="true" data-options="required:true" dctype="关闭原因" style="width: 80%; border: 1px #cccccc solid;" class="easyui-validatebox ">
                    </select>
                </td>
                <td class="TdTitle">关闭人</td>
                <td class="TdContentSearch">
                    <input type="text" id="CloseUserName" name="CloseUserName" runat="server" data-options="required:true" style="border: 1px solid #cccccc; width: 80%;" class="easyui-validatebox" />
                    <input type="hidden" id="CloseUserCode" name="CloseUserCode" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">关闭时间</td>
                <td class="TdContentSearch">
                    <input type="text" id="CloseTime" name="CloseTime" runat="server" data-options="required:true" style="border: 1px solid #cccccc; width: 80%;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td class="TdTitle">关闭说明</td>
                <td class="TdContentSearch" colspan="3">
                    <textarea id="CloseRemark" name="CloseRemark" style="width: 95.2%; border: 1px solid #cccccc; height: 44px;"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdContentSearch" colspan="4" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">关闭</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="Close();">放弃返回</a>
                </td>
            </tr>
        </table>
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="TaskId" name="TaskId" runat="server" />
        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <script type="text/javascript">
            function Save() {
                $.tool.DataPostChk('frmFrom', 'CpComPatrols', 'SaveInspectionPlanMaintenanceColse_Ambient', $('#frmFrom').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("关闭成功!");
                        HDialog.Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Close() {
                HDialog.Close();
            }

            $("#CloseUserName").click(function () {
                HDialog.Open('650', '600', '../ComprehensivePatrols/SelUser.aspx?IsSingle=1', '选择人员', false, function callback(_Data) {
                    if (_Data) {
                        $("#CloseUserCode").val(_Data.split(';')[1]);
                        $("#CloseUserName").val(_Data.split(';')[0]);
                    };
                })
            });
        </script>
    </form>
</body>
</html>
