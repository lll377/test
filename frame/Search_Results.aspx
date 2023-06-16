<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_Results.aspx.cs" Inherits="M_Main.frame.Search_Results" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>搜索结果</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">

    <link rel="stylesheet" href="../Jscript-Ui/hplus/css/plugins/datapicker/datepicker3.css">

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body class="gray-bg">
    <form id="frmForm" runat="server">
    <input type="hidden" id="CurrPage" name="CurrPage" value="1" runat="server" />
    <input type="hidden" id="TypeName" name="TypeName" value="" />
    <div class="wrapper wrapper-content animated fadeInUp">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <button class="btn btn-white" type="button" onclick="window.location.href='../frame/StatDesktop.aspx';"><i class="fa fa-chevron-left"></i></button>
                                 &nbsp;&nbsp;
                        <span style="font-family:微软雅黑;font-size:14px;font-weight:bold;">搜索结果</span>
                    </div>
                    <div class="ibox-content">
                        <div class="row m-b-sm m-t-sm">
                            <div class="col-md-1">
                                <button type="button" id="loading-example-btn" class="btn btn-white btn-sm" id="Refresh" onclick="Refresh();"><i class="fa fa-refresh"></i> 刷新</button>
                            </div>
                            <div class="col-md-11">
                                

                                <div class="input-group"><input type="text" placeholder="请输入标题名称" class="input-sm form-control" id="Title" name="Title" runat="server" /> <span class="input-group-btn">
                                        <input type="button" class="btn btn-sm btn-primary"  id="Search" value="搜索" />
                                        </span>
                                </div>
                                <div class="input-group" style="margin-top:12px;">

                                    <div class="form-group" id="data_5">
                                        
                                        <div class="btn btn-sm btn-default pull-right m-t-n-xs" refdata="知识库"  style="margin-right:5px;"><strong>知识库</strong>
                                        </div>
                                        
                                        <div class="btn btn-sm btn-default pull-right m-t-n-xs" refdata="通讯录"  style="margin-right:5px;"><strong>通讯录</strong>
                                        </div>

                                        <div class="btn btn-sm btn-default pull-right m-t-n-xs" refdata="管理制度" style="margin-right:5px;"><strong>管理制度</strong>
                                        </div>

                                        <div class="btn btn-sm btn-default pull-right m-t-n-xs" refdata="办事程序" style="margin-right:5px;"><strong>办事程序</strong>
                                        </div>

                                        <div class="btn btn-sm btn-default pull-right m-t-n-xs" refdata="学习园地" style="margin-right:5px;"><strong>学习园地</strong>
                                        </div>

                                        <div class="btn btn-sm btn-default pull-right m-t-n-xs" refdata="企业内刊" style="margin-right:5px;"><strong>企业内刊</strong>
                                        </div>

                                        <div class="btn btn-sm btn-default pull-right m-t-n-xs" refdata="信息动态" style="margin-right:5px;"><strong>信息动态</strong>
                                        </div>

                                        <div class="btn btn-sm btn-primary pull-right m-t-n-xs"  refdata="" style="margin-right:5px;"><strong>全部信息</strong>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="project-list">
                            <div class="sk-spinner sk-spinner-circle" id="Loading">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                            <table class="table table-hover" id="List">
                                <tbody>
                                   
                                </tbody>
                            </table>
                            <div class="text-center">
                                <div class="btn-group" id="PageNum">
                                    
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/content.min.js?v=1.0.0"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">


        $(document).ready(function () { $("#loading-example-btn").click(function () { btn = $(this); simpleLoad(btn, true); simpleLoad(btn, false) }) }); function simpleLoad(btn, state) { if (state) { btn.children().addClass("fa-spin"); btn.contents().last().replaceWith(" Loading") } else { setTimeout(function () { btn.children().removeClass("fa-spin"); btn.contents().last().replaceWith(" Refresh") }, 2000) } };

        function Refresh() {
            window.location.href = "../frame/Search_Results.aspx";
        }

        function Detail(Url) {
            window.location.href = Url;
        }

        $("#Search").click(function (e) {
            $("#Loading").css("display","");
            LoadWaitWork();
        });

        var rows = 10;
        var TotalSize;
        function LoadWaitWork() {
            $.tool.DataPost('StatDesktop', 'SearchKeyList', $('#frmForm').serialize() + "&rows=" + rows,
            function Init() {
            },
            function callback(_Data)
            {
                $("#List").html("");
                $("#Loading").css("display", "none");
                if (_Data.substring(0, 5) == "false") {
                    HDialog.Info(_Data.substring(6));
                }
                else {
                    var obj = JSON.parse(_Data);
                    for (var i = 0; i < obj.rows.length; i++) {
                        $("#List").append("<tr style='cursor:pointer;' onclick=\"Detail('" + obj.rows[i].TypeName + "','" + obj.rows[i].Id + "');\"><td class=\"project-status\"><span class=\"label label-primary\">" + obj.rows[i].TypeName + "</td><td class=\"project-title\">" + obj.rows[i].Title + "<br/></td></tr>");
                    }
                }
                TotalSize = obj.total;
                var PageCount = Math.ceil(TotalSize / rows);
                var IsActive = '';
                $("#PageNum").html("");

                $("#PageNum").append("<button class=\"btn btn-white\" type=\"button\" onclick='LastPage();'><i class=\"fa fa-chevron-left\"></i></button>");
                for (var i = 0; i < PageCount; i++) {
                    IsActive = '';
                    var c=parseInt($("#CurrPage").val());
                    if(c==i+1)IsActive = 'active';
                    $("#PageNum").append("<button type=\"button\" class=\"btn btn-white "+IsActive+"\" onclick='CurrentPage("+(i+1)+");'>"+(i+1)+"</button>");
                }
                $("#PageNum").append("<button class=\"btn btn-white\" type=\"button\" onclick='NextPage();'><i class=\"fa fa-chevron-right\"></i></button>");
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
        }

        function LastPage() {
            var c = parseInt($("#CurrPage").val());
            c = c - 1;
            if (c <= 0) {
                return;
            }
            $("#CurrPage").val(c);
            LoadWaitWork();
        }
        function NextPage() {
            var c = parseInt($("#CurrPage").val());
            c = c + 1;
            if (c >= TotalSize+1) {
                return;
            }
            $("#CurrPage").val(c);
            LoadWaitWork();
        }
        function CurrentPage(i) {
            $("#CurrPage").val(i);
            LoadWaitWork();
        }
        LoadWaitWork();

        function Detail(TypeName, Id) {
            var w = $(window).width();
            var h = $(window).height();
            if (TypeName == '知识库') {
                HDialog.Open(w, h, '../frame/KnowledgeDetail.aspx?KnowID=' + Id, '知识详情', true, function callback(_Data) {
                });
            }
            if (TypeName == '管理制度') {
                HDialog.Open(w, h, '../Desktop/ManageDetail.aspx?IID=' + Id, '管理制度', true, function callback(_Data) {
                });
            }
            if (TypeName == '办事程序') {
                HDialog.Open(w, h, '../Desktop/AdminDetail.aspx?IID=' + Id, '办事程序', true, function callback(_Data) {
                });
            }
            if (TypeName == '学习园地') {
                HDialog.Open(w, h, '../Desktop/LearningDetail.aspx?IID=' + Id, '学习园地', true, function callback(_Data) {
                });
            }
            if (TypeName == '企业内刊') {
                HDialog.Open(w, h, '../frame/EnterpriseDetail.aspx?IID=' + Id, '内刊详情', true, function callback(_Data) {
                });
            }
            if (TypeName == '信息动态') {
                HDialog.Open(w, h, '../frame/NewsDetail.aspx?IID=' + Id, '信息动态', true, function callback(_Data) {
                });
            }
        }


        $("#data_5 div").click(function (e) {

            $("#data_5 div").each(function (i) {
                $(this).prop("class", "btn btn-sm btn-default pull-right m-t-n-xs");
            });
            
            $(this).prop("class", "btn btn-sm btn-primary pull-right m-t-n-xs");
            $("#TypeName").val($(this).attr("refdata"));

            LoadWaitWork();
        });

    </script>
    </form>
    </body>
</html>
