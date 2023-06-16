<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetCompanySelect.aspx.cs" Inherits="M_Main.BudgetNew.BudgetCompanySelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算单位多选页面</title>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/Ztree/jquery.ztree.all.min.js"></script>
    <script type="text/javascript" src="../jscript/Ztree/jquery.ztree.exhide.min.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="form1" runat="server">
        <div id="searchDiv">
            <input type="text" id="SearchName" name="SearchName" style="border: 1px solid #cccccc; width: 200px; margin-left: 10px;" class="easyui-validatebox" />
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="FilterTree();">筛选</a>
        </div>
        <div id="divMenuTree" style="overflow-y: scroll; height: 245px; width: 100%">
            <ul id="treeDemo" class="ztree">
            </ul>
        </div>
        <div style="margin: 0 auto; width: 100%; text-align: center;">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="SearchClose" onclick="Btn_Ok()">确定</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'" id="A1" onclick="Btn_Cancle()">取消</a>
        </div>
    </form>
    <script type="text/javascript">

        //****初始化加载树
        function InitTree() {
            $.tool.DataGet('Budget', 'GetCompanyTree', "",
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
        var treeObj = "";
        function GetTree(obj) {
            $('#treeDemo').html("");
            var setting = {
                check: {
                    enable: true,
                    chkStyle: "checkbox",
                    chkboxType: { "Y": "s", "N": "ps" }
                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "id"
                    },
                    key: {
                        name: "text"
                    }
                },
                callback: {
                    beforeClick: ValidateNode,
                    beforeCheck: ValidateNode,
                    onCheck: onCheckEvent,
                    onClick: onCheckEvent

                }
                //, view: {
                //    filter: true,  //是否启动过滤
                //    expandLevel: 0,  //展开层级
                //    showFilterChildren: true, //是否显示过滤数据孩子节点
                //    showFilterParent: true, //是否显示过滤数据父节点
                //    showLine: false
                //}
            }
            treeObj = $.fn.zTree.init($("#treeDemo"), setting, obj);
        }

        function FilterTree() {
            var value = $('#SearchName').val();
            var nodeList = treeObj.getNodesByParamFuzzy('text', value, null);

            var nodes = treeObj.getNodes();
            for (var i = 0; i < nodes.length; i++) {
                treeObj.hideNodes(nodes[i].children);
                treeObj.hideNode(nodes[i]);
            }
            //treeObj.hideNodes(nodes[0].children); //隐藏所有节点
            //treeObj.hideNode(nodes[0]);
            //alert(JSON.stringify(nodeList))
            treeObj.showNodes(nodeList);
            for (var i = 0; i < nodeList.length; i++) {
                ShowAllNodes(nodeList[i]);
            }
        }
        // 显示所有查找到的节点的父节点
        function ShowAllNodes(nodes) {
            treeObj.showNode(nodes);
            var ParentNodes = nodes.getParentNode();
            if (ParentNodes != null) {
                ShowAllNodes(ParentNodes);
            }
        }

        InitTree();
        //****验证是否是最下级节点
        function ValidateNode(treeId, treeNode) {
            if (treeNode.isParent) {
                //HDialog.Info("只能选择最下级节点单位");
                //return false;
            }
        }
        //****选择节点
        function onCheckEvent(event, treeId, treeNode) {
            if (event.type == "click") {
                if (treeNode.checked == true) {
                    treeObj.checkNode(treeNode, false, true);
                } else {
                    treeObj.checkNode(treeNode, true, true);
                }
            }
            //判断当前节点是否有上级节点
            var ParentNode = treeNode.getParentNode();
            ClickParentNode(ParentNode);
        }
        //递归上级
        function ClickParentNode(ParentNode) {
            if (ParentNode != null) {
                //全部 子节点被勾选
                if (ParentNode.check_Child_State == 2) {
                    treeObj.checkNode(ParentNode, true, true);
                }
                //else {
                //    //treeObj.checkNode(ParentNode, false, true);
                //}
                ParentNode = ParentNode.getParentNode();
                ClickParentNode(ParentNode);
            }
        }
        //确定选择
        function Btn_Ok() {
            var CheckedNodes = treeObj.getCheckedNodes(true);
            if (CheckedNodes.length == 0) {
                HDialog.Info("请选择预算单位")
                return;
            }
            var CodeList = "";
            var NameList = "";
            var Nodes = treeObj.transformToArray(treeObj.getNodes());
            for (var i = 0; i < CheckedNodes.length; i++) {
                CodeList += CheckedNodes[i].id + ",";
                NameList += CheckedNodes[i].text + ",";

            }
            //遍历所有节点获取有部分子节点是选中的节点数据
            for (var i = 0; i < Nodes.length; i++) {
                if (Nodes[i].check_Child_State == 1) {
                    CodeList += Nodes[i].id + ",";
                    NameList += Nodes[i].text + ",";
                }
            }
            if (CodeList.length > 0 || NameList.length > 0) {
                CodeList = CodeList.substring(0, CodeList.length - 1);
                NameList = NameList.substring(0, NameList.length - 1);
            }
            HDialog.Close(CodeList + "%" + NameList);
        }

        function Btn_Cancle() {
            HDialog.Close("");
        }
    </script>
</body>
</html>
