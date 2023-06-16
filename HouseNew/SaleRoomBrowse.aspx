<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaleRoomBrowse.aspx.cs" Inherits="M_Main.HouseNew.SaleRoomBrowse" %>



<!DOCTYPE html>
<html>
<head>
    <title></title>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/CloseAjaxCache.js"></script>
</head>
<body>
    <form id="frmForm">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 150px;">
            <table style="width: 100%;" class="DialogTable">


                <tr>
                    <td class="TdTitle">业主名称</td>
                    <td class="TdContent">
                        <input id="CustName" name="CustName" runat="server"></td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input id="RoomSign"
                            name="RoomSign" runat="server"></td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>

                </tr>

            </table>
        </div>


    </form>
</body>
</html>
<script type="text/javascript">

    var column = [[
        {
            field: 'CustName', title: '现业主名称', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = value;
                if (row.IsLock != "1") {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改业主'," + row.CustID + ",'');\">" + row.CustName + "</a>";
                }
                return str;
            }
        },
        { field: 'MasterName', title: '原业主名称', width: 160, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 160, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 160, align: 'left', sortable: true },
        { field: 'FixedTel', title: '固定电话', width: 100, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '移动电话', width: 100, align: 'left', sortable: true },
        {
            field: 'HousePropertyDate', title: '房产证出证日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.HousePropertyDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ChargeTime', title: '变更时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ChargeTime, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'ChangeUsername', title: '经办人', width: 100, align: 'left', sortable: true },
        {
            field: 'IsLock', title: '是否锁定', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                var str = "否";
                if (value == 1) {
                    str = "是";
                }
                return str;
            }
        }
    ]];

    var w = $(window).width();
    var h = $(window).height();


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

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../HouseNew/SaleRoomCreBatchManage.aspx?OPType=Insert', '转让登记', false, function (_Data) {
                    if (_Data == "1") {
                        HDialog.Info('保存成功');
                        LoadList();
                    }
                });
            }
        }, '-',
        {
            text: '费用转移',
            iconCls: 'icon-transfer',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {
                    if (row.Live != 0) {
                        var w = $(window).width();
                        var h = $(window).height();
                        HDialog.Open(w, h, '../HouseNew/SaleRoomTransFee.aspx?LiveID=' + row.LiveID, '费用转移', false, function (_Data) {

                        });
                    }
                    else {
                        HDialog.Info('请选择要转移费用的转让信息');
                    }
                } else {
                    HDialog.Info('请选择要转移费用的转让信息');

                }

            }
        }, '-',
        {
            text: '撤销费用转移',
            iconCls: 'icon-reback',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {
                    if (row.Live != 0) {
                        var w = $(window).width();
                        var h = $(window).height();
                        HDialog.Open(w, h, '../HouseNew/SaleRoomRemoveTransFee.aspx?LiveID=' + row.LiveID, '撤销费用转移', false, function (_Data) {
                        });
                    }
                    else {
                        HDialog.Info('请选择要转移费用的转让信息');
                    }
                } else {
                    HDialog.Info('请选择要转移费用的转让信息');
                }
            }
        }, '-',
        {
            text: '减免费用转移',
            iconCls: 'icon-transfer',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {
                    if (row.Live != 0) {
                        var w = $(window).width();
                        var h = $(window).height();
                        HDialog.Open(w, h, '../HouseNew/WaiversTranFee.aspx?LiveID=' + row.LiveID, '减免费用转移', false, function (_Data) {
                        });
                    }
                    else {
                        HDialog.Info('请选择要转移费用的转让信息');
                    }
                } else {
                    HDialog.Info('请选择要转移费用的转让信息');
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
    //详情
    function ViewDetail(title, strCustID) {
        HDialog.Open(w, h, '../HouseNew/SaleRoomManage.aspx?OPType=Edit&CustID=' + strCustID, title, false,
            function callback(_Data) {
                if (_Data == "1") {
                    HDialog.Info('保存成功');
                    LoadList();
                }
            });
    }

    function LoadList() {

        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
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
            sortOrder: "asc",
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("RoomRental", "SaleRoomList", "TableContainer", param);
            },
            onLoadSuccess: function (data) {

            }
        });
        $('#SearchDlg').dialog('close');
    }



    LoadList();


</script>
