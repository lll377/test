<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListMerge.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Merge.ListMerge" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>点位合并详情</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .col-sm-12 {
            padding: 0;
            margin: 0;
        }
    </style>
</head>
<body>
    <%--<div style="height: 1000px"></div>--%>
    <form id="mainForm" method="post" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">原点位:</legend>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" id="col-xs-12">
                    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend" onclick="alert($(document.body).width())">新点位:</legend>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <table id="dgNew" border="0" cellspacing="0" cellpadding="0"></table>
                </div>
            </div>
        </fieldset>
    </form>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitPage();
        });
        function InitPage() {
            InitDataGrid();
            $(window).resize(function () {
                $("#dg").datagrid('resize');
                $("#dgNew").datagrid('resize');
            })
        }
        var column = [[
            //{ field: 'ck', checkbox: true },

            { field: 'CommName', title: '项目名称', width: 200, align: 'center', sortable: false },
            { field: 'Type', title: '点位类型', width: 100, align: 'center', sortable: false },
            { field: 'CategoryName', title: '点位类别', width: 150, align: 'center', sortable: false },
            { field: 'RegionName', title: '点位区域', width: 150, align: 'center', sortable: false },
            { field: 'Number', title: '点位编号', width: 250, align: 'center', sortable: false },
            {
                field: 'OptNumber1', title: '房屋编号', width: 250, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (row.Type == "房屋") {
                        value = row.OptNumber;
                    }
                    return value;
                }
            },
            {
                field: 'OptNumber2', title: '车位编号', width: 150, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (row.Type == "车位") {
                        value = row.OptNumber;
                    }
                    return value;
                }
            },
            { field: 'Name', title: '点位名称', width: 250, align: 'center', sortable: false },
            { field: 'Position', title: '点位位置', width: 250, align: 'center', sortable: false },
            { field: 'StoreyLayer', title: '所属楼宇', width: 200, align: 'center', sortable: false },
            { field: 'Area', title: '点位面积(平方米)', width: 110, align: 'center', sortable: false },
            {
                field: 'SizeLength', title: '点位尺寸(厘米)', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "长:&nbsp;" + row.SizeLength + "&emsp;宽:&nbsp;" + row.SizeWidth + "&emsp;高:&nbsp;" + row.SizeHeight;
                    //if (!!row.SizeLength) {
                    //    value = "长:&nbsp;" + row.SizeLength;
                    //}
                    //if (!!row.SizeWidth) {
                    //    value += "&emsp;宽:&nbsp;" + row.SizeWidth;
                    //}
                    //if (!!row.SizeHeight) {
                    //    value += "&emsp;高:&nbsp;" + row.SizeHeight;
                    //}
                    return value;
                }
            },
            { field: 'IsInstall', title: '是否安装表计', width: 100, align: 'center', sortable: false },
            { field: 'IsDisable', title: '是否停用', width: 100, align: 'center', sortable: false },
            {
                field: 'Remark', title: '备注', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!value && value.length >= 14) {
                        value = value.substring(0, 14) + "...";
                    }
                    return value;
                }
            },
            { field: 'TradePlanName', title: '招商规划', width: 100, align: 'center', sortable: false },
            { field: 'Price', title: '指导价格(元)', width: 100, align: 'center', sortable: false },
            { field: 'CalculateCostUnit', title: '计费单位', width: 100, align: 'center', sortable: false },
            {
                field: 'PriceUnit', title: '价格单位', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!row.CalculateCostUnit) {
                        value = row.PriceUnit + "&nbsp;/&nbsp;" + row.CalculateCostUnit;
                    }
                    return value;
                }
            },
            { field: 'TradePlanName1', title: '当前状态', width: 100, align: 'center', sortable: false },
            { field: 'TradePlanName2', title: '当前客户', width: 100, align: 'center', sortable: false },
            { field: 'TradePlanName3', title: '开始时间', width: 100, align: 'center', sortable: false },
            { field: 'TradePlanName4', title: '结束时间', width: 100, align: 'center', sortable: false },

            { field: 'Sort', title: '序号', width: 80, align: 'center', sortable: false },
            {
                field: 'Opt', title: '操作', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + row.ID + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
               
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                //fit: true,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: true,
                width: "100%",
                height: 320,
                //toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "LongTimeStamp";
                    param.SortOrder = 1;
                    param.ChangeID =  $.getUrlParam("ID");
                    param = $.getDataGridParam("DivfManage_Point", "GetList", param);
                },
                onLoadSuccess: function (data) {
                     InitDataGridNew();
                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
        }
        function InitDataGridNew() {
            $("#dgNew").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                //fit: true,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: false,
                width: "100%",
                height: 90,
                //toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.page = 1;
                    param.rows = 1;
                    param.SortField = "LongTimeStamp";
                    param.SortOrder = 1;
                    param.ID = $.getUrlParam("ID");
                    param = $.getDataGridParam("DivfManage_Point", "GetList", param);
                },
                onLoadSuccess: function (data) {
                    //$('#dg').resizeDataGrid(60, 800);
                    $("#dg").datagrid('resize');
                    $("#dgNew").datagrid('resize');
                },
                onLoadError: function (data) {
                }
            });
            $('#dgNew').datagrid('clearSelections');
            $('#dgNew').datagrid('clearChecked');
        }
        function Detailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Point/Tab.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                //InitDataGrid();
            });
        }
    </script>
</body>
</html>
