<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrationLeft.aspx.cs" Inherits="M_Main.OAWorkFlowNew.AdministrationLeft" %>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<title>OA权限管理</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
			<LINK href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="DepartmentTree" method="post" runat="server">
        <div style="padding-left:5px;padding-top:5px;">
            <asp:HyperLink id="LinkAll" runat="server" NavigateUrl="../OAWorkFlowNew/AdministrationBrowse.aspx?DepCode=" Target="AdministrationBrowse">全部部门</asp:HyperLink>
        </div>
        
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
					var n=<%= depTreeString %>
					
					var newN=[];
					for(var i=0;i<n.length;i++)
					{
					    newN[i]={SortDepCode:n[i]["SortDepCode"],PrentDepCode:n[i]["PrentDepCode"],DepName:n[i]["DepName"]+"("+n[i]["DepUserCount"]+")",url:"AdministrationBrowse.aspx?DepCode="+n[i]["DepCode"],target:"AdministrationBrowse"};
					}
					treeObj=$.fn.zTree.init($("#treeDemo"), setting, newN);
					treeObj.expandAll(true);
					//zTree = $("#treeDemo").zTree(setting,zNodes);
	</script>
    </form>
	</body>
</HTML>
