<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeTree.aspx.cs" Inherits="M_Main.SysNew.EmployeeTree" %>

<!DOCTYPE html>
<html>
<head>
    <title>DepartmentTree</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <%--授权专用easyui.js 改过源码--%>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.empower.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
</head>
<body>
    <div id="tree"></div>
    <script type="text/javascript">
        $(function () {
            InitDataTree();
        });

        //机构树
        function InitDataTree() {
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    if (data.length == 1) {
                        //默认展开第一个节点
                        $("#tree").tree("expand", $("#tree").tree("getChildren")[0].target)
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "Empower_Utils";
                    param.Method = "GetTreeDepartment";
                },
                onBeforeSelect: function (node) {
                    if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                        return false;
                    }
                    $("#EmployeeCardPunchList", parent.document).attr("src", "EmployeeCardPunchList.aspx?DepCode=" + node.attributes.SortDepCode);

                },
                onSelect: function (row) {

                    //InitDataGrid();
                }
            });
        }
    </script>

    <%--		<form id="DepartmentTree" method="post" runat="server">
		<div id="treeDemo" class="ztree"></div>
			<script type="text/javascript">
				var setting = {
					data: {
						simpleData: {
							enable: true,
							idKey:"SortDepCode",
							pIdKey:"PrentDepCode"
						},
						key: {
							name: "DepName"
						}
					},
					view: {
							fontCss: getFont,
							nameIsHTML: true
						}
				};
					function getFont(treeId, node) {
						return node.font ? node.font : {};
					}
					var n=<%= depTreeString %>;
					
					var newN=[];
					for(var i=0;i<n.length;i++)
					{
					    newN[i]={SortDepCode:n[i]["SortDepCode"],PrentDepCode:n[i]["PrentDepCode"],DepName:n[i]["DepName"],url:"UserBrowse.aspx?DepCode="+n[i]["SortDepCode"],target:"UserBrowse"};
					}
					treeObj=$.fn.zTree.init($("#treeDemo"), setting, newN);
					//treeObj.expandAll(false);

					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					var nodes = treeObj.getNodes();
					var firstNode = nodes[0];
					treeObj.expandNode(firstNode, true, false, false);
	</script>
    </form>--%>
</body>
</html>

