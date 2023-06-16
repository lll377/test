<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomBrowseNew.aspx.cs" Inherits="M_Main.HouseNew.RoomBrowseNew" %>

<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input id="BuildSNums" type="hidden" size="1" name="BuildSNums" value="" runat="server" />
        <input id="hiBuildNames" type="hidden" size="1" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <input id="RegionSNums" type="hidden" size="1" name="RegionSNum" value="" runat="server" />
        <input id="UnitSNums" type="hidden" size="1" name="UnitSNum" value="" runat="server" />
        <input id="FloorSNums" type="hidden" size="1" name="FloorSNums" value="" runat="server" />
        <input id="hiCommID" name="hiCommID" type="hidden" runat="server" />
        <input id="hiRoomID" name="hiRoomID" type="hidden" runat="server" />

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td width="15%">楼&nbsp;&nbsp;&nbsp;&nbsp;宇
                    </td>
                    <td width="35%">
                        <%--<select id="BuildSNum" name="BuildSNum" runat="server">
                            <option></option>
                        </select>--%>
                        <input id="BuildNames" class="easyui-searchbox" style="width: 160px" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" />

                    </td>
                    <td width="15%">房屋编号
                    </td>
                    <td width="35%">
                        <input id="RoomSign" name="RoomSign" style="width: 160px" type="text" />
                    </td>

                </tr>
                <tr>
                    <td width="15%">交房状态
                    </td>
                    <td width="35%">
                        <select id="RoomState" name="RoomState" style="width: 160px" runat="server">
                            <option></option>
                        </select>
                    </td>
                    <td width="15%">房屋名称</td>
                    <td width="35%">
                        <input id="RoomName" name="RoomName" style="width: 160px" type="text" />
                    </td>
                </tr>
                <tr>
                    <td width="15%">入住状态
                    </td>
                    <td width="35%">
                        <select id="LiveStates" name="LiveStates" style="width: 160px" runat="server">
                            <option></option>
                        </select>
                    </td>
                    <td width="15%">是否有效
                    </td>
                    <td width="35%" colspan="3">
                        <select id="IsSplitUnite" name="IsSplitUnite" style="width: 160px" runat="server">
                            <option value="全部">全部</option>
                            <option value="有效" selected>有效</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>

            </table>
        </div>

        <input type="hidden" id="AllData" runat="server" />
        <input type="hidden" id="IsSelectAll" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

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




            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'RoomID', title: 'RoomID', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'IsSplitUnite', title: 'IsSplitUnite', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'BuildName', title: '楼宇', width: 100, align: 'left', sortable: true },
                {
                    field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.RoomSign;
                        if (row.IsLock != "1") {
                            str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改房屋','update'," + row.RoomID + ",'" + row.CustID + "','manage');\">" + row.RoomSign + "</a>";
                        }
                        return str;
                    }
                },
                { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true },
                {
                    field: 'BuildArea', title: '建筑面积', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('房屋历史','update'," + row.RoomID + ",'','areahis');\">" + row.BuildArea + "</a>";
                        return str;
                    }
                },
                {
                    field: 'StateName', title: '交房状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('房屋历史交房状态','update'," + row.RoomID + ",'','statehis');\">" + row.StateName + "</a>";
                        return str;
                    }
                },
                { field: 'LiveStateName', title: '入住状态', width: 100, align: 'left', sortable: true },
                {
                    field: 'ActualSubDate', title: '交房时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FittingTime', title: '装修时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FittingTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'StayTime', title: '入住时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.StayTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'PayBeginDate', title: '开始缴费时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.PayBeginDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'LiveStateName2', title: '租赁状态', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '楼栋管家', width: 100, align: 'left', sortable: true },
                { field: 'Tel', title: '管家电话', width: 100, align: 'left', sortable: true },
                {
                    field: 'IsLock', title: '是否锁定', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "否";
                        if (value == 1) {
                            str = "是";
                        }
                        return str;
                    }
                }

            ]];


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        //CheckAuthority('010104', function callback(_Data) {
                        //    if (_Data == "true") {
                        //        ViewDetail("新增房屋信息", 'add', 0, 'manage');
                        //    }
                        //    else {
                        //        HDialog.Info("你没有新增房屋权限，请联系管理员开通！!");
                        //    }
                        //});
                        //CheckAuthority('1001', function callback(_Data) {
                        //    if (_Data == "true") {
                        //        //    window.location.href = 'RegionManage?OpType=insert';
                        //        ViewDetail("新增房屋信息", 'add', 0, 'manage');
                        //    }
                        //    else {
                        //        $.messager.alert('错误', '无此权限', 'error');
                        //    }
                        //});
                        //ViewDetail("新增房屋信息", 'add', 0, 'manage');
                        ViewDetail("新增房屋信息", 'add', 0,'', 'manage');
                    }
                }, '-',

                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        //判断是否锁定，锁定了的数据不允许删除
                        if (row.IsLock != "1") {
                            DelRecord(row.RoomID)
                        } else {
                            HDialog.Info('房屋已被锁定，不允许删除!');
                        }
                    }
                }
                , '-',

                {
                    text: '设置管家',
                    iconCls: 'icon-save',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请勾选要设置管家的房屋!');
                            return;
                        }
                        var RoomIDs = "";
                        for (var i = 0; i < rows.length; i++) {
                            RoomIDs = RoomIDs + "," + rows[i]["RoomID"];
                        }
                        if (rows.length > 50)
                        {
                            HDialog.Info('选择数据过多，不能超过50条!');
                            return;
                        }

                        RoomIDs = RoomIDs.substring(1, RoomIDs.length);

                        HDialog.Open('620', '250', '../HouseNew/HouseKeeperManage.aspx?RoomIDs=' + RoomIDs, '设置管家', false, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
                , '-',

                {
                    text: '删除管家',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请勾选要删除管家的房屋!');
                            return;
                        }
                        var RoomIDs = "";
                        for (var i = 0; i < rows.length; i++) {
                            RoomIDs = RoomIDs + "," + rows[i]["RoomID"];
                        }

                        RoomIDs = RoomIDs.substring(1, RoomIDs.length);
                        $.messager.confirm('确定', '是否删除该项', function (r) {
                            if (r) {
                                $.tool.DataPost('HouseKeeper', 'DelRoom', 'RoomIDs=' + RoomIDs,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var data = _Data.split('|');
                                        if (data[0] == "true") {
                                            HDialog.Info('删除成功');
                                            LoadList();
                                        }
                                        else { HDialog.Info('删除失败'); }

                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        });
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#BuildName").val("");
                    }
                },
                '-',
                {
                    text: '批量设置入住状态',
                    iconCls: 'icon-man',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        //alert(row);
                        if (row != "") {
                            ViewReplyBatchManage("批量设置入住状态");
                        }
                        else {
                            HDialog.Info("请选择批量入住数据项");
                        }
                    }
                }
                , '-',
                {
                    text: '批量导入房屋信息',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        CheckAuthority('010103', function callback(_Data) {
                            if (_Data == "true") {
                                BatchUpdateRoom();
                            }
                            else {
                                HDialog.Info("无此权限");
                            }
                        });
                    }
                }
            ];

            //批量修改
            function BatchUpdateRoom() {
                //var w = $(window).width();
                //var h = $(window).height();
                HDialog.Open(770, 270, '../HouseNew/BatchUpdateRoom.aspx', '批量导入房屋信息', false, function callback(_Data) {
                    if (_Data == "true") {
                        LoadList();
                    }
                });
            }

            function ViewReplyBatchManage(title) {

                Cache.SetData("UpdateStateIDs", $("#AllData").val());
                HDialog.Open('600', '200', '../HouseNew/RoomBrowseStates.aspx', title, false, function callback(_Data) {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    if (_Data == 1) {
                        Cache.SetData("UpdateStateIDs", '');
                        $("#AllData").val('');
                        $('#IsSelectAll').val(0);
                        LoadList();
                    }
                });
            }


            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Room', 'delete', 'RoomID=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {

                                if (_Data != "true") {
                                    if (_Data != "false") {

                                        HDialog.Info(_Data);
                                    }
                                    else { HDialog.Info('删除失败!'); }

                                }
                                else {
                                    HDialog.Info('删除成功!');
                                }
                                LoadList();

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadData(page, psize) {


                $.tool.DataPost('Room', 'search', "page=" + page + "&rows=" + psize + "&" + $("#frmForm").serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象

                        LoadList(Data);

                        //SetCheckboxValue();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });


            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    selectOnCheck: true,
                    checkOnSelect: true,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Room", "search", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        if ($('#IsSelectAll').val() == "1") {
                            $("#TableContainer").datagrid('checkAll');
                            var rows = $("#TableContainer").datagrid('getRows');

                            $.each(rows, function (index, item) {
                                $('#TableContainer').datagrid("checkRow", index);

                                if ($("#AllData").val().indexOf(item.RoomID) < 0) {
                                    $("#AllData").val($("#AllData").val() + "|" + item.RoomID);
                                }
                            });
                        }
                        else {
                            var rows = $("#TableContainer").datagrid('getRows');
                            $.each(rows, function (index, item) {
                                if ($("#AllData").val().indexOf(item.RoomID) > -1) {
                                    $('#TableContainer').datagrid("checkRow", index);
                                }
                            });
                        }
                    },
                    onCheck: function (rowIndex, rowData) {
                        if ($("#AllData").val().indexOf(rowData.RoomID) < 0) {
                            $("#AllData").val($("#AllData").val() + "|" + rowData.RoomID);
                        }
                    },
                    onUncheck: function (rowIndex, rowData) {
                        $('#IsSelectAll').val(0);
                        if ($('#AllData').val().indexOf(rowData.RoomID) > -1) {
                            $('#AllData').val($('#AllData').val().replace("|" + rowData.RoomID, ''));
                        }
                    },
                    onCheckAll: function (rows) {
                        $('#IsSelectAll').val(1);

                        $.each(rows, function (index, item) {
                            if ($('#AllData').val().indexOf(item.RoomID) < 0) {
                                $('#AllData').val($('#AllData').val() + "|" + item.RoomID);
                            }
                        });
                    },
                    onUncheckAll: function (rows) {
                        $('#IsSelectAll').val(0);

                        $.each(rows, function (index, item) {
                            if ($('#AllData').val().indexOf(item.RoomID) > -1) {
                                $('#AllData').val($('#AllData').val().replace("|" + item.RoomID, ''));
                            }
                        });
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            LoadList();

            function ViewDetail(title, OpType, ID, CustID, page) {

                var conent = "";
                switch (page) {
                    case "manage":
                        conent = '../HouseNew/RoomManage.aspx?OpType=' + OpType + '&RoomID=' + ID + '&CustID1=' + CustID
                        break;
                    case "statehis":
                        conent = '../HouseNew/RoomStateHisBrowse.aspx?RoomID=' + ID
                        break;
                    case "areahis":
                        conent = '../HouseNew/RoomAreaHisBrowse.aspx?RoomID=' + ID
                        break;
                }
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, conent, title, true, function callback(_Data) {
                    if (_Data != '') {
                        // LoadData(1, top.ListPageSize);
                        LoadList();
                    }
                });

            }


        </script>
    </form>
</body>
</html>
