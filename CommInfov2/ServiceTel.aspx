<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceTel.aspx.cs" Inherits="M_Main.CommInfov2.ServiceTel" %>

<!DOCTYPE html>
<html>
<head>
    <title>服务电话</title>
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
            height: 150px;
        }

        .SearchTable {
            width: 600px;
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
    <form id="frmForm" runat="server" style="overflow:auto">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <div id="TableContainer" >
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column = [[
                            { field: 'Heading', title: '服务电话名称', align: 'left', sortable: true },
                            { field: 'InfoSourceName', title: '服务电话类别', align: 'left', sortable: true },
                            {
                                field: 'InfoContent', title: '电话号码', align: 'left', sortable: true, formatter: function (value, row, index) {
                                    return "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.InfoID + "','edit');\">" + row.InfoContent + "</a>";
                                }
                            }
            ]];
            var toolbar = [
                {
                    text: '类别管理',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddType();
                    }
                }, '-',
                 {
                     text: '新增电话',
                     iconCls: 'icon-add',
                     handler: function () {
                         Detail('', 'insert');
                     }
                 }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row)
                    }
                }, '-',
                {
                    text: '<span style=\"color:red\">*请将统一客服电话命名为“客服热线”,用于手机APP等对外公示。</span>'
                }
            ];

            function DelRecord(row) {
                $.messager.confirm('确定', '是否删除该服务电话?', function (r) {
                    if (r) {
                        _Del(row.InfoID);
                    }
                });
            }

            function Del(InfoID) {
                $.messager.confirm('确定', '是否删除该服务电话?', function (r) {
                    if (r) {
                        _Del(InfoID);
                    }
                });
            }

            function _Del(InfoID) {
                $.tool.DataGet('ServiceTel', 'Del', 'InfoID=' + InfoID,
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

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=ServiceTel&Command=List&' + $('#frmForm').serialize(),
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

            function Detail(InfoID, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('600', '200', '../CommInfov2/ServiceTelManager.aspx?InfoID=' + InfoID + '&OpType=' + OpType, '服务电话详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            function AddType() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('600', '379', '../CommInfov2/ServiceTelAddTelType.aspx', '服务电话类别管理', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>
