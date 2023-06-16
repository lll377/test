<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkIngDataLockBrowse.aspx.cs" Inherits="M_Main.ResourceBaseAuditing.ParkIngDataLockBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>车位资料审核</title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>

    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="SelAll" name="SelAll" runat="server" />
        <input type="hidden" id="SelParkID" name="SelParkID" value="" runat="server" />
        <input id="strParkType" size="1" type="hidden" name="strParkType" runat="server" />

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 280px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;" class="DialogTable">
                <tr>
                    <td class="TdTitle">车位类别</td>
                    <td class="TdContentSearch">
                        <select id="ParkCategory" name="ParkCategory" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server" style="width: 80%;">
                            <option selected></option>
                            <option value="全部">全部</option>
                            <option value="0">固定车位</option>
                            <option value="1">非固定车位</option>
                        </select>
                    </td>
                    <td class="TdTitle">车位类型</td>
                    <td class="TdContentSearch">
                        <select id="ParkType" name="ParkType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server" style="width: 80%;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" type="text" style="width: 80%;" id="CarparkName" data-options="editable:false" searcher="SelCarparkName" name="CarparkName" />
                        <input type="hidden" id="CarparkID" name="CarparkID" runat="server" />
                    </td>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContent">
                        <input type="text" style="width: 80%; border: 1px solid #ccc;" id="ParkName" name="ParkName" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">业主名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" style="width: 80%;" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'"
                            onchange="javascript:SelectRoomID_OnChange();" runat="server" style="width: 80%;">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="RoomSign" style="width: 80%;" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContent">
                        <input type="text" style="width: 37%;" id="StanAmount1" name="StanAmount1" />到
                        <input type="text" style="width: 37%;" id="StanAmount2" name="StanAmount2" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">办理状态</td>
                    <td class="TdContentSearch">
                        <select id="drUse" name="drUse" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server" style="width: 100px;">
                            <option selected></option>
                            <option value="已办理">已办理</option>
                            <option value="未办理">未办理</option>
                        </select>
                    </td>
                    <td class="TdTitle">当前状态</td>
                    <td class="TdContentSearch">
                        <select id="SelUseState" name="SelUseState" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server" style="width: 100px;">
                            <option selected></option>
                            <option value="闲置">闲置</option>
                            <option value="使用">使用</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>是否锁定：
                    </td>
                    <td>
                        <select id="SearchIsLock" name="SearchIsLock" class="easyui-combobox"
                            data-options="panelHeight:'auto'" style="width: 100px;">
                            <option value="">全部</option>
                            <option value="0">未锁定</option>
                            <option value="1">已锁定</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        var w = $(window).width();
        var h = $(window).height();
        function InitFunction() {
            $("#TableContainer").css("height", h + "px");
        }
        InitFunction();

        //选择车位区域
        function SelCarparkName() {
            $('#CarparkName').searchbox("setValue", '');
            $('#CarparkID').val('');

            var conent = "../DialogNew/CarparkDlg.aspx";

            HDialog.Open('600', '400', conent, '车位区域', false, function callback(_Data) {
                var data = JSON.parse(_Data);
                $('#CarparkName').searchbox("setValue", data.CarparkName);
                $('#CarparkID').val(data.CarparkID);

            });

        }
        ///选择客户
        function SelCust() {
            $('#CustName').searchbox("setValue", '');
            $('#CustID').val('');
            $('#RoomSign').searchbox("setValue", '');
            $('#RoomID').val('');
            $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
            var conent = "../DialogNew/CustDlg.aspx";
            HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                var data = JSON.parse(_Data);
                $('#CustName').searchbox("setValue", data.CustName);

                $('#CustID').val(data.CustID);


                $.tool.DataGet('Choose', 'CustRoomSigns', $('#FrmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            var RoomData = [];
                            for (var i = 0; i < varObjects.length; i++) {
                                var vIsDelLive = varObjects[i].IsDelLive;
                                var strTmp = "";
                                if (vIsDelLive == 1) {
                                    strTmp = "(历史)";
                                }
                                var RoomID = varObjects[i].RoomID;
                                var RoomSign = varObjects[i].RoomSign;
                                var Buildarea = varObjects[i].BuildArea;
                                var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;
                                RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });
                            }
                            $('#SelectRoomID').combobox({
                                data: RoomData,
                                valueField: 'RoomID',
                                textField: 'RoomText',
                                onChange: function (n, o) {
                                    var data = $('#SelectRoomID').combobox('getData');
                                    if (data.length > 0) {
                                        for (var i = 0; i < data.length; i++) {
                                            if (n == data[i].RoomID) {

                                                $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                $('#RoomID').val(data[i].RoomID);
                                                break;
                                            }
                                        }
                                    }
                                }
                            });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });
        }
        //选择房屋
        function SelRoom() {
            $('#CustName').searchbox("setValue", '');
            $('#CustID').val('');
            $('#RoomSign').searchbox("setValue", '');
            $('#RoomID').val('');
            $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

            var conent = "../DialogNew/RoomDlg.aspx";

            HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                var data = JSON.parse(_Data);
                $('#RoomSign').searchbox("setValue", data.RoomSign);
                $('#CustName').searchbox("setValue", data.CustName);
                if (data.CustID != "0") {
                    $('#CustID').val(data.CustID);
                } else {
                    $('#CustID').val('');
                }

                $('#RoomID').val(data.RoomID);

            });

        }
        //清空
        function CancelParm() {
            $('#ParkCategory').combobox('clear');
            $('#ParkType').combobox('clear');
            $('#CarparkName').searchbox("setValue", '');
            $("#CarparkID").val("");
            $("#ParkName").val("");
            $('#CustName').searchbox("setValue", '');
            $("#CustID").val("");
            $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
            $("#RoomID").val("");
            $('#RoomSign').searchbox("setValue", '');
            $("#StanAmount").val("");
            $('#drUse').combobox('clear');
            $('#SelUseState').combobox('clear');
        }
        var frozenColumns = [[
            { field: 'ck', checkbox: true },
            { field: 'ParkName', title: '车位编号', width: 110, align: 'left', sortable: true },
            { field: 'ParkID', title: 'ParkID', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'CarparkName', title: '车位区域', width: 90, align: 'left', sortable: true },
            { field: 'ParkCategoryName', title: '车位类别', width: 70, align: 'left', sortable: true },
            { field: 'ParkType', title: '车位类型', width: 80, align: 'left', sortable: true },
            {
                field: 'IsLock', title: '是否锁定', width: 80, align: 'center', sortable: true, formatter: function (value, row, index) {
                    var str = "否";
                    if (value == 1) {
                        str = "是";
                    }
                    return str;
                }
            }
        ]];

        var column = [[
            { field: 'CustName', title: '业主名称', width: 220, align: 'left', sortable: true },
            { field: 'StanAmount', title: '收费标准', width: 90, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 80, align: 'left', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 80, align: 'left', sortable: true },
            { field: 'PropertyUses', title: '使用状态', width: 100, align: 'left', sortable: true },
            { field: 'PropertyRight', title: '产权性质', width: 100, align: 'left', sortable: true },
            {
                field: 'ContSubDate', title: '合同交付时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.ContSubDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ActualSubDate', title: '实际交付时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'UseState', title: '当前状态', width: 80, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = "";
                    if (row.UseState == "闲置") {
                        str = "<font color=ForestGreen>" + row.UseState + "</font>"
                    } else {
                        str = "<font>" + row.UseState + "</font>"
                    }
                    return str;
                }
            },
            {
                field: 'LockUser', title: '锁定记录', width: 260, align: 'left', sortable: true, formatter: function (value, row, index) {
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

        var toolbar = [
            {
                text: '锁定',
                iconCls: 'icon-locking',
                handler: function () {
                    var rows = $('#TableContainer').datagrid('getChecked');
                    if (rows == "") {
                        HDialog.Info('请勾选需要锁定的车位类型/车位区域!');
                        return;
                    }
                    else {
                        var IDList = "";
                        $.each(rows, function (key, val) {
                            IDList += rows[key]["ParkID"] + ",";
                        });
                        if (IDList.length > 0) {
                            IDList = IDList.substr(0, IDList.length - 1);
                        }
                        Lock(IDList, 1);
                    }
                }
            }, '-', {
                text: '解锁',
                iconCls: 'icon-key',
                handler: function () {
                    var rows = $('#TableContainer').datagrid('getChecked');
                    if (rows == "") {
                        HDialog.Info('请勾选需要解锁的车位类型/车位区域!');
                        return;
                    }
                    else {
                        var IDList = "";
                        $.each(rows, function (key, val) {
                            IDList += rows[key]["ParkID"] + ",";
                        });
                        if (IDList.length > 0) {
                            IDList = IDList.substr(0, IDList.length - 1);
                        }
                        Lock(IDList, 0);
                    }
                }
            }, '-',
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
            //var ParkType = $("#ParkType").combobox('getText');
            //$("#strParkType").val(ParkType);
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                frozenColumns: frozenColumns,
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
                    param = $.JQForm.GetParam("Parking", "search", "TableContainer", param);
                }
            });
            $("#SearchDlg").dialog("close");
        }

        function Lock(IDList, IsLock) {
            var LockType = "锁定";
            if (IsLock == 0) {
                LockType = "解锁";
            }
            //判断是否重复锁定
            var checkRegionIDs = $("#TableContainer").datagrid('getSelections');
            var isCheck = true;
            $.each(checkRegionIDs, function (i, value) {
                if (value.IsLock == IsLock) {
                    HDialog.Info('选择数据中包含有' + LockType + '的项');
                    isCheck = false;
                    return false;
                }
            });
            if (isCheck) {
                $.messager.confirm('确定', LockType, function (r) {
                    if (r) {
                        $.tool.DataPostChk('frmForm', 'ResourceBaseAuditing', 'ParkingDataAduit', '&KeyIDValues=' + IDList + '&IsLock=' + IsLock,
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


