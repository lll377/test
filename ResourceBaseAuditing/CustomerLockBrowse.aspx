<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerLockBrowse.aspx.cs" Inherits="M_Main.ResourceBaseAuditing.CustomerLockBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <form id="frmForm" method="post" runat="server">
         <input id="CommID" size="1" type="hidden" name="CommID" runat="server"/>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 480px; height: 210px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;margin:0px auto;">
                <tr>
                    <td style="width: 80px">客户名称：
                    </td>
                    <td colspan="2">
                        <input id="KeyIDValues" name="KeyIDValues" type="hidden" />
                        <input id="CustName" class="easyui-textbox" name="CustName" maxlength="50" style="width: 120px" />
                    </td>
                     <td style="width: 80px">电话号码：
                    </td>
                    <td colspan="2">
                        <input id="MobilePhone" class="easyui-textbox" name="MobilePhone" style="width: 120px" type="text" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">房屋名称：
                    </td>
                    <td colspan="2">
                         <input id="RoomNames" class="easyui-textbox" name="RoomNames" style="width: 120px" type="text" />
                    </td>
                     <td style="width: 80px">房屋编号：</td>
                    <td colspan="2">
                         <input id="RoomSign" name="RoomSign" class="easyui-textbox"  style="width: 120px" type="text" />
                    </td>
                </tr>
                  <tr>
                    <td style="width: 80px">客户类别：
                    </td>
                    <td colspan="2" class="TdContentSearch">
                       <select id="CustTypeID" name="CustTypeID" runat="server" class="easyui-combobox" style="width:120px">
                            <option selected></option>
                        </select>

                    </td>
                     <td style="width: 80px">客户性质：</td>
                    <td colspan="2">
                      <select id="LiveType" name="LiveType" runat="server" class="easyui-combobox" style="width:120px">
                            <option selected>全部</option>
                            <option value="1">业主</option>
                            <option value="2">租户</option>
                            <option value="3">临时</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">是否锁定：
                    </td>
                    <td colspan="2">
                 <select id="SearchIsLock" name="SearchIsLock" class="easyui-combobox"
                            data-options="panelHeight:'auto'" style="width: 120px">
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

        $(function () {
            InitTableHeight();
            LoadList();
        });

        function CancelParm() {
            $("#CustName").textbox("setValue", "");
            $("#MobilePhone").textbox("setValue", "");
            $("#RoomNames").textbox("setValue", "");
            $("#RoomSign").textbox("setValue", "");
            $("#CustTypeID").combobox("setValue", "");
            $("#LiveType").combobox("setValue", "");
            $("#SearchIsLock").combobox("setValue", "");
        }

        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }

        var toolbar = [
            {
                text: '锁定',
                iconCls: 'icon-locking',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getSelections");
               
                    if (rows == "") {
                        HDialog.Info('请勾选需要锁定的客户!');
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
                        HDialog.Info('请勾选需要解锁的客户!');
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
                    $("#BuildName").val("");
                }
            }
        ];

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'LiveTypeName', title: '客户类型', width: 100, align: 'left', sortable: true },
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'left', sortable: true },
            {
                field: 'CustName', title: '客户名称', width: 250, align: 'left', sortable: true
            },
            { field: 'MemberName', title: '成员名称', width: 100, align: 'left', sortable: true },
            { field: 'RoomSigns', title: '房屋编号', width: 320, align: 'left', sortable: true },
            { field: 'PaperCode', title: '证件号码', width: 190, align: 'left', sortable: true },
            { field: 'FixedTel', title: '固定电话', width: 110, align: 'left', sortable: true },
            { field: 'MobilePhone', title: '移动电话', width: 110, align: 'left', sortable: true },
            { field: 'LiveStateName', title: '租赁状态', width: 100, align: 'left', sortable: true },
            {
                field: 'IsLock', title: '是否锁定', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "否";
                    if (value == 1) {
                        str = "是";
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
        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Customer&Command=searchcustomercontain&' + $("#frmForm").serialize(),
                method: "get",
                title: '',
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
                toolbar: toolbar,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                }
            });
        }

        function Lock(CustIDs, IsLock) {
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
                $.messager.confirm('确定操作所选客户', LockType, function (r) {
                    if (r) {
                        $.tool.DataPostChk('frmForm', 'ResourceBaseAuditing', 'CustomerLockBrowse', '&KeyIDValues=' + CustIDs + '&IsLock=' + IsLock,
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

    </script>
</body>
</html>

