<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrationMultiple.aspx.cs" Inherits="M_Main.OAWorkFlowNew.AdministrationMultiple" %>

<!DOCTYPE html>
<html>
<head>
    <title>部门级别人员设置</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
    <style>
        body {
            font-size: 12px;
            font-family: 微软雅黑;
            padding-top: 5px;
        }
    </style>
</head>
<body>
    <form id="frmForm" method="post" runat="server">
        <input id="TxtHaveSelList" type="hidden" name="InfoId" runat="server">
        <input id="OperatorTxt" type="hidden" name="InfoId" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td valign="top" bgcolor="#ffffff">
                    <table cellspacing="0" cellpadding="0" border="0" align="center" style="width: 100%; height: 100%;">
                        <tr>
                            <td colspan="3" style="padding-left: 10px;">管理级别：
									<asp:DropDownList ID="OprLevelList" runat="server"></asp:DropDownList>&nbsp;&nbsp;&nbsp;级别用户：<input id="Operator" readonly runat="server" style="border: 1px solid #cccccc; height: 22px; width: 400px;">&nbsp;&nbsp;<img title="请选择处理人员" style="cursor: pointer;" onclick="WorkFlowSelOpr();" src="../images/OAWorkFlow/add.gif"></td>
                        </tr>

                        <tr>
                            <td style="width: 45%" align="center">待选列表</td>
                            <td style="width: 10%; height: 17px" align="center"></td>
                            <td style="width: 45%" align="center">已选列表</td>
                        </tr>
                        <tr>
                            <td style="height: 440px; padding-top: 5px;" valign="middle" align="center">
                                <div id="treeDemo" class="ztree" style="width: 95%; height: 100%; overflow-y: auto;" size="24"></div>
                                <script type="text/javascript">
                                    //$(document).ready(function () {
                                    var setting = {
                                        data: {
                                            simpleData: {
                                                enable: true,
                                                idKey: "SortDepCode",
                                                pIdKey: "PrentDepCode"
                                            },
                                            key: {
                                                name: "DepName"
                                            }
                                        },
                                        view: {
                                            fontCss: getFont,
                                            nameIsHTML: true
                                        }, check: {
                                            enable: true,
                                            chkStyle: "checkbox",    //复选框
                                            chkboxType: {
                                                "Y": "s",
                                                "N": "ps"
                                            }
                                        },
                                        //callback: {
                                        //    onDblClick: zTreeOnDblClick
                                        //}

                                    };
                                    function getFont(treeId, node) {
                                        return node.font ? node.font : {};
                                    }
                                    var n =<%= depTreeString %>;

                                    var newN = [];
                                    for (var i = 0; i < n.length; i++) {

                                        newN[i] = { SortDepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"] + "(" + n[i]["DepUserCount"] + ")" };
                                        n.nocheck = false;
                                    }
                                    treeObj = $.fn.zTree.init($("#treeDemo"), setting, newN);
                                    treeObj.expandAll(true);

                                    //function zTreeOnDblClick(event, treeId, treeNode) {
                                    //    var HaveLb = document.all.HaveSelList;
                                    //    if (treeNode) {
                                    //        AddListBox(HaveLb, treeNode.DepName, treeNode.SortDepCode);
                                    //    }
                                    //    return false;
                                    //}
                                    //})
                                </script>

                                <%--<select id="WaitSelList" style="WIDTH: 95%; HEIGHT: 100%;" size="24" runat="server"></select>--%>
                            </td>
                            <td style="height: 440px" align="center">
                                <input class="button" id="Button1" onclick="LeftToRight();" type="button"
                                    value="添加">
                                <br>
                                <br>
                                <input class="button" id="Button2" onclick="RightToLeft();" type="button"
                                    value="删除">
                                <br>
                                <br>
                                <input class="button" id="Button3" onclick="ALLLeftToRight();" type="button"
                                    value="全选">
                                <br>
                                <br>
                                <input class="button" id="Button4" onclick="AllRightToLeft();" type="button"
                                    value="全删">
                            </td>
                            <td style="height: 440px; padding-top: 5px" valign="middle" align="center">
                                <select id="HaveSelList" style="width: 95%; height: 100%;" size="24" runat="server"></select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 15px;"></td>
                        </tr>
                        <tr>
                            <td valign="middle" align="center" colspan="3">
                                <input type="submit" class="button" id="BtnOk" runat="server" value="确定" onclick="return checkValue();" onserverclick="BtnOk_ServerClick" />
                                <input type="submit" class="button" id="BtnDel" runat="server" value="取消" onclick="return checkValue();" onserverclick="BtnDel_ServerClick" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            function checkValue() {
                var HaveLb = document.all.HaveSelList;
                if (document.all.OperatorTxt.value == "") {
                    window.alert("请选择级别用户");
                    return false;
                }
                if (HaveLb.options.length == 0) {
                    window.alert("请选择部门");
                    return false;
                }
                document.all.TxtHaveSelList.value = "";

                for (var i = 0; i < HaveLb.options.length; i++) {
                    document.all.TxtHaveSelList.value = document.all.TxtHaveSelList.value + HaveLb.options[i].value + ",";
                }
                var RetStr = document.all.TxtHaveSelList.value;
                document.all.TxtHaveSelList.value = RetStr.substring(0, RetStr.length - 1);

                return true;

            }

            function WorkFlowSelOpr() {
                HDialog.Open('800', '544', '../OAWorkFlowNew/SelOpr.aspx?Cmd=3&WorkInfoId=-1&random=' + Math.random(), '选择人员', false, function callback(_Data) {
                    if (_Data != '') {
                        var Ret = Cache.GetData("SelOrp.aspx_Return");
                        var obj = JSON.parse(Ret);
                        var TempUserList = "";
                        if (obj != null) {
                            var arrUserList = obj[0].split('|');
                            var arrUser = new Array();
                            for (var i = 0; i < arrUserList.length; i++) {
                                arrUser = arrUserList[i].split(',');
                                TempUserList = TempUserList + arrUser[1] + ",";
                            }
                            TempUserList = TempUserList.substring(0, TempUserList.length - 1);
                            document.all.OperatorTxt.value = TempUserList;
                            document.all.Operator.value = obj[1];
                        }
                    }
                });
            }

            function AddListBox(Lb, Txt, Value) {
                var NewOption = document.createElement("OPTION");
                NewOption.text = Txt;
                NewOption.value = Value;
                Lb.add(NewOption)
            }

            function ClearListBox(Lb) {
                while (Lb.options.length > 0) {
                    Lb.remove(0);
                }
            }

            function LeftToRight() {
                var HaveLb = document.all.HaveSelList;
                var WaitLb = document.all.treeDemo;
                var newN = [];
                for (var i = 0; i < n.length; i++) {
                    newN[i] = { SortDepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"] + "(" + n[i]["DepUserCount"] + ")" };
                }
                var treeObjs = $.fn.zTree.getZTreeObj("treeDemo");
                var nodes = treeObjs.getCheckedNodes(true);
                var v = "";
                for (var i = 0; i < nodes.length; i++) {
                    v += nodes[i].DepName + ",";
                    nodes[i].SortDepCode; //获取选中节点的值
                    AddListBox(HaveLb, nodes[i]["DepName"], nodes[i]["SortDepCode"]);
                }
                return;
            }

            function RightToLeft() {
                var HaveLb = document.all.HaveSelList;
                var WaitLb = document.all.treeDemo;
                var newN = [];
                for (var i = 0; i < n.length; i++) {
                    newN[i] = { SortDepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"] + "(" + n[i]["DepUserCount"] + ")" };
                }

                var treeObjs = $.fn.zTree.getZTreeObj("treeDemo");
                var nodes = treeObjs.getCheckedNodes(true);
                var v = "";

                for (var i = 0; i < nodes.length; i++) {
                    v += nodes[i].DepName + ",";
                    nodes[i].DepCode; //获取选中节点的值
                    HaveLb.remove(i);
                }
                HaveLb.remove(i);
                return;
            }

            function ClearWaitSelList() {
                var HaveLb = document.all.HaveSelList;
                var WaitLb = document.all.treeDemo;
                var newN = [];
                for (var i = 0; i < n.length; i++) {
                    newN[i] = { SortDepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"] + "(" + n[i]["DepUserCount"] + ")" };
                }

                var treeObjs = $.fn.zTree.getZTreeObj("treeDemo");
                var nodes = treeObjs.getCheckedNodes(true);
                var v = "";

                for (var i = 0; i < nodes.length; i++) {
                    v += nodes[i].DepName + ",";
                    nodes[i].DepCode; //获取选中节点的值
                    AddListBox(HaveLb, nodes[i]["DepName"], nodes[i]["SortDepCode"]);
                }
                return;
            }

            function ALLLeftToRight() {
                var HaveLb = document.all.HaveSelList;
                var WaitLb = document.all.treeDemo;
                var newN = [];
                for (var i = 0; i < n.length; i++) {
                    newN[i] = { SortDepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"] + "(" + n[i]["DepUserCount"] + ")" };
                }

                var treeObjs = $.fn.zTree.getZTreeObj("treeDemo");
                var nodes = treeObjs.getCheckedNodes(true);
                var v = "";

                for (var i = 0; i < nodes.length; i++) {
                    v += nodes[i].DepName + ",";
                    nodes[i].DepCode; //获取选中节点的值
                    AddListBox(HaveLb, nodes[i]["DepName"], nodes[i]["SortDepCode"]);
                }
                return;
            }

            //移除全部
            function AllRightToLeft() {
                var HaveLb = document.all.HaveSelList;
                HaveLb.length = 0;
                //var ItemArr = HaveLb;
                //for (var i = 0; i < ItemArr.length; i++) {
                //    HaveLb.remove(ItemArr[i]);
                //}

                //var HaveLb = document.all.HaveSelList;
                //var WaitLb = document.all.treeDemo;

                //var treeObjs = $.fn.zTree.getZTreeObj("treeDemo");
                //var nodes = treeObjs.getCheckedNodes(true);
                //var v = "";

                //for (var i = 0; i < nodes.length; i++) {
                //    v += nodes[i].DepName + ",";
                //    nodes[i].DepCode; //获取选中节点的值
                //    HaveLb.remove(i);
                //}
                // HaveLb.remove(0);
            }
        </script>
    </form>
</body>
</html>
