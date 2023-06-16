<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysLogBrowse.aspx.cs" Inherits="M_Main.SysNew.SysLogBrowse" %>
<!DOCTYPE html>
<html>
<head>
    <title>操作日志</title>
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
            width: 900px; 
            height: 240px; 
        }
        .SearchTable
        {
            width: 900px; 
            height:auto;
        }
    </style>
</head>
<body>
    <form id="frmForm">
    <input type="hidden" id="DepCode" name="DepCode" runat="server" />
    <div class="SearchContainer" id="TableContainer">
    </div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                   开始时间
                </td>
                <td class="TdContent">
                    <input type="date" id="StartLogTime" name="StartLogTime" class="easyui-datebox"  style="width:130px;" />
                </td>
                <td class="TdTitle">
                   结束时间
                </td>
                <td class="TdContent">
                    <input type="date" id="EndLogTime" name="EndLogTime" class="easyui-datebox"   style="width:130px;"  />
                </td>
                <td class="TdTitle">
                   操作者
                </td>
                <td class="TdContent">
                    <input type="text" id="UserName" name="UserName" />
                </td>
                <td class="TdTitle">
                    客户端IP
                </td>
                <td class="TdContent">
                    <input type="text" id="LocationIP" name="LocationIP" />
                </td>
                </tr>
              <tr>
                <td class="TdTitle">
                   系统名称
                </td>
                <td class="TdContent">
                    <input type="text" id="CommName" name="CommName" />
                </td>
                <td class="TdTitle">
                    操作内容
                </td>
                <td class="TdContent">
                    <input type="text" id="OperateName" name="OperateName" />
                </td>
                <td class="TdTitle">
                   备注
                </td>
                <td class="TdContent">
                    <input type="text" id="Memo" name="Memo" />
                </td>
                <td class="TdTitle">
                    部门名称
                </td>
                <td class="TdContent">
                    <input type="text" id="DepName" name="DepName" />
                </td>
                </tr>
            <tr>
                <td class="TdTitle">
                   岗位名称
                </td>
                <td class="TdContent">
                    <input type="text" id="RoleName" name="RoleName" />
                </td>
                <td class="TdTitle">
                </td>
                <td class="TdContent">
                </td>
                <td class="TdTitle">
                </td>
                <td class="TdContent">
                </td>
                <td class="TdTitle">
                </td>
                <td class="TdContent">
                </td>
                </tr>
            <tr>
                <td colspan="8" style="text-align:center;padding-top:5px;">
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
            { field: 'LogTime', title: '日志时间', align: 'left', sortable: true, width: 25 },
            { field: 'UserName', title: '操作者', align: 'left', sortable: true, width: 25 },
            { field: 'LocationIP', title: '客户端IP', align: 'left', sortable: true, width: 25 },
            { field: 'CommName', title: '系统名称', align: 'left', sortable: true, width: 25 },
            { field: 'OperateName', title: '操作内容', align: 'left', sortable: true, width: 25 },
            { field: 'Memo', title: '备注', align: 'left', sortable: true, width: 25 }
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
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Log&Command=LogList&' + $('#frmForm').serialize(),
                method: "get",
                nowrap: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                remoteSort: false,
                pagination: true,
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

    </script>
    </form>
</body>
</html>
