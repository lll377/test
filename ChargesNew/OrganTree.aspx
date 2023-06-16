<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganTree.aspx.cs" Inherits="M_Main.ChargesNew.OrganTree" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
        <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
        <script src="../jscript/Dialog.js" type="text/javascript"></script>
	</head>
	<body style="overflow-y:auto;padding:5px;">
	<form id="DepartmentTree" method="post" runat="server">
    <input type="hidden" id="CommID" name="CommID" />
    <input type="hidden" id="PrentOrganCode" name="PrentOrganCode" />
    <input type="hidden" id="OrganCode" name="OrganCode" />
    <ul id="treeDemo" class="easyui-tree">
	</ul>
    <script type="text/javascript">
        function NodeItemClick() {
            if (parseInt($("#CommID").val()) > 0) {
                parent.$("#OrganCommManage").attr("src", "OrganCommManage.aspx?OrganCode=" + $("#PrentOrganCode").val() + "&OpType=edit&CommID=" + $("#CommID").val());
            }
            else {
                parent.$("#OrganCommManage").attr("src", "OrganCommManage.aspx?OrganCode=" + $("#PrentOrganCode").val() + "&OpType=edit&CommID=0");
            }

        }

       

        function InitLeftTree() {
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
                }
            });
        }
        InitLeftTree();
	</script>

   
	<script>
		function menuHandler(item){
		    switch (item.name) {
		       
		        case "newcomm":
		            parent.$("#OrganCommManage").attr("src", "OrganCommManage.aspx?OrganCode=" + $("#OrganCode").val() + "&OpType=insert&CommID=" + $("#CommID").val());
		            break;
		      
		    }
		}
		
	</script>

	</form>
	</body>
</html>