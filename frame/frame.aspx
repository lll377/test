<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frame.aspx.cs" Inherits="M_Main.frame.frame" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title><%=OrganName %>智慧物业管理平台</title>
    <!--[if lt IE 8]>   
    <meta http-equiv="refresh" content="0;ie.html"  />
    <![endif]-->
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet">
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style>
        .TopConatiner {
            z-index: 10000000;
            text-align: center;
            top: 0;
            position: fixed;
            width: 100%;
            height: 25px;
        }

        .TopTitle {
            z-index: 10000000;
            text-align: center;
            top: 0;
            position: fixed;
            width: 100%;
            height: 25px;
            color: #f5f5f5;
            font-weight: bold;
        }

        .TopShape {
            width: 400px;
            height: 20px;
            margin: 0px auto;
            color: white;
            font-family: 微软雅黑;
            background-color: transparent;
            border-top: 20px solid #C6C6C6;
            border-left: 20px solid transparent;
            border-right: 20px solid transparent;
        }

        .SearchCommon {
            border: 1px solid #cccccc;
        }
    </style>
</head>
<%--<13>--%>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden" onunload="onUnload_handler()" onbeforeunload="onUnload_handler()">
    <div class="TopConatiner">
        <div class="TopShape"></div>
    </div>
    <div class="TopTitle">
        <%=OrganName %>智慧物业管理平台
    </div>
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close">
                <i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span>
                                <img id="imgHeadPortrait" alt="image" runat="server" class="img-circle" style="width: 64px; height: 64px;" src="../Jscript-Ui/hplus/img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs"><strong class="font-bold"><%=UserName %></strong></span>
                                    <span class="text-muted text-xs block"><%=OrganName %><b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li>
                                    <a class="J_menuItem" href="changepassword.aspx">修改密码</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="../SysNew/MessageFrame.aspx">在线短信</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="../OAPublicWorkNew/WorkRecordFrame.aspx">工作日志</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="../SysNew/UserCalendarWeek.aspx">我的日程</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="<%=LoginUrl %>?CorpID=<%=CorpID%>">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">TW</div>
                    </li>

                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i></a>
                        <div class="navbar-form-custom">
                            <div class="navbar-form-custom form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="Word " id="Word">
                            </div>
                        </div>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-pencil"></i><span class="label label-warning" id="LatestAfficheCount_1" runat="server">0</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li>
                                    <a class="J_menuItem" id="LatestAfficeDetailInfo" runat="server">
                                        <div>
                                            <i class="fa fa-bell"></i><span id="AfficheInfo" runat="server">暂无最新公告</span>
                                            <span class="pull-right text-muted small"><span id="AfficheTime" runat="server">0秒前</span></span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a class="J_menuItem" id="LatestAfficeDetailHref" runat="server">
                                        <div>
                                            <i class="fa fa-bell"></i>最近有<span id="LatestAfficheCount_2" runat="server">0</span>条新公告
                                            <span class="pull-right text-muted small"><span id="LatestAfficheTime" runat="server">0秒前</span></span>
                                        </div>
                                    </a>
                                </li>

                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i><span class="label label-primary"><span id="NotReadCount" runat="server">0</span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a class="J_menuItem" href="../SysNew/MessageFrame.aspx">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i>您有<span id="NotRead" runat="server">0</span>条未读消息
                                            <span class="pull-right text-muted small"><span id="NotReadTime" runat="server">0秒</span>前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a class="J_menuItem" href="../SysNew/MessageFrame.aspx">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i><span id="ReplyCount" runat="server">0</span>条新回复
                                            <span class="pull-right text-muted small"><span id="ReplyReadTime" runat="server">0秒</span>前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="../SysNew/MessageFrame.aspx">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i>切换
                            </a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="" href="javascript:ShowNavHelp()" id="CaoZuoHelp" aria-expanded="false">
                                <i class="fa fa-hand-o-right"></i>操作指引
                            </a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle-help" aria-expanded="false">
                                <i class="fa fa-desktop"></i>帮助
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft">
                    <i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="DesktopNew">首页
                        </a>
                        <a href="javascript:;" class="J_menuTab" data-id="WorkKanban" isfixed="true">工作看板
                        </a>
                        <a href="#" id="messages" class="dropdown-toggle" data-toggle="dropdown" isfixed="true">信息 <b class="caret"></b>
                        </a>
                        <a href="javascript:;" class="J_menuTab" data-id="MainBI" isfixed="true">数据总屏
                        </a>
                        <a href="javascript:;" class="J_menuTab" data-id="CpEqBI" isfixed="true">品控大屏
                        </a>

                        <a href="javascript:;" class="J_menuTab" data-id="ChargeBI" isfixed="true">财务大屏
                        </a>

                        <ul class="dropdown-menu" style="position: absolute; left: 150px;">
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="Commsynopsis"><i class="fa fa-tasks"></i>&nbsp;&nbsp;&nbsp;&nbsp;企业概况</a></li>
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="organizational"><i class="fa fa-tags"></i>&nbsp;&nbsp;&nbsp;&nbsp;组织机构</a></li>
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="TrustTask"><i class="fa fa-hand-stop-o"></i>&nbsp;&nbsp;&nbsp;&nbsp;职责分工</a></li>
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="ManagementBrowse"><i class="fa fa-cogs"></i>&nbsp;&nbsp;&nbsp;&nbsp;管理制度</a></li>
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="Administrative"><i class="fa fa-clone"></i>&nbsp;&nbsp;&nbsp;&nbsp;办事程序</a></li>
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="Learning"><i class="fa fa-book"></i>&nbsp;&nbsp;&nbsp;&nbsp;学习园地</a></li>
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="Enterprise"><i class="fa fa-table"></i>&nbsp;&nbsp;&nbsp;&nbsp;企业内刊</a></li>
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="Knowledge"><i class="fa fa-th-list"></i>&nbsp;&nbsp;&nbsp;&nbsp;知识库</a></li>
                            <li><a href="javascript:;" class="J_menuTab DropDownMenu" style="border-right: none;" data-id="Maillist"><i class="fa fa-print"></i>&nbsp;&nbsp;&nbsp;&nbsp;通讯录</a></li>
                        </ul>
                        <a href="javascript:;" class="J_menuTab" data-id="desktop" isfixed="true">导航
                        </a>
                        <%--<% if (CorpID == "1906")
                            {
                                Response.Write("<a href ='javascript:;' class='J_menuTab' data-id='DesktopNewPA'>决策支撑</a>");

                            }%>--%>

                        <%-- <a href="javascript:;" class="J_menuTab" data-id="KmDeskSource">管理主题</a>
                        <a href="javascript:;" class="J_menuTab" data-id="KmDeskJy">经营主题</a>
                        <a href="javascript:;" class="J_menuTab" data-id="KmDeskFees">财务主题</a>--%>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight">
                    <i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">
                        关闭操作<span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive">
                            <a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll">
                            <a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther">
                            <a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="#" id="SureExit" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i>退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" id="FirstIFrame" name="iframe0" width="100%" height="100%" src="NewDesktop/NewDeskIndex.aspx" frameborder="0" data-id="DesktopNew" seamless></iframe>
                <iframe class="J_iframe" name="iframe1" width="100%" height="100%" src="../TaskManagement/WorkKanban.aspx" frameborder="0" data-id="WorkKanban" isfixed="true" seamless></iframe>
                <% if (CorpID == "1906")
                    {
                        Response.Write("<iframe class='J_iframe' id='FirstIFrame11' name='iframe0' width='100%' height='100%' src='DesktopNewPA.aspx' frameborder='0' data-id='DesktopNewPA' seamless></iframe>");
                    }
                %>
                <iframe class="J_iframe" name="iframe2" width="100%" height="100%" src="desktop.aspx" frameborder="0" data-id="desktop" isfixed="true" seamless></iframe>

                <iframe class="J_iframe" name="iframe2" width="100%" height="100%" src="KmDeskTop/KmDeskSource.aspx" frameborder="0" data-id="KmDeskSource" isfixed="true" seamless></iframe>
                <iframe class="J_iframe" name="iframe2" width="100%" height="100%" src="KmDeskTop/KmDeskJy.aspx" frameborder="0" data-id="KmDeskJy" isfixed="true" seamless></iframe>
                <iframe class="J_iframe" name="iframe2" width="100%" height="100%" src="KmDeskTop/KmDeskFees.aspx" frameborder="0" data-id="KmDeskFees" isfixed="true" seamless></iframe>

                <iframe class="J_iframe" name="iframe2" width="100%" height="100%" src="../Desktop/Organizational.aspx" frameborder="0" data-id="organizational" seamless></iframe>
                <iframe class="J_iframe" name="iframe3" width="100%" height="100%" src="../Desktop/TrustTask.aspx" frameborder="0" data-id="TrustTask" seamless></iframe>
                <iframe class="J_iframe" name="iframe4" width="100%" height="100%" src="../Desktop/ManagementBrowse.aspx" frameborder="0" data-id="ManagementBrowse" seamless></iframe>
                <iframe class="J_iframe" name="iframe5" width="100%" height="100%" src="../Desktop/Administrative.aspx" frameborder="0" data-id="Administrative" seamless></iframe>
                <iframe class="J_iframe" name="iframe6" width="100%" height="100%" src="../Desktop/Learning.aspx" frameborder="0" data-id="Learning" seamless></iframe>
                <iframe class="J_iframe" name="iframe7" width="100%" height="100%" src="../Desktop/Enterprise.aspx" frameborder="0" data-id="Enterprise" seamless></iframe>
                <iframe class="J_iframe" name="iframe8" width="100%" height="100%" src="Knowledge.aspx" frameborder="0" data-id="Knowledge" seamless></iframe>
                <iframe class="J_iframe" name="iframe9" width="100%" height="100%" src="../Desktop/Maillist.aspx" frameborder="0" data-id="Maillist" seamless></iframe>
                <iframe class="J_iframe" name="iframe10" width="100%" height="100%" src="../Desktop/Commsynopsis.aspx" frameborder="0" data-id="Commsynopsis" seamless></iframe>
                <iframe class="J_iframe" name="iframe11" width="100%" height="100%" src="deskMain/Index.aspx" frameborder="0" data-id="MainBI" seamless></iframe>
                <iframe class="J_iframe" name="iframe11" width="100%" height="100%" src="../CpEqBI/CpEqBI.aspx" frameborder="0" data-id="CpEqBI" seamless></iframe>

                <iframe class="J_iframe" name="iframe12" width="100%" height="100%" src="NewDesktopNewBI.aspx" frameborder="0" data-id="ChargeBI" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-left">
                    <a href="#" id="yunxingStart" onclick="DialogError()">运行状态：正常</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">
                <ul class="nav nav-tabs navs-3">
                    <li class="active" id="T1">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-tasks"></i>切换
                        </a>
                    </li>
                    <li id="T2">
                        <a data-toggle="tab" href="#tab-2">
                            <i class="fa fa-desktop"></i>帮助
                        </a>
                    </li>
                    <li id="T3">
                        <a data-toggle="tab" href="#tab-3">
                            <i class="fa fa-heart"></i>主题
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3><i class="fa fa-comments-o"></i>机构切换</h3>
                            <small><i class="fa fa-tim"></i>请从下面的列表中选择欲前往的机构</small>
                            <h6>项目名称：</h6>
                            <input type="text" id="SearchCommon" class="SearchCommon" placeholder="按回车键确认" />
                        </div>
                        <ul class="list-group" id="SwitchOrganList" style="padding: 8px;">
                        </ul>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="sidebar-title">
                            <h3><i class="fa fa-comments-o"></i>客户服务</h3>
                            <small><i class="fa fa-tim"></i>常用资源下载</small>
                        </div>
                        <ul class="sidebar-list">
                            <li>
                                <a href="https://www.firefox.com.cn" target="_blank">
                                    <div class="small pull-right m-t-xs"></div>
                                    <h4>第一步：FireFox火狐浏览器下载安装</h4>
                                    FireFox浏览器下载
                                    <div class="small">当前系统最佳浏览器为FireFox火狐浏览器，兼容Chrome谷歌浏览器、IE11微软浏览器，最佳浏览器为FireFox，建议用户下载安装。</div>
                                    <div class="small text-muted m-t-xs">发布日期： 2016.06.30</div>
                                </a>
                            </li>
                            <li>
                                <a href="https://erp.polywuye.com/HM/M_Main/UploadFiles/HelpDocument/Activex.rar" target="_blank">
                                    <div class="small pull-right m-t-xs"></div>
                                    <h4>第二步：报表控件下载安装</h4>
                                    点击下载

                                    <div class="small">在系统中进行票据打印、报表打印、OA审批前，需要进行报表空间下载安装。</div>
                                    <div class="small text-muted m-t-xs">发布日期： 2016.06.30</div>
                                </a>
                            </li>
                            <%--                            <li>
                                <a href="https://125.64.16.10:1243/HM/M_Main/UploadFiles/HelpDocument/Manual.rar" target="_blank">
                                    <div class="small pull-right m-t-xs"></div>
                                    <h4>更多：天问物业ERP系统帮助文档</h4>
                                    点击下载

                                    <div class="small">包括系统升级说明、快速操作指南、用户操作手册等文档。</div>
                                    <div class="small text-muted m-t-xs">发布日期： 2016.06.30</div>
                                </a>
                            </li>--%>
                        </ul>
                    </div>
                    <div id="tab-3" class="tab-pane">
                        <div class="sidebar-title">
                            <h3><i class="fa fa-comments-o"></i>主题设置</h3>
                            <small><i class="fa fa-tim"></i>你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-0">默认皮肤
                                    </a>
                                </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-1">蓝色主题
                                    </a>
                                </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-3">黄色/紫色主题
                                    </a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--右侧边栏结束-->
    </div>

    <input type="hidden" id="ErrorCode" name="ErrorCode" runat="server" value="" />
    <input type="hidden" id="HdLeftMenu" name="HdLeftMenu" runat="server" />
    <input type="hidden" id="HdSwitchMenu" name="HdSwitchMenu" runat="server" />
    <input type="hidden" id="HdCommID" name="HdCommID" runat="server" />
    <input type="hidden" id="HdOrganCode" name="HdOrganCode" runat="server" />
    <input type="hidden" id="ReturnValue" name="ReturnValue" runat="server" />
    <input type="hidden" id="HdCorpID" name="HdCorpID" value="" runat="server" />
    <input type="hidden" id="GoToUrl" name="GoToUrl" value="" runat="server" />
    <input type="hidden" id="SystemVersion" name="SystemVersion" value="" runat="server" />
    <input type="hidden" id="hdUserAccount" name="hdUserAccount" value="" runat="server" />
    <input type="hidden" id="hdUserPwd" name="hdUserPwd" value="" runat="server" />
    <input type="hidden" id="hdUserPwdMd5" name="hdUserPwdMd5" value="" runat="server" />

    <input type="hidden" id="BurstState" name="BurstState" value="" runat="server" />

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript">

        //分片错误提示
        if ($("#BurstState").val() != "") {
            $("#yunxingStart").html($("#BurstState").val());
        }

        function OpenWinPage(url, type, PNodeCode, PNodeName) {
            if (type == 10) {
                url += "?LoginCode=" + $("#hdUserAccount").val() + "&PassWord=" + $("#hdUserPwdMd5").val() + "&CorpID=" + $("#HdCorpID").val() + "&OrganCode=" + $("#HdOrganCode").val() + "&CommID=" + $("#HdCommID").val() + "&PNodeCode=" + PNodeCode + "&PNodeName=" + PNodeName;
            } else if (type == 11) {//DUP连接
                url += "?LoginCode=" + $("#hdUserAccount").val() + "&PassWord=" + $("#hdUserPwd").val() + "&erp=true";
            }

            console.log(url);
            url = encodeURI(url);
            window.open(url);
        }

        $("#HdCorpID").val("<%=CorpID%>");
        Cache.SetData("CorpID", $("#HdCorpID").val());
        $("#SureExit").click(function () {
            parent.layer.confirm('确定退出系统吗？', {
                btn: ['是', '否'] //按钮
            }, function () {
                onUnload_handler();
                window.location.href = "ExitSystem.aspx?CorpID=<%=CorpID%>";
            }, function () {
                return;
            });
        });
        //构造树结构,菜单功能树及切换项目树
        function FrameTree(_Data, _OrganCode, _CommID, _IsComp) {
            this.TreeList = '';
            this.OrganCode = _OrganCode;
            this.CommID = _CommID;
            this.Data = _Data;
            this.IsComp = _IsComp;
        }
        FrameTree.prototype = {
            constructor: FrameTree,
            SwitchOrgan: function (OrganCode, CommID, RoleOrgan, IsComp) {
                if (RoleOrgan != 'undefined' && RoleOrgan != '') {
                    if ($("#SystemVersion").val() == "completely") {
                        if (CommID != '0') {
                            window.location.href = "loginswitch.aspx?OrganCode=" + OrganCode + "&CommID=" + CommID;
                        }
                        if (OrganCode == '01') {
                            window.location.href = "loginswitch.aspx?OrganCode=" + OrganCode + "&CommID=" + CommID;
                        }
                    }
                    if ($("#SystemVersion").val() == "group") {

                        if ((CommID != '0')) {
                            window.location.href = "loginswitch.aspx?OrganCode=" + OrganCode + "&CommID=" + CommID;
                        }
                        else {
                            if (OrganCode != '') {
                                if (OrganCode == '01') {
                                    window.location.href = "loginswitch.aspx?OrganCode=" + OrganCode + "&CommID=" + CommID;
                                }
                                else {
                                    if (IsComp == '1') {
                                        window.location.href = "loginswitch.aspx?OrganCode=" + OrganCode + "&CommID=" + CommID;
                                    }
                                }
                            }
                        }
                    }

                }
            },
            ShowOrganTree: function () {
                //首先清空树
                $("#SwitchOrganList").html("");
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
                    this.TreeList = this.TreeList + "<a href='#'  onclick=\"Tree.SwitchOrgan('" + varObjects[i].id + "','','" + varObjects[i].attributes.RoleOrgan + "','" + varObjects[i].attributes.IsComp + "');\" type=\"button\" class=\"" + strClass + "\"><i class=\"fa fa-windows\"></i>&nbsp;" + varObjects[i].text + "</a>";
                    var Leaf = "&nbsp;&nbsp;";
                    if (varObjects[i].children != null) {
                        if (varObjects[i].children.length > 0) {
                            this.ShowChildOrganTree(varObjects[i].text, varObjects[i].children, Leaf);
                        }
                    }

                }
                $("#SwitchOrganList").append(this.TreeList);
            },
            ShowChildOrganTree: function (text, ChildTree, Leaf) {
                var strHref = '';
                Leaf = Leaf + "&nbsp;&nbsp;&nbsp;&nbsp;";
                for (var i = 0; i < ChildTree.length; i++) {

                    var Sign = '';
                    if (ChildTree[i].attributes.IsComp == '1') {
                        Sign = '<i class=\"fa fa-windows\" ></i>&nbsp;';
                    }
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

                    //查找指定的小区名称
                    var Sc = "";
                    if (ChildTree[i].attributes.InPopedom != '0') {
                        Sc = $("#SearchCommon").val();
                    }
                    if (Sc != "") {
                        if (ChildTree[i].text.indexOf(Sc) >= 0) {
                            this.TreeList = this.TreeList + "<a href='#'  PText='" + text + "'  Children=\"T\" onclick=\"Tree.SwitchOrgan('" + ChildTree[i].id + "','" + ChildTree[i].attributes.InPopedom + "','" + ChildTree[i].attributes.RoleOrgan + "','" + ChildTree[i].attributes.IsComp + "');\" type=\"button\" class=\"" + strClass + "\">" + Leaf + Sign + ChildTree[i].text + "</a>";
                        }
                    }
                    else {
                        if (ChildTree[i].children != null && ChildTree[i].children != 'undefine') {
                            //如果有下拉菜单增加下拉图标,否则为链接 
                            if (ChildTree[i].children.length > 0) {
                                if (this.CheckChildren(ChildTree[i].children)) {
                                    this.TreeList = this.TreeList + "<a href='#'  Children=\"F\" HasChildren=\"T\" onclick=\"Tree.SwitchOrgan('" + ChildTree[i].id + "','" + ChildTree[i].attributes.InPopedom + "','" + ChildTree[i].attributes.RoleOrgan + "','" + ChildTree[i].attributes.IsComp + "');\" type=\"button\" class=\"" + strClass + "\">" + Leaf + Sign + ChildTree[i].text + "</a>";
                                } else {
                                    if (ChildTree[i].text.indexOf($("#SearchCommon").val()) >= 0) {
                                        this.TreeList = this.TreeList + "<a href='#'  Children=\"F\" HasChildren=\"F\" onclick=\"Tree.SwitchOrgan('" + ChildTree[i].id + "','" + ChildTree[i].attributes.InPopedom + "','" + ChildTree[i].attributes.RoleOrgan + "','" + ChildTree[i].attributes.IsComp + "');\" type=\"button\" class=\"" + strClass + "\">" + Leaf + Sign + ChildTree[i].text + "</a>";
                                    }
                                }
                            }
                        } else {
                            if (ChildTree[i].text.indexOf($("#SearchCommon").val()) >= 0) {
                                this.TreeList = this.TreeList + "<a href='#'  Children=\"F\" HasChildren=\"F\" onclick=\"Tree.SwitchOrgan('" + ChildTree[i].id + "','" + ChildTree[i].attributes.InPopedom + "','" + ChildTree[i].attributes.RoleOrgan + "','" + ChildTree[i].attributes.IsComp + "');\" type=\"button\" class=\"" + strClass + "\">" + Leaf + Sign + ChildTree[i].text + "</a>";
                            }
                        }
                    }


                    if (ChildTree[i].children != null && ChildTree[i].children != 'undefine') {
                        //如果有下拉菜单增加下拉图标,否则为链接 
                        if (ChildTree[i].children.length > 0) {
                            this.ShowChildOrganTree(ChildTree[i].text, ChildTree[i].children, Leaf);
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
                        var NodeType = ChildTree[i].attributes.NodeType;
                        var PNodeCode = ChildTree[i].attributes.PNodeCode;
                        var PNodeName = ChildTree[i].attributes.PNodeName;
                        if (NodeType == "10") {//新系统(ERP)
                            this.TreeList = this.TreeList + "<li class=\"J_menuItem\"><a  href='#' onclick=\"OpenWinPage('" + strHref + "',10," + PNodeCode + ",'" + PNodeName + "')\">" + ChildTree[i].text + "</a>";
                        } else if (NodeType == "11") {//dup连接
                            this.TreeList = this.TreeList + "<li class=\"J_menuItem\"><a  href='#' onclick=\"OpenWinPage('" + strHref + "',11,'','')\">" + ChildTree[i].text + "</a>";
                        } else {
                            this.TreeList = this.TreeList + "<li class=\"J_menuItem\"><a class=\"J_menuItem\" href=\"../" + strHref + "\">" + ChildTree[i].text + "</a>";
                        }

                    }
                    this.TreeList = this.TreeList + "</li>";
                }
                this.TreeList = this.TreeList + "</ul>";
            },
            CheckChildren: function (ChildTree) {

                var checkChildren = false;
                for (var i = 0; i < ChildTree.length; i++) {
                    var Sc = "";
                    if (ChildTree[i].attributes.InPopedom != '0') {
                        Sc = $("#SearchCommon").val();
                    }
                    if (Sc != "") {
                        if (ChildTree[i].text.indexOf(Sc) >= 0) {
                            checkChildren = true;
                            break;
                        }
                    }
                }
                return checkChildren;
            }
        }




        //切换项目
        function InitOrganTree() {
            Tree = new FrameTree($("#HdSwitchMenu").val(), $("#HdOrganCode").val(), $("#HdCommID").val());
            Tree.ShowOrganTree();

        }
        function ErrorLog(tag) {
            //跳登录页
            window.location.href = "ExitSystem.aspx?CorpID=<%=CorpID%>";

        }


        function DialogError() {

            if ($("#ErrorCode").val() == "") {
                return;
            }
            var w = $(window).width() * 0.8;
            var h = $(window).height() * 0.8;
            HDialog.Open(w, h, 'DialogError.aspx?ErrorCode=' + $("#ErrorCode").val(), '错误信息', true, function callback(_Data) {

            });
        }
        $(function () {
            try {
                InitOrganTree();
            } catch (e) {

            }
        });

        var Tree = new FrameTree($("#HdLeftMenu").val(), '', '');
        Tree.ShowTree();

        //列表分页条数
        var ListPageSize = 50;
        var ListPageList = [50, 150, 300];


        function CheckAuthority(FunCode, _callback) {
            //权限判断测试 
            $.ajax({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=RootRight&Command=CheckIsCanOperate&FunCode=' + FunCode,
                type: 'GET',
                dataType: 'text',
                cache: false,
                success: function (_Data) {
                    if (_callback) { _callback(_Data); }
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $.messager.alert('错误', '数据读取错误', 'error');
                }
            });

        }

        function InitIndex() {
            CheckAuthority('1099', function callback(_Data) {

                if (_Data != 'false') {
                    if (document.getElementById("ajyzt") != null) {
                        document.getElementById("ajyzt").style.display = '';
                    }

                }
            });
            CheckAuthority('1098', function callback(_Data) {
                if (_Data != 'false')
                    if (document.getElementById("azyzt") != null) {
                        document.getElementById("azyzt").style.display = '';
                    }

            });

        }
        InitIndex();


        //function Load() {
        //    $.tool.DataGet('User', 'GetUserIsDisable', $('#frmForm').serialize(),
        //        function Init() {
        //        },
        //        function callback(_Data) {

        //            if (_Data != "") {
        //                parent.layer.confirm('当前密码将于【' + _Data + '】过期，请及时修改密码。', {
        //                    btn: ['修改密码', '关闭'] //按钮
        //                }, function () {
        //                    HDialog.Open('1000', '600', '../frame/changepassword.aspx', '修改密码', true, function callback(_Data) {
        //                        if (_Data != "") {//**获得返回的参数信息
        //                        }
        //                    });
        //                }, function () {
        //                    return;
        //                });
        //            }
        //        },
        //        function completeCallback() {
        //        },
        //        function errorCallback() {
        //        });
        //}
        //Load();



    </script>

    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <script type="text/javascript">
        //证照过期
        function ExpiredEvidence() {
            var result = Cache.GetData("ExpiredEvidence");

            var jsonData = eval("(" + $("#HdLeftMenu").val() + ")"); //转换为json对象
            //console.log(jsonData);

            var isJurisdiction = false;//取证照管理菜单权限
            for (var i = 0; i < jsonData.length; i++) {
                if (jsonData[i].hasOwnProperty('children')) {
                    for (var j = 0; j < jsonData[i].children.length; j++) {
                        if (jsonData[i].children[j].hasOwnProperty('children')) {
                            for (var k = 0; k < jsonData[i].children[j].children.length; k++) {
                                if (jsonData[i].children[j].children[k].text == "证照管理") {
                                    //console.log(jsonData[i].children[j].children[k].text);
                                    isJurisdiction = true;
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            //console.log("result:" + result + "==isJurisdiction:" + isJurisdiction);
            //console.log("result:" + typeof(result) + "==isJurisdiction:" + typeof(isJurisdiction));
            //console.log("result:" + (result == "true" && isJurisdiction));
            if (result == "true" && isJurisdiction) {
                $.ajax({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=License&Command=ExpiredEvidence&page=1&rows=10',
                    type: 'GET',
                    dataType: 'json',
                    cache: false,
                    success: function (_Data) {
                        if (_Data != undefined && _Data != null) {
                            if (_Data.total != 0) {
                                HDialog.Open('1000', '500', '../License/ExpiredEvidence.aspx', '证照过期预警', true, function callback(_Data) {
                                    LoadList();
                                });
                            }
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.messager.alert('错误', '数据读取错误', 'error');
                    }
                });
                Cache.SetData("ExpiredEvidence", false);
            }
        }
        $(function () {
            ExpiredEvidence();
        });

        function t(t) {
            var e = 0;
            return top.$(t).each(function () {
                e += $(this).outerWidth(!0)
            }), e
        }
        function e(e) {
            var a = t(top.$(e).prevAll()),
                i = t(top.$(e).nextAll()),
                n = t(top.$(".content-tabs").children().not(".J_menuTabs")),
                s = top.$(".content-tabs").outerWidth(!0) - n,
                r = 0;
            if (top.$(".page-tabs-content").outerWidth() < s) r = 0;
            else if (i <= s - top.$(e).outerWidth(!0) - top.$(e).next().outerWidth(!0)) {
                if (s - top.$(e).next().outerWidth(!0) > i) {
                    r = a;
                    for (var o = e; r - top.$(o).outerWidth() > top.$(".page-tabs-content").outerWidth() - s;) r -= top.$(o).prev().outerWidth(), o = top.$(o).prev()
                }
            } else a > s - top.$(e).outerWidth(!0) - top.$(e).prev().outerWidth(!0) && (r = a - top.$(e).prev().outerWidth(!0));
            top.$(".page-tabs-content").animate({
                marginLeft: 0 - r + "px"
            }, "fast")
        }


        function OpenTab(href, index, title) {


            var t = href,
                a = index,
                i = title,
                n = !0;
            if (void 0 == t || 0 == top.$.trim(t).length) return !1;
            if (top.$(".J_menuTab").each(function () {
                return top.$(this).data("id") == t ? (top.$(this).hasClass("active") || (top.$(this).addClass("active").siblings(".J_menuTab").removeClass("active"), e(this), top.$(".J_mainContent .J_iframe").each(function () {
                    return top.$(this).data("id") == t ? (top.$(this).show().siblings(".J_iframe").hide(), !1) : void 0
                })), n = !1, !1) : void 0
            }), n) {
                var s = '<a href="javascript:;" class="active J_menuTab" data-id="' + t + '">' + i + ' <i class="fa fa-times-circle"></i></a>';
                top.$(".J_menuTab").removeClass("active");
                var r = '<iframe class="J_iframe" name="iframe' + a + '" width="100%" height="100%" src="' + t + '" frameborder="0" data-id="' + t + '" seamless></iframe>';
                top.$(".J_mainContent").find("iframe.J_iframe").hide().parents(".J_mainContent").append(r);
                var o = parent.layer.load(2, {
                    shade: [0.1, '#ffffff'] //0.1透明度的白色背景
                });
                top.$(".J_mainContent iframe:visible").load(function () {
                    parent.layer.close(o);
                }), top.$(".J_menuTabs .page-tabs-content").append(s), e(top.$(".J_menuTab.active"))
            }
            return !1
        }

        //$("body").delegate(".J_menuTab", "click", function () {
        //    var elm = $(this);
        //    var na = elm.context.innerText.replace(/(^\s*)|(\s*$)/g, "");
        //    if (na == '知识库') {
        //        var str1 = '<iframe class="J_iframe" name="iframe_Knowledge" width="100%" height="100%" src="Knowledge.aspx" frameborder="0" data-id="Knowledge" seamless></iframe>';
        //        $('.J_mainContent').find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);
        //    }
        //});

        $("body").delegate(".J_menuTab", "click", function () {
            $('.J_menuTab').removeClass('active');
            var elm = $(this);
            setTimeout(function () {
                elm.addClass('active');
                $("#messages").removeClass('active');
                if (elm.parent().parent().hasClass('dropdown-menu')) {
                    $("#messages").addClass('active');
                }
            }, 30);
        });

        function ShowNavHelp() {

            var src = $(".J_menuTab.active").attr("data-id");
            if ($("iframe[src='" + src + "']").contents().find("iframe").length > 0) {
                var ItemLength = $("iframe[src='" + src + "']").contents().find("iframe").length;
                var ItemIndex = -1;
                for (var i = 0; i < ItemLength; i++) {
                    if ($("iframe[src='" + src + "']").contents().find("iframe")[i].contentWindow.GetShow) {
                        ItemIndex = i;
                        break;
                    }
                }
                if (ItemIndex == -1) {
                    HDialog.Info("当前没有指引");
                } else {
                    $("iframe[src='" + src + "']").contents().find("iframe")[ItemIndex].contentWindow.GetShow()
                    $("#CaoZuoHelp").css("background-color", "cornsilk");
                }
            } else {
                try {
                    if ($("iframe[src='" + src + "']")[0].contentWindow.GetShow) {
                        $("iframe[src='" + src + "']")[0].contentWindow.GetShow();
                        $("#CaoZuoHelp").css("background-color", "cornsilk");
                    } else {
                        HDialog.Info("当前没有指引");
                    }
                } catch (err) {
                    HDialog.Info("当前没有指引");
                }
            }
        }



        //判断是否有直接转入的页面
        if ($("#GoToUrl").val() != "") {
            OpenTab($("#GoToUrl").val(), "GoToUrlIndex", "业务审批");
        }

        $('#Word').keypress(function (event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') {
                OpenTab("Search_Results.aspx?Word=" + $("#Word").val(), "SearchResults", "搜索");
                $("#Word").val("");
            }
        });

        $('.SearchCommon').keypress(function (event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') {
                InitOrganTree();
            }
        });

        function CheckIsActive() {
            //$.ajax({
            //    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CheckUserActive&Command=CheckActive',
            //    type: 'GET',
            //    dataType: 'json',
            //    cache: false,
            //    success: function (_Data) {

            //    },
            //    complete: function (XMLHttpRequest, textStatus, errorThrown) {

            //    },
            //    error: function (XMLHttpRequest, textStatus, errorThrown) {
            //        $.messager.alert('错误', '数据读取错误', 'error');
            //    }
            //});
        }

        //var ProgressInterval;
        //ProgressInterval = setInterval("CheckIsActive()", 120000);

        window.onbeforeunload = function () {
            onUnload_handler();

        }
        var errorMessage = "<%= ErrorMsg%>";
        if (errorMessage != "") {
            alert(errorMessage);
        }
        //CheckIsActive();

        function onUnload_handler() {
            //$.ajax({
            //    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CheckUserActive&Command=CheckActiveOut',
            //    type: 'GET',
            //    dataType: 'json',
            //    cache: false,
            //    success: function (_Data) {

            //    },
            //    complete: function (XMLHttpRequest, textStatus, errorThrown) {

            //    },
            //    error: function (XMLHttpRequest, textStatus, errorThrown) {
            //        //$.messager.alert('错误', '数据读取错误', 'error');
            //    }
            //});
        }

    </script>
</body>
</html>


