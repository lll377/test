<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyEventReportUpdateDealState.aspx.cs" Inherits="M_Main.Emergency.EmergencyEventReportUpdateDealState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急事件报告-变更处理状态</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #dlg_search_point {
            padding: 10px;
            height: 100px;
        }

        .SearchTable {
            width: auto;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 11%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="ID" name="ID" runat="server" />
        <div style="padding:5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">处理状态</td>
                    <td class="TdContentSearch">
                        <select id="DealState" name="DealState" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                            <option value="未处理">未处理</option>
                            <option value="处理中">处理中</option>
                            <option value="已处理">已处理</option>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
        <script type="text/javascript">

            function Save() {
                $.tool.DataPostJson('Emergency', 'UpdateEmergencyEventReportDealState', "ID=" + $('#ID').val() + "&DealState=" + $('#DealState').combobox("getValue"),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            HDialog.Close("1");
                        } else {
                            HDialog.Info(data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
            function Close() {
                HDialog.Close("");
            }
        </script>
    </form>
</body>
</html>
