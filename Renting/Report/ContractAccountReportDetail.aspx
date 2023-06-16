<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAccountReportDetail.aspx.cs" Inherits="M_Main.Renting.Report.ContractAccountReportDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同台账报表-费用明细（数据挖掘）</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="DetailID" name="DetailID" runat="server" />
    <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 550px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formSearch" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">费用项目</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="CostName" name="CostName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">费用开始时间</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="StartFeesStartDate" name="StartFeesStartDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">至</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="EndFeesStartDate" name="EndFeesStartDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">费用结束时间</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="StartFeesEndDate" name="StartFeesEndDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">至</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="EndFeesEndDate" name="EndFeesEndDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-22 col-xs-22" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formSearch').form('clear');">清空</a>
                </div>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            //datebox 添加清空
            var buttons = $.extend([], $.fn.datebox.defaults.buttons);
            buttons.splice(1, 0, {
                text: '清空',
                handler: function (target) {
                    $(target).datebox("setValue", "");
                }
            });
            $('.easyui-datebox').datebox({
                buttons: buttons
            });

            let param = $.getUrlParam();
            if (!!param.DetailID) {
                $("#DetailID").val(param.DetailID);
            }
            InitDataGrid();
        });

        //加载 列表
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-',
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //判断当前页面是否存在数据
                    let Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', "没有可导出的数据，请确认！");
                        return;
                    }
                    var dataFields = $('#TableContainer').datagrid('getColumnFields');
                    var dataColumnFields = [];

                    dataFields.forEach((item, index) => {
                        dataColumnFields += "," + item + " '" + $('#TableContainer').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
                    });
                    if (dataColumnFields.startsWith(',')) {
                        dataColumnFields = dataColumnFields.slice(1);
                    }
                    var param = $.getParam();
                    param.DataColumnFields = dataColumnFields;
                    param.PageSize = 5000;
                    param.IsPagination = "否";
                    param.IsZip = "否";
                    param.TableName = "合同台账明细数据(数据挖掘)";
                    param.Class = 'Renting_ContractAccountReport';
                    param.Method = "GetDataMiningSqlWhere";
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }
        ];

        var column = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 140, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 160, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'TenantryCustName', title: '客户名称', width: 180, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'center' },
            { field: 'RoomBuildArea', title: '建筑面积(平米)', width: 100, align: 'center' },
            { field: 'RoomChargeArea', title: '计租面积(平米)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准(元)', width: 100, align: 'center' },
            { field: 'CostName', title: '费用项目', width: 140, align: 'center' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'center' },
            {
                field: 'FeesDueDate', title: '应收日期', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesStartDate', title: '开始日期', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesEndDate', title: '结束日期', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DueAmount', title: '应收金额(元)', width: 120, align: 'center' },
            { field: 'DueAcceptedAmount', title: '应收已收金额(元)', width: 120, align: 'center' },
            { field: 'DueReductionAmount', title: '应收减免金额(元)', width: 120, align: 'center' },
            { field: 'DueUncollectedAmount', title: '应收未收金额(元)', width: 120, align: 'center' },
            { field: 'CurrentShouldConfirmAmount', title: '本年应确认收入(元)', width: 120, align: 'center' },
            { field: 'BillSign', title: '票据号码', width: 120, align: 'center' },
            { field: 'RefundAmount', title: '退款金额(元)', width: 100, align: 'center' }
        ]];

        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "OrganCode,CommID,TenantryCustID,CostID,FeesDueDate";
                    param.SortOrder = 1;
                    param = $.getDataGridParam("Renting_ContractAccountReport", "GetDataMiningList", param);
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                },
                onLoadError: function (data) {

                }
            });
            $('#dlg_search').dialog('close');
        }
    </script>
</body>
</html>
