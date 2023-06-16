<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckRoomSetSee.aspx.cs" Inherits="M_Main.HouseInspect.CheckRoomSetSee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查验房屋设置</title>
     <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
</head>
<body>
       <form id="frmForm" runat="server">
          <div id="TableContainer" style="width: 100%; background-color: #cccccc;">
        </div>
           <input id="CommId" type="hidden" name="CommId" runat="server" />
            <input id="RoomID" type="hidden" name="RoomID" runat="server" />
    </form>
    <script>
        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");

            $("#RoomID").val(GetQueryString("RoomID"))
        }
        InitFunction();
        $("#CommId").val(Cache.GetData("CommID"))
        var column = [[
            { field: 'ID', title: 'ID', align: 'left', sortable: true, hidden: true },
            { field: 'CommName', title: '所属项目', width: 40, align: 'left', sortable: true },
            {
                field: 'RoomSign', title: '房屋编号', width: 40, align: 'left', sortable: true
            },
            { field: 'RoomName', title: '房屋名称', width: 40, align: 'left', sortable: true },
            { field: 'HouseName', title: '房间名称', width: 40, align: 'left', sortable: true }
        ]];

        function LoadList() {
            
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetCheckRoomSetList&' + $('#frmForm').serialize(),
                method: "get",
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                nowrap: false,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                //toolbar: toolbar,
                sortOrder: "asc",
                onLoadSuccess: function (data) {


                }
            });
            $("#SearchDlg").dialog("close");
        }
        LoadList();

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

    </script>
</body>
</html>
