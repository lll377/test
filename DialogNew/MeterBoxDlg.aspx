<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeterBoxDlg.aspx.cs" Inherits="M_Main.DialogNew.MeterBoxDlg" %>


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
        <input id="LiveType" name="LiveType" type="hidden" runat="server" />
        <input id="IsHis" name="IsHis" type="hidden" runat="server" />

        <div id="ContainerRight" class="ContainerRight">
            <div>
                <div class="datagrid-toolbar" id="divtt">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <div id="divhj">
                                    <table cellspacing="0" cellpadding="0">
                                        <tr style="padding-left:40px;">
                                            <td class="TdTitle">箱表&nbsp;&nbsp;</td>
                                            <td class="TdContent">
                                                <input type="text" class="easyui-validatebox" id="MeterBoxName" name="MeterBoxName"
                                                    runat="server" />
                                            </td>

                                            <td class="TdTitle">表箱序号&nbsp;</td>
                                            <td class="TdContent">
                                                <input type="text" class="easyui-validatebox" id="MeterBoxNum" name="MeterBoxNum"
                                                    runat="server" />
                                            </td>

                                            <td class="TdTitle">表箱位置&nbsp;</td>
                                            <td class="TdContent">
                                                <input type="text" class="easyui-validatebox" id="MeterBoxAddress" name="MeterBoxAddress"
                                                    runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td>
                                <a href="javascript:void(0)" onclick="LoadList();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                            </td>
                            <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>

                        </tr>
                    </table>
                </div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>
        </div>
        <input type="hidden" id="CommID" name="CommID" />

        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                LoadList();
            });

            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width() * 0.25 - 1;
                $("#TableContainer").css("height", h-30 + "px");
            }
            InitFunction();

            var column = [[
                { field: 'MeterBoxNum', title: '序号', width: 300, align: 'left', sortable: true },
                { field: 'MeterBoxName', title: '表箱名称', width: 300, align: 'left', sortable: true },
                { field: 'MeterBoxAddress', title: '位置', width: 420, align: 'left', sortable: true }
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
                    //toolbar: toolbar,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;

                        HDialog.Close(rowData);
                    },

                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "MeterBox", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
              
            }

        </script>
    </form>
</body>
</html>
