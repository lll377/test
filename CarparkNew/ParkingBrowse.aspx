<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingBrowse.aspx.cs" Inherits="M_Main.CarparkNew.ParkingBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ParkingBrowse</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <%--<link href="../css/base.css" type="text/css" rel="stylesheet" />--%>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="overflow: hidden;">
    <form id="FrmForm">
        <input type="hidden" id="SelAll" name="SelAll" runat="server" />
        <input type="hidden" id="SelParkID" name="SelParkID" value="" runat="server" />
        <input id="strParkType" size="1" type="hidden" name="strParkType" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="padding: 10px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">车位类别</td>
                    <td class="TdContentSearch">
                        <select id="ParkCategory" name="ParkCategory" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="全部">全部</option>
                            <option value="0">固定车位</option>
                            <option value="1">非固定车位</option>
                        </select>
                    </td>
                    <td class="TdTitle">车位类型</td>
                    <td class="TdContentSearch">
                        <select id="ParkType" name="ParkType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" type="text" id="CarparkName" data-options="editable:false" searcher="SelCarparkName" name="CarparkName" />
                        <input type="hidden" id="CarparkID" name="CarparkID" runat="server" />
                    </td>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContent">
                        <input type="text" id="ParkName" name="ParkName" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">业主名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="RoomSign" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContent">
                        <input type="text"  id="StanAmount1" name="StanAmount1" />到
                        <input type="text"  id="StanAmount2" name="StanAmount2" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">办理状态</td>
                    <td class="TdContentSearch">
                        <select id="drUse" name="drUse" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="已办理">已办理</option>
                            <option value="未办理">未办理</option>
                        </select>
                    </td>
                    <td class="TdTitle">当前状态</td>
                    <td class="TdContentSearch">
                        <select id="SelUseState" name="SelUseState" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="闲置">闲置</option>
                            <option value="使用">使用</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">地产预留出售</td>
                    <td class="TdContentSearch">
                        <select id="ReserveSale" name="ReserveSale" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="" selected></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">接管时间</td>
                    <td class="TdContent">
                        <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="BeginTakeOverDate" maxlength="50" name="BeginTakeOverDate" runat="server" type="text" />
                        到
                        <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EndTakeOverDate" maxlength="50" name="EndTakeOverDate" runat="server" type="text" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>

                </tr>

            </table>
        </div>
    </form>
    <div id="dlg_BatchTakeOverDate" class="easyui-dialog" title="批量修改接管时间" style="width: 230px; height: 130px; max-width: 800px; padding: 5px" data-options="
            iconCls:'icon-save',modal:true,closed:true">
        <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="title">接管时间:</td>
                <td class="text" colspan="3">
                    <input id="BatchTakeOverDate" name="BatchTakeOverDate" class="easyui-datebox" data-options="editable:false,required:false,
                        icons:[{iconCls:'icon-clear',
                        handler: function(e){
                            $(e.data.target).datebox('clear');
                        }}]" />
                </td>
            </tr>
            <tr>
                <td class="btn" style="text-align: center;padding-top:10px;" colspan="4">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="BatchTakeOverDate();">确定 </a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
<script language="javascript" type="text/javascript">

    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
        var wi = document.body.clientWidth * 0.29 * 0.8;
    }

    var column = [[
        { field: 'ck', checkbox: true },
        {
            field: 'ParkName', title: '车位编号', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = row.ParkName;
                if (row.IsLock != "1") {
                    str = "<a class=\"HrefStyle\"   href='#' onclick=\"ViewDetail('修改车位登记信息','update','" + row.ParkID + "','','" + row.IsLock + "');\">" + row.ParkName + "</a>";
                } else {
                    str = "<a class=\"HrefStyle\" style='color:red' href='#' onclick=\"ViewDetail('修改车位登记信息','update','" + row.ParkID + "','','" + row.IsLock + "');\">" + row.ParkName + "(已锁定)</a>";
                }
                return str;
            }
        },
        { field: 'ParkID', title: 'ParkID', width: 50, align: 'left', sortable: true, hidden: true },
        { field: 'CarparkName', title: '车位区域', width: 100, align: 'left', sortable: true },
        { field: 'ParkCategoryName', title: '车位类别', width: 80, align: 'left', sortable: true },
        { field: 'ParkType', title: '车位类型', width: 100, align: 'left', sortable: true },
        { field: 'ConstUnitName', title: '开发主体', width: 100, align: 'left', sortable: true },
        { field: 'StanAmount', title: '收费标准', width: 90, align: 'left', sortable: true },
        { field: 'CustName', title: '业主名称', width: 200, align: 'left', sortable: true },
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
            field: 'TakeOverDate', title: '物业接管时间', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.TakeOverDate, "yyyy-MM-dd");
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
            field: 'ReserveSale', title: '预留出售', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "";
                if (value == "1") {
                    str = "是";
                }
                else if (value == "0") {
                    str = "否";
                }
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
            field: '删除', title: '删除', width: 60, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.UseName == "已办理") {
                    str = "" + row.UseName + "";
                } else {
                    if (row.IsLock != "1") {
                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"DelRecord(" + row.ParkID + ");\">删 除</a>";
                    } else {
                        str = "删 除";
                    }
                }
                return str;
            }
        },
        {
            field: '查看历史', title: '查看历史', width: 80, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"History(" + row.ParkID + ");\">车位历史</a>";
                return str;
            }
        },
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

    var toolbar = [
        {
            text: '新增',
            iconCls: 'icon-add',
            handler: function () {
                ViewDetail("新增车位信息", 'insert', "", $('#CarparkID').val(), '');
            }
        }, '-',
        //{
        //    text: '车位导入',
        //    iconCls: 'icon-page_white_excel',
        //    handler: function () {
        //        ViewReport("车位导入");
        //    }
        //}, '-',
        {
            text: '批量导入',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                BatchImportParking();
            }
        }, '-',
        {
            text: '批量修改',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                BatchUpdateParking();
            }
        }, '-',
        //{
        //    text: '删除',
        //    iconCls: 'icon-cancel',
        //    handler: function () {
        //        var row = $("#TableContainer").datagrid("getSelected");
        //        if (row == null) {
        //            HDialog.Info('请选择删除项！');
        //            return;
        //        }
        //        DelRecord(row.ParkID)
        //    }
        //}, '-',
        {
            text: '修改车位标准',
            iconCls: 'icon-edit',
            handler: function () {
                var rows = $('#TableContainer').datagrid('getChecked');
                //if (rows.length > 1) {
                //    HDialog.Info("不能同时修改多个车位")
                //}
                if (rows[0].IsLock == "1") {
                    HDialog.Info("车位已被锁定")
                }
                else {
                    Save();
                }
            }
        }, '-',
        {
            text: '批量设置地产预留出售车位',
            iconCls: 'icon-transfer',
            handler: function () {
                debugger
                var rows = $('#TableContainer').datagrid('getChecked');

                rows = $.grep(rows, function (n, i) {
                    return n.IsLock != "1" && n.PropertyRight.indexOf("自有产权") >= 0;
                });

                if (rows.length == 0) {
                    HDialog.Info('请勾选需要设置的车位号!');
                    return;
                }
              
                

                $.messager.confirm('确定', '是否设置所选地产为预留出售车位', function (r) {
                    if (r) {
                        var arrid = new Array();
                        for (var i = 0; i < rows.length; i++) {
                            arrid.push(rows[i].ParkID);
                        }
                        $.tool.DataPost('Parking', 'setSales', 'ParkingIDs=' + arrid.toString(),
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "true") {
                                    HDialog.Info('设置成功');
                                }
                                else { HDialog.Info('设置失败'); }
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }
        }, '-',
        {
            text: '批量设置物业接管时间',
            iconCls: 'icon-transfer',
            handler: function () {
                debugger
                var rows = $('#TableContainer').datagrid('getChecked');
                if (rows.length == 0) {
                    HDialog.Info('请勾选需要批量设置的车位!');
                    return;
                }
                $("#dlg_BatchTakeOverDate").dialog("open");
                $("#BatchTakeOverDate").datebox("setValue", formatDate(new Date(), "yyyy-MM-dd"));


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
        //, '-',
        //{
        //    text: '历史记录',
        //    iconCls: 'icon-search',
        //    handler: function () {
        //        var row = $("#TableContainer").datagrid("getSelected");
        //        if (row == null) {
        //            HDialog.Info('请选择一行查看！');
        //            return;
        //        }
        //        HDialog.Open(w, h, "../CarparkNew/ParkingHisBrowse.aspx?ParkID=" + row.ParkID + "", "车位历史", true,
        //            function callback(_Data) {

        //        });
        //    }
        //}
    ];


    function BatchTakeOverDate() {
        $.messager.confirm('温馨提示', '确定批量修改接管时间?', function (r) {
            if (r) {
                var rows = $('#TableContainer').datagrid('getChecked');
                var arrid = new Array();
                for (var i = 0; i < rows.length; i++) {
                    arrid.push(rows[i].ParkID);
                }
                $.tool.DataPost('Parking', 'BatchTakeOverDate', 'ParkingIDs=' + arrid.toString() + "&BatchTakeOverDate=" + $("#BatchTakeOverDate").datebox("getValue"),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            $("#dlg_BatchTakeOverDate").dialog("close");
                            LoadList();
                        }
                        else { HDialog.Info('设置失败'); }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }

    function BatchImportParking() {
        HDialog.Open(770, 270, '../CarparkNew/BatchImportParking.aspx', '批量导入车位信息', false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }

    function BatchUpdateParking() {
        HDialog.Open(770, 270, '../CarparkNew/BatchUpdateParking.aspx', '批量修改车位信息', false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }

    function History(strParkID) {
        HDialog.Open(w, h, "../CarparkNew/ParkingHisBrowse.aspx?ParkID=" + strParkID + "", "车位历史", true,
            function callback(_Data) {

            });
    }

    //修改车位标准
    function Save() {

        var rows = $('#TableContainer').datagrid('getChecked');
        if (rows == "") {
            HDialog.Info('请勾选需要设置的车位号!');
            return;
        }
        else {
            var SelParkID = "";
            $.each(rows, function (key, val) {
                SelParkID += rows[key]["ParkID"] + ",";

            });
            SelParkID = SelParkID.substr(0, SelParkID.length - 1);
            Cache.SetData("SelParkID", SelParkID);
            HDialog.Open('450', '250', '../CarparkNew/ParkingCostSetting.aspx',
                '设置车位标准', false, function callback(_Data) {
                    if (_Data == "true") {
                        LoadList();
                    }

                });
        }

    }

    function LoadList() {
        var ParkType = $("#ParkType").combobox('getText');
        $("#strParkType").val(ParkType);
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Parking", "search", "TableContainer", param);
            }, onLoadSuccess: function (data) {
                if (data.rows.length > 0) {
                    //循环判断操作为新增的不能选择
                    for (var i = 0; i < data.rows.length; i++) {
                        //根据operate让某些行不可选
                        if (data.rows[i].IsLock == "1") {
                            $("input[type='checkbox']")[i + 1].disabled = true;
                        }
                    }
                }
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //清空查询条件
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

    function DelRecord(Id) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('Parking', 'delete', 'ParkID=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('删除成功');
                        }
                        else { HDialog.Info('删除失败'); }
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }

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

    function ViewDetail(title, OpType, ParkID, CarparkID, IsLock) {

        HDialog.Open('820', '470', '../CarparkNew/ParkingManage.aspx?ParkID=' + ParkID + '&CarparkID=' + CarparkID + '&OpType=' + OpType + '&IsLock=' + IsLock, title, false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }
    //导入
    function ViewReport(title) {
        HDialog.Open(w, h, '../CarparkNew/ParkingExcelBrowse.aspx', title, true, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }

    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", '83%');
    });
</script>
