<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChargesHistoricalPaymentSettings.aspx.cs" Inherits="M_Main.ChargesNew.ChargesHistoricalPaymentSettings" %>

<!DOCTYPE html>
<html>
<head>
    <title>通用审核流程模块设置</title>
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
            width: 300px;
            height: 80px;
        }

        .SearchTable {
            width: 300px;
            height: auto;
        }

        .tabs-panels {
            border: none;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="AuditType" name="AuditType" runat="server" />
        <input type="hidden" id="reftable" name="reftable" runat="server" />
        <input type="hidden" id="Config" name="Config" runat="server" />
       <%-- <div class="easyui-tabs" style="width: 100%; overflow: hidden; border: none;" id="Tab">
            <%=Tab_Script%>
        </div>--%>

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">岗位
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" runat="server" />
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
                $("#TableContainer").css("height", h+ "px");
            }
            InitFunction();
            var column;
            column = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
                {
                    field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.IID + "','edit');\">" + row.CommName + "</a>";
                        return str;
                    }
                },
                {
                    field: 'IsShow', title: '是否显示', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "否";
                        if (value == "1") {
                            str = "是";
                        } else if (value == "0") {
                            str = "否";
                        }
                        return str;
                    }
                },
                { field: 'BeginDate', title: '开始时间', width: 200, align: 'left', sortable: true },
                { field: 'Remark', title: '备注', width: 300, align: 'left', sortable: true },
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
                        var row = $("#TableContainer").datagrid("getChecked");
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
                if (row == null || row == undefined) {
                    HDialog.Info("请选择数据!");
                    return false;
                }
                var IIDs = "";
                for (var i = 0; i < row.length; i++) {
                    IIDs += row[i].IID+",";
                }
                if (IIDs.length > 0) {
                    IIDs = IIDs.substring(0, IIDs.length-1)
                }
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('ChargesFeeBundleSettings', 'ChargesFeeBundleSettingsDelete', 'IIDs=' + IIDs,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data != "") {
                                    HDialog.Info(_Data);
                                } else {
                                    LoadList();
                                }
                                $('#SearchDlg').parent().appendTo($("form:first"));
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
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=ChargesFeeBundleSettings&Command=ChargesFeeBundleSettingsList&'
                    + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: false,
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

            function Detail(IID, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('500', '300', '../ChargesNew/ChargesHistoricalPaymentSettingsDetail.aspx?AuditType=' + $("#AuditType").val() + '&IID=' + IID + '&OpType=' + OpType, '新增', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>
