<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetProgramSelectWithOutParent.aspx.cs" Inherits="M_Main.BudgetNew.BudgetProgramSelectWithOutParent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择预算科目（不包含上级）</title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <style type="text/css">
        .ContainerLeft {
            height: 100%;
            border-right: 1px solid #cccccc;
            width: 100%;
        }

        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div>
            <input type="text" id="SearchName" name="SearchName" style="border: 1px solid #cccccc; width: 200px; margin-left: 10px;" class="easyui-validatebox" />
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="FilterTree();">筛选</a>
        </div>
        <div class="ContainerLeft" id="divTree">
            <ul id="treeDemo" class="easyui-tree" style="height: 100%; overflow: auto;">
            </ul>
        </div>
        <div style="text-align: center; margin-top: 10px;">
            <input type="button" class="button" value="确定" id="BtnSave" onclick="Btn_Ok();" />
            <input type="button" class="button" value="关闭" id="BtnClose" onclick="CloseWindow();" />
        </div>
        <input type="hidden" id="ParentId" name="ParentId" />
        <input type="hidden" id="CsId" name="CsId" />
        <input type="hidden" id="OpType" name="OpType" />

        <script type="text/javascript">
            InitTableHeight();
            function InitTableHeight() {
                var h = $(window).height();
                $("#divTree").css({ "height": h - 80 + "px" });
            }

            function FilterTree() {
                $('#treeDemo').tree("doFilter", $('#SearchName').val());
            }

            function InitTree() {
                $.tool.DataGet('CsCost', 'GetSubjectEasyUiTree', "",
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            //将ztree转换为集合
                            GetTree(varObjects);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            InitTree();
            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    checkbox: true,
                    data: obj,
                    onBeforeCheck: function (node, checked) {
                    },
                    onClick: function (node) {
                        if (node.checked) {
                            $('#treeDemo').tree("uncheck", node.target);
                        } else {
                            $('#treeDemo').tree("check", node.target);
                        }
                    }
                });
            }

            //确定
            function Btn_Ok() {
                var nodes = $('#treeDemo').tree('getChecked');
                if (nodes.length == 0) {
                    HDialog.Info("请选择项目");
                    return;
                }
                HDialog.Close(JSON.stringify(nodes));
            }

            function getTreeSelected() {
                var nodes = $('#treeDemo').tree('getChecked');
                var arr = new Array();
                for (var i = 0; i < nodes.length; i++) {
                    arr.push(nodes[i]);
                    myFuc(nodes[i]);
                }
                return arr;

                //内部递归函数
                function myFuc(n) {
                    var parent = $('#treeDemo').tree('getParent', n.target);
                    if (parent == null) return;
                    if (isExistItem(parent)) return;
                    arr.push(parent);
                    myFuc(parent);
                }
                //验证节点是否已存在数组中
                function isExistItem(item) {
                    var flag = false;
                    for (var i = 0; i < arr.length; i++) {
                        if (arr[i] == item) {
                            flag = true; break;
                        }
                    }
                    return flag;
                }
            }

            //关闭
            function CloseWindow() {
                HDialog.Close("");
            }
        </script>
    </form>
</body>
</html>
