<%@ Page Language="c#" CodeBehind="MultiCorpCostDlg.aspx.cs" AutoEventWireup="false" Inherits="M_Main.DialogNew.MultiCorpCostDlg" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>费用项目选择</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache,  must-revalidate">
    <meta http-equiv="Expires" content="0">
    <base target="_self">
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.excheck-3.5.js"></script>
    <script language="javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript">
		<!--
    self.returnValue = "";
    function btnClear_OnClick() {
        MultiCorpCommCostDlg.CostName.value = "";
    }

    self.returnValue = "";

    function btnOK_onclick() {


        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        ckNodes = zTree.getCheckedNodes(true);
        CostIDs = "";
        CostNames = "";
        var CostCodes = "";
        for (var i = 0, l = ckNodes.length; i < l; i++) {

            if (ckNodes[i].checked) {
                //zmh 2017 06 02 修改 ckNodes[i].IsTreeRoow == "0"
                if (ckNodes[i].CorpCostID != null && ckNodes[i].isParent == false) {
                    CostIDs += ckNodes[i].CorpCostID + ",";
                    CostNames += ckNodes[i].CostName + ",";
                    CostCodes += ckNodes[i].CostCode + ",";
                }
            }

        }
        if (CostIDs == "") {
            HDialog.Info("请选择收费项目!");
            return false;
        }
        if (CostIDs.length > 0) CostIDs = CostIDs.substring(0, CostIDs.length - 1);
        if (CostNames.length > 0) CostNames = CostNames.substring(0, CostNames.length - 1);
        if (CostCodes.length > 0) CostCodes = CostCodes.substring(0, CostCodes.length - 1);

        var data = CostIDs + "\t" + CostNames + "\t" + CostCodes;
        //$('#SelReturn').val(data);
        //var data = $('#SelReturn').val();
        //console.log(data);
        HDialog.Close(data);
        return true;
    }
    function Close() {
        HDialog.Close();
    }


    var setting = {
        check: {
            chkStyle: "checkbox",
            enable: true
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "CostCode",
                pIdKey: "PrentCostCode"
            },
            key: {
                name: "CostName"
            }
        },
        view: {
            fontCss: getFont,
            nameIsHTML: false
        },
        callback: {
            beforeClick: beforeClick,
            onCheck: onCheck
        }
    };

    function getFont(treeId, node) {

        return node.font ? node.font : {};
    }

    function beforeClick(treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.checkNode(treeNode, !treeNode.checked, null, true);
        return false;
    }

    function onCheck(e, treeId, treeNode) {

    }
    var treeObj;
    $(document).ready(function () {

        treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        treeObj.setting.check.chkboxType = { "Y": "ps", "N": "ps" };

        //treeObj.expandAll(true);				

    });
    function allCheckbox(obj) {
        //console.log(obj);
        //console.log(obj.checked);
        treeObj.checkAllNodes(obj.checked);

    }
    var zNodes =<%= nodesN %>


    //-->
    </script>
</head>
<body style="overflow: auto">

    <form id="MultiCorpCostDlg" method="post" runat="server">
        <input id="TvUncheck" type="hidden" size="2" name="TvUncheck"
            runat="server" /><input id="TvCheck" style="height: 22px; width: 48px" type="hidden" size="2" name="TvCheck"
                runat="server" /><input id="SelReturn" style="height: 22px; width: 20px" type="hidden" size="1" name="SelReturn"
                    runat="server" />
        <input id="SysCostSign" style="height: 22px; width: 48px" type="hidden" size="2" name="SysCostSign"
            runat="server" />
        <input id="CostType" style="height: 22px; width: 48px" type="hidden" size="2" name="CostType"  runat="server" />
        
        <table style="width: 100%;">
            <tr>
                <td valign="top" width="100%" bgcolor="#ffffff">
                    <input type="checkbox" id="check1" onclick="javascript: allCheckbox(this)" />全选
                    <div style="width: 100%; height: 325px; overflow-y: scroll;">
                        <ul id="treeDemo" class="ztree" style="overflow: auto" runat="server"></ul>
                    </div>
                </td>
            </tr>
        </table>
        <table style="width: 100%; bottom: 0; position: fixed;">
            <tr>
                <td height="30" align="center">
                    <input id="btnSelect" onclick="javascript: btnOK_onclick();" type="button"
                        value="选择" name="btnFilter" class="button" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						&nbsp;&nbsp;&nbsp;
                    <input id="btnReturn" onclick="Close();" type="button"
                        value="放弃选择" name="btnReturn" class="button">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
