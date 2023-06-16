<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpCostStandardEditHisBrowse.aspx.cs" Inherits="M_Main.ChargesNew.CorpCostStandardEditHisBrowse" %>
<!DOCTYPE html>
<html>
<head>
    <title>标准变化情况</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 600px; 
            height: 150px; 
        }
        #SearchSaveDlg {
            padding:10px;
            width: 600px; 
            height: 150px; 
        }
        .SearchTable
        {
            width: 600px; 
            height:auto;
        }
        .SearchTable .TdTitle {
            width:15%;
        }
        .SearchTable .TdContent {
            width:35%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input type="hidden" id="SelRows" name="LockRows" runat="server" />
    <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
    <input type="hidden" id="CostCode" name="CostCode" runat="server" />
    <div id="TableContainer">
    </div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    费用项目
                </td>
                <td class="TdContentSearch">
                    <input type="text"  class="easyui-searchbox" searcher="SelCostName"  data-options="required:true"
                    id="CostName" name="CostName"  runat="server" />
                </td>
                <td class="TdTitle">
                    标准名称
                </td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"  id="StanName" name="StanName" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">

        function SelCostName() {
            $('.easyui-dialog').parent().appendTo($("form:first"));
            HDialog.Open('1000', '600', '../DialogNew/SelCorpCostItem.aspx', '费用项目选择', false, function callback(_Data) {
                if (_Data != '') {
                    var Obj = JSON.parse(_Data);
                    $("#CostName").searchbox("setValue", Obj.text);
                    $("#CostCode").val(Obj.id);
                    $("#CorpCostID").val(Obj.attributes.CorpCostID);
                }
            });
        }

        function InitFunction() {
            var h = $(window).height()-5;
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
            { field: 'EditTypeName', title: '操作类别', align: 'left', sortable: true },
            { field: 'UserName', title: '操作人', align: 'left', sortable: true },
            {
                field: 'CostName', title: '费用名称',width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.HisID + "','edit');\">" + row.CostName + "</a>";
                    return str;
                }
            },
            
            { field: 'NewStanName', title: '标准名称', width: 250,align: 'left', sortable: true },
            { field: 'StanAmount', title: '原通用收费标准', align: 'left', sortable: true },
            { field: 'NewStanAmount', title: '现通用收费标准', align: 'left', sortable: true },    

            { field: 'StanExplain', title: '原标准说明', width: 150,align: 'left', sortable: true },
            { field: 'NewStanExplain', title: '现标准说明', width: 150,align: 'left', sortable: true },

            { field: 'ChargeCycle', title: '原计费周期', align: 'left', sortable: true },
            { field: 'NewChargeCycle', title: '现计费周期', align: 'left', sortable: true },
            { field: 'AmountRounded', title: '原数量取整方式', align: 'left', sortable: true },
            { field: 'NewAmountRounded', title: '现数量取整方式', align: 'left', sortable: true },

            { field: 'DelinRates', title: '原合同违约金比率', align: 'left', sortable: true },
            { field: 'NewDelinRates', title: '现合同违约金比率', align: 'left', sortable: true },
            
            { field: 'StanStartDate', title: '原启用日期', align: 'left', sortable: true , formatter: function (value, row, index) {
                        var str = formatDate(row.StanStartDate, "yyyy-MM-dd");
                        return str;
                }
            },
            { field: 'NewStanStartDate', title: '现启用日期', align: 'left', sortable: true , formatter: function (value, row, index) {
                        var str = formatDate(row.NewStanStartDate, "yyyy-MM-dd");
                        return str;
                }
            },
            { field: 'StanEndDate', title: '原停用日期', align: 'left', sortable: true , formatter: function (value, row, index) {
                        var str = formatDate(row.StanEndDate, "yyyy-MM-dd");
                        return str;
                }
            },
            { field: 'NewStanEndDate', title: '现停用日期', align: 'left', sortable: true , formatter: function (value, row, index) {
                        var str = formatDate(row.NewStanEndDate, "yyyy-MM-dd");
                        return str;
                }
            }

        ]];
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                rownumbers: true,
                IsCustomHead: false,
                remoteSort: false,
                cascadeCheck: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CorpCostStandardHistory", "List", "TableContainer", param);
                }
            });
        }
        LoadList();

        function Detail(HisID, OpType) {
            $('.easyui-dialog').parent().appendTo($("form:first"));
            HDialog.Open('1000', '600', '../ChargesNew/CorpCostStandardEditHisManage.aspx?HisID=' + HisID + '&OpType=' + OpType, '操作历史详细', false, function callback(_Data) {
                if (_Data != '') {
                    LoadList();
                }
            });
        }

    </script>
    </form>
</body>
</html>