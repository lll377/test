<%@ Page Language="c#" CodeBehind="MultiCorpCommCostDlg.aspx.cs" AutoEventWireup="false" Inherits="M_Main.DialogNew.MultiCorpCommCostDlg" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
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
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
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
        if (self.returnValue == "") {
            HDialog.Info("请选择!");
            return false;
        }

        HDialog.Close(self.returnValue);
        return true;
    }
    function btnReturn_onclick() {
        self.returnValue = "";
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
            nameIsHTML: true
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
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        var ckNodes = zTree.getCheckedNodes(true);
        var CostIDs = "";
        var CostNames = "";
        var PrentCostCodes = "";
        var SysCostSign = "";
        var IsSealed = "";
        for (var i = 0, l = ckNodes.length; i < l; i++) {
            if (ckNodes[i].checked) {
                if (ckNodes[i].CostID != null && ckNodes[i].isParent != true) {
                    CostIDs += ckNodes[i].CostID + ",";
                    CostNames += ckNodes[i].CostName + ",";
                    PrentCostCodes += ckNodes[i].PrentCostCode + ",";
                    SysCostSign += ckNodes[i].SysCostSign + ",";
                    IsSealed += ckNodes[i].IsSealed + ",";
                }
            }
        }
        if (CostIDs.length > 0) CostIDs = CostIDs.substring(0, CostIDs.length - 1);
        if (CostNames.length > 0) CostNames = CostNames.substring(0, CostNames.length - 1);
        if (PrentCostCodes.length > 0) PrentCostCodes = PrentCostCodes.substring(0, PrentCostCodes.length - 1);

        if (SysCostSign.length > 0) SysCostSign = SysCostSign.substring(0, SysCostSign.length - 1);
        if (IsSealed.length > 0) IsSealed = IsSealed.substring(0, IsSealed.length - 1);
        self.returnValue = CostIDs + "\t" + CostNames + "\t" + PrentCostCodes + "\t" + SysCostSign + "\t" + IsSealed;
    }


    var treeObj;
    $(document).ready(function () {

        treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        treeObj.setting.check.chkboxType = { "Y": "ps", "N": "ps" };

    });
    function allCheckbox(obj) {
        console.log(zNodes);
        treeObj.checkAllNodes(obj.checked);

        var CostIDs = "";
        var CostNames = "";
        var PrentCostCodes = "";
        var SysCostSign = "";
        var IsSealed = "";
        for (var i = 0, l = zNodes.length; i < l; i++) {
            if (zNodes[i].CostID != null) {
                CostIDs += zNodes[i].CostID + ",";
                CostNames += zNodes[i].CostName + ",";
                PrentCostCodes += zNodes[i].PrentCostCode + ",";
                SysCostSign += zNodes[i].SysCostSign + ",";
                IsSealed += zNodes[i].IsSealed + ",";
            }
        }
        if (CostIDs.length > 0) CostIDs = CostIDs.substring(0, CostIDs.length - 1);
        if (CostNames.length > 0) CostNames = CostNames.substring(0, CostNames.length - 1);
        if (PrentCostCodes.length > 0) PrentCostCodes = PrentCostCodes.substring(0, PrentCostCodes.length - 1);

        if (SysCostSign.length > 0) SysCostSign = SysCostSign.substring(0, SysCostSign.length - 1);
        if (IsSealed.length > 0) IsSealed = IsSealed.substring(0, IsSealed.length - 1);
        self.returnValue = CostIDs + "\t" + CostNames + "\t" + PrentCostCodes + "\t" + SysCostSign + "\t" + IsSealed;
        console.log(CostIDs + "\t" + CostNames + "\t" + PrentCostCodes + "\t" + SysCostSign + "\t" + IsSealed);
    }
    var zNodes =<%= nodesNew %>;
    </script>
</head>
<body style="overflow: auto">
    <form id="MultiCorpCommCostDlg" method="post" runat="server">
        <input id="hiCommID" name="hiCommID" type="hidden" runat="server" />
        <table style="width: 100%; top: 0; position: fixed;">

            <tr>
                <td class="TdContent" height="22">
                    <asp:CheckBox ID="IsHis" runat="server" Text="历史项目" AutoPostBack="True"></asp:CheckBox>&nbsp;项目名称：
                        <input id="CostName" type="text" size="18" name="StanName" style="width: 150px; height: 22px"
                            runat="server" maxlength="100" />
                    &nbsp;&nbsp;<input class="button" id="btnFilter" type="submit" value="查询" name="btnFilter"
                        runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();"
                            type="button" value="清空" name="btnClear" />
                </td>
            </tr>
        </table>
        <table style="width: 100%; padding-top: 22px">
            <tr>
                <td height="3"></td>
            </tr>
        </table>
        <tr>
            <td valign="top" width="100%" bgcolor="#ffffff">
                <input type="checkbox" id="check1" onclick="javascript: allCheckbox(this)" />全选
                    <div style="width: 100%; height: 325px; overflow-y: scroll;">
                        <ul id="treeDemo" class="ztree" style="overflow: auto" runat="server"></ul>
                    </div>
            </td>
        </tr>
        <tr>
            <td height="3"></td>
        </tr>
        </table>
            <table style="width: 100%; bottom: 0; position: fixed;">
                <tr>
                    <td height="30" align="center">
                        <input id="SelReturn" style="width: 20px; height: 22px" type="hidden" size="1" name="SelReturn"
                            runat="server" /><input id="TvCheck" style="width: 48px; height: 22px" type="hidden" size="2" name="TvCheck"
                                runat="server" /><input id="TvUncheck" style="width: 48px; height: 22px" type="hidden" size="2" name="TvUncheck"
                                    runat="server" /><input class="button" id="btnSelect" onclick="javascript: if (btnOK_onclick() == false) return false;"
                                        type="button" value="选择" name="btnFilter" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						&nbsp;&nbsp;&nbsp;
                        <input class="button" id="btnReturn" onclick="javascript: btnReturn_onclick();"
                            type="button" value="放弃选择" name="btnReturn" /><input id="IncidentID" style="width: 22px; height: 22px" type="hidden" size="1" runat="server"><input id="CostGeneType" style="width: 22px; height: 22px" type="hidden" size="1" name="CostGeneType"
                                runat="server" /><input id="IsOutSel" style="width: 22px; height: 22px" type="hidden" size="1" name="IsOutSel"
                                    runat="server" /><input id="hiIsHis" style="width: 32px; height: 22px" type="hidden" size="1" name="hiIsHis"
                                        runat="server" /><input id="IsShowHis" style="width: 32px; height: 22px" type="hidden" size="1" name="IsShowHis"
                                            runat="server" /><input id="IsParking" style="width: 32px; height: 22px" type="hidden" size="1" name="IsShowHis"
                                                runat="server" /><input id="CostType" style="width: 32px; height: 22px" type="hidden" size="1" name="CostType"
                                                    runat="server" /></td>
                </tr>
            </table>
    </form>
</body>
</html>
