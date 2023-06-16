<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomStateSeach.aspx.cs" Inherits="M_Main.HouseNew.RoomStateSeach" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.8.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="BuildSNums" type="hidden" size="1" name="BuildSNums" value="" runat="server" />
        <input id="hiBuildNames" type="hidden" size="1" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 680px; height: 200px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tbody>
                    <tr>
                        <td style="width: 15%; text-align: right">楼宇名称</td>
                        <td style="width: 35%; text-align: left"> 
                            <input id="BuildNames" class="easyui-searchbox" style="width: 144px" searcher="SelBuild" data-options="editable:false" name="BuildNames" runat="server" />
                        </td>
                        <td style="width: 15%; text-align: right">组团区域</td>
                        <td style="width: 35%; text-align: left">
                            <select id="RegionSNum" name="RegionSNum" class="easyui-combobox" runat="server">
                                <option selected=""></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; text-align: right">房屋编号</td>
                        <td style="text-align: left" colspan="3">
                            <input id="RoomSign" maxlength="50" class="easyui-textbox" style="width: 96%; border: 1px solid #cccccc; height: 20px; line-height: 20px;" size="26" name="RoomSign" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; text-align: right">修改前交房状态</td>
                        <td style="width: 35%; text-align: left">
                            <select id="RoomOldState" name="RoomOldState" class="easyui-combobox" runat="server"></select>
                        </td>
                        <td style="width: 15%; text-align: right">修改后交房状态</td>
                        <td style="width: 35%; text-align: left">
                            <select id="RoomNewState" name="RoomNewState" class="easyui-combobox" runat="server"></select>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; text-align: right">修改日期从</td>
                        <td style="width: 35%; text-align: left">
                            <input id="ChangeStartdate" style="width: 100%" class="easyui-datebox" maxlength="20" size="10" name="ChangeStartdate" runat="server" />
                        </td>
                        <td style="width: 15%; text-align: right">到</td>
                        <td style="width: 35%; text-align: left">
                            <input id="ChangeEndDate" style="width: 100%" class="easyui-datebox" maxlength="20" size="10" name="ChangeEndDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px"></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清除</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function SelBuild() {
        var varReturn;

        HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {


            if (_Data != "") {//**获得返回 刷新
                var varObjects = _Data.split("|");
                var BuildSNums = "";
                var BuildNames = "";
                $('#BuildSNums').val(BuildSNums);
                $('#BuildNames').searchbox('setValue', BuildNames);

                for (var i = 0; i < varObjects.length; i++) {
                    if (varObjects[i].indexOf(",") > 0) {
                        var d1 = varObjects[i].split(",")[0];
                        var d2 = varObjects[i].split(",")[1];

                        BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                        BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                    }

                }
                $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));

                //LoadList();
            }
        });

    }

    function getQueryStr(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) { return pair[1]; }
        }
        return (false);
    }


    function btnClear() {
        $("#RoomSign").textbox('setValue', '');
        $("#BuildNames").searchbox('setValue', '');
        $("#RegionSNum").combobox('setValue', '');
        $("#RoomOldState").combobox('setValue', '');
        $("#RoomNewState").combobox('setValue', '');
        $("#ChangeStartdate").searchbox('setValue', '');
        $("#ChangeEndDate").searchbox('setValue', '');

        //LoadList();
    }

    var column = [[
        { field: 'RoomID', title: 'RoomID', width: 50, align: 'left', sortable: true, hidden: true },
        { field: 'BuildName', title: '楼宇', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
        { field: 'CustName', title: '当前业主', width: 100, align: 'left', sortable: true },
        { field: 'BuildArea', title: '建筑面积', width: 100, align: 'left', sortable: true },
        { field: 'InteriorArea', title: '套内面积', width: 100, align: 'left', sortable: true },
        { field: 'GardenArea', title: '花园面积', width: 100, align: 'left', sortable: true },
        { field: 'YardArea', title: '地下室面积', width: 100, align: 'left', sortable: true },
        { field: 'StateName', title: '变更前交房状态', width: 100, align: 'left', sortable: true },
        { field: 'NewStateName', title: '变更后交房状态', width: 100, align: 'left', sortable: true },
        { field: 'UserName', title: '变更人', width: 100, align: 'left', sortable: true },
        { field: 'ChangeDate', title: '变更日期', width: 150, align: 'left', sortable: true },
        { field: 'ChangeMemo', title: '备注', width: 100, align: 'left', sortable: true }

    ]];



    function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }
    InitTableHeight();

    var toolbar = [
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }, '-',
        {
            text: 'Excel导出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = 'RoomStateSeachCreExcel.aspx';
            }
        }
    ];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            title: '',
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
            selectOnCheck: false,
            checkOnSelect: false,
            showFooter: true,
            rownumbers: true,
            border: false,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Room", "roomstatehis", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.IID == 'footer') {
                    return 'background-color:#F4F4F4;border:none;';
                }
            },
            onLoadSuccess: function (data) {
                $.tool.DataPostNoLoading('Room', "roomBuildAreaSum", $('#frmForm').serialize(),
                    function Init() {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                IID: 'footer',
                                CustName: "<span style='color:red'>建筑面积合计</span>",
                                BuildArea: "<span style='color:red'>0</span>"
                            }
                        ]);
                    },
                    function callback(Data) {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                IID: 'footer',
                                CustName: "<span style='color:red'>建筑面积合计</span>",
                                BuildArea: "<span style='color:red'>" + Data + "</span>"
                            }
                        ]);
                    }
                );
                $("#SearchDlg").dialog("close");
                $("#RoomSign").val();
                $("#ChangeStartdate").datebox('setValue', '');
                $("#ChangeEndDate").datebox('setValue', '');
            }
        });
    }

    $("select").each(function () {
        var key = $(this).attr("id");

        if (key != undefined) {
            $(this).css("width", 200);
        }
    });

    $('#ChangeStartdate').css("width", 200);
    $('#ChangeEndDate').css("width", 200);

    $(function () {
        var sy = getQueryStr("sy");
        if (sy == '1') {
            var now = new Date();
            var mon = now.getMonth() + 1;
            var sdate = now.getFullYear() + '-' + mon + '-01 00:00:00';
            mon = now.getMonth() + 2;
            var edate = now.getFullYear() + '-' + mon + '-01 00:00:00';

            $("#ChangeStartdate").datebox('setValue', sdate);
            $("#ChangeEndDate").datebox('setValue', edate);
        }
        LoadList();
    })

</script>