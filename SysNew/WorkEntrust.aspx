<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkEntrust.aspx.cs" Inherits="M_Main.SysNew.WorkEntrust" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>工作委托设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 250px;
        }

        .SearchTable {
            width: 100%;
            height: auto;
        }

        /*.SearchTable .TdTitle {
            width:15%;
        }
        .SearchTable .TdContent {
            width:35%;
        }*/
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td>被委托人&nbsp;:&nbsp;<input type="text" id="ToUserName" name="ToUserName" />
                    </td>
                    <tr>
                        <td colspan="4" style="text-align: center; padding-top: 5px;">
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
                { field: 'UserName', title: '委托人', align: 'left', width: 50, sortable: true },
                {
                    field: 'ToUserName', title: '被委托人', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = row.ToUserName;
                        return str;
                    }
                },
                {
                    field: 'EntrustStartDate', title: '委托开始时间', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.EntrustStartDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'EntrustEndDate', title: '委托结束时间', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.EntrustEndDate, "yyyy-MM-dd");
                        return str;
                    }
                }
            ]];
            var toolbar = [
                {
                    text: '委托',
                    iconCls: 'icon-add',
                    handler: function () {
                        Detail('', 'insert');
                    }
                }, '-',
                {
                    text: '撤销',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row)
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function DelRecord(row) {
                $.messager.confirm('确定', '是否撤销委托', function (r) {
                    if (r) {
                        $.tool.DataGet('WorkEntrust', 'Del', 'EntrustCode=' + row.EntrustCode,
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                if (_Data.substring(0, 5) == "false") {
                                    HDialog.Info(_Data.substring(6));
                                }
                                else {
                                    LoadList();
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=WorkEntrust&Command=List&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    remoteSort: false,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            function Detail(EntrustCode, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));

                HDialog.Open('600', '340', '../SysNew/WorkEntrustManage.aspx?EntrustCode=' + EntrustCode + '&OpType=' + OpType, '工作委托详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

        </script>
    </form>
</body>
</html>
