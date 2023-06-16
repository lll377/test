<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiCustCanDlgJH.aspx.cs" Inherits="M_Main.DialogNew.MultiCustCanDlgJH" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>


    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>


    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.excheck-3.5.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            overflow-x: hidden;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 74.5%;
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <form id="MultiCustCanDlg" runat="server">
        <table class="DialogTable" height="100%" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="2">客户选择</td>
            </tr>
            <tr>
                <td>
                    <div class="Container">
                        <div id="ContainerLeft" class="ContainerLeft">
                            <div id="OrganTree" style="border: none; width: 220px; overflow: auto;">
                                <table id="RoomFrameTree" style="overflow-y: auto; width: 220px;">
                                    <tr>
                                        <td valign="top">
                                            <div id="LeftTop1" style="width: 220px; text-align: center;">目录树</div>
                                            <div id="LeftTop2" style="width: 220px; text-align: center;">
                                                <asp:DropDownList ID="SelList" runat="server" AutoPostBack="True">
                                                    <%--<asp:ListItem Value="1">按组团区域</asp:ListItem>--%>
                                                    <asp:ListItem Value="2" Selected="True">按楼栋名称</asp:ListItem>
                                          <%--          <asp:ListItem Value="3">按房屋状态</asp:ListItem>
                                                    <asp:ListItem Value="4">按车位区域</asp:ListItem>
                                                    <asp:ListItem Value="5">按客户类型</asp:ListItem>
                                                    <asp:ListItem Value="6">按客户类别</asp:ListItem>
                                                    <asp:ListItem Value="7">按费用名称</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                            <div id="LeftTop3" style="overflow-y: auto;">
                                                <div style="overflow-y: auto;">
                                                    <ul id="treeDemo" class="ztree" runat="server">
                                                    </ul>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <%--                                    <tr>
                                        <td class="formTable_Item" style="font-size: 12px; height: 24px; font-weight: bold" align="center">
                                            <input style="height: 22px; z-index: 0" id="btnSelCost" class="button_six" value="确定选择费用"
                                                type="button" name="btnSelCost" runat="server" onclick="javascript:if (btnSelCost_onclick()==false) return false;"></td>
                                    </tr>--%>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div id="ContainerRight" class="ContainerRight" style="padding-left: 2px;">
                        <iframe id="frmTreeList" name="frmTreeList" src="about:blank" style="width: 100%; height: 100%;" frameborder="no"></iframe>
                    </div>
                </td>
                <%--<td class="formTable_ItemInput" valign="top" align="center" width="75%">
                    <table id="Table3" height="500px" cellspacing="1" cellpadding="1" width="100%" border="0">
                        <tr>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                </td>--%>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input class="button" id="btnSelect" onclick="javascript: if (btnOK_onclick() == false) return false;" type="button" value="选择确定" name="btnSelect" runat="server">
                    <input class="button" id="btnSelectAll" type="button" value="全部选择" name="btnSelectAll" runat="server">
                    <input id="btnReturn" onclick="javascript: HDialog.Close();" type="button" value="关闭" name="btnReturn" class="button"></td>
            </tr>
        </table>

        <input style="height: 22px; width: 32px; z-index: 0" id="RoomState" size="1" type="hidden"
            name="RoomState" runat="server"><input style="height: 22px; width: 32px; z-index: 0" id="RegionSNum" size="1" type="hidden"
                name="RegionSNum" runat="server"><input id="CarParkID" style="height: 22px; width: 32px" type="hidden" size="1" name="CarParkID"
                    runat="server"><input id="BuildSNum" style="height: 22px; width: 32px" type="hidden" size="1" name="BuildSNum"
                        runat="server"><input id="CustTypeID" style="height: 22px; width: 32px" type="hidden" size="1" name="CustTypeID"
                            runat="server"><input id="CommID" style="height: 22px; width: 32px" type="hidden" size="1" name="CommID"
                                runat="server"><input id="hiIsHis" style="height: 22px; width: 32px" type="hidden" size="1" name="hiIsHis"
                                    runat="server"><input id="hiLiveType" style="height: 22px; width: 32px" type="hidden" size="1" name="hiLiveType"
                                        runat="server"><input id="hiFindTree" style="height: 22px; width: 32px" type="hidden" size="1" name="hiFindTree"
                                            runat="server"><input id="SelReturn" style="height: 22px; width: 22px" type="hidden" size="1" name="SelReturn"
                                                runat="server"><input id="SelSQLEx" style="height: 22px; width: 22px" type="hidden" size="1" name="SelSQLEx"
                                                    runat="server"><input style="height: 22px; width: 22px; z-index: 0" id="CostIDs" size="1" type="hidden"
                                                        name="CostIDs" runat="server"><input style="height: 22px; width: 22px; z-index: 0" id="CostNames" size="1" type="hidden"
                                                            name="CostNames" runat="server"><input id="TvCheck" style="height: 22px; width: 48px" type="hidden" size="2" name="TvCheck"
                                                                runat="server"><input id="TvUncheck" style="height: 22px; width: 48px" type="hidden" size="2" name="TvUncheck"
                                                                    runat="server">
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $("#returnValue").val('');
            function InitFunction() {
                var h = $(window).height() - 65;
                var w = $(window).width() * 0.25 - 1;
                $("#OrganTree").css("height", h + "px");
                $("#RoomFrameTree").css("width", w + "px");
                $("#RoomFrameTree").css("height", h + "px");
                $("#frmTreeList").css("height", h + "px");
            }
            InitFunction();

            function btnOK_onclick() {
                var varRe = $("#SelReturn").val();
                if (varRe == "") {
                    HDialog.Info("请选择!");
                    return false;
                }
            }

            var setting = {
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "TreeCode",
                        pIdKey: "PrentTreeCode"
                    },
                    key: {
                        name: "TreeName"
                    }
                },
                view: {
                    fontCss: getFont,
                    nameIsHTML: true
                }
            };

            function SetFrame() {
                var strIsHis = $("#hiIsHis").val();
                var strCommID = $("#CommID").val();
                var strSelList = $("#SelList").val();
                var strBuildSNum = $("#BuildSNum").val();

                //按楼栋名称
                if (strSelList == "2") {
                    setting = {
                        data: {
                            simpleData: {
                                enable: true,
                                idKey: "TreeCode",
                                pIdKey: "PrentTreeCode"
                            },
                            key: {
                                name: "TreeName"
                            }
                        },
                        view: {
                            fontCss: getFont,
                            nameIsHTML: true
                        },
                        check: {
                            enable: true,
                            chkStyle: "checkbox",//显示 checkbox 选择框，默认checkbox可选择值radio
                            chkboxType: { "Y": "s", "N": "ps" }
                        },
                        callback: {
                            onCheck: onCheck
                        }
                    };
                    $("#frmTreeList").attr("src", "MultiCustCanRoomDlg_ListJH.aspx?BuildSNum=" + strBuildSNum + "&CommID=" + strCommID + "&IsHis=" + strIsHis);
                }
            }

            function getFont(treeId, node) {

                return node.font ? node.font : {};
            }

            var zNodes =<%= nodes %>;

            $(document).ready(function () {
                SetFrame()
                var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                treeObj.expandAll(true);

            });

            function beforeClick(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.checkNode(treeNode, !treeNode.checked, null, true);
                return false;
            }

            var strCommID = new Array();
            var strBuildSNum = new Array();
            var strUnitSNum = new Array();
            var strFloorSNum = new Array();

            function onCheck() {
                strCommID = new Array();
                strBuildSNum = new Array();
                strUnitSNum = new Array();
                strFloorSNum = new Array();

                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                var nodes = treeObj.getCheckedNodes(true);
                for (var i = 0; i < nodes.length; i++) {
                    strCommID.push(parseInt(nodes[i].CommID));
                    strBuildSNum.push(parseInt(nodes[i].BuildSNum));
                    strUnitSNum.push(parseInt(nodes[i].UnitSNum));
                    strFloorSNum.push(parseInt(nodes[i].FloorSNum));
                }

                strCommID = Array.from(new Set(strCommID));
                strBuildSNum = Array.from(new Set(strBuildSNum));
                strUnitSNum = Array.from(new Set(strUnitSNum));
                strFloorSNum = Array.from(new Set(strFloorSNum));

                //console.log(strBuildSNum);

                console.log(strCommID.toString() + "|" + strBuildSNum.toString() + "|" + strUnitSNum.toString() + "|" + strFloorSNum.toString());

                //window.location.href = "../DialogNew/MultiCustCanRoomDlg_ListJH.aspx?BuildSNum=" + strBuildSNum.toString() + "&UnitSNum=" + strUnitSNum.toString() + "&FloorSNum=" + strFloorSNum.toString() + "&CommID=" + strCommID.toString() + "";
                $("#frmTreeList").attr("src", "../DialogNew/MultiCustCanRoomDlg_ListJH.aspx?BuildSNum=" + strBuildSNum.toString() + "&UnitSNum=" + strUnitSNum.toString() + "&FloorSNum=" + strFloorSNum.toString() + "&CommID=" + strCommID.toString() + "");

            }
        </script>
    </form>
</body>
</html>
