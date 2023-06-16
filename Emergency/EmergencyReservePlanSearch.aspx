<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyReservePlanSearch.aspx.cs" Inherits="M_Main.Emergency.EmergencyReservePlanSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急预案查询</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        .SearchTable {
            padding: 5px;
            width: 560px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 8%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <div class="easyui-layout" id="Layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300">
            <ul id="treeDemo" class="easyui-tree">
            </ul>
        </div>
        <div data-options="region:'center',border:true">
            <div style="width: 100%; height: 100%; background-color: #cccccc;" id="TableContainer">
            </div>
        </div>
    </div>
    <div id="dlg_search_Reserve" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
        <form id="frmReservePlan">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">应急类型</td>
                    <td class="TdContentSearch">
                        <input id="EmergencyTypeName" name="EmergencyTypeName" maxlength="100" type="text" class="easyui-textbox" />
                    </td>
                    <td class="TdTitle">应急等级</td>
                    <td class="TdContentSearch">
                        <input id="EmergencyLevelNames" name="EmergencyLevelNames" type="text" maxlength="100" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmReservePlan').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
        <input type="hidden" name="LoginRoleCode" id="LoginRoleCode" runat="server" />
        <input type="hidden" name="CommID" id="CommID" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">


        //初始化页面高度
        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $('#Layout').height(h);
            $("#Layout").layout('resize', {
                height: h,
                width: w
            });
        }

        //加载树
        function LoadTree() {
            $("#treeDemo").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    if (data.length > 0) {
                        var dataJson = $("#treeDemo").tree("getChildren");
                        $.each(dataJson, function (i, itemNode) {
                            if ($("#treeDemo").tree("isLeaf", itemNode.target)) {
                                //默认选中第一个节点
                                $("#treeDemo").tree('select', itemNode.target);
                                return false;
                            }
                        });
                    } else {
                        LoadList();
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "CpComPatrols";
                    param.Method = "DepMenuList";
                    //控制用户权限
                    param.SelRoleCode = $("#LoginRoleCode").val();
                },
                onBeforeSelect: function (node) {
                    if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                        return false;
                    }
                },
                onSelect: function (row) {
                    $("#CommID").val(row.attributes.CommID);
                    $('#frmReservePlan').form('clear');
                    LoadList();
                }
            });
        }

        var column = [[
            { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
            {
                field: 'EmergencyTypeName', title: '应急类型', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"Detail('edit','" + row.ID + "','" + row.CommID + "')\" href=\"javascript:void(0);\">" + row.EmergencyTypeName + "</a>";
                    return str;
                }
            },
            { field: 'EmergencyLevelNames', title: '等级', width: 80, align: 'left', sortable: true },
            {
                field: 'FileList', title: '应急预案文档', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"ViewFile('" + row.ID + "')\" href=\"javascript:void(0);\">查看应急预案文档</a>";
                    return str;
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: 80, align: 'left', sortable: true },
            { field: 'Remark', title: '备注', width: 160, align: 'left', sortable: true }
        ]];

        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_Reserve').dialog('open');
                }
            }
            , '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($("#CommID").val() == "0" || $("#CommID").val() == "") {
                        HDialog.Info('请选择项目!');
                        return;
                    }
                    var Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        HDialog.Info('没有需要导出的应急预案数据!');
                        return;
                    }
                    window.open("EmergencyReservePlanSearchExport.aspx?CommID=" + $('#CommID').val() + "&" + $('#frmReservePlan').serialize());
                }
            }
        ];

        //查看 应急预案文档
        function ViewFile(ID) {
            var w = 600;
            var h = 400;
            HDialog.OpenWin(w, h, '../Emergency/EmergencyUploadView.aspx?KeyID=' + ID + "&Type_Name=应急预案", "应急预案文档详情", false, function callback(_Data) {
            });
        }

        //编辑 应急预案
        function Detail(OpType, ID, CommID) {
            var w = $(window).width() * 5 / 9;
            var h = $(window).height() + 20;

            HDialog.OpenWin(w, h, '../Emergency/EmergencyReservePlanDetail.aspx?Flag=1&OpType=' + OpType + '&ID=' + ID + "&CommID=" + CommID, "应急预案详情", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }

        //加载页面列表
        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: 50,
                pageList: [50, 100, 300],
                columns: column,
                fitColumns: true,
                pagination: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                rownumbers: true,
                border: false,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Emergency", "GetEmergencyReservePlanList", "TableContainer", param);
                }
            });
            $("#dlg_search_Reserve").dialog("close");
        }

        //页面初始化
        $(function () {
            InitTableHeight();
            LoadTree();
        });
    </script>
</body>
</html>

