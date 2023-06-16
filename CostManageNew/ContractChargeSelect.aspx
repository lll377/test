<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractChargeSelect.aspx.cs" Inherits="M_Main.CostManageNew.ContractChargeSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同费用查询</title>
    <%--<link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .combobox-item {
            height: 25px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1000px; height: 160px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr class="tr">
                    <td class="TdTitle">合同名称</td>
                    <td class="TdContent">
                        <input id="ContractName" name="ContractName" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">合同编号</td>
                    <td class="TdContent">
                        <input id="ContractNo" name="ContractNo" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">签订主体</td>
                    <td class="TdContent">
                        <input id="CastName" name="CastName" type="text" class="easyui-validatebox" onclick="SelCast();" />
                        <input type="hidden" id="CostId" name="CostId" value="" /></td>
                    <td class="TdTitle">成本科目</td>
                    <td class="TdContent">
                        <input id="SubjectName" name="SubjectName" type="text" class="easyui-validatebox" onclick="SelCostSubject();" />
                        <input type="hidden" id="CsId" name="CsId" value="" /></td>
                </tr>

                <tr>
                    <td class="TdTitle">应付年月</td>
                    <td class="TdContent">
                        <input id="PayMonth" name="PayMonth"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM', skin: 'default' })" format="date" />
                    </td>
                    <%--<td class="TdTitle">已付金额</td>
                    <td class="TdContent">
                        <input id="PayedMoney" name="PayedMoney" type="text" class="easyui-validatebox" /></td>--%>
                </tr>
                <tr style="height: 10px;">
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>


        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            //选择成本科目
            function SelCostSubject() {
                LayerDialog.Open('400', '350', '../DialogNew/SelCostSubject.aspx?OnlyChildren=true', '选择成本科目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#CsId").val(varObjects[0]);
                        $("#SubjectName").val(varObjects[1]);
                    }
                });
            }
            //选择签订主体
            function SelCast() {
                LayerDialog.Open('400', '350', '../DialogNew/SelCostCompany.aspx', '选择签订主体', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#CostId").val(varObjects[0]);
                        $("#CastName").val(varObjects[1]);
                    }
                });
            }

            var column = [[
                { field: 'ChId', title: 'ChId', width: 25, align: 'left', sortable: true, hidden: true },
                //{ field: 'Sort', title: '序号', width: 30, align: 'left', sortable: true },
                {
                    field: 'ContractName', title: '合同名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"ContractShow('" + row.CId + "')\">" + row.ContractName + "</a>";
                        return str;
                    }
                },
                { field: 'ContractNo', title: '合同编号', width: 80, align: 'left', sortable: true },
                { field: 'CastName', title: '签订主体', width: 80, align: 'left', sortable: true },
                { field: 'SubjectName', title: '成本科目', width: 80, align: 'left', sortable: true },
                { field: 'Rate', title: '税率（%）', width: 80, align: 'left', sortable: true },
                { field: 'PayMonth', title: '应付年月', width: 80, align: 'left', sortable: true },
                { field: 'PayMoney', title: '应付金额（元）', width: 50, align: 'left', sortable: true },
                { field: 'PayedMoney', title: '已付金额（元）', width: 50, align: 'left', sortable: true },
                { field: 'Remark', title: '备注', width: 80, align: 'left', sortable: true }
            ]];

            //查看合同详情
            function ContractShow(CId) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                LayerDialog.Open(w, h, '../CostManageNew/FromTabs.aspx?changBS=1&OpType=edit&Id=' + CId, '查看合同信息', true, function callback(_Data) {
                });
            }

            function btnClear() {
                $("#CommName ,#CommId , #DepName, #DepCode ,#PrincipalName, #CastName ,#ContractNo,#ContractName, #CostId, #ContractType, #SubjectName, #CsId, #ContractPeriod,#PayMonth, #ContractEnd,#StartTime").val("");
                $("#Statue ,#IsUpdate1 , #IsPastDue1, #IsEnd1 ,#IsSettleAccounts1,#IsClose1 ").val("");
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#RunDate").datebox('setValue', null);
                    }
                }, {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        Export();
                    }
                }];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractChargeList&' + $('#frmFrom').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
                $("#SearchDlg").dialog("close");
            }
            $(function () {
                LoadList();
            });

            function Export() {

                var dataFields = $('#TableContainer').datagrid('getColumnFields');
                var dataColumnFields = [], fields = "", datagridAttribute;

                $.each(dataFields, function (i, item) {
                    fields = item;
                    datagridAttribute = $('#TableContainer').datagrid("getColumnOption", item);
                    if (datagridAttribute.hidden) {
                        return true;
                    }
                    if (item == "Opt") { return true; }
                    dataColumnFields += "," + fields + " '" + datagridAttribute.title.replace("<br/>", "") + "'";
                });
                dataColumnFields = dataColumnFields.slice(1);
                var param = $.getParam();
                param.DataColumnFields = dataColumnFields;
                param.PageSize = 5000;
                param.IsPagination = "否";
                param.IsZip = "否";
                param.TableName = "合同费用";
                param.Class = "CsCost";
                param.Method = "GetContractChargeListWhere";
                console.log($.param(param));
                window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
            }
        </script>
    </form>
</body>
</html>

