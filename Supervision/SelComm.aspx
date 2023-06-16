<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelComm.aspx.cs" Inherits="M_Main.Supervision.SelComm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择项目</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/uuid.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow: auto;
            border-right: 1px solid #cccccc;
            width: 30%;
        }

        .ContainerRight {
            float: left;
            overflow: auto;
        }
    </style>
</head>
<body>
    <form id="FrmForm">
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
        <input type="hidden" id="hiOrganCode" name="hiOrganCode" runat="server" />
        <input type="hidden" id="hiSearchOrganCode" name="hiSearchOrganCode" />
        <input type="hidden" id="hiCommIDS" name="hiCommIDS" />
        <input type="hidden" id="hiOrganCodeS" name="hiOrganCodeS" />
        <input type="hidden" id="Sort" name="Sort" />
        <input id="isCheck" name="isCheck" type="hidden" runat="server" />
        <input id="isCommID" name="isCommID" type="hidden" value="0" runat="server" /><%--是否项目权限过滤--%>
        <input id="searchCommname" name="searchCommname" type="hidden" />
    </form>
    <div class="Container">
        <div id="ContainerLeft" class="ContainerLeft">
            <table id="RoomFrameTree">
                <tr>
                    <td>
                        <div id="LeftTop1">
                            <div>
                                <ul id="treeDemo" style="width: 100%;" class="easyui-tree">
                                </ul>
                            </div>
                        </div>
                    </td>
                </tr>

            </table>
        </div>
        <div id="ContainerRight" class="ContainerRight">
            <div>
                <div class="datagrid-toolbar" id="divtt">
                    <table>
                        <tr>
                        </tr>
                    </table>
                </div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>
        </div>
    </div>
    <div id="tt" class="datagrid-toolbar" style="padding: 5px; width: 100%">
        <table>
            <tbody>
                <tr>
                    <td>
                        <a href="javascript:;" class="l-btn l-btn-small l-btn-plain" onclick="Save();">
                            <span class="l-btn-left l-btn-icon-left">
                                <span class="l-btn-text">确定</span>
                                <span class="l-btn-icon icon-save">&nbsp;</span>
                            </span>
                        </a>
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <span class="l-btn-left l-btn-icon-left">
                            <span class="l-btn-text" style="margin: 0 6px 0 6px;">项目名称：</span>
                            <span>
                                <input type="text" id="commName" name="commName" class="easyui-textbox" data-options="
                                icons: [{
                                    iconCls: 'icon-clear',
                                    handler: function (e) {
                                        $(e.data.target).textbox('clear');
                                    }
                                }]" />
                            </span>
                        </span>
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:;" class="l-btn l-btn-small l-btn-plain" onclick="Search();">
                            <span class="l-btn-left l-btn-icon-left">
                                <span class="l-btn-text">筛选</span>
                                <span class="l-btn-icon icon-search">&nbsp;</span>
                            </span>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        var w = $("#ContainerLeft").width();
        var AllWidth = $(window).width();
        var rightW = AllWidth - w;
        $("#ContainerRight").css("width", rightW - 5);

        function Save() {
            HDialog.ReturnIsJson = true;
            if ($("#isCheck").val() == '1') {
                var rows = $("#TableContainer").datagrid('getSelections');
                var result = new Object();
                result["id"] = "";
                result["name"] = "";
                if (rows != '') {
                    $.each(rows, function (index, item) {
                        result["id"] = result["id"] + item.CommID + ",";
                        result["name"] = result["name"] + item.CommName + ",";
                    });
                    result["id"] = result["id"].substring(0, result["id"].length - 1);
                    result["name"] = result["name"].substring(0, result["name"].length - 1);
                }
                HDialog.Close(result);
            }
            else {
                var row = $("#TableContainer").datagrid('getSelected');
                if (row != '') {
                    if (parseInt(row.CommID) > 0) {
                        var result = new Object();
                        result["id"] = row.CommID;
                        result["name"] = row.CommName;
                        HDialog.Close(result);
                    }
                }
            }
        }

        function Search() {
            $("#searchCommname").val($("#commName").val());
            LoadList();
        }

        function NodeItemClick(node) {
            var organCodes = "";
            if (node != null) {
                for (var i = 0; i < node.length; i++) {
                    organCodes += node[i].attributes.OrganCode + ",";
                }
                organCodes = organCodes.substring(0, organCodes.length - 1)
            }
            $("#hiSearchOrganCode").val(organCodes);
            LoadList();
        }

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'OrganName', title: '区域名称', width: 200, align: 'left', sortable: true },
            { field: 'CommID', title: '项目ID', width: 100, align: 'left', sortable: true },
            { field: 'CommName', title: '项目名称', width: 500, align: 'left', sortable: true }
        ]];

        var column2 = [[
            { field: 'OrganName', title: '区域名称', width: 200, align: 'left', sortable: true },
            { field: 'CommID', title: '项目ID', width: 100, align: 'left', sortable: true },
            { field: 'CommName', title: '项目名称', width: 500, align: 'left', sortable: true }
        ]];

        function LoadList() {
            if ($('#isCheck').val() == '1') {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    autoRowHeight: false,
                    columns: column,
                    fitColumns: false, //设置为true将自动使列适应表格宽度以防止出现水平滚动。
                    singleSelect: false,//设置为true将只允许选择一行。
                    remoteSort: false,//定义是否通过远程服务器对数据排序。
                    pagination: false,//设置true将在数据表格底部显示分页工具栏。
                    border: false,
                    checkbox: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: "#tt",
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param.Method = "DataPost";
                        param.Class = "CSSupervision";
                        param.Command = "GetComm";
                        //控制用户权限
                        param.hiSearchOrganCode = $("#hiSearchOrganCode").val();
                        param.searchCommname = $("#searchCommname").val();
                    },
                    onLoadSuccess: function (data) {
                        $("#searchCommname").val('');
                        $(this).datagrid('selectAll');
                    }
                });
            }
            else {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    autoRowHeight: false,
                    columns: column2,
                    fitColumns: false, //设置为true将自动使列适应表格宽度以防止出现水平滚动。
                    singleSelect: true,//设置为true将只允许选择一行。
                    remoteSort: false,//定义是否通过远程服务器对数据排序。
                    pagination: false,//设置true将在数据表格底部显示分页工具栏。
                    border: false,
                    checkbox: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: "#tt",
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param.Method = "DataPost";
                        param.Class = "CSSupervision";
                        param.Command = "GetComm";
                        //控制用户权限
                        param.hiSearchOrganCode = $("#hiSearchOrganCode").val();
                        param.searchCommname = $("#searchCommname").val();
                    },
                    onLoadSuccess: function (data) {
                        $("#searchCommname").val('');
                    }
                });
            }
        }

        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width() * 0.25 - 1;
            $("#RoomFrameTree").css("width", w + "px");
            $("#TableContainer").css("height", h - 5 + "px");
            var h1 = h - 24;
            $("#LeftTop1").css("height", h1 + "px");
        }

        function InitLeftTree() {
            $.tool.DataPost('CSSupervision', 'GetOrganTreeByOrgan', "OrganCode=" + $('#hiOrganCode').val(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != '') {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        GetTree(varObjects);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        function GetTree(obj) {
            $('#treeDemo').html("");
            $('#treeDemo').tree({
                data: obj,
                checkbox: true,
                onSelect: function (node) {
                    var vnodes = $(this).tree('getChecked');
                    var vnode = $(this).tree('getSelected').attributes.OrganCode;
                    var isCheck = false;
                    for (var i = 0; i < vnodes.length; i++) {
                        if (vnode == vnodes[i].attributes.OrganCode) {
                            isCheck = true;
                            break;
                        }
                    }
                    if (isCheck) {
                        $(this).tree('uncheck', node.target);
                    } else {
                        $(this).tree('check', node.target);
                    }
                },
                onCheck: function (node, checked) {
                    var nodes = $(this).tree('getChecked');
                    NodeItemClick(nodes);
                }
            });
        }

        $(function () {
            InitFunction();
            InitLeftTree();
            LoadList();
        });
    </script>
</body>
</html>
