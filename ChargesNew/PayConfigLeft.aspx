﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayConfigLeft.aspx.cs" Inherits="M_Main.ChargesNew.PayConfigLeft" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>项目列表</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 120px; 
            height: 80px; 
        }
        .SearchTable
        {
            width: 120px; 
            height:auto;
        }
    </style>
</head>
<body style="overflow:hidden;padding:5px;">
	<form id="DepartmentTree" method="post" runat="server">
    <input type="hidden" id="CommID" name="CommID" />
    <input type="hidden" id="PrentOrganCode" name="PrentOrganCode" />
    <input type="hidden" id="OrganCode" name="OrganCode" />
    <ul id="treeDemo" style="scrolling:auto; overflow-y:scroll;" class="easyui-tree">
	</ul>
    <script type="text/javascript">
        function NodeItemClick() {
            if (parseInt($("#CommID").val()) > 0) {
                parent.$("#PayConfigRight").attr("src", "PayConfigRight.aspx?OrganCode=" + $("#PrentOrganCode").val() + "&OpType=edit&CommID=" + $("#CommID").val());
            }
            else {
                parent.$("#PayConfigRight").attr("src", "PayConfigRight.aspx?OrganCode=" + $("#OrganCode").val() + "&OpType=edit&CommID=" + $("#CommID").val());
            }
        }



        function InitLeftTree() {
            var h = $(window).height() - 20;
            $("#treeDemo").css("height", h + "px");
            $.tool.DataGet('Organ', 'GetOrganTree', "",
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

        function TravelOrgan(OrganCode) {
            var roots = $('#treeDemo').tree('getRoots'), children, i, j;
            for (i = 0; i < roots.length; i++) {
                if (roots[i].attributes.OrganCode == OrganCode) {
                    $('#treeDemo').tree('select', roots[i].target);
                }
                children = $('#treeDemo').tree('getChildren', roots[i].target);
                for (j = 0; j < children.length; j++) {
                    if (children[j].attributes.OrganCode == OrganCode) {
                        $('#treeDemo').tree('select', children[j].target);
                    }
                }
            }
        }
        function TravelComm(CommID) {
            var roots = $('#treeDemo').tree('getRoots'), children, i, j;
            for (i = 0; i < roots.length; i++) {
                if (roots[i].attributes.InPopedom == CommID) {
                    $('#treeDemo').tree('select', roots[i].target);
                }
                children = $('#treeDemo').tree('getChildren', roots[i].target);
                for (j = 0; j < children.length; j++) {
                    if (children[j].attributes.InPopedom == CommID) {
                        $('#treeDemo').tree('select', children[j].target);
                    }
                }
            }
        }

        function RefreshLeftTree(OrganCode, CommID) {
            $.tool.DataGet('Organ', 'GetOrganTree', "",
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != '') {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        GetTree(varObjects);
                        if (parseInt(CommID) > 0) {
                            TravelComm(CommID);
                        }
                        else {
                            TravelOrgan(OrganCode);
                        }
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
                onClick: function (node) {
                    $("#OrganCode").val(node.attributes.OrganCode);
                    $("#PrentOrganCode").val(node.attributes.PrentOrganCode);
                    $("#CommID").val(node.attributes.InPopedom);
                    NodeItemClick();
                },
                onContextMenu: function (e, node) {
                    e.preventDefault();
                    $('#tt').tree('select', node.target);
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                }
            });
        }
        InitLeftTree();
	</script>

   
	<script type="text/javascript">
        $(function () {
            $(document).bind('contextmenu', function (e) {
                e.preventDefault();
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            });
        });
	</script>

	</form>
	</body>
</html>


