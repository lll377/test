<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewStanDlg.aspx.cs" Inherits="M_Main.DialogNew.NewStanDlg" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
       <INPUT id="CommID"  type="hidden" size="1" name="CommID" runat="server"/>
        <INPUT id="CostID" type="hidden" size="1" name="CostID" runat="server"/>
        <INPUT id="CostCode"  type="hidden" size="1" name="CostCode" runat="server"/>
        <INPUT id="hiIsHis"  type="hidden" size="1" name="hiIsHis" runat="server"/>
        <INPUT id="IsShowHis"  type="hidden" size="1" name="IsShowHis" runat="server"/>

    <div class="SearchContainer" id="TableContainer">
    </div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
        style="width: 400px; height: 100px; padding: 10px;">
        <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
            <tr>
                <td width="25%">
                    <asp:CheckBox id="IsHis" runat="server" Text="历史标准" AutoPostBack="True" OnCheckedChanged="IsHis_CheckedChanged"></asp:CheckBox>&nbsp;&nbsp;标准名称
                </td>
                <td width="75%">
                  <INPUT id="StanName" style="WIDTH: 144px; HEIGHT: 22px" type="text" size="18" name="StanName"
							runat="server" maxLength="100" class="Control_ItemInput">
                     <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">
                        确定筛选</a>
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

        var column = [[
                { field: 'StanID', title: 'StanID', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'CostSNum', title: '费用序号', width: 50, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 60, align: 'left', sortable: true },
                
                { field: 'StanName', title: '标准名称', width: 100, align: 'left', sortable: true },
                { field: 'StanFormulaName', title: '计算方式', width: 120, align: 'left', sortable: true },
                { field: 'StanAmount', title: '计算标准', width: 50, align: 'left', sortable: true },
                { field: 'ChargeCycle', title: '计费周期', width: 50, align: 'left', sortable: true },
                { field: 'DelinRates', title: '合同违约金比率', width: 50, align: 'left', sortable: true },
                { field: 'StanExplain', title: '标准说明', width: 50, align: 'left', sortable: true },                
                { field: 'StanEndHit', title: '标准状态', width: 50, align: 'left', sortable: true }

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

            var CommID = $('#CommID').val();
            var IsHis = $('#hiIsHis').val();
            var CostID = $('#CostID').val();
            var CostCode = $('#CostCode').val();
            var StanName = $('#StanName').val();
            

            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=CostStandard&CommID=' + CommID + '&IsHis=' + IsHis + '&CostID=' + CostID + '&CostCode=' + CostCode + '&StanName=' + StanName,
                method: "Get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                rownumbers: true,
                border: false,
                toolbar: toolbar,
                sortOrder: "asc",
                onDblClickRow: function (rowIndex, rowData) {
                    if (rowData.StanID == 0) {
                        HDialog.Info("请选择收费标准");
                    }
                    else if (rowData.iStanEndDay < 0)
                    {
                        HDialog.Info("标准已失效");
                    }
                    else {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(rowData);
                    }
                },
                onLoadSuccess: function (data) {
                }
            });
            $("#SearchDlg").dialog("close");
        }

        LoadList();


    </script>
    </form>
</body>
</html>
