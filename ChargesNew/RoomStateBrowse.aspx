<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomStateBrowse.aspx.cs" Inherits="M_Main.ChargesNew.RoomStateBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title>收费比例设置</title>
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
            width: 600px;
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
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="CostCode" name="CostCode" runat="server" />
        <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">交房状态
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="StateName" name="StateName" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
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
                { field: 'SortNum', title: '序号', width: 70, align: 'left', sortable: true },
                {
                    field: 'StateName', title: '交房状态', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.RoomState + "','edit');\">" + row.StateName + "</a>";
                        return str;
                    }
                },
                { field: 'FeesRate', title: '收费比率', width: 100, align: 'left', sortable: true },
                { field: 'StateMemo', title: '备注', width: 200, align: 'left', sortable: true },
                { field: 'NowStateNames', title: '当前交房状态', width: 300, align: 'left', sortable: true },
                { field: 'CorpCostItems', title: '缴纳收费科目', width: 400, align: 'left', sortable: true }
            ]];
            var toolbar = [

                {
                    text: '新增',
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
                        if (row == null) {
                            HDialog.Info('请选择删除项！');
                            return;
                        }
                        DelRecord(row.RoomState);
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


            function DelRecord(RoomState) {
                $.messager.confirm('确定', '是否删除该收费比例', function (r) {
                    if (r) {
                        $.tool.DataGet('CorpRoomState', 'Del', 'RoomState=' + RoomState,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "false") {
                                    HDialog.Info('删除失败');
                                }
                                else {
                                    HDialog.Info('删除成功');
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
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CorpRoomState&Command=List&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
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

            function Detail(RoomState, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '300', '../ChargesNew/RoomStateManage.aspx?RoomState=' + RoomState + '&OpType=' + OpType, '收费比例详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

        </script>
    </form>
</body>
</html>
