<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authority_SupplierLeft.aspx.cs" Inherits="M_Main.Mt.Authority_SupplierLeft" %>

<!DOCTYPE html>

<HTML>
	<HEAD>
		<title>SPopeRoleTree</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
		<LINK href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="SPopeRoleTree" method="post" runat="server">
			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="1">
				
				<TR>
					<TD valign="top"><div id="treeDemo" class="ztree"></div>
							</TD>
				</TR>
			</TABLE>`
		</form>
		<script type="text/javascript">
				var setting = {
					data: {
						simpleData: {
							enable: true,
							idKey:"DepCode",
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
					var n =<%= roleTreeString %>
				 
					var newN=[];
					for(var i=0;i<n.length;i++)
					{
					    newN[i]={DepCode:n[i]["SortDepCode"],PrentDepCode:n[i]["PrentDepCode"],DepName:n[i]["DepName"]+"("+n[i]["DepRoleCount"]+")",url:"Authority_SupplierRight.aspx?DepCode="+n[i]["DepCode"],target:"Authority_SupplierRight"};
	
					}
					treeObj=$.fn.zTree.init($("#treeDemo"), setting, newN);
					// treeObj.expandAll(true);
					//zTree = $("#treeDemo").zTree(setting,zNodes);
														</script>
	</body>
</HTML>