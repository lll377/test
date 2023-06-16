<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewDesktopNewBI.aspx.cs" Inherits="M_Main.frame.NewDesktopNewBI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理主题</title>
    <link href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/management_new.css" rel="stylesheet" />
    <link href="css/management_new_media.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js"></script>
    <script src="../Jscript-Ui/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script src="../Jscript-Ui/echarts-3.7.2/echarts.min.js"></script>

    <script src="../Jscript-Ui/echarts-3.7.2/map/china.js"></script>

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="css/NewDeskTopNewBI.css" rel="stylesheet" />



    <style class="cp-pen-styles">
        ol, ul {
            list-style: none
        }

        .select_wrapper {
            line-height: 36px;
            border-radius: 3px;
            cursor: pointer;
            position: relative;
        }

            .select_wrapper:hover {
                background: #566c3a url("arrow.png") no-repeat top 15px right 12px;
            }

            .select_wrapper span {
                display: block;
                margin: 0 30px 0 15px;
            }

            .select_wrapper .select_inner {
                background: #fff;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
                color: #687278;
                display: none;
                position: absolute;
                left: 0;
                top: -100%;
                width: 100%;
                z-index: 3;
            }

                .select_wrapper .select_inner li {
                    border-bottom: 1px solid #eee;
                    padding: 0 15px;
                }

                    .select_wrapper .select_inner li:hover {
                        background: #eee;
                    }

                    .select_wrapper .select_inner li:last-child {
                        border: none;
                        border-radius: 0 0 5px 5px;
                    }

                    .select_wrapper .select_inner li:first-child {
                        border-radius: 5px 5px 0 0;
                    }
    </style>


    <style type="text/css">
        .body {
            background: url(deskNewBINew/background.jpg) no-repeat;
            width: 100%;
            height: 100%;
            background-size: 100% 100%;
            // position: absolute;
            filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='bg-login.png',sizingMethod='scale');
            /*padding-left: 30px;
            padding-right: 30px;*/
        }

        .content_kf {
            background: url(deskNewBINew/25.png) no-repeat;
            background-size: 100% 100%;
            /*width: 25%;*/
            height: 270px;
            padding-top: 30px;
        }

        .content_bybslb {
            background: url(deskNewBINew/2.png) no-repeat;
            background-size: 100% 100%;
            /*width: 25%;*/
            height: 220px;
            padding-top: 0px;
            margin-top: 10px;
        }

        #bybslb {
        }

        .content_input {
            width: 15%;
            /*height: 70px;*/
            padding-top: 30px;
            margin-left: 20px;
            margin-top: 20px;
        }

        .content_xmgk {
            background: url(deskNewBINew/3.png) no-repeat;
            background-size: 100% 100%;
            /*width: 25%;*/
            height: 485px;
            padding-top: 20px;
        }

        .content_sfzt {
            background: url(deskNewBINew/4.png) no-repeat;
            background-size: 100% 100%;
            height: 482px;
            padding-top: 30px;
        }

        .content_tszt {
            background: url(deskNewBINew/23.png) no-repeat;
            background-size: 100% 100%;
            height: 482px;
            padding-top: 30px;
        }

        .content_365 {
            background: url(deskNew/365.png) no-repeat;
            background-size: 100% 100%;
            /*width: 25%;*/
            height: 250px;
            padding: 0 10px;
            padding-top: 50px;
            /*margin-top:10px;*/
        }

        .content_sbwhl {
            background: url(deskNew/sbwhl.png) no-repeat;
            background-size: 100% 100%;
            /*width: 25%;*/
            height: 250px;
            padding-top: 30px;
            /*margin-top:10px;*/
        }

        .content_sbzt {
            background: url(deskNew/sbzt.png) no-repeat;
            background-size: 100% 100%;
            /*width: 25%;*/
            height: 250px;
            padding-top: 30px;
            /*margin-top:10px;*/
        }

        .content_ndbsmydph {
            background: url(deskNew/ndbsmydph.png) no-repeat;
            background-size: 100% 100%;
            /*width: 25%;*/
            height: 250px;
            padding-top: 30px;
            /*margin-top:10px;*/
        }

        .content_whilte {
            background: url(deskNewBINew/17.png) no-repeat;
            background-size: 100% 100%;
            height: 100%;
        }

        .content_whilte_padding {
            padding: 5px 25px 10px 25px;
            height: 45%;
        }

        .content_blue {
            background: url(deskNew/blue.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
        }

        .content_pink {
            background: url(deskNew/pink.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
        }

        .content_orange {
            background: url(deskNew/orange.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
        }

        .width_300 {
            width: 300px;
        }

        .height_100 {
            height: 100px;
            /*background-color:#cccccc;*/
        }

        .padding_10 {
            padding: 10px 5px 10px 5px;
        }

        .margin_bottom_10 {
            margin-bottom: 10px;
        }

        .margin_top_10 {
            margin-top: 10px;
        }

        .margin_left_10 {
            margin-left: 10px;
        }

        .margin_right_10 {
            margin-right: 10px;
        }

        .text_white {
            padding: 10px 0px 30px 0px;
            text-align: center;
            color: white;
        }

        .text_weight_150 {
            font-size: small;
            font-weight: 300;
        }

        .text_weight_300 {
            font-size: small;
            font-weight: 300;
        }


        .text_weight_600 {
            font-size: larger;
            font-weight: 600;
        }

        .text_color_blue {
            color: #2894FF;
            width: 100%;
        }

        .float_left {
            float: left;
        }

        .my-col-lg-3 {
            margin: .5% .5%;
            width: 24%;
            float: left;
            height: 90px;
        }

        @media (max-height:831px) {

            .my-col-lg-3 {
                margin: .5% .5%;
                width: 24%;
                float: left;
                height: 90px;
            }
        }


        .content_sfztleft {
            float: left;
            color: #fff;
        }

        .content_sfztright {
            color: #dec312;
            float: right;
        }

        .content_sfzt1 {
            clear: both;
            height: 30px;
        }

        .content_jysj1 {
            width: 50%;
        }

        .content_jysj2 {
            width: 50%;
        }

        .jy_Data {
            color: #ddc50c;
            font-weight: bold;
        }

        .Cotent_zt {
            width: 48%;
            float: left;
        }

        .Cotent_zt1 {
            float: right;
            width: 48%;
        }

        .divfloat_left {
            float: left;
        }

        .divfloat_right {
            float: right;
        }

        .content_jysj {
            background: url(deskNewBINew/5.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
        }

        .divrow {
            margin-top: 15px;
            padding: 0px 15px 0px 15px;
            height: 249px;
        }

        .Cotent_kfzt {
            background: url(deskNewBINew/6.png) no-repeat;
            background-size: 100% 100%;
        }

        .Cotent_kfzt1 {
            background: url(deskNewBINew/7.png) no-repeat;
            background-size: 100% 100%;
        }

        .Cotent_cczt {
            background: url(deskNewBINew/8.png) no-repeat;
            background-size: 100% 100%;
        }

        .Cotent_cczt1 {
            background: url(deskNewBINew/9.png) no-repeat;
            background-size: 100% 100%;
        }

        .Cotent_kfxc {
            background: url(deskNewBINew/10.png) no-repeat;
            background-size: 100% 100%;
        }

        .Cotent_kfxc1 {
            background: url(deskNewBINew/11.png) no-repeat;
            background-size: 100% 100%;
        }

        .Cotent_hjxc {
            background: url(deskNewBINew/12.png) no-repeat;
            background-size: 100% 100%;
        }

        .Cotent_hjxc1 {
            background: url(deskNewBINew/13.png) no-repeat;
            background-size: 100% 100%;
        }

        .content_pzwz {
            background: url(deskNewBINew/26.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
        }

        .content_pzzt {
            background: url(deskNewBINew/22.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
        }

        .content_eqzt {
            background: url(deskNewBINew/19.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top: 15px;
        }

        .content_xczt {
            background: url(deskNewBINew/20.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top: 15px;
        }

        .content_aqzt {
            background: url(deskNewBINew/21.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top: 15px;
        }

        .content_hjzt {
            background: url(deskNewBINew/24.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top: 15px;
        }

        .content_gczt {
            background: url(deskNewBINew/16.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top: 15px;
        }


        .Cotent_sfzt {
            background: url(deskNewBINew/14.png) no-repeat;
            background-size: 100% 100%;
        }

        .Cotent_sfzt1 {
            background: url(deskNewBINew/15.png) no-repeat;
            background-size: 100% 100%;
        }
    </style>
</head>
<body class="body">
    <form id="form" runat="server">
        <div class="container-fluid all_div" style="background-image: none;">
            <div class="row">
                <div class="col-lg-12 nav_two">
                    <img src="deskNewBINew/border.png" class="nav_center_img" style="margin-top: -4.5%; width: 95%;" />
                    <img src="deskNewBINew/title.png" class="nav_center_img" style="margin-top: -7.5%; width: 30%;" />
                </div>
            </div>
            <div class="row ">
                <div class="col-lg-4">
                </div>
                <div class="col-lg-4 nav_two">
                    <img src="deskNewBI/TitleText.png"  class="nav_center_img" style="margin-top: -18%;" />
                    <%--<img src="deskNewBINew/tcontent.png" class="nav_center_img" style="margin-top: -18%;" />--%>
                </div>
                <div class="col-lg-4 nav_three">
                </div>
            </div>
            <div class="row ">
                <div class="col-lg-12 nav_two">
                    <img src="deskNewBINew/titlex.png" class="nav_center_img" style="margin-top: -3%; width: 30%;" />
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 ">
                    <div class="content_kf">
                        <div id="feeList" style="width: 100%; height: 226px;"></div>
                    </div>

                    <div class="content_bybslb">
                        <div id="tsPie" style="width: 100%; height: 226px;"></div>
                    </div>
                </div>
                <div class="col-lg-6 ">
                    <div class="content_xmgk">
                        <div class="row" style="padding-top: 15px;">
                            <div class="col-lg-4 content_input padding_10 text_white">
                                <label class="text_weight_300 margin_left_10 float_left">
                                    管理面积
                                </label>
                                <br />
                                <label id="build_area" class="text_weight_600 text_color_blue " runat="server">
                                    0 
                                </label>
                            </div>
                            <div class="col-lg-4 content_input padding_10 text_white">
                                <label class="text_weight_300 margin_left_10 float_left">
                                    管理户数
                                </label>
                                <br />
                                <label id="room_sum" class="text_weight_600 text_color_blue " runat="server">
                                    0 
                                </label>
                            </div>
                            <div class="col-lg-4 content_input padding_10 text_white">
                                <label class="text_weight_300 margin_left_10 float_left">
                                    项目数量
                                </label>
                                <br />
                                <label id="per_area" class="text_weight_600 text_color_blue " runat="server">
                                    0 
                                </label>
                            </div>
                            <%--<div class="col-lg-4 content_input padding_10 text_white">
                                <label class="text_weight_300 margin_left_10 float_left">
                                    设备数量
                                </label>
                                <br />
                                <label id="eq_num" class="text_weight_600 text_color_blue " runat="server">
                                    0 
                                </label>
                            </div>--%>

                            <div class="col-lg-4 content_input padding_10 text_white" style="width: 18%;">
                                <label class="text_weight_300 margin_left_10 float_left">
                                    商业街(入住户数)
                                </label>
                                <br />
                                <label id="Label1" class="text_weight_600 text_color_blue " runat="server">
                                    0 
                                </label>
                            </div>


                            <div class="col-lg-4 content_input padding_10 text_white">
                                <label class="text_weight_300 margin_left_10 float_left">
                                    商业街(入住率)
                                </label>
                                <br />
                                <label id="Label2" class="text_weight_600 text_color_blue " runat="server">
                                    0 
                                </label>
                            </div>

                        </div>
                        <div id="Map" style="width: 80%; height: 80%; top: -40px; left: 118px;"></div>
                    </div>
                </div>
                <%-- 报事数据--%>
                <div class="col-lg-3 ">
                    <div class="content_sfzt">
                        <div style="height: 40%; padding: 15px;">
                            <div id="bsPie" style="width: 100%; height: 226px;"></div>
                        </div>
                        <div style="height: 58%; padding: 33px;">
                            <div class="content_sfzt1">
                                <div class="content_sfztleft">客服(本月报事量)</div>
                                <div class="content_sfztright"><span id="kfbs">101</span>件</div>
                            </div>
                            <div class="content_sfzt1">
                                <div class="content_sfztleft">客服(本月完成率)</div>
                                <div class="content_sfztright"><span id="kfbswc">52</span>%</div>
                            </div>
                            <div class="content_sfzt1">
                                <div class="content_sfztleft">工程(本月报事量)</div>
                                <div class="content_sfztright"><span id="gcbs">65</span>件</div>
                            </div>
                            <div class="content_sfzt1">
                                <div class="content_sfztleft">工程(本月完成率)</div>
                                <div class="content_sfztright"><span id="gcbswc">52</span>%</div>
                            </div>
                            <div class="content_sfzt1">
                                <div class="content_sfztleft">环境(本月报事量)</div>
                                <div class="content_sfztright"><span id="hjbs">2652</span>件</div>
                            </div>
                            <div class="content_sfzt1">
                                <div class="content_sfztleft">环境(本月完成率)</div>
                                <div class="content_sfztright"><span id="hjbswc">22</span>%</div>
                            </div>
                            <div class="content_sfzt1">
                                <div class="content_sfztleft">安全(本月报事量)</div>
                                <div class="content_sfztright"><span id="aqbs">326</span>件</div>
                            </div>
                            <div class="content_sfzt1">
                                <div class="content_sfztleft">安全(本月完成率)</div>
                                <div class="content_sfztright"><span id="aqbswc">52</span>%</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row divrow">
                <div class="content_jysj  ">
                    <div class="col-lg-3  content_jysj1">
                        <div class="row content_whilte_padding">
                            <div class="my-col-lg-3 content_whilte text_white">
                                <label class="text_weight_300">
                                    本日实收(万)
                                </label>
                                <br />
                                <label id="brss" class="jy_Data text_weight_300 margin_top_10">
                                    0
                                </label>
                            </div>
                            <div class="my-col-lg-3 content_whilte text_white">
                                <label class="text_weight_300">
                                    本月应收(万)
                                </label>
                                <br />
                                <label id="byys" class="jy_Data text_weight_300 margin_top_10">
                                    0
                                </label>
                            </div>
                            <div class="my-col-lg-3 content_whilte text_white">
                                <label class="text_weight_300">
                                    本年应收(万)
                                </label>
                                <br />
                                <label id="bnys" class="jy_Data text_weight_300 margin_top_10">
                                    0
                                </label>
                            </div>
                            <div class="my-col-lg-3 content_whilte text_white">
                                <label class="text_weight_300">
                                    本年实收(万)
                                </label>
                                <br />
                                <label id="bnss" class="jy_Data text_weight_300 margin_top_10">
                                    0
                                </label>
                            </div>
                            <div class="my-col-lg-3 content_whilte text_white">
                                <label class="text_weight_300">
                                    年初往年欠费(万)
                                </label>
                                <br />
                                <label id="ncwnqf" class="jy_Data text_weight_300 margin_top_10">
                                    0
                                </label>
                            </div>
                            <div class="my-col-lg-3 content_whilte text_white">
                                <label class="text_weight_300">
                                    往年欠费实收(万)
                                </label>
                                <br />
                                <label id="wnqfss" class="jy_Data text_weight_300 margin_top_10">
                                    0
                                </label>
                            </div>
                            <div class="my-col-lg-3 content_whilte text_white">
                                <label class="text_weight_300">
                                    本年累计欠费(万)
                                </label>
                                <br />
                                <label id="bnljqf" class="jy_Data text_weight_300 margin_top_10">
                                    0
                                </label>
                            </div>
                            <div class="my-col-lg-3 content_whilte text_white">
                                <label class="text_weight_300">
                                    本年欠费实收(万)
                                </label>
                                <br />
                                <label id="bnqfss" class="jy_Data text_weight_300 margin_top_10">
                                    0
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  content_jysj2">
                        <div id="byRate" class="my-col-lg-3" style="width: 24%; height: 200px;"></div>
                        <div id="bnRate" class="my-col-lg-3" style="width: 24%; height: 200px;"></div>
                        <div id="wnRate" class="my-col-lg-3" style="width: 24%; height: 200px;"></div>
                        <div id="bnqfRate" class="my-col-lg-3" style="width: 24%; height: 200px;"></div>
                    </div>
                </div>

            </div>
            <%--客服主题--%>
            <div class="row divrow">
                <div class="Cotent_zt  Cotent_kfzt" style="width: 48%; padding: 33px 5px 30px 33px;">
                    <div class="divfloat_left" style="width: 30%">

                        <div class="content_sfzt1" style="margin-top: 23px;">
                            <div class="content_sfztleft">当日报事发生量</div>
                            <div class="content_sfztright"><span id="drbsNum">101</span>件</div>
                        </div>
                        <div class="content_sfzt1">
                            <div class="content_sfztleft">累计报事发生量</div>
                            <div class="content_sfztright"><span id="ljbsNum">52</span>件</div>
                        </div>
                        <div class="content_sfzt1">
                            <div class="content_sfztleft">当日投诉量</div>
                            <div class="content_sfztright"><span id="drtsNum">65</span>件</div>
                        </div>
                        <div class="content_sfzt1">
                            <div class="content_sfztleft">本月投诉量</div>
                            <div class="content_sfztright"><span id="bytsNum">52</span>%</div>
                        </div>
                        <div class="content_sfzt1">
                            <div class="content_sfztleft">本月回访量</div>
                            <div class="content_sfztright"><span id="bytshfNum">2652</span>件</div>
                        </div>
                    </div>
                    <div class="divfloat_right" style="width: 68%">
                        <div id="bybswcl" class="my-col-lg-3" style="width: 49%; height: 170px;"></div>
                        <div id="bytsclwcl" class="my-col-lg-3" style="width: 49%; height: 170px;"></div>
                    </div>
                </div>
                <div class="Cotent_zt1 Cotent_kfzt1" style="padding: 33px 5px 30px 33px;">
                    <div style="width: 60%">
                        <div id="drtshfl" class="my-col-lg-3" style="width: 32%; height: 170px;"></div>
                        <div id="bytshfl" class="my-col-lg-3" style="width: 32%; height: 170px;"></div>
                        <div id="yjjyhfl" class="my-col-lg-3" style="width: 32%; height: 170px;"></div>
                    </div>
                    <div class="divfloat_right" style="width: 40%">
                        <div id="yzbsmyd" class="my-col-lg-3" style="width: 100%; height: 170px;"></div>
                    </div>
                </div>
            </div>

            <%--收费排行--%>
            <div class="row divrow">
                <div class="Cotent_zt Cotent_sfzt">
                    <div id="rowsix_20" style="width: 100%; height: 226px;"></div>
                </div>
                <div class="Cotent_zt1 Cotent_sfzt1">

                    <div id="rowsix_21" style="width: 100%; height: 226px;"></div>
                </div>

            </div>

            <%--物资主题--%>
            <%--<div class="row divrow">
                <div class="content_pzwz">
                    <div class="ibox-content">
                        <div style="height: 210px;" id="rowMt"></div>
                    </div>
                </div>
            </div>--%>
            <%--品质主题--%>
            <%--<div class="row divrow">
                <div class="content_pzzt">
                    <div class="col-lg-3  content_jysj1">
                        <div id="row_pzhc" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:16%;"></div>
                        <div id="row_pzzg" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:16%;"></div>
                    </div>
                    <div class="col-lg-3  content_jysj2">
                        <div class="ibox-content">
                            <div style="height: 210px;" id="rowCp"></div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <%--设备主体--%>
            <%--<div class="row divrow">
                <div class="content_eqzt">
                    <div class="col-lg-3  content_jysj1">
                        <div id="row_sbxj" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:16%;"></div>
                        <div id="row_sbwb" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:16%;"></div>
                    </div>
                    <div class="col-lg-3  content_jysj2">
                        <div class="ibox-content">
                            <div style="height: 210px;" id="rowEq"></div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <%--巡查主体--%>
            <%--<div class="row divrow">
                <div class="content_xczt">
                    <div class="col-lg-3  content_jysj1">
                        <div id="row_gqxc" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:8%;"></div>
                        <div id="row_zxxc" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:8%;"></div>
                        <div id="row_kfxc" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:8%;"></div>
                    </div>
                    <div class="col-lg-3  content_jysj2">
                        <div class="ibox-content">
                            <div style="height: 210px;" id="rowPatrol"></div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <%--安全主体--%>
            <%--<div class="row divrow">
                <div class="content_aqzt">
                    <div class="col-lg-3  content_jysj1">
                        <div id="row_aqxg" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:16%;"></div>
                        <div id="row_xfxj" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:16%;"></div>
                    </div>
                    <div class="col-lg-3  content_jysj2">
                        <div class="ibox-content">
                            <div style="height: 210px;" id="rowSafe"></div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <%--环境主体--%>
            <%-- <div class="row divrow">
                <div class="content_hjzt">
                    <div class="col-lg-3  content_jysj1">
                        <div id="row_hjbj" class="my-col-lg-3" style="width: 24%; height: 220px;"></div>
                        <div id="row_lhyh" class="my-col-lg-3" style="width: 24%; height: 220px;"></div>
                        <div id="row_ljqy" class="my-col-lg-3" style="width: 24%; height: 220px;"></div>
                        <div id="row_shxs" class="my-col-lg-3" style="width: 24%; height: 220px;"></div>
                    </div>
                    <div class="col-lg-3  content_jysj2">
                        <div class="ibox-content">
                            <div style="height: 210px;" id="rowAmbient"></div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <%--工程主体--%>
            <%--<div class="row divrow">
                <div class="content_gczt">
                    <div class="col-lg-3  content_jysj1">
                        <div id="rowEq_wh" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:16%;"></div>
                        <div id="rowEq_Incident" class="my-col-lg-3" style="width: 24%; height: 220px;margin-left:16%;"></div>
                    </div>
                    <div class="col-lg-3  content_jysj2">
                        <div class="ibox-content">
                            <div style="height: 210px;" id="rowEqStatus"></div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </form>
    <input type="hidden" id="isJump" runat="server" />
    <script src="js/newdesktopNewBI.js"></script>
</body>
</html>
