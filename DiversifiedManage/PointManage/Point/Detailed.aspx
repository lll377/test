<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detailed.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Point.Detailed" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>详情</title>
    <link href="/HM/M_Main/css/base.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .col-sm-1, .col-sm-3 {
            background: #f9f9f9;
            border: 1px solid #eee;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="mainForm" method="post" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">点位信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">序号：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="Sort" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">点位类型：</label>
                <div class="col-sm-5 col-xs-5">
                    <div id="Type" class="control-content"></div>
                    <%-- <label class="control-content" id="lbl_OptNumber"></label>
                    <label id="OptNumber" class="control-content"></label>--%>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">点位类别：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="CategoryName" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">点位区域：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="RegionName" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">点位编号：</label>
                <div class="col-sm-5 col-xs-5" style="">
                    <label id="Number" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">点位名称：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="Name" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">点位位置：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="Position" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">所属楼宇：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="StoreyLayer" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">点位面积：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="Area" class="control-content"></label>
                    <label class="control-content">(单位:平方米)</label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">点位尺寸：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="SizeLength" class="control-content"></label>
                    <%-- <label id="SizeLength" class="control-content"></label>
                    <label class="control-content">宽</label>
                    <label id="SizeWidth" class="control-content"></label>
                    <label class="control-content">高</label>
                    <label id="SizeHeight" class="control-content"></label>--%>
                    <label class="control-content">(单位:厘米)</label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">是否安装表计：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="IsInstall" class="control-content"></label>
                    </div>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">是否停用：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="IsDisable" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">备注：</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="Remark" class="control-content"></label>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">点位图片</legend>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="padding: 0; padding-left: 10px" id="list_up_img">
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">点位规划信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">招商规划：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="TradePlanName" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">计费单位：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="CalculateCostUnit" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">指导价格：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="Price" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">价格单位：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="PriceUnit" class="control-content"></label>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">点位状态信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">当前状态：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="UseState" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">当前客户：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="CustName" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">开始时间：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="PointBeginTime" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">结束时间：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="PointEndTime" class="control-content"></label>
                </div>
            </div>
        </fieldset>
    </form>
    <input type="hidden" name="ID" id="ID" />
    <script type="text/javascript">

        $(function () {
            InitPage();
        });

        function InitPage() {
            var ID = $.getUrlParam("ID");
            $("#ID").val(ID);
            InitData();
        }
        function InitData() {
            $.dataPostJson('DivfManage_Point', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (!!data.CalculateCostUnit) {
                        data.PriceUnit = data.PriceUnit + "&nbsp;/&nbsp;" + data.CalculateCostUnit;
                    }
                    data.SizeLength = "长:&nbsp;" + data.SizeLength + "&emsp;宽:&nbsp;" + data.SizeWidth + "&emsp;高:&nbsp;" + data.SizeHeight;
                    data.PointBeginTime = $.dateFormat(data.PointBeginTime);
                    data.PointEndTime = $.dateFormat(data.PointEndTime);
                      if (data.Type == "房屋" || data.Type == "车位") {
                        data.Type = data.Type + "&emsp;&emsp;<b>" + data.Type + "编号：</b>" + data.OptNumber;
                    }
                    $.setParam(data);
                  
                    //$("#Type").html(data.Type);

                    InitDataFileAnnex(data.ID)
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function InitDataFileAnnex(AttachedID) {
            $.dataPostJson('DivfManage_FileAnnex', 'GetListDataTable', { "AttachedID": AttachedID }, true, false,
                function Init() {
                },
                function callback(data) {
                    AppendImg(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function AppendImg(data) {
            if (!!data) {
                var html = "", FileSize = '';
                $.each(data, function (i, item) {
                    FileSize = Number((parseFloat(item.FileSize) / 1024).toString()).toFixed(2);
                    html += "<div class=\"list_up_img\"><a href=\"" + item.FullPath + "\"  target=\"_blank\"><img filename=\"" + item.FileName + "\" filesize=\"" + item.FileSize + "\" fileremark=\"" + item.FileRemark + "\" src=\"" + item.FullPath + "\" title=\"<div><p style='text-align:center'>(点击查看原图)</p><p>文&nbsp;&nbsp;件&nbsp;&nbsp;名:" + item.FileName + "</p><p>文件大小:" + FileSize + "KB</p><p>文件备注:" + item.FileRemark + "</p></div>\" class=\"easyui-tooltip\" /></a></div>";
                });
                console.log(html);
                $("#list_up_img").append(html);
                $(".easyui-tooltip").tooltip();
            }
        }
    </script>
</body>
</html>
