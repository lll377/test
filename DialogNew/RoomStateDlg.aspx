<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomStateDlg.aspx.cs" Inherits="M_Main.DialogNew.RoomStateDlg" %>

<!DOCTYPE html>
<html>
<head>
    <title>收费房屋状态比例</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="RoomState" name="RoomState" runat="server" />
        <div id="TableContainer">
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                { field: '', checkbox: true, sortable: true },
                { field: 'SortNum', title: '序号', width: 70, align: 'left', sortable: true },
                {
                    field: 'StateName', title: '交房状态', width: 150, align: 'left', sortable: true
                },
                { field: 'FeesRate', title: '收费比率', width: 100, align: 'left', sortable: true }

            ]];
            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-filter',
                    handler: function () {
                        var rows = $("#TableContainer").datagrid('getSelections');
                        var StateNames = "";
                        var RoomStates = "";
                        for (var i = 0; i < rows.length; i++) {
                            StateNames += rows[i].StateName + ",";
                            RoomStates += rows[i].RoomState + ",";
                        }
                        if (StateNames.length > 0) StateNames = StateNames.substring(0, StateNames.length - 1);
                        if (RoomStates.length > 0) RoomStates = RoomStates.substring(0, RoomStates.length - 1);

                        var result = StateNames + "\t" + RoomStates;
                        HDialog.Close(result);
                    }
                }
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CorpRoomState&Command=ListDlg&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: false,
                    pagination: true,
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


        </script>
    </form>
</body>
</html>
