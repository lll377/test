<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganTree.aspx.cs" Inherits="M_Main.SysNew.OrganTree" %>
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
	<body style="overflow:hidden;padding:2px;">
	<form id="DepartmentTree" method="post" runat="server">
    <input type="hidden" id="CommID" name="CommID" />
    <input type="hidden" id="PrentOrganCode" name="PrentOrganCode" />
    <input type="hidden" id="OrganCode" name="OrganCode" />
    <ul id="treeDemo" style="scrolling:auto; overflow-y:scroll;" class="easyui-tree">
	</ul>
    <script type="text/javascript">
        function NodeItemClick() {
            if(parseInt($("#CommID").val())>0)
            {
                parent.$("#OrganCommManage").attr("src", "OrganCommManage.aspx?OrganCode=" + $("#PrentOrganCode").val() + "&OpType=edit&CommID=" + $("#CommID").val());
            }
            else
            {
                parent.$("#OrganCommManage").attr("src", "OrganManage.aspx?OrganCode=" + $("#OrganCode").val() + "&OpType=edit&CommID=" + $("#CommID").val());
            }
        }

        function DelComm(OrganCode,CommID) {
            $.tool.DataGet('Organ', 'DeleteComm', "OrganCode=" + OrganCode + "&CommID=" + CommID,
                                                function Init() {
                                                },
                                                function callback(_Data) {
                                                    if (_Data == 'true') {
                                                        HDialog.Info("删除成功");
                                                        InitLeftTree();
                                                    }
                                                    else {
                                                        HDialog.Info(_Data);
                                                    }
                                                },
                                                function completeCallback() {
                                                },
                                                function errorCallback() {
                                                });
        }
        function DelOrgan(OrganCode, CommID) {
            $.tool.DataGet('Organ', 'DeleteOrgan', "OrganCode=" + OrganCode + "&CommID=" + CommID,
                                                function Init() {
                                                },
                                                function callback(_Data) {
                                                    if (_Data == 'true') {
                                                        HDialog.Info("删除成功");
                                                        InitLeftTree();
                                                    }
                                                    else {
                                                        HDialog.Info(_Data);
                                                    }
                                                },
                                                function completeCallback() {
                                                },
                                                function errorCallback() {
                                                });
        }
        function Del() {
            if (parseInt($("#CommID").val()) > 0) {
                parent.$("#OrganCommManage").attr("src", "OrganCommManage.aspx?OrganCode=&OpType=insert&CommID=");
                DelComm($("#OrganCode").val(),parseInt($("#CommID").val()));
            }
            else {
                parent.$("#OrganCommManage").attr("src", "OrganManage.aspx?OrganCode=&OpType=insert&CommID=");
                DelOrgan($("#OrganCode").val(), parseInt($("#CommID").val()));
            }
        }

        function InitLeftTree() {
            var h = $(window).height() - 20;
            var w = $(window).width()-12;
            $("#treeDemo").css("height", h + "px");
            $("#treeDemo").css("width", w+"px");
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
            var param = "&OrganCode=" + OrganCode + "&CommID=" + CommID;
            $.tool.DataGet('Organ', 'GetOrganTree', param,
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
                    // select the node
                    $('#tt').tree('select', node.target);
                    // display context menu
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                }
            });
            //收起
            //$('#treeDemo').tree('collapseAll');
        }
        InitLeftTree();
    </script>

    <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width:120px;">
		<div data-options="name:'newbjorgan',iconCls:'icon-add'">新增本级管理区域</div>
        <div data-options="name:'newxjorgan',iconCls:'icon-add'">新增下级管理区域</div>
		<div data-options="name:'newcomm',iconCls:'icon-add'">新增项目</div>
        <div class="menu-sep"></div>
		<div data-options="name:'del',iconCls:'icon-cancel'">删除</div>
	</div>
	<script>
		function menuHandler(item){
		    switch (item.name) {
		        case "newbjorgan":
		            parent.$("#OrganCommManage").attr("src", "OrganManage.aspx?OrganCode=" + $("#PrentOrganCode").val() + "&OpType=insert&CommID=" + $("#CommID").val());
		            break;
		        case "newxjorgan":
		            parent.$("#OrganCommManage").attr("src", "OrganManage.aspx?OrganCode=" + $("#OrganCode").val() + "&OpType=insert&CommID=" + $("#CommID").val());
		            break;
		        case "newcomm":
		            parent.$("#OrganCommManage").attr("src", "OrganCommManage.aspx?OrganCode=" + $("#OrganCode").val() + "&OpType=insert&CommID=" + $("#CommID").val());
		            break;
		        case "del":
		            HDialog.Prompt("是否确认删除", function a() {
		                Del();
		            })
		            break;
		    }
		}
		$(function(){
			$(document).bind('contextmenu',function(e){
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