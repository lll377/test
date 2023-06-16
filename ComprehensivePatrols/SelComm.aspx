<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelComm.aspx.cs" Inherits="M_Main.ComprehensivePatrols.SelComm" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
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
            <table id="RoomFrameTree" name="RoomFrameTree">
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
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                        </tr>
                    </table>
                </div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>
        </div>
    </div>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">

        var w = $("#ContainerLeft").width();
        var AllWidth = $(window).width();
        var rightW = AllWidth - w;
        $("#ContainerRight").css("width", rightW - 5);

        $(document).ready(function () {
            InitFunction();
            InitLeftTree();
            LoadList();
        });

        var toolbar = [
            {
                text: '确定',
                iconCls: 'icon-ok',
                handler: function () {
                    HDialog.ReturnIsJson = true;
                    if ($("#isCheck").val() != '') {
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
            }, '-',
            {
                text: '<input type="text" id="commName" name="commName"  />',
            },
            {
                iconCls: 'icon-search',
                handler: function () {
                    $("#searchCommname").val($("#commName").val());
                    LoadList();
                }
            }
        ];

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
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CpComPatrols&Command=GetComm&' + $('#FrmForm').serialize(),
                    //method: "get", //设置为true，当数据长度超出列宽时将会自动截取。
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
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param.Method = "DataPost";
                        param.Class = "CpComPatrols";
                        param.Command = "GetComm";
                        //控制用户权限
                        param.hiSearchOrganCode = $("#hiSearchOrganCode").val();
                        param.searchCommname = $("#searchCommname").val();
                    },
                    onLoadSuccess: function (data) {
                        $(this).datagrid('selectAll');
                        $("#searchCommname").val("");
                        $("#commName").val("");
                    },
                    onSelect: function (rowIndex, rowData) {
                    }
                });
            }
            else {
                $("#TableContainer").datagrid({
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CpComPatrols&Command=GetComm&' + $('#FrmForm').serialize(),
                    //method: "get", //设置为true，当数据长度超出列宽时将会自动截取。
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
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param.Method = "DataPost";
                        param.Class = "CpComPatrols";
                        param.Command = "GetComm";
                        //控制用户权限
                        param.hiSearchOrganCode = $("#hiSearchOrganCode").val();
                        param.searchCommname = $("#searchCommname").val();
                    },
                    onLoadSuccess: function (data) {

                    },
                    onSelect: function (rowIndex, rowData) {
                        //alert(rowData.CommName + rowData.CommID);
                    }
                    //onDblClickRow: function (rowIndex, rowData) {
                    //    HDialog.ReturnIsJson = true;
                    //    HDialog.Close(rowData);
                    //}
                });
            }
            $('#SearchDlg').dialog('close');
        }

        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width() * 0.25 - 1;
            $("#RoomFrameTree").css("width", w + "px");
            //$("#RoomFrameTree").css("height", h + "px");
            $("#TableContainer").css("height", h - 5 + "px");
            var h1 = h - 24;
            $("#LeftTop1").css("height", h1 + "px");
        }

        function InitLeftTree() {
            $.tool.DataPost('CpComPatrols', 'GetOrganTreeByOrgan', "OrganCode=" + $('#hiOrganCode').val(),
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

            //默认全选
            //var roots = $('#treeDemo').tree('getRoots');//返回tree的所有根节点数组  
            //for (var i = 0; i < roots.length; i++) {
            //    var node = $('#treeDemo').tree('find', roots[i].id);//查找节点  
            //    $('#treeDemo').tree('check', node.target);//将得到的节点选中  
            //} 
        }

    </script>
</body>
</html>
