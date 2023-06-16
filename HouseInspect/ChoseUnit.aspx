<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChoseUnit.aspx.cs" Inherits="M_Main.HouseInspect.ChoseUnit" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>选择责任/整改单位</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="FrmForm" runat="server">
        <input id="type"  type="hidden" name="type" runat="server" />
        <input id="CommID"  type="hidden" name="CommID" runat="server" />
         <span style="margin-left:10px; margin-right:3px;">单位名称:</span><input class="easyui-validatebox" id="UnitName" name="UnitName" type="text"/>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
        <div style="width: 100%;" id="TableContainer">
        </div>

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();

                $("#TableContainer").css("height", h);
            }
            InitTableHeight();
            
            var column = [[
                { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
                { field: 'UnitName', title: '单位名称', width: 200, align: 'left', sortable: true }
            ]];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=ChoseUnit&' + $('#FrmForm').serialize(),
                    method: "get",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,                    
                    onLoadSuccess: function (data) {
                    },
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.Close(JSON.stringify(rowData));
                    }
                });
            }
            LoadList();

        </script>
    </form>
</body>
</html>


