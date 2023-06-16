<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelCurrencyPost2.aspx.cs" Inherits="M_Main.DialogNew.SelCurrencyPost2" %>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .SearchTable {
            width: 100%;
            padding: 10px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" name="RoleCodes" id="RoleCodes" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" style="width: 400px; height: 140px; padding: 10px; overflow: hidden;" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle" colspan="4">岗位名称
                    </td>
                    <td class="TdContent" colspan="4">
                        <input type="text" class="easyui-validatebox" id="RoleName" name="RoleName" />
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            var RoleCodes = "<%=RoleCodes%>";
            var arrRoleCodes = [];
            $(function () {
                if (RoleCodes != '') {
                    arrRoleCodes = RoleCodes.split(',');
                }
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var column = [[
                { field: '', checkbox: true },
                {
                    field: 'RoleName', title: '岗位名称', width: 200, align: 'left', sortable: true
                },
                {
                    field: 'UserCount', title: '人数', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"UserList('" + row.RoleCode + "');\">" + row.UserCount + "</a>";
                        return str;
                    }
                },
                { field: 'RoleDescribe', title: '备注', width: 300, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        var RCs = "";
                        if (arrRoleCodes.length <= 0)
                        {
                            var emptyArr = [];
                            HDialog.Close(JSON.stringify(emptyArr));
                            return;
                        }
                        for (var i = 0; i < arrRoleCodes.length; i++) {
                            RCs += "'"+arrRoleCodes[i]+"'" + ",";
                        }
                        RCs = RCs.substr(0, RCs.length - 1);
                        $("#RoleCodes").val(RCs);
                        $.ajax({
                            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Role&Command=RoleList&DepCode=Empty&page=1&rows=99999&' + $('#frmForm').serialize(),
                            type: 'get',
                            success: function (res) {
                                var resobj = JSON.parse(res);
                                var rows = resobj.rows;
                                HDialog.Close(JSON.stringify(rows));
                            }
                        });
                         
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Role&Command=RoleList&DepCode=Empty&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    remoteSort: false,
                    fitColumns: false,
                    pagination: true,
                    width: "100%",
                    height: 450,
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        AutoBind();
                    },
                    onSelect: function (rowIndex, rowData) {
                        AddRoleCode(rowData.RoleCode);
                    },
                    onUnselect: function (rowIndex, rowData) {
                        DelRoleCode(rowData.RoleCode);
                    },
                    onCheckAll: function (row) {
                        for (var i = 0; i < row.length; i++) {
                            AddRoleCode(row[i].RoleCode);
                        }
                    },
                    onUncheckAll: function (row) {
                        for (var i = 0; i < row.length; i++) {
                            DelRoleCode(row[i].RoleCode);
                        }
                    }
                });
            }
            LoadList();

            //自动选中
            function AutoBind() {
                var data = $("#TableContainer").datagrid('getData');

                for (var i = 0; i < data.rows.length; i++) {
                    for (var j = 0; j < arrRoleCodes.length; j++) {
                        if (data.rows[i].RoleCode == arrRoleCodes[j]) {
                            var rowIndex1 = $("#TableContainer").datagrid("getRowIndex", data.rows[i]);
                            $("#TableContainer").datagrid("selectRow", rowIndex1);
                        }
                    }
                }
            }
            //添加
            function AddRoleCode(Code) {
                var Exists = arrRoleCodes.filter(function (c) { return c == Code; })
                if (Exists.length <= 0) {
                    arrRoleCodes.push(Code);
                }
            }
            //删除
            function DelRoleCode(Code) {
                var delindex = -1;
                for (var i = 0; i < arrRoleCodes.length; i++) {
                    if (arrRoleCodes[i] == Code)
                        delindex = i;
                }
                if (delindex != -1)
                    arrRoleCodes.splice(delindex, 1);
            }

            function UserList(RoleCode) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '600', '../SysNew/DepartmentRoleUserList.aspx?RoleCode=' + RoleCode, '人员列表', true, function callback(_Data) {
                });
            }
        </script>
    </form>
</body>
</html>
