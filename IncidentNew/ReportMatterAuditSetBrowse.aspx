<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMatterAuditSetBrowse.aspx.cs" Inherits="M_Main.IncidentNew.ReportMatterAuditSetBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title>报事审核流程模块设置</title>
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
            width: 500px;
            height: 240px;
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
        <input type="hidden" id="TypeCode"  name="TypeCode" runat="server">
        <div class="easyui-tabs" style="width: 100%; overflow: hidden; border: none;" id="Tab">
            <%=Tab_Script%>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;height:140px;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">岗位
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" />
                    </td>
                    <td class="TdTitle">原因大类</td>
                    <td class="TdContent">
                        <%--<input type="text" class="easyui-validatebox" data-options="required:true"
                    id="TypeName" name="TypeName" runat="server" onclick="SelIncidentType();" readonly  />--%>
                        <input type="text" class="easyui-validatebox" id="TypeName" name="TypeName"   />
                    </td>
                </tr>
                <tr style="height:20px"></tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList('SaiXuan');">确定筛选</a>
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
            var column;
            column = [[
                { field: 'ck', checkbox: true, width: '30' },
                            { field: 'OrderId', title: '审核序号', width: 200, align: 'left', sortable: true },
                            {
                                field: 'RoleName', title: '岗位', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.AuditID + "','edit');\">" + row.RoleName + "</a>";
                                    return str;
                                }
                            },
                            { field: 'TypeName', title: '原因大类', width: 200, align: 'left', sortable: true }

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
                    DelRecord(AuditIDs)

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
            function DelRecord(AuditIDs) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('ReportMatterAuditSet', 'Del', 'AuditID=' + AuditIDs,
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

            function LoadList(T) {
                if (T == 'SaiXuan') {
                    T = $("#reftable").val();
                }
                $('#SearchDlg').parent().appendTo($("form:first"));
                $("#" + T).datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=ReportMatterAuditSet&Command=List&' + $('#frmForm').serialize(),
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
                HDialog.Open('700', '200', '../IncidentNew/ReportMatterAuditSetManage.aspx?AuditType=' + $("#AuditType").val() + '&AuditID=' + ID + '&OpType=' + OpType, '流程详情', false, function callback(_Data) {
                    if (_Data != '') {
                        var reftable = $("#reftable").val();
                        LoadList(reftable);
                    }
                });
            }

            $('#Tab').tabs({
                onSelect: function (title, index) {
                    var current_tab = $('#Tab').tabs('getSelected');
                    var refaudittype = $(current_tab).attr("refaudittype");
                    var reftable = $(current_tab).attr("reftable");
                    $("#reftable").val(reftable);
                    $("#AuditType").val(refaudittype);
                    LoadList(reftable);
                }
            });

        </script>

    </form>
</body>
</html>
