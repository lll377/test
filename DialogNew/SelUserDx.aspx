<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelUserDx.aspx.cs" Inherits="M_Main.DialogNew.SelUserDx" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 500px; 
            height: 240px; 
        }
        .SearchTable
        {
            width: 500px; 
            height:auto;
        }
        .SearchTable .TdTitle {
            width:15%;
        }
        .SearchTable .TdContent {
            width:35%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input type="hidden" id="DepCode" name="DepCode" runat="server" />
    <div id="TableContainer">
    </div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    人员姓名
                </td>
                <td class="TdContent">
                    <input type="text" id="UserName" name="UserName" />
                </td>
                <td class="TdTitle">
                    登录账号
                </td>
                <td class="TdContent">
                    <input type="text" id="LoginCode" name="LoginCode" />
                </td>
                </tr>
                <tr>
                <td class="TdTitle">
                    所属岗位
                </td>
                <td class="TdContent">
                    <input type="text" id="RoleName" name="RoleName" />
                </td>
                <td class="TdTitle">
                    通用岗位
                </td>
                <td class="TdContent">
                    <input type="text" id="SysRoleName" name="SysRoleName" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    开通手机
                </td>
                <td class="TdContent">
                    <input type="checkbox" id="CkMobile" name="CkMobile"/>
                </td>
                <td class="TdTitle">
                </td>
                <td class="TdContent">
                </td>
                <td class="TdTitle">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>
    <input type="hidden" id="SelUserName" name="SelUserName" runat="server" />
    <input type="hidden" id="SelUserCode" name="SelUserCode" runat="server" />

    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">

        function SelUser() {
            var rows = $('#TableContainer').datagrid('getChecked');
            var C = $("#SelUserCode").val();
            var N = $("#SelUserName").val();

            var str = $("#SelUserCode").val();
            
            for (var i = 0; i < rows.length; i++) {
                if (str.indexOf(rows[i].UserCode) < 0) {
                    if (str == '' && i==0) {
                        C = C + rows[i].UserCode;
                        N = N + rows[i].UserName;
                    }
                    else {
                        C = C + ',' + rows[i].UserCode;
                        N = N + ',' + rows[i].UserName;
                    }
                    
                }
            }
            $("#SelUserName").val(N);
            $("#SelUserCode").val(C);
        }

        function CheckUser() {

            var rows = $('#TableContainer').datagrid('getRows');
            var str = $("#SelUserCode").val();
            for (var i = 0; i < rows.length; i++) {
                if (str.indexOf(rows[i].UserCode) >= 0) {
                    var RI = $("#TableContainer").datagrid("getRowIndex", rows[i]);
                    $("#TableContainer").datagrid("selectRow", RI);
                }
            }
        }
  
        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
                { field: 'UserCode', title: '选择', align: 'center', checkbox:true },
                { field: 'DepName', title: '组织机构', width:300, align: 'left', sortable: true },
                {
                    field: 'UserName', title: '人名员称', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.UserCode + "','edit');\">" + row.UserName + "</a>";
                        return str;
                    }
                },
                { field: 'LoginCode', title: '登录账号', width: 80, align: 'left', sortable: true },
                { field: 'UserRoleNames', title: '岗位名称', width: 120, align: 'left', sortable: true },
                { field: 'UserSysRoleNames', title: '通用岗位', width: 80, align: 'left', sortable: true }
        ]];

        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            },
            {
                text: '确定',
                iconCls: 'icon-save',
                handler: function () {
                    SelUser();
                    var rows = $("#SelUserName").val() + ';' + $("#SelUserCode").val();
                    HDialog.Close(rows);
                }
            },
            {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#SelUserName").val("");
                    $("#SelUserCode").val("");
                    var rows = $("#SelUserName").val() + ';' + $("#SelUserCode").val();
                    HDialog.Close(rows);
                }
            }
        ];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=User&Command=UserList_Role&' + $('#frmForm').serialize(),
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: false,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    //加载已经选中的CheckBox
                    SelUser();
                },
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                    //选中已加载的User
                    CheckUser();
                }
            });
        }
        LoadList();

    </script>
    </form>
</body>
</html>
