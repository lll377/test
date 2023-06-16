<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowSortManageSel.aspx.cs" Inherits="M_Main.OAWorkFlowNew.FlowSortManageSel" %>
<!DOCTYPE html>
<html>
	<head>
		<title>选择流程分类</title>
		<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
		<link href="../css/style.css" type="text/css" rel="stylesheet">
		<script src="../jscript/JSClient.js" type="text/javascript"></script>
		<link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
		<link href="../css/style.css" type="text/css" rel="stylesheet">
        <script src="../jscript/Dialog.js" type="text/javascript"></script>
        <script type="text/javascript" src="../jscript/Cache.js"></script>
	</head>
	<body style="overflow-x:hidden;overflow:auto;padding:5px;">
		<form id="Form1" method="post" runat="server">
		<div style="WIDTH:100%;height:auto;" id="DvTree">
				<ul id="treeDemo" class="ztree">
				</ul>
		</div>
		<script type="text/javascript">
		var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey:"InfoId",
					pIdKey:"Pid"
				},
				key: {
					name: "FlowSortName"
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
		
		var n=<%= zNodes %>
		var newN=[];
		for(var i=0;i<n.length;i++)
		{
			var strData="";
			var Doc='';
			if(n[i]["DocumentUrl"]!=null)
			{
				Doc=n[i]["DocumentUrl"];
				Doc=Doc.replace(/\\/g, "/");
			}
			strData=n[i]["InfoId"]+"\t"+n[i]["FlowSortName"]+"\t"+n[i]["IsUpdate"]+"\t"+Doc;
			newN[i]={InfoId:n[i]["InfoId"],Pid:n[i]["Pid"],FlowSortName:n[i]["FlowSortName"],click:"NodeItem_DblClick('"+strData+"')"};
		}
		treeObj=$.fn.zTree.init($("#treeDemo"), setting, newN);
		treeObj.expandAll(true);
		var nodes = treeObj.getNodes();
		if (nodes.length>0) {
			treeObj.selectNode(nodes[0]);
		}
		String.prototype.Trim = function() 
		{ 
			return this.replace(/(^\s*)|(\s*$)/g, ""); 
		}
		function NodeItem_DblClick(strNodeData)
		{
				var sAllNodes = treeObj.getNodes();
				
				if(sAllNodes.length>0)
				{
						if(strNodeData!=null)
						{
							var NodeData=strNodeData;
							var DataArray=NodeData.split('\t');
							for(var i=0;i<DataArray.length;i++)
							{
								if(DataArray[i]=="null")
								{
									DataArray[i]="";
								}
							}
							var node = treeObj.getNodeByParam("InfoId",DataArray[0]);
							var IsLast=node.children;
							if(IsLast==null)
							{
								var RetArray=new Array();
								RetArray[0]=DataArray[0].Trim();
								RetArray[1]=DataArray[1].Trim();
								RetArray[2]=DataArray[2].Trim();
								RetArray[3]=DataArray[3].Trim();
								var Ret=JSON.stringify(RetArray);
								HDialog.Close(Ret);
							}
							HDialog.Close('');
						}
				}
		}
		</script>
		</form>
	</body>
</HTML>
