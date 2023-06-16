<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DictionaryBrowseList.aspx.cs" Inherits="M_Main.SysNew.DictionaryBrowseList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>字典维护</title>
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
            height: 90px;
        }

        .SearchTable {
            width: 500px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">字典类别
                    </td>
                    <td class="TdContent">
                        <select id="DListDictionarySort" name="DListDictionarySort" runat="server"></select>
                    </td>
                    <td class="TdTitle">字典名称
                    </td>
                    <td class="TdContent">
                        <input type="text" id="DictionaryName" name="DictionaryName" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
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
                            {
                                field: 'DictionaryName', title: '字典名称', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.DictionaryCode + "','edit');\">" + row.DictionaryName + "</a>";
                                    return str;
                                }
                            },
                            { field: 'DictionarySign', title: '字典编码', width: 120, align: 'left', sortable: true },
                            { field: 'DictionaryOrderId', title: '序号', width: 80, align: 'left', sortable: true },
                            { field: 'DictionaryMemo', title: '备注', width: 250, align: 'left', sortable: true }
            ]];
            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        Detail('', 'add');
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
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '返回',
                    iconCls: 'icon-back',
                    handler: function () {
                        window.history.back();
                    }
                }
            ];

            function DelRecord(row) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Dictionary', 'Del', 'DictionaryCode=' + row.DictionaryCode + '&DListDictionarySort=' + $('#DListDictionarySort').val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            LoadList();
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
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Dictionary&Command=DictionaryList&' + $('#frmForm').serialize(),
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
                        //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            function Detail(Code, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '350', '../SysNew/DictionaryManage.aspx?DictionarySort=' + $("#DListDictionarySort").val() + '&DictionaryCode=' + Code + '&OpType=' + OpType, '字典详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

        </script>
    </form>
</body>
</html>
