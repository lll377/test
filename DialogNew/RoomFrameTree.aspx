<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomFrameTree.aspx.cs" Inherits="M_Main.DialogNew.RoomFrameTree" %>
<!DOCTYPE html>
<HTML>
	<head>
		<title>DepartmentTree</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
			<LINK href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
	</head>
	<body>
		<form id="RoomFrameTree" method="post" runat="server">
			<table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="1" style="margin-top:2px;">
				<tr>
					<td vAlign="top"><div id="treeDemo" class="ztree"></div>
					</td>
				</tr>
			</table>
		</form>
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
					var n=<%= depTreeString %>
					
					var newN=[];
					for(var i=0;i<n.length;i++)
					{
					    newN[i]={SortDepCode:n[i]["SortDepCode"],PrentDepCode:n[i]["PrentDepCode"],DepName:n[i]["DepName"],url:"RoomFrameBrowse.aspx?DepCode="+n[i]["SortDepCode"],target:"RoomFrameBrowse"};
					}
					treeObj=$.fn.zTree.init($("#treeDemo"), setting, newN);
					

					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					var nodes = treeObj.getNodes();
					var firstNode = nodes[0];
					treeObj.expandNode(firstNode, true, false, false);
	</script>
	</body>
</HTML>
