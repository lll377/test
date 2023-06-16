<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditCorpCostItemContractBrowse.aspx.cs" Inherits="M_Main.ChargesNew.AuditCorpCostItemContractBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管控模型合同费用审核流程</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body {
        }

        #SearchDlg {
            padding: 10px;
            width: 450px;
            height: 80px;
        }

        .SearchTable {
            width: 500px;
            height: auto;
        }

        .tabs-panels {
            border: none;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="AuditType" name="AuditType" runat="server" />
        <input type="hidden" id="reftable" name="reftable" runat="server" />
        <input type="hidden" id="Config" name="Config" runat="server" />
        <div class="easyui-tabs" style="width: 100%; overflow: hidden; border: none;" id="Tab">
            <%=Tab_Script%>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr id="roleTr">
                    <td class="TdTitle">岗位
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr id="changeTr" style="display: none;">
                    <td class="TdTitle">变更类别</td>
                    <td class="TdContent">
                        <input type="text" id="ChangeType" name="ChangeType" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr id="contractTr" style="display: none;">
                    <td class="TdTitle">合同类别</td>
                    <td class="TdContent">
                        <input type="text" id="ContractType" name="ContractType" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>

        <script type="text/javascript">


            function InitFunction() {
                var h = $(window).height();
                $("#Tab").css("height", h + "px");

                $(".Container").each(function (i) {
                    $(this).css("height", (h - 32) + "px");
                });

            }
            InitFunction();
            var column = [[
                { field: 'ck', checkbox: true, width: '30' },
                { field: 'OrderId', title: '审核序号', width: 100, align: 'left', sortable: true },
                {
                    field: 'RoleName', title: '岗位', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.AuditID + "','edit');\">" + row.RoleName + "</a>";
                        return str;
                    }
                }
            ]];
            //经营合同
            var columnContract = [[
                { field: 'ck', checkbox: true, width: '30' },
                { field: 'ContractTypeName', title: '合同类别', width: 300, align: 'left', sortable: true },
                {
                    field: 'WorkFlowName', title: '流程名称', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.AuditID + "','edit');\">" + row.WorkFlowName + "</a>";
                        return str;
                    }
                },
                { field: 'Memo', title: '备注', width: 300, align: 'left', sortable: true }
            ]];
            //经营合同变更
            var columnChange = [[
                { field: 'ck', checkbox: true, width: '30' },
                { field: 'DictionaryName', title: '变更类别', width: 300, align: 'left', sortable: true },
                {
                    field: 'WorkFlowName', title: '流程名称', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.AuditID + "','edit');\">" + row.WorkFlowName + "</a>";
                        return str;
                    }
                },
                { field: 'Memo', title: '备注', width: 200, align: 'left', sortable: true }
            ]];

            //租赁合同签订列表
            var columnLeaseContract = [[
                { field: 'ck', checkbox: true, width: '30' },
                { field: 'ContractTypeName', title: '合同类别', width: 200, align: 'left', sortable: true },
                { field: 'DepName', title: '发起部门', width: 200, align: 'left', sortable: true },
                {
                    field: 'WorkFlowName', title: '流程名称', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.AuditID + "','edit');\">" + row.WorkFlowName + "</a>";
                        return str;
                    }
                }, { field: 'Memo', title: '备注', width: 200, align: 'left', sortable: true }
            ]];
            //租赁合同变更列表
            var columnLeaseChangeContract = [[
                { field: 'ck', checkbox: true, width: '30' },
                { field: 'ChangeType', title: '变更类型', width: 200, align: 'left', sortable: true },
                { field: 'DepName', title: '发起部门', width: 200, align: 'left', sortable: true },
                {
                    field: 'WorkFlowName', title: '流程名称', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.AuditID + "','edit');\">" + row.WorkFlowName + "</a>";
                        return str;
                    }
                }, { field: 'Memo', title: '备注', width: 200, align: 'left', sortable: true }
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
                        var reftable = $("#reftable").val();
                        var rows = $("#" + reftable).datagrid("getSelections");
                        if (rows.length == 0) {
                            HDialog.Info('请选择删除项！');
                            return;
                        }
                        var AuditIDs = '';
                        for (i = 0; i < rows.length; i++) {
                            AuditIDs += rows[i].AuditID + ",";
                        }

                        AuditIDs = AuditIDs.substring(0, AuditIDs.length - 1);
                        if ($("#reftable").val() == "TableContainer_4") {
                            DelRecord(AuditIDs)
                        } else if ($("#reftable").val() == "TableContainer_29" || $("#reftable").val() == "TableContainer_30") {
                            //删除租赁合同的流程设置
                            DelRecordLeaseContract(AuditIDs);
                        }
                        else {
                            DelRecordContract(AuditIDs)
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
                }];

            function SelType(v) {
                $("#AuditType").val(v);
                LoadList();
            }
            function DelRecord(AuditIDs) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('AuditCorpCostItemFees', 'Del', 'AuditID=' + AuditIDs,
                            function Init() {
                            },
                            function callback(_Data) {
                                var reftable = $("#reftable").val();
                                var pager = $("#" + reftable).datagrid('options');
                                pager.pageNumber = 1;
                                LoadList(reftable);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function DelRecordContract(AuditIDs) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('AuditCorpCostItemContract', 'Del', 'AuditID=' + AuditIDs,
                            function Init() {
                            },
                            function callback(_Data) {
                                var reftable = $("#reftable").val();
                                var pager = $("#" + reftable).datagrid('options');
                                pager.pageNumber = 1;
                                LoadList(reftable);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function DelRecordLeaseContract(AuditIDs) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('AuditLeaseContract', 'Del', 'AuditID=' + AuditIDs,
                            function Init() {
                            },
                            function callback(_Data) {
                                var reftable = $("#reftable").val();
                                var pager = $("#" + reftable).datagrid('options');
                                pager.pageNumber = 1;
                                LoadList(reftable);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function Search() {
                var ReftableStr = $("#reftable").val();
                LoadList(ReftableStr);
            }

            function LoadList(T) {
                $('#SearchDlg').parent().appendTo($("form:first"));
                var UrlStr = "";
                var ColumnStr = [[]];
                if (T == "TableContainer_4") {
                    UrlStr = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AuditCorpCostItemFees&Command=List&' + $('#frmForm').serialize();
                    ColumnStr = column;
                } else if (T == "TableContainer_10") {
                    UrlStr = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AuditCorpCostItemContract&Command=List&' + $('#frmForm').serialize();
                    ColumnStr = columnChange;
                } else if (T == "TableContainer_29") {
                    //租赁合同签订
                    UrlStr = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AuditLeaseContract&Command=List&' + $('#frmForm').serialize();
                    ColumnStr = columnLeaseContract;
                } else if (T == "TableContainer_30") {
                    //租赁合同变更
                    UrlStr = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AuditLeaseContract&Command=List&' + $('#frmForm').serialize();
                    ColumnStr = columnLeaseChangeContract;
                } else {
                    UrlStr = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AuditCorpCostItemContract&Command=List&' + $('#frmForm').serialize();
                    ColumnStr = columnContract;
                }
                $('#SearchDlg').parent().appendTo($("form:first"));
                $("#" + T).datagrid({
                    url: UrlStr,
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: ColumnStr,
                    fitColumns: false,
                    singleSelect: true,
                    remoteSort: false,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    singleSelect: false, //允许选择多行  
                    selectOnCheck: true,//true勾选会选择行，false勾选不选择行, 1.3以后有此选项。重点在这里  
                    checkOnSelect: true, //true选择行勾选，false选择行不勾选, 1.3以后有此选项   
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList('TableContainer');

            function Detail(ID, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                var ReftableStr = $("#reftable").val();
                if (ReftableStr == "TableContainer_4") {
                    HDialog.Open('500', '200', '../ChargesNew/AuditCorpCostItemFeesManage.aspx?AuditType=' + $("#AuditType").val() + '&AuditID=' + ID + '&OpType=' + OpType, '流程详情', false, function callback(_Data) {
                        if (_Data != '') {
                            LoadList(ReftableStr);
                        }
                    });
                } else if (ReftableStr == "TableContainer_10") {
                    //合同变更流程
                    HDialog.Open('500', '200', '../ChargesNew/AuditCorpCostItemContractManageByChange.aspx?AuditID=' + ID + '&OpType=' + OpType, '流程详情', false, function callback(_Data) {
                        if (_Data != '') {
                            LoadList(ReftableStr);
                        }
                    });
                } else if (ReftableStr == "TableContainer_29") {
                    //租赁合同签订流程
                    HDialog.Open('600', '300', '../LeaseManage/LeaseContractAuditManage.aspx?AuditID=' + ID + '&OpType=' + OpType, '流程详情', false, function callback(_Data) {
                        if (_Data != '') {
                            LoadList(ReftableStr);
                        }
                    });
                } else if (ReftableStr == "TableContainer_30") {
                    //租赁合同变更流程
                    HDialog.Open('600', '300', '../LeaseManage/LeaseContractChangeAuditManage.aspx?AuditID=' + ID + '&OpType=' + OpType, '流程详情', false, function callback(_Data) {
                        if (_Data != '') {
                            LoadList(ReftableStr);
                        }
                    });
                } else {
                    //合同签订 合同执行流程
                    HDialog.Open('500', '200', '../ChargesNew/AuditCorpCostItemContractManage.aspx?AuditType=' + $("#AuditType").val() + '&AuditID=' + ID + '&OpType=' + OpType, '流程详情', false, function callback(_Data) {
                        if (_Data != '') {
                            LoadList(ReftableStr);
                        }
                    });
                }
            }


            $('#Tab').tabs({
                onSelect: function (title, index) {
                    var current_tab = $('#Tab').tabs('getSelected');
                    var refaudittype = $(current_tab).attr("refaudittype");
                    var reftable = $(current_tab).attr("reftable");
                    $("#reftable").val(reftable);
                    $("#AuditType").val(refaudittype);
                    if (reftable == "TableContainer_4") {
                        $('#roleTr').css("display", "");
                        $('#changeTr').css("display", "none");
                        $('#contractTr').css("display", "none");
                        $('#ChangeType').val("");
                        $('#ContractType').val("");
                    } else if (reftable == "TableContainer_10") {
                        //合同变更流程
                        $('#roleTr').css("display", "none");
                        $('#changeTr').css("display", "");
                        $('#contractTr').css("display", "none");
                        $('#RoleName').val("");
                        $('#ContractType').val("");
                    } else if (reftable == "TableContainer_29") {
                        //租赁合同签订
                        $('#roleTr').css("display", "none");
                        $('#changeTr').css("display", "none");
                        $('#contractTr').css("display", "");
                        $('#RoleName').val("");
                        $('#ChangeType').val("");
                        $('#ContractType').val("");
                    } else if (reftable == "TableContainer_30") {
                        //租赁合同变更流程
                        $('#roleTr').css("display", "none");
                        $('#changeTr').css("display", "");
                        $('#contractTr').css("display", "none");
                        $('#RoleName').val("");
                        $('#ChangeType').val("");
                        $('#ContractType').val("");
                    } else {
                        //合同签订 合同执行流程
                        $('#roleTr').css("display", "none");
                        $('#changeTr').css("display", "none");
                        $('#contractTr').css("display", "");
                        $('#RoleName').val("");
                        $('#ChangeType').val("");
                    }
                    setTimeout(function () {
                        LoadList(reftable);
                    }, 100);
                }
            });
            LoadList("TableContainer_4");
        </script>

    </form>
</body>
</html>
