﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSearch.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.Merchants.ContractSearch" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>合同</title>
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

</head>
<body>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1000px; height: 510px;" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">指导价格</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Price" name="Price" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ¥'" />
                    <label class="control-text">(单位:元)</label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">价格单位</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="PriceUnit" name="PriceUnit" class="easyui-combobox" />
                    <label class="control-text" id="lblCalculateCostUnit"></label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">

        $(function () {
            InitPage();
        });
        function InitPage() {
            InitControl();
            InitDataGrid();
        }
        function InitControl() {

        }

        var toolbar = [
            //{
            //    text: '筛选',
            //    iconCls: 'icon-search',
            //    handler: function () {
            //        $('#dlg_search').dialog('open');
            //    }
            //},
            //'-', {
            //    text: '导出',
            //    iconCls: 'icon-page_white_excel',
            //    handler: function () {
            //        window.open("/HM/M_Main/DiversifiedManage/PointManage/Point/Export.aspx?random=" + Math.random());
            //    }
            //}
        ];
        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'CommName', title: '项目名称', width: 200, align: 'center' },
            { field: 'BuyerCustName', title: '客户名称', width: 200, align: 'center' },
            {
                field: 'RoomSigns', title: '房屋编号', width: 320, align: 'center'
            },
            { field: 'BuyerConnectTel', title: '联系电话', width: 120, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 180, align: 'center' },
            {
                field: 'ContractSign', title: '合同编号', width: 200, align: 'center', formatter: function (value, row, index) {
                    value = "<a style=\"color:blue\" onclick=\"Edit('" + row.ID + "','edit','')\" href=\"javascript:void(0);\">" + value + "</a>";
                    return value;
                }
            },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'center' },
            {
                field: 'ContractBeginTime', title: '合同开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'ContractEndTime', title: '合同结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'ContractPeriod', title: '合同期限(月)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准(元)', width: 100, align: 'center' },
            { field: 'ContractTotalPrice', title: '合同总额(元)', width: 100, align: 'center' },
            {
                field: 'ContractSignTime', title: '签约时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'WorkStartUserName', title: '发起人', width: 100, align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: 150, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss');
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: 80, align: 'center' },
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Edit(row.ID, "edit", "")
                },
                onBeforeLoad: function (param) {
                    param.SortField = "ID";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.MerchantsID = $.getUrlParam("ID");
                    param = $.getDataGridParam("DivfManage_Merchants", "GetListContract", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }
        function Edit(id, OpType, SignType) {
            var urlParam = { "OpType": OpType, "Id": id, "SignType": SignType };
            var w = $(top.window).width();
            var h = $(window).height();
            if (w > 1200) {
                w = 1200;
            }
            LayerDialog.OpenWin(w, '600', '/HM/M_Main/DiversifiedManage/ContractManage/ContractManageDetail.aspx?' + $.param(urlParam), "合同登记信息", false, function callback(_Data) {
                if (_Data != "") {
                    InitDataGrid();
                }
            });
        }
    </script>
</body>
</html>
