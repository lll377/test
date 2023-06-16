<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyOrganizationSet.aspx.cs" Inherits="M_Main.Emergency.EmergencyOrganizationSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急组织设置</title>
    <link href="../css/button.css" rel="stylesheet" />
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
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            line-height: 20px;
        }

        .TdContentSearch textarea {
            width: 96.2%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
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
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <div class="easyui-layout" id="Layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:460">
            <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width: 120px;">
                <div data-options="name:'addNow',iconCls:'icon-add'">新增本级</div>
                <div data-options="name:'addLower',iconCls:'icon-add'">新增下级</div>
                <div class="menu-sep"></div>
                <div data-options="name:'del',iconCls:'icon-cancel'">删除</div>
            </div>
            <div style="width: 100%; height: 100%; background-color: #cccccc;" id="TableContainer">
            </div>
        </div>
        <div data-options="region:'center',border:true">
            <form id="FrmForm" runat="server">
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">岗位序号:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="Sort" name="Sort" class="easyui-numberbox" style="width: 200px;" data-options="required:true" />
                            <input type="hidden" id="ID" name="ID" runat="server" />
                            <input type="hidden" id="ParentID" name="ParentID" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">岗位名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="OrganizationName" name="OrganizationName" maxlength="200" style="width: 195px;" class="easyui-validatebox"
                                data-options="required:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">备注:</td>
                        <td class="TdContentSearch">
                            <textarea type="text" id="Remark" name="Remark" maxlength="1400" style="width: 245px;" class="easyui-validatebox"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
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
        /* 应急组织 */
        var columnType = [[
            {
                field: 'text', title: '名称', width: 200, align: 'left', sortable: true
            }
        ]];

        var toolbarType = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    //判断是否选择了数据  如果选择了数据的话就新增在这个的下面
                    $('#FrmForm').form('clear');
                    var SelectRow = $('#TableContainer').treegrid("getSelected");
                    var ParentID = "";
                    if (SelectRow) {
                        ParentID = SelectRow.attributes.ParentId;
                    }
                    $('#ParentID').val(ParentID);
                }
            }, '-', {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    Del();
                }
            }, '-', {
                text: '展开/折叠',
                iconCls: 'icon-redo',
                handler: function () {
                    if (IsCollapseAll == true) {
                        $('#TableContainer').treegrid('expandAll');
                        IsCollapseAll = false;
                    }
                    else {
                        $('#TableContainer').treegrid('collapseAll');
                        IsCollapseAll = true;
                    }
                }
            }
        ];
        var IsCollapseAll = true;

        //菜单内容点击事件
        function menuHandler(item) {
            switch (item.name) {
                case "addNow":
                    //新增本级 
                    //清空页面数据 
                    $('#FrmForm').form('clear');
                    var SelectRow = $('#TableContainer').treegrid("getSelected");
                    var ParentID = "";
                    if (SelectRow) {
                        ParentID = SelectRow.attributes.ParentId;
                    }
                    $('#ParentID').val(ParentID);
                    break;
                case "addLower":
                    //新增下级
                    var SelectRow = $('#TableContainer').treegrid("getSelected");
                    var ParentID = "";
                    if (SelectRow) {
                        ParentID = SelectRow.id;
                    }
                    if (ParentID != "") {
                        $('#FrmForm').form('clear');
                        $('#ParentID').val(ParentID);
                    } else {
                        HDialog.Info("请选择上级应急组织设置");
                        return;
                    }
                    break;
                case "del":
                    //删除应急组织设置
                    Del();
                    break;
            }
        }

        //编辑 应急组织设置
        function Edit(SelectNode) {
            if (SelectNode) {
                if (SelectNode.attributes.Sort) {
                    $('#Sort').numberbox("setValue", SelectNode.attributes.Sort);
                }
                $('#ID').val(SelectNode.id);
                $('#OrganizationName').val(SelectNode.text);
                $('#ParentID').val(SelectNode.attributes.ParentId);

            }
        }
        //删除 应急组织设置
        function Del() {
            var SelectRow = $('#TableContainer').treegrid("getSelected");
            if (SelectRow) {
                var Childnode = $('#TableContainer').treegrid("getChildren", SelectRow.id);
                if (Childnode.length > 0) {
                    //存在子节点不允许删除
                    HDialog.Info("当前应急组织设置下存在子节点，不允许删除");
                    return;
                }
                $.messager.confirm('确定', '是否删除该应急组织?', function (r) {
                    if (r) {
                        $.tool.DataPostJson('Emergency', 'DelEmergencyOrganizationSet', "idList=" + SelectRow.id,
                            function Init() {
                            },
                            function callback(data) {
                                if (data.result) {
                                    HDialog.Info("删除成功");
                                    LoadList();
                                } else {
                                    HDialog.Info(data.msg);
                                }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }
                });

            } else {
                HDialog.Info("请选择需要删除的应急组织设置");
                return;
            }


        }

        //保存页面数据
        function Save() {
            if ($('#FrmForm').form("validate")) {
                $.tool.DataPostJson('Emergency', 'SaveEmergencyOrganizationSet', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            HDialog.Info("保存成功!");
                            LoadList();
                        } else {
                            HDialog.Info(data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }
        //加载 应急组织设置 列表 treegrid
        function LoadList() {
            $("#TableContainer").treegrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Emergency&Command=GetEmergencyOrganizationSetList',
                treeField: 'text',
                idField: 'id',
                method: "post",
                nowrap: false,
                columns: columnType,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                rownumbers: true,
                width: "100%",
                toolbar: toolbarType,
                border: false,
                onContextMenu: ContextMenu, // 绑定右键菜单
                onSelect: function (node) {
                    Edit(node);
                },
                onLoadSuccess: function (data) {
                    //加载成功默认折叠所有级别
                    $('#TableContainer').treegrid('collapseAll');
                    var rootNodes = $('#TableContainer').treegrid('getRoot');
                    if (rootNodes) {
                        $('#TableContainer').treegrid('select', rootNodes.id);
                    }
                },
                onLoadError: function () {
                    //清空页面数据
                    $('#FrmForm').form('clear');
                }
            });
        }

        //添加右击菜单内容
        function ContextMenu(e, row) {
            e.preventDefault();
            if (row) {
                $('#TableContainer').treegrid('select', row.id);//选中当前行
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }
        }

        //页面初始化
        $(function () {
            InitTableHeight();
            LoadList();
        });

    </script>
</body>
</html>

