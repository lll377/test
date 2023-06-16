<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAssert.aspx.cs" Inherits="M_Main.OAPublicWorkNew.ContractAssert" %>

<!DOCTYPE html>
<html>
<head>
    <title>合同评审</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 200px;
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
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
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
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function SelWorkFlowType() {
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0004&random=" + Math.random();
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
                if (h < 760) {
                    h = h - 40;
                }
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                { field: 'LoginName', title: '发起人', align: 'left', width: 50, sortable: true },
                { field: 'WorkStartDate', title: '发起时间', align: 'left', width: 50, sortable: true },
                { field: 'ContractType', title: '合同类别', align: 'left', width: 50, sortable: true },
                {
                    field: 'ContractName', title: '合同名称', align: 'left', width: 80, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.InfoId + "');\">" + row.ContractName + "</a>";
                        return str;
                    }
                },
                { field: 'ContractCode', title: '合同编号', align: 'left', width: 50, sortable: true },
                { field: 'CompanyName', title: '对方单位', align: 'left', width: 50, sortable: true },
                { field: 'ContractMoney', title: '合同金额', align: 'left', width: 50, sortable: true },
                { field: 'ContractLimit', title: '合同期限', align: 'left', width: 50, sortable: true },

                { field: 'WorkDepart', title: '主办部门', align: 'left', width: 50, sortable: true },
                { field: 'Writer', title: '经办人', align: 'left', width: 50, sortable: true },

                { field: 'WorkDays', title: '办理天数', align: 'left', width: 50, sortable: true },
                { field: 'CompleteName', title: '办理状态', align: 'left', width: 50, sortable: true }

            ]];
            var toolbar = [
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row)
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = "../OAPublicWorkNew/Export/ContractAssertExport.aspx";
                    }
                }
            ];
            //zmh 2017-04-11 添加导出

            function DelRecord(row) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('OAControl', 'ContractDelete', 'InfoId=' + row.InfoId + '&State=' + row.CompleteName,
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                if (_Data.substring(0, 5) == "false") {
                                    HDialog.Info(_Data.substring(6));
                                }
                                else {
                                    LoadList();
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=OAControl&Command=ContractSearch&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();


            function Detail(InfoId) {
                window.location.href = 'ContractManage.aspx?IsAssert=1&IsPrint=1&InfoId=' + InfoId;
            }
        </script>
    </form>
</body>
</html>
