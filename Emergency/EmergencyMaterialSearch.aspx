<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyMaterialSearch.aspx.cs" Inherits="M_Main.Emergency.EmergencyMaterialSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急物资查询</title>
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
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
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
        <form id="frmMaterial">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">物资类别</td>
                    <td class="TdContentSearch">
                        <input id="MaterialCategoryName" name="MaterialCategoryName" type="text" onclick="SelMaterialCategory()" readonly class="easyui-validatebox" />
                        <input type="hidden" id="MaterialCategoryID" name="MaterialCategoryID" runat="server" />
                    </td>
                    <td class="TdTitle">物资名称</td>
                    <td class="TdContentSearch">
                        <input id="MaterialName" name="MaterialName" type="text" readonly onclick="SelMaterialName()" class="easyui-validatebox" />
                        <input type="hidden" id="MaterialNameID" name="MaterialNameID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">存放地点</td>
                    <td class="TdContentSearch">
                        <input id="DepositPlace" name="DepositPlace" maxlength="1000" type="text" class="easyui-textbox" />
                    </td>
                    <td class="TdTitle">是否过期</td>
                    <td class="TdContentSearch">
                        <select id="IsOverdueName" name="IsOverdueName" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                            <option value="全部" selected>全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否完好</td>
                    <td class="TdContentSearch">
                        <select id="IsIntactName" name="IsIntactName" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                            <option value="全部" selected>全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否停用</td>
                    <td class="TdContentSearch">
                        <select id="IsStopName" name="IsStopName" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                            <option value="全部" selected>全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="clearWhere()">清空</a>
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

        //选择 物资类别
        function SelMaterialCategory() {
            HDialog.OpenWin('600', '400', '../Emergency/Dialog/EmergencyDictionary.aspx?' + $.param({ DType: '应急物资类别' }), '选择物资类别', false, function callback(data) {
                if (data != "") {
                    data = $.parseJSON(data);
                    $("#MaterialCategoryID").val(data.ID);
                    $("#MaterialCategoryName").val(data.Name);
                }

            });
        }
        //选择 物资名称
        function SelMaterialName() {
            HDialog.OpenWin('600', '400', '../Emergency/Dialog/EmergencyDictionary.aspx?' + $.param({ DType: '应急物资名称' }), '选择物资类别', false, function callback(data) {
                if (data != "") {
                    data = $.parseJSON(data);
                    $("#MaterialNameID").val(data.ID);
                    $("#MaterialName").val(data.Name);
                }

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
                    clearWhere();
                    LoadList();
                }
            });
        }
        function clearWhere() {
            $('#frmMaterial').form('clear');
            $('#IsOverdueName').combobox("setValue", "全部");
            $('#IsIntactName').combobox("setValue", "全部");
            $('#IsStopName').combobox("setValue", "全部");

        }

        var column = [[
            { field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true },
            { field: 'MaterialCategoryName', title: '物资类别', width: 120, align: 'left', sortable: true },
            {
                field: 'MaterialName', title: '物资名称', width: 140, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"Detail('edit','" + row.ID + "','" + row.CommID + "')\" href=\"javascript:void(0);\">" + row.MaterialName + "</a>";
                    return str;
                }
            },
            { field: 'MaterialUnit', title: '物资单位', width: 80, align: 'left', sortable: true },
            { field: 'SpecificationType', title: '规格型号', width: 100, align: 'left', sortable: true },
            { field: 'ShouldMatchNum', title: '应配数量', width: 80, align: 'left', sortable: true },
            {
                field: 'QualityLimit', title: '质保期限', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd');
                    }
                    return "";
                }
            },
            { field: 'DepositPlace', title: '存放地点', width: 180, align: 'left', sortable: true },
            { field: 'EmergencyTypeNames', title: '应急类型', width: 140, align: 'left', sortable: true },
            { field: 'InfactNumber', title: '实际数量', width: 80, align: 'left', sortable: true },
            { field: 'IsOverdueName', title: '是否过期', width: 80, align: 'left', sortable: true },
            { field: 'IsIntactName', title: '是否完好', width: 80, align: 'left', sortable: true },
            { field: 'IsStopName', title: '是否停用', width: 80, align: 'left', sortable: true }
        ]];

        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_Reserve').dialog('open');
                }
            }, '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($("#CommID").val() == "0" || $("#CommID").val() == "") {
                        HDialog.Info('请选择项目!');
                        return;
                    }
                    var Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        HDialog.Info('没有需要导出的应急物资数据!');
                        return;
                    }
                    window.open("EmergencyMaterialSearchExport.aspx?CommID=" + $('#CommID').val() + "&" + $('#frmMaterial').serialize());
                }
            }
        ];

        //编辑 应急物资
        function Detail(OpType, ID, CommID) {
            var w = $(window).width() * 5 / 9;
            var h = $(window).height() * 6 / 8;
            HDialog.OpenWin(w, h, '../Emergency/EmergencyMaterialDetail.aspx?Flag=1&OpType=' + OpType + '&ID=' + ID + "&CommID=" + CommID, "应急物资详情", false, function callback(_Data) {
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
                fitColumns: false,
                pagination: true,
                singleSelect: true,
                rownumbers: true,
                border: false,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Emergency", "GetEmergencyMaterialList", "TableContainer", param);
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

