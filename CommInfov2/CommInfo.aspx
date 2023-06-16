<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommInfo.aspx.cs" Inherits="M_Main.CommInfov2.CommInfo" %>

<!DOCTYPE html>
<html>
<head>
    <title>社区资讯</title>
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
            height: 170px;
        }

        .SearchTable {
            width: 100%;
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
    <form id="frmForm" runat="server" style="overflow: auto">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">资讯类型
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <label>
                            <input type="radio" name="InfoType" class="InfoType" value="" checked="true" />所有类型</label>
                        <label>
                            <input type="radio" name="InfoType" class="InfoType" value="qqts" style="margin-left: 20px;" />亲情提示</label>
                        <label>
                            <input type="radio" name="InfoType" class="InfoType" value="dtzx" style="margin-left: 20px;" />社区资讯</label>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">标题
                    </td>
                    <td class="TdContent">
                        <input type="text" id="Heading" name="Heading" />
                    </td>
                    <td class="TdTitle">资讯来源
                    </td>
                    <td class="TdContent">
                        <input type="text" id="InfoSource" name="InfoSource" />
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">开始时间
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="IssueDateBg" name="IssueDateBg" class="easyui-datebox" />
                    </td>
                    <td class="TdTitle">-
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="IssueDateEnd" name="IssueDateEnd" class="easyui-datebox" />
                    </td>
                    
                </tr>
                <tr>
                    <td class="TdTitle">有效时间
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="ShowEndDateBg" name="ShowEndDateBg" class="easyui-datebox" />
                    </td>
                    <td class="TdTitle">-
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="ShowEndDateEnd" name="ShowEndDateEnd" class="easyui-datebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">状态
                    </td>
                    <td class="TdContent">
                        <select id="IsAudit" name="IsAudit" runat="server">
                            <option value="-1" selected="selected">所有</option>
                            <option value="1">已屏蔽</option>
                            <option value="0">正常</option>
                        </select>
                    </td>
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
            var column = [[
                            {
                                field: 'InfoType', title: '资讯类型', align: 'left', sortable: true, formatter: function (value, row, index) {
                                    if (row.InfoType == "qqts") {
                                        return "亲情提示";
                                    } else if (row.InfoType == "dtzx") {
                                        return "社区资讯";
                                    }
                                }
                            },
                            { field: 'InfoSource', title: '来源', align: 'left', sortable: true },
                            {
                                field: 'Heading', title: '标题', align: 'left', sortable: true, formatter: function (value, row, index) {
                                    return "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.InfoID + "','edit');\">" + row.Heading + "</a>"
                                }
                            },
                            { field: 'IssueDate', title: '开始时间', align: 'left', sortable: true },
                            { field: 'ShowEndDate', title: '有效时间', align: 'left', sortable: true },
                            { field: 'IsEmphasisInform', title: '是否重要公告', align: 'left', sortable: true },
                            {
                                field: 'IsAudit', title: '状态', align: 'left', sortable: true, formatter: function (value, row, index) {
                                    var text = (row.IsAudit == "0" ? "正常" : "已屏蔽");
                                    return "<a class=\"HrefStyle\" href=\"#\" onclick=\"shield('" + row.InfoID + "','" + row.IsAudit + "');\">" + text + "</a>";
                                }
                            },
                             { field: 'CreateUserName', title: '上次操作人', align: 'left', sortable: true },
                            { field: 'CreateTime', title: '上次操作时间', align: 'left', sortable: true },
                            { field: 'InformCommNameList', title: '公告范围项目', align: 'left', sortable: true },
                            { field: 'InformBuildNameList', title: '公告范围楼栋', align: 'left', sortable: true }
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
                        if ($("#CommID").val() != row.CommID || $("#OrganCode").val() != row.OrganCode) {
                            if ($("#OrganCode").val() == '01') {
                                HDialog.Info('无法操作公司或项目发布的资讯');
                            } else if ($("#CommID").val() == '0') {
                                HDialog.Info('无法操作总部或项目发布的资讯');
                            } else {
                                HDialog.Info('无法操作总部或公司发布的资讯');
                            }
                            return;
                        }
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

            function DelRecord(row) {
                $.messager.confirm('确定', '是否删除该条资讯', function (r) {
                    if (r) {
                        $.tool.DataGet('CommInfo', 'Del', 'InfoID=' + row.InfoID,
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
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CommInfo&Command=List&' + $('#frmForm').serialize(),
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
                HDialog.Open('900', '580', '../CommInfov2/CommInfoManager.aspx?InfoID=' + InfoID + '&OpType=' + OpType, '社区资讯详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            function shield(InfoID, IsAudit) {
                var text = (IsAudit == 0 ? "是否屏蔽该条资讯信息?" : "是否取消屏蔽?");

                $.messager.confirm('确定', text, function (r) {
                    if (r) {
                        $.tool.DataGet('CommInfo', 'IsAudit', 'InfoID=' + InfoID,
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
        </script>
    </form>
</body>
</html>
