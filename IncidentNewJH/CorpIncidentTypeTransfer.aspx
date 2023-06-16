<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpIncidentTypeTransfer.aspx.cs" Inherits="M_Main.IncidentNewJH.CorpIncidentTypeTransfer" %>

<%@ Register TagPrefix="dslbc" Namespace="DualSelectListBoxControl" Assembly="DualSelectListBoxControl" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事类别发送</title>
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
            valign: top;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            width: 25%;
            padding-right: 5px;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 73%;
        }
    </style>
</head>
<body style="padding: 0; margin: 0;">
    <form id="CorpCostStandardBatchManage" method="post" runat="server">
        <input id="SelIndex" type="hidden" name="SelIndex" runat="server">
        <input id="isSave" type="hidden" name="isSave" runat="server" value="0">
        <input id="Chk" type="hidden" name="Chk" runat="server">
        <input id="SelData" type="hidden" name="SelData" runat="server">
        <input id="Hidden1" type="hidden" name="Chk" runat="server">
        <input id="strData" type="hidden" name="strData" runat="server">
        <div id="ContainerLeft" class="ContainerLeft">
            <div id="OrganTree" style="border: none; width: 100%;">
                <ul id="treeDemo" class="ztree" runat="server"></ul>
            </div>
        </div>
        <div id="ContainerRight" class="ContainerRight">
            <div id="OrganCommManage" style="border: none; width: 100%;">
                <table class="DialogTable" id="Table1">
                    <tr>
                        <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事类别设置</td>
                    </tr>
                    <tr>
                        <td valign="top" align="center" width="70%" colspan="3">
                            <table class="DialogTable">
                                <tr>
                                    <td class="TdTitle"></td>
                                    <td class="TdContent">
                                        <asp:Label ID="LbSelText" runat="server"></asp:Label>的报事类别：</td>
                                    <td class="TdTitle"></td>
                                    <td class="TdContent">待设报事类别：</td>
                                </tr>
                            </table>
                            <dslbc:DualSelectListBox ID="DualListField" runat="server">
                                <LeftListStyle Width="200px" Height="250px"></LeftListStyle>
                                <RightListStyle Width="200px" Height="250px"></RightListStyle>
                            </dslbc:DualSelectListBox>
                            <table class="DialogTable">
                                <tr>
                                    <td class="TdTitle"></td>
                                    <td class="TdContent">
                                        <asp:Label ID="UserCount1" runat="server"></asp:Label></td>
                                    <td class="TdTitle"></td>
                                    <td class="TdContent">
                                        <asp:Label ID="UserCount2" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <input type="button" class="button" onclick="javascript: CheckData();" value="确定" runat="server" />
                            <input class="button" id="btnOK" style="display: none;" type="button" value="确定" name="btnOK" runat="server"></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width()*0.25-1;
            $("#OrganTree").css("width", w + "px");
            $("#OrganTree").css("height", h + "px");
            $("#OrganCommManage").css("height", h + "px");
        }
        InitFunction();

        function CheckData()
        {
            $("#isSave").val("1");
            $("#btnOK").click();
        }
			
        function NodeItemClick(strData)
        {
            $("#isSave").val("0");
            $("#strData").val(strData);
            document.forms[0].submit();
        }
			
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    idKey:"OrganCode",
                    pIdKey:"PrentOrganCode"
                },
                key: {
                    name: "OrganName"
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
        var n=<%=zNodes%>;
					
        var newN=[];
        for(var i=0;i<n.length;i++)
        {
            var strData="";
            for(var y in n[i])
            {
                strData=n[i]["InPopedom"]+","+n[i]["OrganName"]+","+n[i]["OrganCode"];
            }
            newN[i]={OrganCode:n[i]["OrganCode"],PrentOrganCode:n[i]["PrentOrganCode"],OrganName:n[i]["OrganName"],click:"NodeItemClick('"+strData+"')"};
	
        }
        treeObj=$.fn.zTree.init($("#treeDemo"), setting, newN);
        treeObj.expandAll(false);
        var node = treeObj.getNodeByParam("OrganCode",$("#SelIndex").val());
        treeObj.selectNode(node,false);
        //zTree = $("#treeDemo").zTree(setting,zNodes);
    </script>
</body>
</html>
