<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysObjectList.aspx.cs" Inherits="M_Main.HouseInspect.SysObjectList" %>

<!DOCTYPE html>
<html>
<head>
    <title>对象树</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 120px;
            height: 80px;
        }

        .SearchTable {
            width: 120px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer">
        </div>
        <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width: 120px;">
            <div data-options="name:'newbjObject',iconCls:'icon-add'">新增本级对象</div>
            <div data-options="name:'newxjObject',iconCls:'icon-add'">新增下级对象</div>
            <div data-options="name:'newStandard',iconCls:'icon-add'">新增标准</div>
            <div class="menu-sep"></div>
            <div data-options="name:'del',iconCls:'icon-cancel'">删除</div>
        </div>
        <input type="hidden" id="ObjectId" name="ObjectId" />
        <input type="hidden" id="ParentId" name="ParentId" />
        <input type="hidden" id="ContainerRightUrl" name="ContainerRightUrl" />
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var column;
            column = [[
                { field: 'text', title: '对象名称', align: 'left', sortable: true, width: 380 }
            ]];

            var IsCollapseAll = false;
            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        var a = { name: 'newxjObject' };
                        if ($("#ObjectId").val() > "") {
                            menuHandler({ name: 'newxjObject' });
                        } else {
                            menuHandler({ name: 'newbjObject' });
                        }
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        menuHandler({ name: 'del' });
                    }
                }, '-',
                {
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

            function menuHandler(item) {
                switch (item.name) {
                    case "newbjObject":
                        HDialog.Open('580', '150', '../HouseInspect/SysObjectEdit.aspx?IsChild=0&ObjectId=' + $("#ObjectId").val() + '&ParentId=' + $("#ParentId").val(), '新增查验对象', false, function callback(_Data) {
                            if (_Data != '') {
                                InitLeftTree();
                            }
                        });
                        break;
                    case "newxjObject":
                        if ($("#ObjectId").val() > "") {
                            if (CheckParent()) {
                                HDialog.Open('550', '130', '../HouseInspect/SysObjectEdit.aspx?IsChild=1&ObjectId=' + $("#ObjectId").val() + '&ParentId=' + $("#ParentId").val(), '新增查验对象', false, function callback(_Data) {
                                    if (_Data != '') {
                                        InitLeftTree();
                                    }
                                });
                            }
                        } else {
                            HDialog.Info("未选中对象，请重试！");
                        }
                        break;
                    case "newStandard":
                        if ($("#ObjectId").val() > "") {
                            if (IsChild()) {
                                HDialog.Open('740', '530', '../HouseInspect/SysStandardEdit.aspx?ObjectId=' + $("#ObjectId").val() + '&OpType=insert', '标准详细', false, function callback(_Data) {
                                    if (_Data != '') {
                                        parent.$("#SysStandardItem").attr("src", $("#ContainerRightUrl").val()+"?ObjectId=" + $("#ObjectId").val());
                                    }
                                });
                            }
                        } else {
                            HDialog.Info("未选中对象，请重试！");
                        }
                        break;
                    case "del":
                        if ($("#ObjectId").val() > "") {
                            $.messager.confirm('确定', '将同时删除对应的下级对象和对应的标准，是否删除', function (r) {
                                if (r) {
                                    $.tool.DataGet('CsHouseInspect', 'DelObject', 'ObjectId=' + $("#ObjectId").val(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            InitLeftTree();
                                            parent.$("#SysStandardItem").attr("src", $("#ContainerRightUrl").val() +"?ObjectId=");
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            });
                        } else {
                            HDialog.Info("未选中对象，请重试！");
                        }
                        break;
                }
            }

            //检验父级节点
            function CheckParent() {
                var result;
                $.ajax({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=CheckObject&ObjectId=' + $("#ObjectId").val(),
                    type: 'GET',
                    dataType: 'text',
                    cache: false,
                    async: false,
                    success: function (_Data) {
                        if (_Data != "0") {
                            HDialog.Info("选中对象下有未删除的标准，无法新增下级对象！");
                            result = false;
                        } else {
                            result = true;
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        HDialog.Info("数据读取错误");
                        bool = false;
                    }
                });
                return result;
            }

            //检验是否子节点
            function IsChild() {
                var result;
                $.ajax({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=IsChild&ObjectId=' + $("#ObjectId").val(),
                    type: 'GET',
                    dataType: 'text',
                    cache: false,
                    async: false,
                    success: function (_Data) {
                        if (_Data != "0") {
                            HDialog.Info("选中对象不是末级节点，无法新增标准！");
                            result = false;
                        } else {
                            result = true;
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        HDialog.Info("数据读取错误");
                        bool = false;
                    }
                });
                return result;
            }

            function InitLeftTree() {
                $("#ContainerRightUrl").val(GetQueryString('ContainerRightUrl'));
                
                $("#TableContainer").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetObjectEasyUiTree&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    remoteSort: false,
                    pagination: false,
                    rownumbers: true,
                    IsCustomHead: false,
                    cascadeCheck: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    cascadeCheck: true,
                    onClickRow: function (node) {
                        $("#ObjectId").val(node.attributes.ObjectId);
                        $("#ParentId").val(node.attributes.ParentId);
                        parent.$("#SysStandardItem").attr("src", $("#ContainerRightUrl").val() +"?ObjectId=" + $("#ObjectId").val());
                    },
                    onContextMenu: function (e, node) {
                        e.preventDefault();
                        $('#mm').menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        });
                    },
                    onLoadSuccess: function (row, data) {
                        $('#TableContainer').treegrid('collapseAll');
                        IsCollapseAll = true;
                    }
                });
            }
            InitLeftTree();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
