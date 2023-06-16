<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCustomerBankLockBrowse.aspx.cs" Inherits="M_Main.ResourceBaseAuditing.NewCustomerBankLockBrowse" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Customer</title>
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
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol.css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/JQForm/JQForm.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .HrefStyle {
            color: darkblue;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="FrmForm" method="post" runat="server">
        <input id="LiveType" name="LiveType" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 250px;">
            <table class="DialogTable">
                <tr>
                    <td class="DialogTdTitle">客户类型</td>
                    <td colspan="2">
                        <input type="radio" id="rb1" name="rb" value="1" />业主&nbsp;
                          <input type="radio" id="rb2" name="rb" value="2" />租户&nbsp;
                          <input type="radio" id="rb3" name="rb" value="3" />临时
                    </td>
                    <td class="DialogTdTitle">客户类别</td>
                    <td colspan="2">
                        <select id="CustTypeID" name="CustTypeID" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">客户名称</td>
                    <td class="DialogTdContent">
                        <input id="CustName" name="CustName" runat="server"></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">房屋编号</td>
                    <td colspan="2">
                        <input id="RoomSign" name="RoomSign" runat="server"></td>
                    <td class="DialogTdTitle">证件号码</td>
                    <td colspan="2">
                        <input id="PaperCode" name="PaperCode" runat="server"></td>
                    <td class="DialogTdTitle">固定电话</td>
                    <td class="DialogTdContent">
                        <input id="FixedTel" name="FixedTel" runat="server"></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">移动电话</td>
                    <td colspan="2">
                        <input id="MobilePhone" name="MobilePhone" runat="server"></td>
                    <td class="DialogTdTitle">托收类别</td>
                    <td colspan="2">
                        <select id="BankName" name="BankName" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="DialogTdTitle">银行帐号</td>
                    <td class="DialogTdContent">
                        <input id="BankAccount" name="BankAccount" runat="server"></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">银行户名</td>
                    <td colspan="2">
                        <input id="BankIDs" name="BankIDs" runat="server"></td>
                    <td class="DialogTdTitle">登记更改时间从：</td>
                    <td colspan="2">
                        <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="SignStart" runat="server" name="SignStart" /></td>
                    <td class="DialogTdTitle">到：</td>
                    <td class="DialogTdContent">
                        <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="SignEnd" runat="server" name="SignEnd" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">是否锁定</td>
                    <td colspan="7">
                        <select id="SearchIsLock" name="SearchIsLock" class="easyui-combobox"
                            data-options="panelHeight:'auto'" style="width: 137px">
                            <option value="">全部</option>
                            <option value="0">未锁定</option>
                            <option value="1">已锁定</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle" colspan="8"></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="8">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">

    function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }

    InitTableHeight();
     

    var column = [[
        { field: 'ck', checkbox: true },
        { field: 'CustName', title: '客户名称', width: 120, align: 'left', sortable: true },
        { field: 'CommName', title: '小区名称', width: 160, align: 'left', sortable: true },
        { field: 'RoomSigns', title: '房屋编号', width: 200, align: 'left', sortable: true },
        { field: 'NewRoomNames', title: '房屋路址', width: 180, align: 'left', sortable: true },
        { field: 'FixedTel', title: '固定电话', width: 110, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '移动电话', width: 110, align: 'left', sortable: true },
        { field: 'PaperCode', title: '证件号码', width: 190, align: 'left', sortable: true },

        { field: 'BankName', title: '托收类别', width: 100, align: 'left', sortable: true },
        { field: 'BankCodeName', title: '银行名称', width: 100, align: 'left', sortable: true },
        { field: 'BankProvince', title: '开户行省份', width: 100, align: 'left', sortable: true },
        { field: 'BankCity', title: '开户行市', width: 100, align: 'left', sortable: true },
        { field: 'BankNo', title: '开户行行号', width: 100, align: 'left', sortable: true },
        { field: 'BankInfo', title: '开户行名称', width: 100, align: 'left', sortable: true },
        { field: 'BankIDs', title: '银行户名', width: 100, align: 'left', sortable: true },
        { field: 'BankAccount', title: '银行账号', width: 100, align: 'left', sortable: true },
        { field: 'BankAgreement', title: '代收协议编号', width: 100, align: 'left', sortable: true },
        { field: 'BankPaperName', title: '持卡证件名称', width: 100, align: 'left', sortable: true },

        { field: 'BankPaperCode', title: '持卡人证件号码', width: 100, align: 'left', sortable: true },
        { field: 'BankMobilePhone', title: '持卡人联系电话', width: 100, align: 'left', sortable: true },
        { field: 'BankCustCode', title: '银行客户编码', width: 100, align: 'left', sortable: true },
        { field: 'SignDate', title: '登记时间', width: 100, align: 'left', sortable: true },
        {
            field: 'IsLockBank', title: '是否锁定', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "否";
                if (value == 1) {
                    str = "是";
                }
                return str;
            }
        },
        {
            field: 'LockBankUser', title: '锁定记录', width: 260, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "";
                if (value != "" && value != null) {
                    if (row.IsLockBank == 1) {
                        str = "由 " + value + " 于" + row.LockBankDate + "锁定";
                    } else {
                        str = "由 " + value + " 于" + row.LockBankDate + "解锁";
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
                    HDialog.Info('请勾选需要锁定的记录!');
                    return;
                }
                else {
                    var CustIDs = "";
                    $.each(rows, function (key, val) {
                        CustIDs += rows[key]["CustID"] + ",";
                    });
                    CustIDs = CustIDs.substr(0, CustIDs.length - 1);
                    Lock(CustIDs, 1);
                }
            }
        }, '-', {
            text: '解锁',
            iconCls: 'icon-key',
            handler: function () {
                var rows = $('#TableContainer').datagrid('getChecked');
                if (rows == "") {
                    HDialog.Info('请勾选需要解锁的记录!');
                    return;
                }
                else {
                    var CustIDs = "";
                    $.each(rows, function (key, val) {
                        CustIDs += rows[key]["CustID"] + ",";
                    });
                    CustIDs = CustIDs.substr(0, CustIDs.length - 1);
                    Lock(CustIDs, 0);
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

        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column, 
            fitColumns: false,
            remoteSort: false,
            rownumbers: true,
            singleSelect: false,
            check: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("CustBank", "CustomerBankList", "TableContainer", param);
            },
        });
        $("#SearchDlg").dialog("close");
    }

    LoadList();


    function Lock(CustIDs, IsLock) {
        var LockType = "锁定";
        if (IsLock == 0) {
            LockType = "解锁";
        }
        //判断是否重复锁定
        var checkRegionIDs = $("#TableContainer").datagrid('getSelections');
        var isCheck = true;
        $.each(checkRegionIDs, function (i, value) {
            if (value.IsLockBank == IsLock) {
                HDialog.Info('选择数据中包含有' + LockType + '的项');
                isCheck = false;
                return false;
            }
        });
        if (isCheck) {
            $.messager.confirm('确定', LockType, function (r) {
                if (r) {
                    $.tool.DataPostChk('frmForm', 'ResourceBaseAuditing', 'NewCustomerBankLockBrowse', '&KeyIDValues=' + CustIDs + '&IsLock=' + IsLock,
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

    $("select").each(function () {
        var key = $(this).attr("id");
        if (key != undefined) {
            $(this).css("width", document.body.clientWidth * 0.15 * 0.67);
        }
    });

</script>

