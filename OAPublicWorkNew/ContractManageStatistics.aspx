<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractManageStatistics.aspx.cs" Inherits="M_Main.OAPublicWorkNew.ContractManageStatistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同评审统计</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/export.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: auto;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        #DlgSetIsReimbursement {
            padding: 10px;
            width: 300px;
            height: auto;
        }

            #DlgSetIsReimbursement .SearchTable {
                width: 300px;
                height: auto;
            }

                #DlgSetIsReimbursement .SearchTable .TdTitle {
                    width: 30%;
                }

                #DlgSetIsReimbursement .SearchTable .TdContent {
                    width: 20%;
                }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="CorpID" name="CorpID" type="hidden" runat="server" />
        <input id="WorkFlowTypeId" type="hidden" name="WorkFlowTypeId" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">流程类别
                    </td>
                    <td class="TdContent">
                        <input id="WorkFlowType" readonly name="WorkFlowType" runat="server" onclick="SelWorkFlowType();" />
                    </td>
                    <td class="TdTitle">发起人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起开始时间
                    </td>
                    <td class="TdContentSearch">
                        <input id="CheckStartDate" name="CheckStartDate" class="easyui-datebox" runat="server" />
                    </td>
                    <td class="TdTitle">发起结束时间
                    </td>
                    <td class="TdContentSearch">
                        <input id="CheckEndDate" name="CheckEndDate" class="easyui-datebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同名称
                    </td>
                    <td class="TdContent">
                        <input id="ContractName" name="ContractName" runat="server" />
                    </td>
                    <td class="TdTitle">对方单位
                    </td>
                    <td class="TdContent">
                        <input id="CompanyName" name="CompanyName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同编号
                    </td>
                    <td class="TdContent">
                        <input id="ContractCode" name="ContractCode" runat="server" />
                    </td>
                    <td class="TdTitle">合同类别
                    </td>
                    <td class="TdContent">
                        <select id="ContractType" name="ContractType" runat="server">
                            <option value=""></option>
                            <option value="支付合同">支付合同</option>
                            <option value="收款合同">收款合同</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同金额
                    </td>
                    <td class="TdSearchContent">
                        <input id="SContractMoney" style="width: 40px; height: 19px" name="SContractMoney" runat="server" />
                        至
                    <input id="EContractMoney" style="width: 40px; height: 19px" name="EContractMoney" runat="server" />
                    </td>
                    <td class="TdTitle">合同期限
                    </td>
                    <td class="TdContent">
                        <input id="ContractLimit" name="ContractLimit" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">主办部门
                    </td>
                    <td class="TdContent">
                        <input id="WorkDepart" name="WorkDepart" runat="server" />
                    </td>
                    <td class="TdTitle">经办人
                    </td>
                    <td class="TdContent">
                        <input id="Writer" name="Writer" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">办理天数大于
                    </td>
                    <td class="TdContentSearch">
                        <input id="SWorkDays" name="SWorkDays" style="width: 40px; height: 16px; border: 1px solid #cccccc;" runat="server" />
                        至
                    <input id="EWorkDays" name="EWorkDays" style="width: 40px; height: 16px; border: 1px solid #cccccc;" runat="server" />
                    </td>
                    <td class="TdTitle">办理状态
                    </td>
                    <td class="TdContent">
                        <select id="CompleteName" runat="server">
                            <option value=""></option>
                            <option value="1">未完结</option>
                            <option value="2">已完结</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报账状态
                    </td>
                    <td class="TdContent">
                        <select id="IsReimbursement" name="IsReimbursement" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="DlgSetIsReimbursement" class="easyui-dialog" title="设置报账状态" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">报账状态
                    </td>
                    <td class="TdContent">
                        <select id="IsReimbursementSet" name="IsReimbursementSet" runat="server">
                            <option value="是" selected>是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="Save();">保存</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="Cancel();">取消返回</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function SelWorkFlowType() {
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0002&random=" + Math.random();
                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        if (obj != null) {
                            document.all.WorkFlowType.value = obj[1].toString();
                            document.all.WorkFlowTypeId.value = obj[0].toString();
                        }
                    }
                });
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                { field: 'ck', checkbox: true },
                { field: 'LoginName', title: '发起人', align: 'left', width: 50 },
                { field: 'WorkStartDate', title: '发起时间', align: 'left', width: 50 },
                { field: 'ContractType', title: '合同类别', align: 'left', width: 50 },
                {
                    field: 'ContractName', title: '合同名称', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.InfoId + "');\">" + row.ContractName + "</a>";
                        return str;
                    }
                },
                { field: 'ContractCode', title: '合同编号', align: 'left', width: 50 },
                { field: 'CompanyName', title: '对方单位', align: 'left', width: 50 },
                { field: 'ContractMoney', title: '合同金额', align: 'left', width: 50 },
                { field: 'ContractLimit', title: '合同期限', align: 'left', width: 50 },
                { field: 'WorkDepart', title: '主办部门', align: 'left', width: 50 },
                { field: 'Writer', title: '经办人', align: 'left', width: 50 },
                { field: 'WorkDays', title: '办理天数', align: 'left', width: 50 },
                { field: 'CompleteName', title: '办理状态', align: 'left', width: 50 },
                {
                    field: 'IsReimbursement', title: '是否报账', align: 'center', width: 50, formatter: function (value, row, index) {
                        if (value == "") {
                            return "否";
                        }
                        return value;
                    }
                }
            ]];
            var toolbar = [
                {
                    text: '报账状态设置',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var Rows = $('#TableContainer').datagrid('getChecked');
                        if (Rows.length == 0) {
                            HDialog.Info("请至少勾选一条需要设置报账状态的数据！");
                            return;
                        }

                        $('#DlgSetIsReimbursement').parent().appendTo($("form:first"));
                        $('#DlgSetIsReimbursement').dialog('open');
                    }
                }, '-',
                {
                    text: '统计',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成合同评审统计数据！');
                        }
                        else {
                            Export('合同评审统计', $('#TableContainer'));
                        }
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=OASearch&Command=ContractSearch&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            function Detail(InfoId) {
                if (InfoId == '') {
                    window.location.href = 'ContractManage.aspx';
                }
                else {
                    window.location.href = 'ContractManage.aspx?InfoId=' + InfoId;
                }

            }
            //保存报账状态
            function Save() {
                var Rows = $('#TableContainer').datagrid('getChecked');
                if (Rows.length == 0) {
                    HDialog.Info("请至少勾选一条需要设置报账状态的数据！");
                    return;
                }
                var InfoIds = "";
                Rows.forEach((itemRow) => {
                    InfoIds = InfoIds + ',' + itemRow.InfoId;
                });
                if (InfoIds.endsWith(",")) {
                    InfoIds = InfoIds.substring(0, InfoIds.length - 1);
                }
                $.messager.confirm('确定', '是否确定修改当前勾选数据的报账状态？', function (r) {
                    if (r) {
                        $.tool.DataGet('OASearch', 'ContractUpdateIsReimbursement', 'InfoIds=' + InfoIds + "&IsReimbursement=" + $('#IsReimbursementSet').val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data != "true") {
                                    HDialog.Info(_Data);
                                } else {
                                    HDialog.Info("修改报账状态成功！");
                                    LoadList();
                                }
                                $('#DlgSetIsReimbursement').dialog('close');
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            //取消返回
            function Cancel() {
                $('#DlgSetIsReimbursement').dialog('close');
            }

            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable2(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }

            var Headcolumn = [[
                { field: 'LoginName', title: '发起人', align: 'left', width: 100 },
                { field: 'WorkStartDate', title: '发起时间', align: 'left', width: 140 },
                { field: 'ContractType', title: '合同类别', align: 'left', width: 100 },
                { field: 'ContractName', title: '合同名称', align: 'left', width: 100 },
                { field: 'ContractCode', title: '合同编号', align: 'left', width: 100 },
                { field: 'CompanyName', title: '对方单位', align: 'left', width: 140 },
                { field: 'ContractMoney', title: '合同金额', align: 'left', width: 100 },
                { field: 'ContractLimit', title: '合同期限', align: 'left', width: 100 },
                { field: 'WorkDepart', title: '主办部门', align: 'left', width: 140 },
                { field: 'Writer', title: '经办人', align: 'left', width: 100 },
                { field: 'WorkDays', title: '办理天数', align: 'left', width: 100 },
                { field: 'CompleteName', title: '办理状态', align: 'left', width: 100 },
                { field: 'IsReimbursement', title: '是否报账', align: 'center', width: 100 }
            ]];

            var ExcelCol = [[
                { field: 'LoginName', title: '发起人', align: 'left', width: 100 },
                { field: 'WorkStartDate', title: '发起时间', align: 'left', width: 140 },
                { field: 'ContractType', title: '合同类别', align: 'left', width: 100 },
                { field: 'ContractName', title: '合同名称', align: 'left', width: 100 },
                { field: 'ContractCode', title: '合同编号', align: 'left', width: 100 },
                { field: 'CompanyName', title: '对方单位', align: 'left', width: 140 },
                { field: 'ContractMoney', title: '合同金额', align: 'left', width: 100 },
                { field: 'ContractLimit', title: '合同期限', align: 'left', width: 100 },
                { field: 'WorkDepart', title: '主办部门', align: 'left', width: 140 },
                { field: 'Writer', title: '经办人', align: 'left', width: 100 },
                { field: 'WorkDays', title: '办理天数', align: 'left', width: 100 },
                { field: 'CompleteName', title: '办理状态', align: 'left', width: 100 },
                { field: 'IsReimbursement', title: '是否报账', align: 'center', width: 100 }
            ]];
        </script>
    </form>
</body>
</html>
