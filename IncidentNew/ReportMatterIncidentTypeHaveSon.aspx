<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMatterIncidentTypeHaveSon.aspx.cs" Inherits="M_Main.IncidentNew.ReportMatterIncidentTypeHaveSon" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMatterIncidentTypeHaveSon.aspx.cs" Inherits="M_Main.IncidentNew.ReportMatterIncidentTypeHaveSon" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>报事类别选择(大类)</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache,  must-revalidate">
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <meta http-equiv="Expires" content="0">
    <base target="_self">

    <script language="javascript">

        self.returnValue = "";

        var setting = {
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "TypeCode",
                    pIdKey: "ReasonSortPrentCode"
                },
                key: {
                    name: "TypeName"
                }
            },
            view: {
                fontCss: getFont,
                nameIsHTML: true
            },
            callback: {
                beforeClick: beforeClick,
                //onCheck: onCheck
            }
        };

        function getFont(treeId, node) {

            return node.font ? node.font : {};
        }

        function beforeClick(treeId, treeNode) {

            return false;
        }


        function btnOK_onclick() {
            if (self.returnValue != "") {
                self.close();
                HDialog.ReturnIsJson = true;
                HDialog.Close(self.returnValue);
            }
        }
        function NodeItemClick(ReasonSortPrentCode, _data) {

            if (document.getElementById("IsOutSel").value == "1") {
                if (ReasonSortPrentCode == 0) {

                }
                if (ReasonSortPrentCode != "0") {

                }
                var varObjects = _data.split("|");
                $.tool.DataPost('ReportMatterAuditSet', 'GetReasonDetail', 'TypeID=' + varObjects[0],
                    function Init() {
                    },
                    function callback(_Data) {
                        var json = JSON.parse(_Data);
                        //console.log(_Data);
                        //console.log(json[0].IsHaveSon);
                        if (json[0].IsHaveSon == 1) {
                            HDialog.Info('只能选择最末层大类');
                            return false;
                        }
                        self.returnValue = _Data;
                        self.close();
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(self.returnValue);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            else {
                var varObjects = _data.split("|");

                $.tool.DataPost('ReportMatterAuditSet', 'GetReasonDetail', 'TypeID=' + varObjects[0],
                    function Init() {
                    },
                    function callback(_Data) {
                        var json = JSON.parse(_Data);
                        //console.log(_Data);
                        //console.log(json[0].IsHaveSon);
                        if (json[0].IsHaveSon == 1) {
                            HDialog.Info('只能选择最末层大类');
                            return false;
                        }
                        self.returnValue = _Data;
                        self.close();
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(self.returnValue);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

        }
        var zNodes =<%=zNodes %>;
        $(document).ready(function () {
            var newN = [];
            for (var i = 0; i < zNodes.length; i++) {
                var strData = "";
                for (var y in zNodes[i]) {
                    if (strData != "") {
                        strData += "|";
                    }
                    strData += zNodes[i][y];
                }
                newN[i] = {
                    TypeCode: zNodes[i]["TypeCode"],
                    ReasonSortPrentCode: zNodes[i]["ReasonSortPrentCode"],
                    TypeName: zNodes[i]["TypeName"],
                    click: "NodeItemClick('" + zNodes[i]["ReasonSortPrentCode"] + "','" + strData + "')"
                };
            }
            var treeObj = $.fn.zTree.init($("#treeDemo"), setting, newN);
            treeObj.setting.check.chkboxType = { "Y": "ps", "N": "ps" };
            treeObj.expandAll(true);

        });
    </script>
    <link href="../css/dialog.css" type="text/css" rel="stylesheet">
</head>
<body ms_positioning="GridLayout" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0"
    scroll="yes">
    <form id="CorpIncidentTypeDlg" method="post" runat="server">
        <table class="formTable" id="Table1" cellspacing="1" cellpadding="4" align="center" height="100%">
            <%--<TR>
					<TD CLASS="formTable_Header" ALIGN="center"><span id="lbl_WorkflowName">报事类别选择</span></TD>
				</TR>--%>
            <tr>
                <td height="22">&nbsp;名称：<input id="CostName" style="height: 22px; width: 30%" size="18" name="StanName" runat="server"
                    maxlength="100" class="Control_ItemInput">
                    <input class="button" id="btnFilter" style="height: 22px" type="submit" value="查询" name="btnFilter"
                        runat="server"><input class="button" id="btnClear" style="height: 22px" onclick="javascript: btnClear_OnClick();"
                            type="button" value="清空" name="btnClear">
                </td>
            </tr>
            <tr>
                <td class="formTable_ItemInput">
                    <div id="divMenuTree" style="overflow: auto; height: 100%; width: 100%">

                        <ul id="treeDemo" class="ztree" runat="server">
                        </ul>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="3"></td>
            </tr>
            <tr>
                <td height="30" class="formTable_Footer" align="center">
                    <input id="btnSelect" onclick="javascript: btnOK_onclick();" style="height: 22px" type="submit"
                        value="选择" name="btnFilter" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						&nbsp;&nbsp;&nbsp;
                    <input id="btnReturn" style="height: 22px" onclick="javascript: HDialog.Close();" type="button"
                        value="放弃选择" name="btnReturn" class="button_four"><input id="OldDefaultEntryID" style="height: 22px; width: 48px" type="hidden" size="2"
                            name="OldDefaultEntryID" runat="server"><input id="DefaultEntryID" style="height: 22px; width: 48px" type="hidden" size="2" name="DefaultEntryID"
                                runat="server"><input id="TvUncheck" style="height: 22px; width: 48px" type="hidden" size="2" name="TvUncheck"
                                    runat="server"><input id="TvCheck" style="height: 22px; width: 48px" type="hidden" size="2" name="TvCheck"
                                        runat="server"><input id="TvCheck2" style="height: 22px; width: 48px" type="hidden" size="2" name="TvCheck"
                                            runat="server"><input id="TvUncheck2" style="height: 22px; width: 48px" type="hidden" size="2" name="TvUncheck"
                                                runat="server"><input id="IsCheck" style="height: 22px; width: 48px" type="hidden" size="2" name="TvUncheck"
                                                    runat="server"><input id="IsOutSel" style="height: 22px; width: 22px" type="hidden" size="1" name="IsOutSel"
                                                        runat="server" value="0"><input id="hClassID" style="height: 22px; width: 22px" type="hidden" size="1" name="IsOutSel"
                                                            runat="server">
                    <input id="IsFastDeal" style="height: 22px; width: 22px" type="hidden" size="1" name="IsFastDeal"
                        runat="server">
                </td>

            </tr>
        </table>
    </form>
</body>
</html>

