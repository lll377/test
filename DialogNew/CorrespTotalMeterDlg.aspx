<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorrespTotalMeterDlg.aspx.cs" Inherits="M_Main.DialogNew.CorrespTotalMeterDlg" %>


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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 100%;
            overflow: auto;
        }
    </style>
</head>
<body>
    <form id="FrmForm">
        <input type="hidden" id="MeterProperty" name="MeterProperty" value="1" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 150px;">

            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">表计类型</td>
                    <td class="TdContentSearch">
                        <select id="MeterType" runat="server" style="width: 50%" name="MeterType"></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">表计名称</td>
                    <td class="TdContentSearch">
                        <input id="MeterName" type="text" name="MeterName" runat="server" /></td>
                </tr>

                <tr>
                    <td align="center" colspan="2">
                        <input class="button" id="btnSave" type="button" value="查询" name="btnSave" runat="server" onclick="LoadList();" />
                    </td>
                </tr>
            </table>
        </div>

        <div style="width: 100%;" id="TableContainer"></div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                LoadList();
            });

            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width() * 0.25 - 1;
                $("#TableContainer").css("height", h - 30 + "px");
            }
            InitFunction();

            var column = [[
                { field: 'MeterID', title: 'MeterID', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'MeterSNum', title: '表计序号', width: 100, align: 'left', sortable: true },
                { field: 'Location', title: '安装位置', width: 100, align: 'left', sortable: true },
                { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                { field: 'MeterTypeName', title: '表计类型', width: 100, align: 'left', sortable: true },
                { field: 'PoolTypeName', title: '分摊方式', width: 100, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;

                        HDialog.Close(rowData);
                    },

                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "PublicMeter", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
            }
        </script>
    </form>
</body>
</html>
