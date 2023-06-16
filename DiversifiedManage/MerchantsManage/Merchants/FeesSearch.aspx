<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesSearch.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.Merchants.FeesSearch" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>客商费用</title>
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
            { field: 'CommName', title: '项目名称', width: 200, align: 'center', sortable: false },
            { field: 'ContractSign', title: '合同编号', width: 200, align: 'center', sortable: false },
            { field: 'CustName', title: '客户名称', width: 200, align: 'center', sortable: false },
            { field: 'RoomSign', title: '房屋编号', width: 200, align: 'center', sortable: false },
            { field: 'CostName', title: '费用名称', width: 200, align: 'center', sortable: false },
            {
                field: 'FeesDueDate', title: '费用日期', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value, "yyyy年MM月");
                }
            },
            {
                field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'FeesStateDate', title: '开始日期', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'FeesEndDate', title: '结束日期', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'DueAmount', title: '应收金额', width: 100, align: 'center', sortable: false },
            { field: 'PaidAmount', title: '实收金额', width: 100, align: 'center', sortable: false },
            { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'center', sortable: false },
            { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'center', sortable: false },
            { field: 'RefundAmount', title: '退款金额', width: 100, align: 'center', sortable: false },
            { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'center', sortable: false },
            { field: 'IsBankName', title: '托收状态', width: 100, align: 'center', sortable: false },
            { field: 'IsFreezeName', title: '冻结状态', width: 100, align: 'center', sortable: false },
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
                    //Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "FeesDueDate";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.MerchantsID = $.getUrlParam("ID");
                    param = $.getDataGridParam("DivfManage_Merchants", "GetListContractFees", param);
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

        function Edit(title, id) {
            var OpType = "Add";
            if (isValueNull(id)) { OpType = "Edit"; }
            var param = { "OpType": OpType, "ID": id };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Point/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Detailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Point/Tab.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }
        function Del(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.dataPostJson('DivfManage_Point', 'Del', { "idList": idList }, true, false,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                InitDataGrid();
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

    </script>
</body>
</html>
