<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentStandardUpload.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentStandardUpload" %>

<!DOCTYPE html>

<html>
<head>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
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
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 150px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">附件名称
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
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                console.log(h);
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var column = [[
                { field: 'IID', title: 'IID', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'Type', title: '收费标准类型', width: 100, align: 'left', sortable: true, hidden: false },
                { field: 'Num', title: '序号', width: 100, align: 'left', sortable: true, hidden: false },
                {
                    field: 'Name', title: '收费标准名称', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改标准信息','edit','" + row.IID + "');\">" + row.Name + "</a>";
                        return str;
                    }
                },
                { field: 'Memo', title: '备注', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail("新增标准信息", 'add', 0);
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null) {
                            DelRecord(row.IID);
                        }
                    }
                }
            ];

            function DelRecord(iid) {
                HDialog.Prompt('是否删除该项', function () {
                    $.tool.DataGet('IncidentSetUp', 'DelIncidentStandardUpload', 'IID=' + iid,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.split('|')[0] == "true") {
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
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentSetUp&Command=GetIncidentStandardUploadDataList&' + $("#frmForm").serialize(),
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
                    //height:"90%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();
            function ViewDetail(title, OpType, ID) {
                if (OpType == "edit") {
                    HDialog.Open(600, 350, '../IncidentNewJH/IncidentStandardUploadManage.aspx?IID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                        LoadList();
                    });
                }
                else {
                    HDialog.Open(600, 350, '../IncidentNewJH/IncidentStandardUploadManage.aspx?IID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                        LoadList();
                    });
                }
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
                        if (_Data.split('|')[0] == "true") {
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
