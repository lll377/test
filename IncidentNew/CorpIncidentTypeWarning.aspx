<%@ Page Language="C#" CodeBehind="CorpIncidentTypeWarning.aspx.cs" AutoEventWireup="true" Inherits="M_Main.IncidentNew.CorpIncidentTypeWarning" %>

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
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer"></div>
        <input id="AllData" name="AllData" runat="server" type="hidden" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 120px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName" searcher="SelTypeName" runat="server" />
                    </td>
                    <td class="TdTitle">预警类别
                    </td>
                    <td class="TdContentSearch">
                        <select class="easyui-combobox" id="AssignmentState" name="AssignmentState" data-options="editable:false,panelHeight:'auto'" style="width: 100px;">
                            <option value="" selected="selected">请选择</option>
                            <option value="0">未分派</option>
                            <option value="5">未接单</option>
                            <option value="1">处理中</option>
                            <%-- <option value="2">已处理未回访</option>--%>
                            <option value="3">已完成</option>
                            <option value="4">已关闭</option>
                        </select>
                    </td>
                    <td class="TdTitle">预警岗位</td>
                    <td class="TdContentSearch">
                        <input id="RuleID" name="RuleID" type="hidden" />
                        <input type="text" class="easyui-searchbox" id="RuleName" name="RuleName" searcher="SelRoleName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function DelRecord() {
                //var row = $("#TableContainer").datagrid("getSelected");
                //if (row != null) {
                //    $.messager.confirm('确定', '是否删除该记录', function (r) {
                //        if (r) {
                //            $.tool.DataGet('IncidentWarning', 'Delete', 'WarningID=' + row.WarningID,
                //                function Init() {
                //                },
                //                function callback(_Data) {

                //                    if (_Data == "true") {
                //                        HDialog.Info('删除成功');
                //                    }
                //                    else { HDialog.Info('删除失败'); }
                //                    $('#SearchDlg').parent().appendTo($("form:first"));
                //                    LoadList();


                //                },
                //                function completeCallback() {
                //                },
                //                function errorCallback() {
                //                });
                //        }
                //    });
                //}

                var rows = $('#TableContainer').datagrid('getChecked');
                if (rows == "") {
                    HDialog.Info('请选择要删除的项!');
                }
                else {
                    HDialog.Prompt('确认删除选中项', function () {
                        $('#AllData').val(JSON.stringify(rows));
                        $.tool.DataPost('IncidentWarning', 'Delete', $('#frmForm').serialize(),
                            function Init() {
                            },
                            function callback(_Data) {

                                if (_Data == "true") {
                                    HDialog.Info('删除成功');
                                }
                                else { HDialog.Info('删除失败'); }
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                LoadList();



                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    });
                }

            }
            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail("新增报事预警设置", 'Insert');
                    }
                }, '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        ViewDetail("修改报事预警设置", 'Edit');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        DelRecord();
                    }
                }, '-',

                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                {
                    field: '', checkbox: true
                },
                { field: 'TypeName', title: '报事类别', width: 80, align: 'left', sortable: true },
                { field: 'AssignmentName', title: '预警类别', width: 40, align: 'left', sortable: true },
                { field: 'WarningHourValue', title: '超期时间', width: 40, align: 'left', sortable: true },
                { field: 'RoleName', title: '预警岗位', width: 200, align: 'left', sortable: true }
            ]];

            function SelTypeName() {
                //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                //    var arrRet = JSON.parse(_Data);
                //    $("#TypeName").searchbox("setValue", arrRet.id);
                //    $("#TypeName").searchbox("setText", arrRet.text);
                //});
                HDialog.Open('650', '500', '../DialogNew/CorpBigIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    //$("#TypeID").val(arrRet.id);
                    $("#TypeName").searchbox("setValue", arrRet.id);
                    $("#TypeName").searchbox("setText", arrRet.text);
                });
            }

            function SelRoleName() {
                HDialog.Open('650', '500', '../DialogNew/SysCheckRoleDlg.aspx', '选择预警岗位', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#RuleID").val(arrRet.id);
                    $("#RuleName").searchbox("setText", arrRet.text);
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: 'post',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncidentWarning", "Search", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });

            }
            LoadList();



            function ViewDetail(title, OpType) {

                var w = $(window).width();
                switch (OpType) {
                    case "Insert":
                        HDialog.Open(600, 300, '../IncidentNew/CorpIncidentTypeWarningManage.aspx?OPType=' + OpType, title, false, function callback(_Data) {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            if (_Data == 1) {
                                LoadList();
                            }
                        });
                        break;
                    case "Edit":
                        debugger;
                        var row = $('#TableContainer').datagrid('getChecked');
                        if (row == "") {
                            HDialog.Info('请勾选一条要修改的项!');
                            return;
                        }
                        else if (row.length > 1) {
                            HDialog.Info('只能勾选一条要修改的项!');
                            return;
                        } else {
                            if (row != null) {
                                HDialog.Open(600, 300, '../IncidentNew/CorpIncidentTypeWarningManage.aspx?OPType=' + OpType + '&WarningID=' + row[0].WarningID, title, false, function callback(_Data) {
                                    $('#SearchDlg').parent().appendTo($("form:first"));
                                    if (_Data == 1) {
                                        LoadList();
                                    }
                                });
                            }
                        }
                        break;
                    default:
                        break;
                }

            }
        </script>
    </form>
</body>
</html>
