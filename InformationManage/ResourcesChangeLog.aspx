<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResourcesChangeLog.aspx.cs" Inherits="M_Main.InformationManage.ResourcesChangeLog" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>客户信息操作历史记录</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body>
    <form id="FrmForm" runat="server">
         <input id="LogType" name="LogType" type="hidden" runat="server"/>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 150px; padding: 10px;">
            <table style="width: 99%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td>操作说明
                    </td>
                    <td>
                        <input id="LogMemo" style="width: 136px" size="17" name="LogMemo" maxlength="50" />
                    </td>
                </tr>
                <tr>
                    <td >操作开始时间</td>
                    <td >
                        <input type="text"
                            id="CustomerStartDate" name="CustomerStartDate" onclick="WdatePicker()" runat="server" />
                    </td>
                    <td >操作结束时间</td>
                    <td>
                        <input type="text"
                            id="CustomerEndDate" name="CustomerEndDate" onclick="WdatePicker()" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">

    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h-41 + "px");
    }

    var column = [[
            { field: 'IID', title: 'IID', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'LogType', title: '操作类型', width: 150, align: 'left', sortable: true },
            {
                field: 'LogTime', title: '操作日期', width: 150, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.LogTime, "yyyy-MM-dd HH:mm:ss");
                    return str;
                }
            },
            { field: 'LogMemo', title: '操作说明', width: 300, align: 'left', sortable: true },
              { field: 'LogUser', title: '操作人', width: 100, align: 'left', sortable: true }
    ]];

    var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                    $("#LogMemo").val("");
                }
            }
    ];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Customer&Command=searchchangeLog&' + $("#FrmForm").serialize(),
            method: "get",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc"
        });
        $("#SearchDlg").dialog("close");
    }

</script>

