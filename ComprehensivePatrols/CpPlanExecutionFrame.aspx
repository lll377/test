<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CpPlanExecutionFrame.aspx.cs" Inherits="M_Main.ComprehensivePatrols.CpPlanExecutionFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>任务执行跟进</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>

    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
            padding: 0px;
            margin: 0px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="commTree" data-options="region:'west',border:true,width:300,title:'项目'">
                <ul id="treeOrgan" class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,lines:true"></ul>
            </div>
            <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active" refpage="TaskNotComplete" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">未完成任务</a>
                        </li>
                        <li class="" refpage="TaskExpired" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">已过期任务</a>
                        </li>
                        <li class="" refpage="TaskCompleted" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">已完成任务</a>
                        </li>
                        <li class="" refpage="TaskStayExamine" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false">待审核任务</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body" style="padding: 0px;">
                                <iframe id="TaskNotComplete" src="" style="width: 100%; border: none;" class="iframe"></iframe>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <iframe id="TaskExpired" src="" style="width: 100%; border: none;" class="iframe"></iframe>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <iframe id="TaskCompleted" src="" style="width: 100%; border: none;" class="iframe"></iframe>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <iframe id="TaskStayExamine" src="" style="width: 100%; border: none;" class="iframe"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input id="LoginRoleCode" type="hidden" name="LoginRoleCode" runat="server" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#layout").css("height", h + "px");
                $("#commTree").css("height", h + "px");
                $("#layout_center").css("height", h + "px");
                $(".iframe").css({ "height": h - 38 + "px" });
            }
            InitTableHeight();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            //机构
            function LoadOrganTree() {
                $("#treeOrgan").tree({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    treeField: 'text',
                    idField: 'id',
                    lines: true,
                    border: false,
                    loadMsg: '加载中,请稍侯...',
                    onLoadSuccess: function (node, data) {
                        //LoadList();
                        //默认选中第一个节点
                        if (data.length > 0) {
                            var commid = GetQueryString('CommID');
                            var node = $('#treeOrgan').tree('find', data[0].id);
                            var firstnode = null;
                            if (commid == '' && commid == '0') {
                                firstnode = SelectFirsLeafNode(node);
                            }
                            else {
                                var str = JSON.stringify(data);
                                str = str.substr(0, str.indexOf(commid));
                                str = str.substr(str.lastIndexOf("OrganCode") + 12, 30);
                                str = str.substr(0, str.indexOf('\"'));
                                debugger
                                firstnode = $('#treeOrgan').tree('find', str);

                            }
                            if (firstnode) {
                                $('#treeOrgan').tree('select', firstnode.target);
                            } else {
                                //LoadList();
                            }
                        }
                    },
                    onBeforeSelect: function (node) {
                        if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                            return false;
                        }
                    },
                    onBeforeLoad: function (row, param) {
                        localStorage.removeItem('CpCommId');
                        param.Method = "DataPost";
                        param.Class = "CpComPatrols";
                        param.Command = "DepMenuList";
                        //控制用户权限
                        param.SelRoleCode = $("#LoginRoleCode").val();

                    },
                    onSelect: function (row) {
                        //var isLeaf = $("#treeOrgan").tree('isLeaf', row.target);
                        //if (isLeaf) {
                        //    localStorage.setItem("CpCommId", row.attributes.CommID);
                        //    $(window.document).contents().find("#ifrMain")[0].contentWindow.Load();
                        //} else {
                        //    localStorage.removeItem('CpCommId');
                        //}
                        var page = $('.active')[0].attributes[1].value;
                        $(".tabs-container li").each(function () {
                            if ($(this).attr("refpage") != page) {
                                $(this).attr("refsel", "0");
                            } else {
                                localStorage.setItem("CpCommId", row.attributes.CommID);
                                if (GetQueryString('isDesk') == '1') {
                                    $("#" + page).attr("src", page + ".aspx?isDesk=1&CommID=" + row.attributes.CommID);
                                } else {
                                    $("#" + page).attr("src", page + ".aspx?CommID=" + row.attributes.CommID);
                                }
                            }
                        });
                    }
                });
            }


            //递归 获取第一个子节点
            function SelectFirsLeafNode(FirstNode) {
                var ItemFirstNode = null;
                function dd(node) {
                    if (!$('#treeOrgan').tree("isLeaf", node.target)) {
                        var Children = $('#treeOrgan').tree("getChildren", node.target);
                        dd(Children[0]);
                    } else {
                        ItemFirstNode = node;
                    }
                }
                var i = 9999;
                while (1 < i) {
                    if (ItemFirstNode == null) {
                        dd(FirstNode);
                    } else {
                        break;
                    }
                    i = i - 1;
                }
                return ItemFirstNode;
            }

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                if (refsel == 0) {
                    var SelecteTreeNode = $('#treeOrgan').tree("getSelected");
                    if (SelecteTreeNode != null) {
                        localStorage.setItem("CpCommId", SelecteTreeNode.attributes.CommID);
                        $("#" + refpage).attr("src", refpage + ".aspx?CommID=" + SelecteTreeNode.attributes.CommID);
                        $(this).attr("refsel", "1");
                    }
                }
            });
            LoadOrganTree();
        </script>
    </form>
</body>
</html>
