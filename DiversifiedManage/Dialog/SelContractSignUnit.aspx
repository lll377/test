﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelContractSignUnit.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.SelContractSignUnit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多经管理-合同签约单位选择</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .toolbartable {
            margin: 0px 10px;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }
    </style>
</head>
<body>
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="mainForm">
            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>签约单位名称</span></td>
                    <td class="text">
                        <input id="UnitName" name="UnitName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:false,width:80" onclick="InitDataGrid();">筛选</a>
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>

                    </td>
                </tr>
            </table>
        </form>
    </div>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <input type="hidden" id="UnitType" name="UnitType" value="收款方" />
    <script language="javascript" type="text/javascript">
        $(function () {
            var UnitType = $.getUrlParam("UnitType");
            if (UnitType != null) {
                $("#UnitType").val(UnitType);
            }
            InitDataGrid();
        });

        var column = [[
            { field: 'UnitType', title: '单位类型', width: 100, align: 'left' },
            { field: 'UnitName', title: '单位名称', width: 320, align: 'left' }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                onDblClickRow: function (rowIndex, rowData) {
                    ClosePage(rowData);
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("DiversifiedManage", "GetListSignUnit", "dg", param);
                },
                onLoadSuccess: function (data) {

                }
            });
        }
        function Save() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                ClosePage(row);
            } else {
                $.messager.alert('温馨提示', "请选择签约单位");
            }
        }

        function ClosePage(row) {
            HDialog.ReturnIsJson = true;
            HDialog.Close(row);
        }
    </script>
</body>
</html>
