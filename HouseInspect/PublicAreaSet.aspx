<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicAreaSet.aspx.cs" Inherits="M_Main.HouseInspect.PublicAreaSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查验公区设置</title>
    
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <link href="../css/workflow.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <%--<div style="width: 100%; height: 100%">
            <div id="divHeight" style="width: 25%; float: left; height: 590px; overflow: auto;">
                <div class="BtnDown" id="Depart" style="width: 100%;">项目</div>
                <div id="divMenuTree">
                    <ul id="treeDemo" class="ztree">
                    </ul>
                </div>
            </div>

            <div style="width: 75%; float: left; height: 100%;">

                <div style="width: 100%; background-color: #cccccc;" id="TableContainerPoint">
                </div>
            </div>
        </div>--%>
         <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="commTree" data-options="region:'west',border:true,width:300,title:'项目'">
                 <ul id="treeDemo" class="ztree">
                    </ul>
            </div>
            <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
                 <div style="width: 100%; background-color: #cccccc;" id="TableContainerPoint">
                </div>
            </div>

        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 130px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">公区类型:</td>
                    <td class="TdContent">
                        <select id="PublicAreaType" name="PublicAreaType" data-options="required:true" isdctype='true' dctype="公区类型" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 204px;height:22px">
                        </select>
                    </td>
                    <td class="TdTitle">公区名称:</td>
                    <td class="TdContent">
                        <input id="PublicAreaName" name="PublicAreaName" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;height:20px" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="$('#frmForm').form('clear');">清空</a>
                    </td>
                </tr>
            </table>

        </div>
       <input id="hidID" type="hidden" size="2" name="hidID" runat="server" />
        <input id="OrganCode" type="hidden" size="2" name="OrganCode" runat="server" />
        <input id="OrganName" type="hidden" size="2" name="OrganName" runat="server" />
        <input type="hidden" id="CommName" name="CommName" />
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <script>
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainerPoint").css("height", h + "px");
                $("#layout").css("height", h+"px");
                $("#layout_center").css("height", h + "px");
            }
            InitTableHeight();

            function btnOK_onclick(strNodeData) {
                var str = strNodeData.split('|');
                document.getElementById("hidID").value = "";

                document.getElementById("OrganCode").value = str[0];
                document.getElementById("OrganName").value = str[1];
                document.getElementById("CommName").value = str[1];
                document.getElementById("CommId").value = str[2];

                LoadList();
            }

            //加载项目节点
            function getFont(treeId, node) {
                return node.font ? node.font : {};
            }
            var setting = {
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "OrganCode",
                        pIdKey: "PrentOrganCode"
                    },
                    key: {
                        name: "OrganName"
                    }
                },
                view: {
                    fontCss: getFont,
                    nameIsHTML: true
                }
            };
            var n =<%= zNodes %>;
            var newN = [];
            for (var i = 0; i < n.length; i++) {
                var strData = "";
                strData = n[i]["OrganCode"] + "|" + n[i]["OrganName"] + "|" + n[i]["InPopedom"];
                newN[i] = { OrganCode: n[i]["OrganCode"], PrentOrganCode: n[i]["PrentOrganCode"], OrganName: n[i]["OrganName"], InPopedom: n[i]["InPopedom"], click: "btnOK_onclick('" + strData + "')", open: 'true' };
            }
            var treeObj = $.fn.zTree.init($("#treeDemo"), setting, newN);

            var column = [[
                { field: 'Id', title: 'Id', align: 'left', sortable: true, hidden: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
                {
                    field: 'PublicAreaName', title: '公区名称', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','edit');\">" + row.PublicAreaName + "</a>";
                        return str;
                    }
                },
                { field: 'PublicAreaTypeName', title: '公区类型', width: 40, align: 'left', sortable: true },
                { field: 'Remark', title: '备注', width: 50, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#CommId").val() == "" || $("#CommId").val() == "0") {
                            HDialog.Info("请在左侧选择项目");
                            return;
                        }
                        Detail('', 'insert');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainerPoint").datagrid("getSelected");

                        if (row == null) {
                            HDialog.Info("请先选择一行数据!");
                            return;
                        }
                        DelStandard(row);
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function LoadList() {
                $("#TableContainerPoint").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetPublicAreaSetList&' + $('#frmForm').serialize(),
                    method: "get",
                    title: '',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    singleSelect: true,
                    columns: column,
                    //fit: true,
                    fitColumns: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: false,
                    onClickRow: function (rowIndex, rowData) {
                    }
                });
                $("#SearchDlgSave").dialog("close");
                $("#SearchDlg").dialog("close");
            }
            LoadList();

            function DelStandard(row) {
                $.messager.confirm('确定', '是否删除该查验公区', function (r) {
                    if (r) {
                        $.tool.DataGet('CsHouseInspect', 'DelPublicAreaSet', 'ID=' + row.Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function Detail(ID, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('670', '250', '../HouseInspect/PublicAreaSetEdit.aspx?CommID=' + $("#CommId").val() + '&Id=' + ID + '&OpType=' + OpType, '查验公区编辑', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

        </script>
    </form>
</body>
</html>
