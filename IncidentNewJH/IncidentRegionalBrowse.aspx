<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentRegionalBrowse.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentRegionalBrowse" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 150px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">区域位置
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="RegionalPlace" name="RegionalPlace" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="IdList" name="IdList" runat="server" />
        <div id="SearchBuiling" class="easyui-dialog" title="设置管家" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 170px; padding: 10px;">
            <input type="hidden" id="RegionalID" name="RegionalID" />
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">管家角色</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" style="width: 77%" data-options="required:true,editable:false" id="RoleNames" name="RoleNames" searcher="SelDealMan" runat="server" />
                        <input style="width: 16px; height: 22px" id="RoleCodes" size="1" type="hidden" name="RoleCodes" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼栋管家</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" style="width: 77%" data-options="required:true,editable:false" id="UserName" name="UserName" searcher="SelUserByRole" runat="server" />
                        <input style="width: 16px; height: 22px" id="UserCode" size="1" type="hidden" name="UserCode" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">管家电话</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 76%" data-options="required:true,editable:false" id="MobileTel" name="MobileTel" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <input type="button" class="button" value="保存" id="BtnBuildingSave" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'RegionalID', title: 'RegionalID', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'RegionalNum', title: '序号', width: 100, align: 'left', sortable: true, hidden: true },
                {
                    field: 'RegionalPlace', title: '公共区域', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改公区区域','update'," + row.RegionalID + ");\">" + row.RegionalPlace + "</a>";
                        return str;
                    }
                },
                { field: 'UserName', title: '楼栋管家', width: 200, align: 'left', sortable: true },
                { field: 'RegionalMemo', title: '备注', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail("新增公区信息", 'add', 0);
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null) {
                            DelRecord(row.RegionalID);
                        }
                    }
                }, '-',

                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#RegionalName").val("");
                    }
                }
                , '-',
                {
                    text: '设置管家',
                    iconCls: 'icon-save',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getSelected');
                        if (rows == "" || rows == null) {
                            HDialog.Info('请勾选要设置管家的公共区域!');
                            return;
                        }
                        else {

                            $("#RoleNames").searchbox("setValue", "");
                            $("#RoleCodes").val("");
                            $("#UserName").searchbox("setValue", "");
                            $("#UserCode").val("");
                            $('#MobileTel').val("")

                            
                            $('#SearchBuiling').parent().appendTo($("form:first"))
                            $('#SearchBuiling').dialog('open');
                        }
                    }
                }
                , '-',
                {
                    text: '删除管家',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getSelected');
                        if (rows == "") {
                            HDialog.Info('请勾选需要删除的管家!');
                            return;
                        }
                        else {
                            var id = "";
                            id = rows.RegionalID
                            updatebuilding(id)
                        }
                    }
                }
            ];

            function DelRecord(Id) {
                HDialog.Prompt('是否删除该项', function () {
                    $.tool.DataGet('IncidentSet', 'delete', 'RegionalID=' + Id,
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
                });
            }


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentSet&Command=search&' + $("#frmForm").serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: false,
                    pagination: true,
                    border: false,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }

            LoadList();


            function ViewDetail(title, OpType, ID) {
                //var h = $(window).height();
                if (OpType == "update") {
                    HDialog.Open(600, 200, '../IncidentNewJH/IncidentRegionalManage.aspx?RegionalID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {

                        LoadList();
                    });
                }
                else {
                    HDialog.Open(600, 200, '../IncidentNewJH/IncidentRegionalManage.aspx?RegionalID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {

                        LoadList();
                    });
                }
            }

            function SelDealMan() {
                HDialog.Open('640', '480', '../DialogNew/HouseKeeper.aspx', '选择管家角色', false, function callback(_Data) {
                    var arrRet = _Data.split('\t');
                    $("#RoleNames").searchbox("setValue", arrRet[1]);
                    $("#RoleCodes").val(arrRet[0]);
                    $("#UserName").searchbox("setValue", '');
                    $("#UserCode").val('');
                });
            }

            function SelUserByRole() {
                if ($("#RoleCodes").val() <= '') {
                    HDialog.Info('请先选择管家角色');
                    return;
                }
                HDialog.Open('640', '480', '../DialogNew/SelKeeper.aspx?RoleCodes=' + $("#RoleCodes").val(), '选择管家', false, function callback(_Data) {
                    var obj = JSON.parse(_Data);
                    var arrRet = _Data.split('\t');
                    $("#UserName").searchbox("setValue", obj.UserName);
                    $("#UserCode").val(obj.UserCode);
                    $('#MobileTel').val(obj.MobileTel)
                });
            }


            $("#BtnBuildingSave").click(function () {
                $('#IdList').val("");
                var cmd = 'updatebuilding';
                var rows = $('#TableContainer').datagrid('getChecked');
                var id = "";
                for (var i = 0; i < rows.length; i++) {
                    if (i == 0) {
                        id = rows[i].RegionalID;
                    } else { id += ',' + rows[i].RegionalID };
                }
                $("#RegionalID").val(id);
                $.tool.DataPostChk('frmForm', 'IncidentSet', cmd, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('设置成功');
                            $("#SearchBuiling").dialog("close");
                            LoadList();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            });
            


            function updatebuilding(id) {
                $("#RegionalID").val(id);
                
                var cmd = 'updateHousekeeper';
                $('#IdList').val("");
                var cmd = 'updatebuilding';
                var rows = $('#TableContainer').datagrid('getChecked');
                var id = "";
                for (var i = 0; i < rows.length; i++) {
                    if (i == 0) {
                        id = rows[i].RegionalID;
                    } else { id += ',' + rows[i].RegionalID };
                }
                $("#RegionalID").val(id);

                HDialog.Prompt('是否删除该项', function () {
                    $.tool.DataGet('IncidentSet', 'updateHousekeeper', 'RegionalID=' + id,
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
                });
            }
        </script>

    </form>
</body>
</html>
