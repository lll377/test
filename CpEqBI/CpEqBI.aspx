<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CpEqBI.aspx.cs" Inherits="M_Main.CpEqBI.CpEqBI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>品控主题</title>
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
            margin-top:15px;
        }

        .content_xczt {
            background: url(deskNewBINew/20.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top:15px;
        }

        .content_aqzt {
            background: url(deskNewBINew/21.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top:15px;
        }

        .content_hjzt {
            background: url(deskNewBINew/24.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top:15px;
        }

        .content_gczt {
            background: url(deskNewBINew/16.png) no-repeat;
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            height: 249px;
            padding: 30px;
            margin-top:15px;
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
                    <img src="deskNewBINew/tcontent.png" class="nav_center_img" style="margin-top: -18%;" />
                </div>
                <div class="col-lg-4 nav_three">
                </div>
            </div>
            <div class="row ">
                <div class="col-lg-12 nav_two">
                    <img src="deskNewBINew/titlex.png" class="nav_center_img" style="margin-top: -3%; width: 30%;" />
                </div>
            </div>
            <%--品质主题--%>
            <div class="row divrow">
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
            </div>
            <%--设备主体--%>
            <div class="row divrow">
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
            </div>
            <%--巡查主体--%>
            <div class="row divrow" style="display:none">
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
            </div>
            <%--安全主体--%>
            <div class="row divrow">
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
            </div>
            <%--环境主体--%>
            <div class="row divrow">
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
            </div>
            <%--工程主体--%>
            <div class="row divrow">
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
            </div>
        </div>
    </form>
    <input type="hidden" id="isJump" runat="server" />
    <script src="js/newdesktopNewBI.js"></script>
</body>
</html>
