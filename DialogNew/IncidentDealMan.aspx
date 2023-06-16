<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentDealMan.aspx.cs" Inherits="M_Main.DialogNew.IncidentDealMan" %>

<!DOCTYPE html>
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
        #SearchDlg {
            padding: 10px;
            width: 500px;
            height: 240px;
        }

        .SearchTable {
            width: 500px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="BigCorpTypeID" name="BigCorpTypeID" runat="server" />
        <input type="hidden" id="IsAssignedBatch" name="IsAssignedBatch" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="IsTransmit" name="IsTransmit" runat="server" />
        <input type="hidden" id="IncidentID" name="IncidentID" runat="server" />
        <input id="AllCheck" size="1" type="hidden" name="AllCheck" runat="server" />
        <input type="hidden" id="pdlist" name="pdlist" value="" />
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">人员姓名
                    </td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" />
                    </td>

                </tr>

                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
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
            var column;
            column = [[
                { field: 'UserName', title: '员工姓名', width: 40, align: 'left', sortable: true },
                {
                    field: 'EmployeeStatus', title: '状态', width: 40, align: 'left', sortable: true
                },
                {
                    field: 'EmployeeProfession', title: '工种', width: 40, align: 'left', sortable: true
                },
                { field: 'RoleName', title: '通用岗位', width: 160, align: 'left', sortable: true },
                { field: 'NotOverNum', title: '在办工单', width: 100, align: 'left', sortable: true },
                {
                    field: 'LastLocation', title: '当前位置', width: 100, align: 'left', sortable: true
                }
            ]];

            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getSelected');
                        if (rows == "" || rows == null) {
                            HDialog.Info('请选择');
                        }
                        else {

                            var mUserCode = "";
                            var mUserName = "";


                            mUserCode = rows.UserCode;
                            mUserName = rows.UserName;

                            var strRe = mUserCode + "\t" + mUserName;

                            HDialog.Close(strRe);


                        }
                    }

                }, {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=IncidentDealMan&' + $('#frmForm').serialize(),
                    method: "get",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onLoadSuccess: function (data) {

                    },
                    onDblClickRow: function (rowIndex, rowData) {
                        var mUserCode = "";
                        var mUserName = "";
                        mUserCode = rowData.UserCode;
                        mUserName = rowData.UserName;

                        var strRe = mUserCode + "\t" + mUserName;

                        HDialog.Close(strRe);
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();

        </script>
    </form>
</body>
</html>
