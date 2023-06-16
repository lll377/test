<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Commsynopsis.aspx.cs" Inherits="M_Main.Desktop.Commsynopsis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>核查点位列表</title>

    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet">
    <script type="text/javascript" src="../jscript/Cache.js"></script>

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>


    <style type="text/css">
        .BtnDownOn {
            background-image: url("../images/funtitle_detail.gif");
            border: 1px solid #cccccc;
            width: 80%;
            margin-left: 10%;
            margin-top: 10px;
            height: 30px;
            text-align: center;
            line-height: 30px;
        }

        .BtnDownOff {
            border: 1px solid #cccccc;
            border: 1px solid #cccccc;
            width: 80%;
            margin-left: 10%;
            margin-top: 10px;
            height: 30px;
            text-align: center;
            line-height: 30px;
        }
    </style>
    <script type="text/javascript">
        function ChangeTitle(obj) {
            if (obj == 1) {
                $('#divMenuTree').css('display', 'none');
                document.getElementById("Depart").className = "BtnDownOn";
                document.getElementById("Depart2").className = "BtnDownOff";

                $.tool.DataPost('Affiche', 'GetCommIntro', 'OrganCode=' + document.getElementById("OrganCode").value + '&CommID=' + document.getElementById("HdCommID").value,
                    function Init() {
                    },
                    function callback(_Data) {
                        
                        document.getElementById("Content").innerHTML = _Data;

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            else {
                $('#divMenuTree').css('display', '');
                document.getElementById("Depart2").className = "BtnDownOn";
                document.getElementById("Depart").className = "BtnDownOff";
            }

        }

    </script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server">

        <div style="width: 100%; height: 100%">
            <div style="width: 14%; float: left; height: 590px; overflow: auto;">
                <div class="BtnDownOn" id="Depart" onclick="ChangeTitle(1);">公司简介</div>
                <div class="BtnDownOff" id="Depart2" onclick="ChangeTitle(2);">项目简介</div>
                <div id="divMenuTree" style="display: none;">
                    <ul class="list-group" id="SwitchOrganList" style="padding: 8px;">
                    </ul>
                </div>
            </div>
            <div style="width: 85%; float: left; height: 100%; margin-top: 2px; border-left: 1px solid #cccccc;">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="ibox">
                        <div class="ibox-content">
                            <div id="Content" runat="server" style="margin-top: 25px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <input type="hidden" id="HdLeftMenu" name="HdLeftMenu" runat="server" />
        <input type="hidden" id="HdSwitchMenu" name="HdSwitchMenu" runat="server" />
        <input type="hidden" id="HdCommID" name="HdCommID" runat="server" />
        <input type="hidden" id="HdOrganCode" name="HdOrganCode" runat="server" />
        <input class="button" id="btnSave" style="display: none"
            type="button" value="保存" name="btnFilter" runat="server" />
        <input id="hidID" type="hidden" size="2" name="hidID" runat="server" />
        <input id="SelIndex" type="hidden" size="2" name="SelIndex" runat="server" />
        <input id="OrganCode" type="hidden" size="2" value="01" name="OrganCode" runat="server" />
        <input id="OrganName" type="hidden" size="2" name="OrganName" runat="server" />
        <input id="PrentOrganCode" type="hidden" name="PrentOrganCode" runat="server" />
        <input id="varReturn" type="hidden" name="varReturn" runat="server" />
        <input id="Object" type="hidden" name="Object" runat="server" />
        <input id="InPopedom" type="hidden" name="InPopedom" runat="server" />
        <input id="City" type="hidden" name="City" runat="server" />
        <input id="Point" type="hidden" name="Point" runat="server" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            //加载项目节点
            function getFont(treeId, node) {
                return node.font ? node.font : {};
            }

            //构造树结构,菜单功能树及切换项目树
            function FrameTree(_Data, _OrganCode, _CommID) {
                this.TreeList = '';
                this.OrganCode = _OrganCode;
                this.CommID = _CommID;
                this.Data = _Data;
            }
            FrameTree.prototype = {
                constructor: FrameTree,
                SwitchOrgan: function (Obj, OrganCode, CommID, RoleOrgan) {
                    $("#SwitchOrganList a").removeClass("active");
                    $("#OrganCode").val(OrganCode);
                    $(Obj).addClass("active");
                    if (RoleOrgan != 'undefined' && RoleOrgan != '') {
                        $.tool.DataPost('Affiche', 'GetCommIntro', 'OrganCode=' + OrganCode + '&CommID=' + CommID,
                             function Init() {
                             },
                             function callback(_Data) {

                                 document.getElementById("Content").innerHTML = _Data;
                             },
                             function completeCallback() {
                             },
                             function errorCallback() {
                             });
                    }
                },
                ShowOrganTree: function () {
                    var varObjects = eval("(" + this.Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    for (var i = 0; i < varObjects.length; i++) {
                        var strClass = '';

                        if (this.CommID != '0') {
                            if (varObjects[i].attributes.InPopedom == this.CommID) {
                                strClass = "list-group-item active";
                            }
                            else {
                                strClass = "list-group-item";
                            }
                        }
                        else {
                            if (varObjects[i].id == this.OrganCode) {
                                strClass = "list-group-item active";
                            }
                            else {
                                strClass = "list-group-item";
                            }
                        }
                        this.TreeList = this.TreeList + "<a href='#' onclick=\"Tree.SwitchOrgan(this,'" + varObjects[i].id + "','','" + varObjects[i].attributes.RoleOrgan + "');\" type=\"button\" class=\"" + strClass + "\"><i class=\"fa fa-windows\"></i>&nbsp;" + varObjects[i].text + "</a>";
                        var Leaf = "&nbsp;&nbsp;";
                        if (varObjects[i].children.length > 0) {
                            this.ShowChildOrganTree(varObjects[i].children, Leaf);
                        }
                    }
                    $("#SwitchOrganList").append(this.TreeList);
                },
                ShowChildOrganTree: function (ChildTree, Leaf) {
                    var strHref = '';
                    Leaf = Leaf + "&nbsp;&nbsp;&nbsp;&nbsp;";
                    for (var i = 0; i < ChildTree.length; i++) {
                        var Sign = '';
                        if (ChildTree[i].attributes.IsComp == '1') Sign = '<i class=\"fa fa-windows\"></i>&nbsp;';
                        else {
                            if (ChildTree[i].attributes.InPopedom != '0') {
                                Sign = '<i class=\"fa fa-home\"></i>&nbsp;';
                            }
                            else {
                                Sign = '<i class=\"fa fa-folder\"></i>&nbsp;';
                            }
                        }

                        var strClass = '';
                        if (this.CommID != '0') {
                            if (ChildTree[i].attributes.InPopedom == this.CommID) {
                                strClass = "list-group-item active";
                            }
                            else {
                                strClass = "list-group-item";
                            }
                        }
                        else {
                            if (ChildTree[i].id == this.OrganCode) {
                                strClass = "list-group-item active";
                            }
                            else {
                                strClass = "list-group-item";
                            }
                        }

                        this.TreeList = this.TreeList + "<a href='#' onclick=\"Tree.SwitchOrgan(this,'" + ChildTree[i].id + "','" + ChildTree[i].attributes.InPopedom + "','" + ChildTree[i].attributes.RoleOrgan + "');\" type=\"button\" class=\"" + strClass + "\">" + Leaf + Sign + ChildTree[i].text + "</a>";
                        if (ChildTree[i].children != null && ChildTree[i].children != 'undefine') {
                            //如果有下拉菜单增加下拉图标,否则为链接
                            if (ChildTree[i].children.length > 0) {
                                this.ShowChildOrganTree(ChildTree[i].children, Leaf);
                            }
                        }
                    }
                },
                ShowTree: function () {
                    var varObjects = JSON.parse(this.Data); //转换为json对象
                    for (var i = 0; i < varObjects.length; i++) {
                        var InitExpand = "";
                        if (i == 0) InitExpand = "active"; else InitExpand = "";

                        var Leaf = 1;
                        var strHref = varObjects[i].attributes.URLPage;

                        if (varObjects[i].children != null) {
                            this.TreeList = this.TreeList + "<li class=\"" + InitExpand + "\"><a href=\"#\"><i class=\"fa " + varObjects[i].iconCls + "\"></i><span class=\"nav-label\">" + varObjects[i].text + "</span><span class=\"fa arrow\"></span></a>";
                            if (varObjects[i].children.length > 0) {
                                this.ShowChildTree(varObjects[i].children, Leaf);
                            }
                        }
                        else {
                            this.TreeList = this.TreeList + "<li class=\"" + InitExpand + "\"><a class=\"J_menuItem\" href=\"../" + strHref + "?V=" + i + "\"><i class=\"fa " + varObjects[i].iconCls + "\"></i><span class=\"nav-label\">" + varObjects[i].text + "</span><span class=\"fa arrow\"></span></a>";
                        }


                        this.TreeList = this.TreeList + "</li>";
                    }
                    $("#side-menu").append(this.TreeList);
                },
                ShowChildTree: function (ChildTree, Leaf) {
                    var strHref = '';
                    var LeafSign = 'fourth';
                    Leaf = Leaf + 1;
                    if (Leaf == 2) LeafSign = 'second';
                    if (Leaf == 3) LeafSign = 'third';
                    if (Leaf == 4) LeafSign = 'fourth';
                    if (Leaf == 5) LeafSign = 'fifth';
                    if (Leaf == 6) LeafSign = 'sixth';
                    this.TreeList = this.TreeList + "<ul class=\"nav nav-" + LeafSign + "-level\">";
                    for (var i = 0; i < ChildTree.length; i++) {
                        strHref = ChildTree[i].attributes.URLPage;
                        if (strHref == 'undefine' || strHref == '') strHref = '#';
                        if (ChildTree[i].children != null && ChildTree[i].children != 'undefine') {
                            //如果有下拉菜单增加下拉图标,否则为链接
                            if (ChildTree[i].children.length > 0) {
                                this.TreeList = this.TreeList + "<li class=\"J_menuItem\"><a href=\"#\">" + ChildTree[i].text + "<span class=\"fa arrow\"></span></a>";
                                this.ShowChildTree(ChildTree[i].children, Leaf);
                            }
                            else {
                                this.TreeList = this.TreeList + "<li class=\"J_menuItem\"><a class=\"J_menuItem\" href=\"../" + strHref + "\">" + ChildTree[i].text + "<span class=\"fa arrow\"></span></a>";
                            }
                        }
                        else {
                            this.TreeList = this.TreeList + "<li class=\"J_menuItem\"><a class=\"J_menuItem\" href=\"../" + strHref + "\">" + ChildTree[i].text + "</a>";
                        }
                        this.TreeList = this.TreeList + "</li>";
                    }
                    this.TreeList = this.TreeList + "</ul>";
                }
            }

            var Tree = new FrameTree($("#HdLeftMenu").val(), '', '');
            Tree.ShowTree();
            Tree = new FrameTree($("#HdSwitchMenu").val(), $("#HdOrganCode").val(), $("#HdCommID").val());
            Tree.ShowOrganTree();



            function InitTableHeight() {
                var h = $(window).height() - 30;
                $("#Content").css("height", h + "px");
            }
            InitTableHeight();

            ChangeTitle(1);
        </script>
        <script src="../jscript/QualityDictionaryCanNull.js" type="text/javascript"></script>
    </form>
</body>
</html>
