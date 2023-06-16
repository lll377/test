<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentTree.aspx.cs" Inherits="M_Main.SysNew.DepartmentTree" %>

<!DOCTYPE html>
<html>
<head>
    <title>DepartmentTree</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <%--授权专用easyui.js 改过源码--%>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.empower.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
</head>
<body>
    <input type="hidden" id="GeneralHeadquarters" name="GeneralHeadquarters" value="0" runat="server" />
    <form id="DepartmentTree" method="post" runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="1" style="margin-top: 2px;">
            <tr class="zb">
                <td style="padding-left: 10px;">
                    <asp:HyperLink ID="LinkAll" runat="server" NavigateUrl="../SysNew/DepartmentRoleBrowse.aspx?DepCode=All" Target="DepartmentRoleBrowse">全部岗位</asp:HyperLink></td>
            </tr>
            <tr class="zb">
                <td style="padding-left: 10px;">
                    <asp:HyperLink ID="LinkEmpty" runat="server" NavigateUrl="../SysNew/DepartmentRoleBrowse.aspx?DepCode=Empty" Target="DepartmentRoleBrowse">通用岗位</asp:HyperLink></td>
            </tr>
            <tr>
                <td valign="top">
                    <div id="tree" ></div>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        $(function () {
            if ($("#GeneralHeadquarters").val() == "1") {
                $(".zb").hide();
            }
            InitDataTree();
        });

        //机构树
        function InitDataTree() {
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    if (data.length == 1) {
                        //默认展开第一个节点
                        $("#tree").tree("expand", $("#tree").tree("getChildren")[0].target)
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "Empower_Utils";
                    param.Method = "GetTreeDepartment";
                },
                onBeforeSelect: function (node) {
                    // if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                    //    return false;
                    //}
                    $("#DepartmentRoleBrowse",parent.document).attr("src", "DepartmentRoleBrowse.aspx?DepCode=" + node.attributes.SortDepCode);
                },
                onSelect: function (row) {

                    //InitDataGrid();
                }
            });
        }
      <%--  var setting = {
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
            }
        };
        function getFont(treeId, node) {
            return node.font ? node.font : {};
        }
        var n =<%= depTreeString %>;

        var newN = [];
        for (var i = 0; i < n.length; i++) {
            newN[i] = { SortDepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"] + "", url: "DepartmentRoleBrowse.aspx?DepCode=" + n[i]["SortDepCode"], target: "DepartmentRoleBrowse" };
        }
        treeObj = $.fn.zTree.init($("#treeDemo"), setting, newN);
        treeObj.expandAll(false);--%>
					//zTree = $("#treeDemo").zTree(setting,zNodes);
    </script>
</body>
</html>
