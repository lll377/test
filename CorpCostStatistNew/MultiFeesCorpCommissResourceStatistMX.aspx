<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiFeesCorpCommissResourceStatistMX.aspx.cs" Inherits="M_Main.CorpCostStatistNew.MultiFeesCorpCommissResourceStatistMX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../css/framesearch.css" />
    <link rel="stylesheet" type="text/css" href="../css/button.css" />
    <link rel="stylesheet" type="text/css" href="../css/editcss.css" />

    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../jscript/Authority.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/PersonDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/Dialog.js"></script>
    <script type="text/javascript" src="../jscript/format.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: auto;
            height: auto;
        }
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            line-height: 20px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 19%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }
    </style>
</head>
<body>
    <form id="FrmForm" runat="server" method="post">
        <input id="CommID" name="CommID" type="hidden" runat="server" />
        <input id="PropertyUses" name="PropertyUses" type="hidden" runat="server" />
        <input id="RoomState" name="RoomState" type="hidden" runat="server" />
        <input id="OrganCode" name="OrganCode" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        LoadList();
    });

    function InitTableHeight() {
        var w = $(window).height();
        var h = $(window).height();
        $("#TableContainer").css("width", w + "px");
        $("#TableContainer").css("height", h + "px");
    }

    var toolbar = [
        {
            text: '导出Excel',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = 'MultiFeesCorpCommissResourceStatistXMCre.aspx';
            }
        }
    ];

    var column = [[
        { field: 'OrganName', title: '区域名称', width: 150, align: 'left', sortable: true },
        { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true },
        { field: 'CustName', title: '业主名称', width: 120, align: 'left', sortable: true },
        { field: 'PropertyUses', title: '使用性质', width: 120, align: 'left', sortable: true },
        { field: 'StateName', title: '房屋状态', width: 120, align: 'left', sortable: true },
        { field: 'BuildArea', title: '建筑面积', width: 120, align: 'left', sortable: true },
        { field: 'InteriorArea', title: '套内面积', width: 120, align: 'left', sortable: true },
        { field: 'CommonArea', title: '公摊面积', width: 120, align: 'left', sortable: true },
        { field: 'GardenArea', title: '花园面积', width: 120, align: 'left', sortable: true }
    ]];

    function LoadList() {
        InitTableHeight();
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            toolbar: toolbar,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("FeesStatic", "CorpCommissResourceStatistMX", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }
</script>