<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditCorpCostItemWaivBrowse.aspx.cs" Inherits="M_Main.ChargesNew.AuditCorpCostItemWaivBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title>费用减免流程设置</title>
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
            width: 520px;
            height: 260px;
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
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">岗位名称
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" runat="server" />
                    </td>
                    <td class="TdTitle">业务类型
                    </td>
                    <td class="TdContent">
                        <select id="WaiverCategory" name="WaiverCategory" runat="server" style="width: 63%; height: 22px;"> 
                            <option value="取消减免审核流程">取消减免审核流程</option>
                        </select>

                        <span style="color: red">*</span>
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
                $("#TableContainer").css("height", (h - 32) + "px");
            }

            InitFunction();
            var column;
            column = [[
                { field: 'WaiverCategory', title: '减免类型', width: 120, align: 'left', sortable: true },
                { field: 'CorpCostName', title: '费用大项', width: 200, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 200, align: 'left', sortable: true },
                { field: 'OrderId', title: '审核序号', width: 80, align: 'left', sortable: true },
                {
                    field: 'RoleName', title: '岗位', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.AuditID + "','edit');\">" + row.RoleName + "</a>";
                        return str;
                    }
                }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        Batch();
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row);
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

            function SelType(v) {
                $("#AuditType").val(v);
                LoadList();
            }
            function DelRecord(row) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('AuditCorpCostItemWaiv', 'Del', 'AuditID=' + row.AuditID,
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                var reftable = $("#reftable").val();
                                LoadList(reftable);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {

                $('#SearchDlg').parent().appendTo($("form:first"));
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AuditCorpCostItemWaiv&Command=List&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
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

            function Batch() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '650', '../ChargesNew/AuditCorpCostItemWaivBatch.aspx?AuditType=' + $("#AuditType").val(), '费用减免流程设置', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            function Detail(ID, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('700', '220', '../ChargesNew/AuditCorpCostItemWaivManage.aspx?AuditID=' + ID + '&OpType=' + OpType, '费用减免流程设置详情', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            $('#ddlWaiversCategory').combobox({
                onChange: function (n, o) {
                    var myOptValue = $("#ddlWaiversCategory").combobox("getText");
                    $('#WaiverCategory').val(myOptValue);
                }
            });



            $('#Tab').tabs({
                onSelect: function (title, index) {
                    var current_tab = $('#Tab').tabs('getSelected');
                    var refaudittype = $(current_tab).attr("refaudittype");
                    var reftable = $(current_tab).attr("reftable");
                    $("#reftable").val(reftable);
                    $("#AuditType").val(refaudittype);


                    if (reftable == "TableContainer_1") {
                        // $("#WaiverCategory").val("应收调帐");
                        document.getElementById("WaiverCategory").selectedIndex = 1;
                    }
                    else {
                        $("#WaiverCategory").val("取消减免审核流程");
                    }


                    setTimeout(function () {
                        LoadList(reftable);
                    }, 100);
                }
            });
        </script>

    </form>
</body>
</html>
