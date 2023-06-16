<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlowLeft.aspx.cs" Inherits="M_Main.OAWorkFlowNew.WorkFlowLeft" %>

<!DOCTYPE html>
<html>
<head>
    <title>流程设置</title>
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
            width: 220px;
            height: 80px;
        }

        .SearchTable {
            width: 220px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="InfoId" name="InfoId" runat="server" />
        <input type="hidden" id="Pid" name="Pid" runat="server" />
        <div id="TableContainer">
        </div>
        <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width: 120px;">
            <div data-options="name:'newxj',iconCls:'icon-add'">新增下级</div>
            <div class="menu-sep"></div>
            <div data-options="name:'del',iconCls:'icon-cancel'">删除</div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td>类别名称
                    </td>
                    <td>
                        <input type="text" class="easyui-validatebox" id="FlowName" style="width: 90%;" name="FlowName" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList('-1');">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清除条件</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function ClearWhere() {
                $("#FlowName").val("");
            }
            function menuHandler(item) {
                switch (item.name) {
                    case "newxj":
                         if ($("#InfoId").val() == "0" || $("#InfoId").val() == "") {
                            $("#InfoId").val("-1");
                        }
                        HDialog.Open('800', '350', '../OAWorkFlowNew/WorkFlowTypeDetail.aspx?Pid=' + $("#InfoId").val() + '&OpType=add', '流程类别详细', false, function callback(_Data) {
                            if (_Data.substring(0, 5) == "false") {
                                HDialog.Info(_Data.substring(6));
                            }
                            else {

                                //新增加下级
                                var node = $('#TableContainer').treegrid('getSelected');
                                var ChildNode = JSON.parse(_Data);
                                $('#TableContainer').treegrid('append', {
                                    parent: $("#InfoId").val(),
                                    data: ChildNode
                                });

                            }
                        });
                        break;
                    case "del":
                        HDialog.Prompt("是否确认删除", function a() {
                            DelRecord($("#InfoId").val());
                        })
                        break;
                }
            }

            function Detail(InfoId, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '350', '../OAWorkFlowNew/WorkFlowTypeDetail.aspx?InfoId=' + InfoId + '&OpType=' + OpType, '流程类别详细', false, function callback(_Data) {

                    if (_Data.substring(0, 5) == "false") {
                        HDialog.Info(_Data.substring(6));
                    }
                    else {
                        var node = $('#TableContainer').treegrid('getSelected');
                        var UpdateNode = JSON.parse(_Data);
                        node.text = UpdateNode[0].text;
                        $('#TableContainer').treegrid('update', {
                            id: node.id,
                            row: node
                        });
                    }
                });
            }


            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                {
                    field: 'text', title: '类别名称', align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.id + "','edit');\">" + row.text + "</a>";
                        return str;
                    }
                }
            ]];

            var IsCollapseAll = false;
            var toolbar = [
                {
                    text: '展开/折叠',
                    iconCls: 'icon-redo',
                    handler: function () {
                        if (IsCollapseAll == true) {
                            $('#TableContainer').treegrid('expandAll');
                            IsCollapseAll = false;
                        }
                        else {
                            $('#TableContainer').treegrid('collapseAll');
                            IsCollapseAll = true;
                        }
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

            function DelRecord(InfoId) {

                $.tool.DataGet('WorkFlowManage', 'Delete', 'InfoId=' + InfoId,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            $('#TableContainer').treegrid('remove', InfoId);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }

            function LoadList(Pid) {
                $("#TableContainer").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=WorkFlowManage&LoadPid=' + Pid + '&FlowSortName=' + $("#FlowName").val() + '&Command=Search&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    initialState: "collapsed",
                    onClickRow: function (node) {
                        $("#InfoId").val(node.id);
                        $("#Pid").val(node.attributes.Pid);
                        $("#FlowSortName").val(node.text);
                        parent.$("#WorkFlowRight").attr("src", "WorkFlowRight.aspx?InfoId=" + node.id);
                    },
                    onBeforeExpand: function (row, param) {
                        if (row) {
                            $("#TableContainer").treegrid('options').url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=WorkFlowManage&LoadPid=' + row.id + '&Command=Search&' + $('#frmForm').serialize();
                        }
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                    loadFilter: function (data) {
                        if (data.d) {
                            return data.d;
                        } else {
                            return data;
                        }
                    }
                });
            }

            LoadList(-1);

            $(function () {
                $(document).bind('contextmenu', function (e) {
                    e.preventDefault();
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                });
            });
        </script>
    </form>
</body>
</html>
