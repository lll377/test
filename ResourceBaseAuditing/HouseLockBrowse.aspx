<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HouseLockBrowse.aspx.cs" Inherits="M_Main.ResourceBaseAuditing.HouseLockBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房屋资料审核</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" method="post" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: 80px">楼宇名称：
                    </td>
                    <td colspan="2">
                        <input id="KeyIDValues" name="KeyIDValues" type="hidden" />
                        <input id="BuildName" class="easyui-textbox" name="BuildName" maxlength="50" style="width: 137px" />
                    </td>
                    <td style="width: 80px">房屋编号
                    </td>
                    <td colspan="2">
                        <input id="RoomSign" class="easyui-textbox" name="RoomSign" style="width: 137px" type="text" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">交房状态
                    </td>
                    <td colspan="2">
                        <select id="RoomState" style="width: 137px" class="easyui-combobox" name="RoomState" runat="server">
                            <option></option>
                        </select>
                    </td>
                    <td style="width: 80px">房屋名称</td>
                    <td colspan="2">
                        <input id="RoomName" name="RoomName" class="easyui-textbox" style="width: 137px" type="text" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">是否有效
                    </td>
                    <td colspan="2">
                        <select id="IsSplitUnite" name="IsSplitUnite" runat="server" style="width: 137px" class="easyui-combobox">
                            <option value="全部">全部</option>
                            <option value="有效" selected>有效</option>
                        </select>
                    </td>
                    <td style="width: 80px">是否锁定：
                    </td>
                    <td>
                        <select id="SearchIsLock" name="SearchIsLock" class="easyui-combobox"
                            data-options="panelHeight:'auto'" style="width: 137px">
                            <option value="">全部</option>
                            <option value="0">未锁定</option>
                            <option value="1">已锁定</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="10"></td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div class="SearchContainer" id="TableContainer">
    </div>

    <script type="text/javascript">

        function CancelParm() {
            $("#BuildName").textbox("setValue", "");
            $("#RoomSign").textbox("setValue", "");
            $("#RoomState").combobox("setValue", "");
            $("#RoomName").textbox("setValue", "");
            $("#SearchIsLock").combobox("setValue", "");
            $("#IsSplitUnite").combobox("setValue", "");
        }

        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitTableHeight();

        var toolbar = [
            {
                text: '锁定',
                iconCls: 'icon-locking',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getSelections");

                    if (rows == "") {
                        HDialog.Info('请勾选需要锁定的楼宇!');
                        return;
                    }
                    else {
                        var HouseIDs = "";
                        $.each(rows, function (key, val) {
                            HouseIDs += rows[key]["RoomID"] + ",";
                        });
                        HouseIDs = HouseIDs.substr(0, HouseIDs.length - 1);
                        Lock(HouseIDs, 1);
                    }
                }
            }, '-', {
                text: '解锁',
                iconCls: 'icon-key',
                handler: function () {
                    var rows = $('#TableContainer').datagrid('getChecked');
                    if (rows == "") {
                        HDialog.Info('请勾选需要解锁的楼宇!');
                        return;
                    }
                    else {
                        var HouseIDs = "";
                        $.each(rows, function (key, val) {
                            HouseIDs += rows[key]["RoomID"] + ",";
                        });
                        HouseIDs = HouseIDs.substr(0, HouseIDs.length - 1);
                        Lock(HouseIDs, 0);
                    }
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                    $("#BuildName").val("");
                }
            }
        ];

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'RoomID', title: 'RoomID', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'IsSplitUnite', title: 'IsSplitUnite', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'BuildName', title: '楼宇', width: 140, align: 'left', sortable: true },
            {
                field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true
            },
            { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
            {
                field: 'BuildArea', title: '建筑面积', width: 80, align: 'left', sortable: true
            },
            {
                field: 'StateName', title: '交房状态', width: 150, align: 'left', sortable: true
            },
            {
                field: 'ActualSubDate', title: '交房时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'FittingTime', title: '装修时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.FittingTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'StayTime', title: '入住时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.StayTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'PayBeginDate', title: '开始缴费时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PayBeginDate, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'LiveStateName', title: '租赁状态', width: 80, align: 'left', sortable: true },
            {
                field: 'IsLock', title: '是否锁定', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "否";
                    if (value == 1) {
                        str = "是";
                    }
                    return str;
                }
            },
            {
                field: 'LockUser', title: '锁定记录', width: 250, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "";
                    if (value != "") {
                        if (row.IsLock == 1) {
                            str = "由 " + value + " 于" + row.LockDate + "锁定";
                        } else {
                            str = "由 " + value + " 于" + row.LockDate + "解锁";
                        }
                    }
                    return str;
                }
            }
        ]];
        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                remoteSort: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                check: true,
                rownumbers: true,
                border: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Room", "search", "TableContainer", param);
                }
            });
            $("#SearchDlg").dialog("close");
        }

        function Lock(HouseIDs, IsLock) {
            var LockType = "锁定";
            if (IsLock == 0) {
                LockType = "解锁";
            }
            //判断是否重复锁定
            var checkHouseIDs = $("#TableContainer").datagrid('getSelections');
            var isCheck = true;
            $.each(checkHouseIDs, function (i, value) {
                if (value.IsLock == IsLock) {
                    HDialog.Info('选择数据中包含有' + LockType + '的项');
                    isCheck = false;
                    return false;
                }
            });
            if (isCheck) {
                $.messager.confirm('确定', LockType, function (r) {
                    if (r) {
                        $.tool.DataPostChk('frmForm', 'ResourceBaseAuditing', 'HouseLockBrowse', '&KeyIDValues=' + HouseIDs + '&IsLock=' + IsLock,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "true") {
                                    HDialog.Info(LockType + '成功');
                                }
                                else { HDialog.Info(LockType + '失败'); }
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }
        }
        LoadList();

    </script>
</body>
</html>
