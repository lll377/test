<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostItemPlotBrowse.aspx.cs" Inherits="M_Main.ChargesNew.CostItemPlotBrowse" %>
<!DOCTYPE html>
<html>
<head>
    <title>收费期间设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
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
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <input type="hidden" id="CostCode" name="CostCode" runat="server" />
    <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
    <div id="TableContainer">
    </div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    管理项目
                </td>
                <td class="TdContentSearch">
                    <input type="text" id="CommName" name="CommName" class="easyui-searchbox" searcher="SelComm" />
                </td>
                <td class="TdTitle">
                    费用名称
                </td>
                <td class="TdContentSearch">
                    <input type="text" id="CostName" name="CostName" class="easyui-searchbox" searcher="SelCostName"  />
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
        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
                        { field: 'CommName', title: '管理项目', width: 180, align: 'left', sortable: true },
                        {
                            field: 'CostName', title: '费用名称', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                                var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.CostID + "','" + row.CommID + "','" + row.CommName + "','edit');\">" + row.CostName + "</a>";
                                return str;
                            }
                        },
                        { field: 'DuePlotDate', title: '费用划分日期', width: 100, align: 'left', sortable: true }
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
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CommCostItem&Command=List&' + $('#frmForm').serialize(),
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                remoteSort: false,
                pagination: true,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                    $("#CommID").val('');
                }
            });
        }
        LoadList();

        function Detail(CostID,CommID,CommName, OpType)
        {
            $('.easyui-dialog').parent().appendTo($("form:first"));
            HDialog.Open('1000', '400', '../ChargesNew/CostItemPlotManage.aspx?CostID=' + CostID + '&CommID=' + CommID + '&CommName=' + CommName + '&OpType=' + OpType, '详细', false, function callback(_Data) {
                if (_Data != '') {
                    LoadList();
                }
            });
        }

        function SelComm() {
            $('.easyui-dialog').parent().appendTo($("form:first"));
            HDialog.Open('1000', '600', '../DialogNew/SelComm.aspx', '管理项目选择', false, function callback(_Data) {
                if (_Data != '') {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").searchbox("setValue", arrRet.name);
                }
            });
        }
        function SelCostName() {
            $('.easyui-dialog').parent().appendTo($("form:first"));
            HDialog.Open('1000', '600', '../DialogNew/SelCorpCostItem.aspx', '费用项目选择', false, function callback(_Data) {
                if (_Data != '') {
                    var Obj = JSON.parse(_Data);
                    $("#CostName").searchbox("setValue", Obj.text);
                }
            });
        }

    </script>
    </form>
</body>
</html>
