<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewDeskIndex.aspx.cs" Inherits="M_Main.frame.NewDeskIndex" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>桌面</title>
    <link rel="shortcut icon" href="favicon.ico" />
    <link href="../css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../css/animate.min.css" rel="stylesheet" />
    <link href="../css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../css/NewDesktop.css?v=1.0" rel="stylesheet" />


    <script type="text/javascript" src="../../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../Jscript-Ui/echarts/china.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/echarts/world.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>

    <base target="_blank" />
    <style type="text/css">
        /*当屏幕在1200px~1700px之间*/
        @media screen and (min-width:1500px) {
            .MariginTopClass {
                margin-top: 5.4px;
                text-align: center;
                width: 120px;
            }

            .padding_0 {
                padding: 0px;
            }

            .Colorblock {
                border-radius: 2px;
                width: 10px;
                height: 10px;
                margin-top: 5px;
            }

            .bottomDivList {
                position: absolute;
                bottom: 44px;
            }

            .db-title {
                margin-top: 50px;
                margin-left: 20%;
            }

            .marginTop_15 {
                margin-top: 15px;
            }

            .marginLeft_10 {
                margin-left: 10px;
            }

            .marginLeft_15 {
                margin-left: 15px;
            }

            .marginTop_20 {
                margin-top: 20px;
            }

            .marginTop_60 {
                margin-top: 60px;
            }

            .marginTop_75 {
                margin-top: 75px;
            }

            .marginTop_90 {
                margin-top: 90px;
            }

            .title_2 {
                font-weight: bold;
                font-size: 16px;
                color: #ffffff;
            }

            .title_5 {
                font-size: 22px;
                padding-left: 0px;
                color: #ffffff;
            }

            .cursor {
                cursor: pointer;
            }

            .img1 {
                margin-left: 1%;
                width: 23.6%;
                height: 210px;
                background: url(img/gzsp.png) no-repeat;
                background-size: 100% 100%;
            }

            .img2 {
                margin-left: 1%;
                width: 23.6%;
                height: 210px;
                background: url(img/khfw.png) no-repeat;
                background-size: 100% 100%;
            }

            .img3 {
                margin-left: 1%;
                width: 23.6%;
                height: 210px;
                background: url(img/gcsb.png) no-repeat;
                background-size: 100% 100%;
            }

            .img4 {
                margin-left: 1%;
                width: 23.6%;
                height: 210px;
                background: url(img/aqxf.png) no-repeat;
                background-size: 100% 100%;
            }

            .img5 {
                margin-left: 1%;
                width: 23.6%;
                height: 210px;
                background: url(img/hjzl.png) no-repeat;
                background-size: 100% 100%;
            }

            .img6 {
                margin-left: 1%;
                width: 23.6%;
                height: 210px;
                background: url(img/zhxc.png) no-repeat;
                background-size: 100% 100%;
            }

            .img7 {
                margin-left: 1%;
                width: 23.6%;
                height: 210px;
                background: url(img/pzhc.png) no-repeat;
                background-size: 100% 100%;
            }

            .img8 {
                margin-left: 1%;
                width: 23.6%;
                height: 210px;
                background: url(img/cwsf.png) no-repeat;
                background-size: 100% 100%;
            }

            .col4 {
                width: 32.7%;
            }

            .index_xxbt {
                background: url(img/index_xx_title.png) no-repeat #ffffff;
                background-position-x: 20px;
                background-position-y: 8px;
                background-size: 127px 33px;
                border-radius: 10px 10px 0 0;
            }

                .index_xxbt h5 {
                    margin-left: 20px;
                    font-size: 16px;
                    color: #1c95e6;
                    font-weight: bold;
                }

            .index_xxgd {
                height: 20px;
                width: 50px;
                float: right;
                background: url(img/index_xx_gd.png) no-repeat #ffffff;
                margin-top: 7px;
                background-size: 100% 100%;
                cursor: pointer;
            }

            .ibox1 {
                clear: both;
                margin-top: 0px;
                padding: 0px;
            }

            .ibox1-title {
                min-height: 45px;
                margin-bottom: 0px;
                padding: 10px 15px 7px;
            }

            .ibox-content {
                height: 290px;
                border-radius: 0 0 10px 10px;
            }

            .Line_1 {
                list-style: none;
            }

            .timeSpan {
                float: right;
                font-size: 15px;
                padding-top: 3px;
                margin-right: 5%;
                color: #9c9c9c;
            }

            .timeImg {
                padding-left: 80.6%;
                height: 22px;
                margin-top: 3px;
            }
        }


        /*当屏幕在10px~1199px之间*/

        @media screen and (min-width:10px) and (max-width:1500px) {
            .MariginTopClass {
                margin-top: 5.4px;
                text-align: center;
                width: 120px;
            }

            .padding_0 {
                padding: 0px;
            }

            .Colorblock {
                border-radius: 2px;
                width: 10px;
                height: 10px;
                margin-top: 5px;
            }

            .bottomDivList {
                position: absolute;
                bottom: 44px;
            }

            .db-title {
                margin-top: 50px;
                margin-left: 13%;
            }

            .marginTop_15 {
                margin-top: 8px;
            }

            .marginLeft_10 {
                margin-left: 5px;
            }

            .marginLeft_15 {
                margin-left: 8px;
            }

            .marginTop_20 {
                margin-top: 10px;
            }

            .marginTop_60 {
                margin-top: 40px;
            }

            .marginTop_75 {
                margin-top: 53px;
            }

            .marginTop_90 {
                margin-top: 60px;
            }

            .title_2 {
                font-weight: lighter;
                font-size: 13px;
                color: #ffffff;
            }

            .title_5 {
                font-size: 18px;
                padding-left: 0px;
                color: #ffffff;
            }

            .cursor {
                cursor: pointer;
            }

            .img1 {
                margin-left: 1%;
                width: 23.6%;
                height: 155px;
                background: url(img/gzsp.png) no-repeat;
                background-size: 100% 100%;
            }

            .img2 {
                margin-left: 1%;
                width: 23.6%;
                height: 155px;
                background: url(img/khfw.png) no-repeat;
                background-size: 100% 100%;
            }

            .img3 {
                margin-left: 1%;
                width: 23.6%;
                height: 155px;
                background: url(img/gcsb.png) no-repeat;
                background-size: 100% 100%;
            }

            .img4 {
                margin-left: 1%;
                width: 23.6%;
                height: 155px;
                background: url(img/aqxf.png) no-repeat;
                background-size: 100% 100%;
            }

            .img5 {
                margin-left: 1%;
                width: 23.6%;
                height: 155px;
                background: url(img/hjzl.png) no-repeat;
                background-size: 100% 100%;
            }

            .img6 {
                margin-left: 1%;
                width: 23.6%;
                height: 155px;
                background: url(img/zhxc.png) no-repeat;
                background-size: 100% 100%;
            }

            .img7 {
                margin-left: 1%;
                width: 23.6%;
                height: 155px;
                background: url(img/pzhc.png) no-repeat;
                background-size: 100% 100%;
            }

            .img8 {
                margin-left: 1%;
                width: 23.6%;
                height: 155px;
                background: url(img/cwsf.png) no-repeat;
                background-size: 100% 100%;
            }

            .col4 {
                width: 32.7%;
            }

            .index_xxbt {
                background: url(img/index_xx_title.png) no-repeat #ffffff;
                background-position-x: 20px;
                background-position-y: 8px;
                background-size: 127px 33px;
                border-radius: 10px 10px 0 0;
            }

                .index_xxbt h5 {
                    margin-left: 20px;
                    font-size: 16px;
                    color: #1c95e6;
                    font-weight: bold;
                }

            .index_xxgd {
                height: 20px;
                width: 50px;
                float: right;
                background: url(img/index_xx_gd.png) no-repeat #ffffff;
                margin-top: 7px;
                background-size: 100% 100%;
                cursor: pointer;
            }

            .ibox1 {
                clear: both;
                margin-top: 0px;
                padding: 0px;
            }

            .ibox1-title {
                min-height: 45px;
                margin-bottom: 0px;
                padding: 10px 15px 7px;
            }

            .ibox-content {
                height: 290px;
                border-radius: 0 0 10px 10px;
            }

            .Line_1 {
                list-style: none;
            }

            .timeSpan {
                float: right;
                font-size: 15px;
                padding-top: 3px;
                margin-right: 5%;
                color: #9c9c9c;
            }

            .timeImg {
                padding-left: 73.6%;
                height: 22px;
                margin-top: 3px;
            }
        }
    </style>

    <script type="text/javascript">
</script>

</head>
<body class="gray-bg">
    <form id="MyDesk" runat="server">
        <div style="width: 100%; height: 30px; background-color: #ffffff; display: none" id="timeDiv">
            <div class="wrapper wrapper-content">
                <div class="row">
                    <div class="col-sm-6 _margin_top_10">
                        <div class="ibox">
                            <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#e0e0e0">
                                <tbody>
                                    <tr>
                                        <td style="width: 67%" bgcolor="#ffffff" height="15" valign="middle" width="827" align="left">
                                            <table width="100%">
                                                <tr>
                                                    <td width="15">
                                                        <img border="0" align="left" src="../../images/xtgg.gif" width="15" height="12">
                                                    </td>
                                                    <td width="60" align="left">系统公告:</td>
                                                    <td>


                                                        <table border="0" cellspacing="0" cellpadding="0" align="left">
                                                            <tr>
                                                                <td valign="top" align="left">

                                                                    <div id="containerinfo">
                                                                        <div id="Content" runat="server"></div>
                                                                    </div>


                                                                </td>
                                                            </tr>
                                                        </table>


                                                        <%--<marquee id="SysMessage_net" onmouseover="SysMessage_net.stop()" onmouseout="SysMessage_net.start()"
											height="15" width="100%" scrollAmount="5" scrollDelay="100">--%>
                                                        <%--</marquee>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td bgcolor="#ffffff" height="15" valign="middle" width="33%" align="left"></td>
                                        <td bgcolor="#ffffff" height="15" valign="middle" width="33%" align="center"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-6 _margin_top_10">
                        <img src="img/time.png" class="timeImg" style="margin-top: -7px;" /><label> 数据截止：</label><asp:Label ID="laDate" runat="server" Text="" Style="margin-top: -7px;"></asp:Label>
                    </div>
                </div>
            </div>



        </div>
        <input type="hidden" id="CorpId" runat="server" />
        <input type="hidden" id="OrganCode" runat="server" />
        <input type="hidden" id="OrganName" runat="server" />
        <input type="hidden" id="ChargesSubject" runat="server" />
        <input type="hidden" id="CommId" runat="server" />
        <input type="hidden" id="page" name="page" value="1" />
        <input type="hidden" id="rows" name="rows" value="9999999" />
        <input type="hidden" id="ReturnValue" runat="server" />
        <input id="EditBeginDate" name="EditBeginDate" value="1" type="hidden" runat="server" />
        <input id="EditEndDate" name="EditEndDate" value="1" type="hidden" runat="server" />

        <input type="hidden" id="QmTotalCount" runat="server" />

        <div class="wrapper wrapper-content">

            <div class="row" id="OrganDiv" style="display: none">
                <div class="col-sm-12" style="padding-left: 15px; padding-right: 15px;">
                    <div class="row">
                        <div class="col-sm-2  img1">
                            <div class="db-title marginTop_90">
                                <span class="title_2 cursor" onclick="window.location.href='../../MyOa/WaitWork.aspx';">办&nbsp;公&nbsp;审&nbsp;批：&nbsp;当前待办&nbsp;<span id="WaitWorkCount" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="window.location.href='../../MyOa/BusinessCheck.aspx';">业&nbsp;务&nbsp;审&nbsp;批：&nbsp;当前待办&nbsp;<span id="BusinessCheckCount" class="title_5">0</span>&nbsp;件</span>
                            </div>
                        </div>
                        <div class="col-sm-2  img2">
                            <div class="db-title marginTop_60">
                                <span class="title_2">全&nbsp;部&nbsp;工&nbsp;单：&nbsp;本月完成率&nbsp;<span id="Organqbgd" class="title_5">0</span>%</span><br />
                                <span class="title_2">投&nbsp;诉&nbsp;工&nbsp;单：&nbsp;本月完成率&nbsp;<span id="Organtsgd" class="title_5">0</span>%</span><br />
                                <span class="title_2">工&nbsp;单&nbsp;评&nbsp;价：&nbsp;本月满意度&nbsp;<span id="Organgdpj" class="title_5">0</span>%</span><br />
                                <span class="title_2">客&nbsp;户&nbsp;拜&nbsp;访：&nbsp;本月完成率&nbsp;<span id="Organkhbf" class="title_5">0</span>%</span>
                            </div>
                        </div>
                        <div class="col-sm-2  img3">
                            <div class="db-title marginTop_60">
                                <span class="title_2">设&nbsp;备&nbsp;巡&nbsp;检：&nbsp;本月完成率&nbsp;<span id="Organsbxj" class="title_5">0</span>%</span><br />
                                <span class="title_2">设&nbsp;备&nbsp;维&nbsp;保：&nbsp;本月完成率&nbsp;<span id="Organsbwb" class="title_5">0</span>%</span><br />
                                <span class="title_2">设&nbsp;备&nbsp;故&nbsp;障：&nbsp;本月故障率&nbsp;<span id="Organsbgz" class="title_5">0</span>%</span><br />
                                <span class="title_2">分&nbsp;户&nbsp;查&nbsp;验：&nbsp;本月完成率&nbsp;<span id="Organfhcy" class="title_5">0</span>%</span>
                            </div>
                        </div>
                        <div class="col-sm-2  img4">
                            <div class="db-title marginTop_90">
                                <span class="title_2">安&nbsp;全&nbsp;巡&nbsp;更：&nbsp;本月完成率&nbsp;<span id="Organaqxg" class="title_5">0</span>%</span><br />
                                <span class="title_2">消&nbsp;防&nbsp;巡&nbsp;检：&nbsp;本月完成率&nbsp;<span id="Organxfxj" class="title_5">0</span>%</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 marginTop_20 img5">
                            <div class="db-title marginTop_60">
                                <span class="title_2">环&nbsp;境&nbsp;保&nbsp;洁：&nbsp;本月完成率&nbsp;<span id="Organhjbj" class="title_5">0</span>%</span><br />
                                <span class="title_2">绿&nbsp;化&nbsp;养&nbsp;护：&nbsp;本月完成率&nbsp;<span id="Organlhfh" class="title_5">0</span>%</span><br />
                                <span class="title_2">四&nbsp;害&nbsp;消&nbsp;杀：&nbsp;本月完成率&nbsp;<span id="Organshxs" class="title_5">0</span>%</span><br />
                                <span class="title_2">垃&nbsp;圾&nbsp;清&nbsp;运：&nbsp;本月完成率&nbsp;<span id="Organljqy" class="title_5">0</span>%</span>
                            </div>
                        </div>
                        <div class="col-sm-2 marginTop_20 img6">
                            <div class="db-title marginTop_75">
                                <span class="title_2">公&nbsp;区&nbsp;巡&nbsp;查：&nbsp;本月完成率&nbsp;<span id="Organgqxc" class="title_5">0</span>%</span><br />
                                <span class="title_2">装&nbsp;修&nbsp;巡&nbsp;查：&nbsp;本月完成率&nbsp;<span id="Organzxxc" class="title_5">0</span>%</span><br />
                                <span class="title_2">空&nbsp;房&nbsp;巡&nbsp;查：&nbsp;本月完成率&nbsp;<span id="Organkfxc" class="title_5">0</span>%</span>
                            </div>
                        </div>
                        <div class="col-sm-2 marginTop_20 img7">
                            <div class="db-title marginTop_90">
                                <span class="title_2">品&nbsp;质&nbsp;核&nbsp;查：&nbsp;本月完成率&nbsp;<span id="Organpzhc" class="title_5">0</span>%</span><br />
                                <span class="title_2">品&nbsp;质&nbsp;整&nbsp;改：&nbsp;本月完成率&nbsp;<span id="Organpzzg" class="title_5">0</span>%</span>
                            </div>
                        </div>
                        <div class="col-sm-2 marginTop_20 img8">
                            <div class="db-title marginTop_90">
                                <span class="title_2">物管费往年清欠：累计&nbsp;<span id="Organwgfwnqq" class="title_5">0</span>%</span><br />
                                <span class="title_2">物管费本年收款：累计&nbsp;<span id="Organwgfbnsk" class="title_5">0</span>%</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" id="CommDiv" style="display: none">
                <div class="col-sm-12" style="padding-left: 15px; padding-right: 15px;">
                    <div class="row">
                        <div class="col-sm-2  img1">
                            <div class="db-title marginTop_75">
                                <span class="title_2 cursor" onclick="window.location.href='../../MyOa/WaitWork.aspx';">办&nbsp;公&nbsp;审&nbsp;批：&nbsp;当前待办&nbsp;<span id="WaitWorkCount1" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="window.location.href='../../MyOa/BusinessCheck.aspx';">业&nbsp;务&nbsp;审&nbsp;批：&nbsp;当前待办&nbsp;<span id="BusinessCheckCount1" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="window.location.href='../../MyOa/InfoList.aspx';">业&nbsp;务&nbsp;异&nbsp;动：&nbsp;本月异动&nbsp;<span id="lbxxts" runat="server" class="title_5">0</span>&nbsp;件</span>
                            </div>
                        </div>
                        <div class="col-sm-2  img2">
                            <div class="db-title marginTop_75">
                                <span class="title_2 cursor" onclick="openAhref(2,'');">全&nbsp;部&nbsp;工&nbsp;单：&nbsp;当前待办&nbsp;<span id="Commqbgd" runat="server" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(13,'');">投&nbsp;诉&nbsp;工&nbsp;单：&nbsp;当前待办&nbsp;<span id="Commtsgd" runat="server" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(3,'客户拜访');">客&nbsp;户&nbsp;拜&nbsp;访：&nbsp;当前待办&nbsp;<span id="Commkhbf" runat="server" class="title_5">0</span>&nbsp;件</span>
                            </div>
                        </div>
                        <div class="col-sm-2  img3">
                            <div class="db-title marginTop_75">
                                <span class="title_2 cursor" onclick="openAhref(4,'设备巡检');">设&nbsp;备&nbsp;巡&nbsp;检：&nbsp;当前待办&nbsp;<span id="Commsbxj" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(5,'设备维保');">设&nbsp;备&nbsp;维&nbsp;保：&nbsp;当前待办&nbsp;<span id="Commsbwb" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(10,'分户查验');">分&nbsp;户&nbsp;查&nbsp;验：&nbsp;当前待办&nbsp;<span id="Commfhcy" runat="server" class="title_5">0</span>&nbsp;件</span>
                            </div>
                        </div>
                        <div class="col-sm-2  img4">
                            <div class="db-title marginTop_90">
                                <span class="title_2 cursor" onclick="openAhref(6,'安全巡更');">安&nbsp;全&nbsp;巡&nbsp;更：&nbsp;当前待办&nbsp;<span id="Commaqxg" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(7,'消防巡检');">消&nbsp;防&nbsp;巡&nbsp;检：&nbsp;当前待办&nbsp;<span id="Commxfxj" class="title_5">0</span>&nbsp;件</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2 marginTop_20 img5">
                            <div class="db-title marginTop_60">
                                <span class="title_2 cursor" onclick="openAhref(14,'环境保洁');">环&nbsp;境&nbsp;保&nbsp;洁：&nbsp;当前待办&nbsp;<span id="Commhjbj" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(14,'绿化防护');">绿&nbsp;化&nbsp;养&nbsp;护：&nbsp;当前待办&nbsp;<span id="Commlhfh" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(14,'四害消杀');">四&nbsp;害&nbsp;消&nbsp;杀：&nbsp;当前待办&nbsp;<span id="Commshxs" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(14,'垃圾清运');">垃&nbsp;圾&nbsp;清&nbsp;运：&nbsp;当前待办&nbsp;<span id="Commljqy" class="title_5">0</span>&nbsp;件</span>
                            </div>
                        </div>
                        <div class="col-sm-2 marginTop_20 img6">
                            <div class="db-title marginTop_75">
                                <span class="title_2 cursor" onclick="openAhref(15,'公区巡查');">公&nbsp;区&nbsp;巡&nbsp;查：&nbsp;当前待办&nbsp;<span id="Commgqxc" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(15,'装修巡查');">装&nbsp;修&nbsp;巡&nbsp;查：&nbsp;当前待办&nbsp;<span id="Commzxxc" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(15,'空房巡查');">空&nbsp;房&nbsp;巡&nbsp;查：&nbsp;当前待办&nbsp;<span id="Commkfxc" class="title_5">0</span>&nbsp;件</span>
                            </div>
                        </div>
                        <div class="col-sm-2 marginTop_20 img7">
                            <div class="db-title marginTop_90">
                                <span class="title_2 cursor" onclick="openAhref(11,'品质核查');">品&nbsp;质&nbsp;核&nbsp;查：&nbsp;当前待办&nbsp;<span id="Commpzhc" class="title_5">0</span>&nbsp;件</span><br />
                                <span class="title_2 cursor" onclick="openAhref(12,'品质整改');">品&nbsp;质&nbsp;整&nbsp;改：&nbsp;当前待办&nbsp;<span id="Commpzzg" class="title_5">0</span>&nbsp;件</span>
                            </div>
                        </div>
                        <div class="col-sm-2 marginTop_20 img8">
                            <div class="db-title marginTop_60">
                                <span class="title_2">物管费往年欠费（截止昨日）</span><span class="title_5"></span><br />
                                <span class="title_2"><span id="Commwgfwnqfhs" class="title_5">0</span>&nbsp;户/<span id="Commwgfwnqfje" class="title_5">0</span>&nbsp;元</span><br />
                                <span class="title_2">物管费本年欠费（截止昨日）</span><span class="title_5"></span><br />
                                <span class="title_2"><span id="Commwgfbnqfhs" class="title_5">0</span>&nbsp;户/<span id="Commwgfbnqfje" class="title_5">0</span>&nbsp;元</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row marginTop_15">
                <div class="col-sm-4 col4 marginLeft_10">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <span class="index_xxgd" onclick="window.location.href='../../Desktop/CompanyWorkMore.aspx';"></span>
                            <h5>工作通知<span id="Wv"></span></h5>
                        </div>
                        <div class="ibox-content">

                            <div class="NewList" id="HeadquartersNews">
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-4  col4">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <span class="index_xxgd" onclick="window.location.href='../../Desktop/OrganDynamicMore.aspx';"></span>
                            <h5>工作动态</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="NewList" id="CommpanyNews">
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-4  col4">
                    <div class="ibox1">
                        <div class="ibox1-title index_xxbt">
                            <span class="index_xxgd" onclick="window.location.href='../../Desktop/CommDynamicMore.aspx';"></span>
                            <h5>项目快报</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="NewList" id="ProjectDynamic">
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <script type="text/javascript" src="../js/newdesktop1.js"></script>
        <%--  <script type="text/javascript" src="../Jscript-Ui/echarts-2.2.7/desktop_new.js"></script>--%>
    </form>

    <script type="text/javascript"> 

        function modaldemo() {
            n('../MyOa/InfoList.aspx', 9, '信息提示列表')
        }

        function openAhref(obj, typename) {
            var commid = $("#CommId").val();
            var href = '../NewDesktop/CommTaskList.aspx?TaskType=' + obj + '&TypeName=' + typename;
            if (commid > 0) {
                if (obj == 4) {
                    href = '../../EquipmentNew/TaskFollowUpFrame_Inspection.aspx?isDesk=1&IsFireControl=0&CommID=' + commid;
                }
                else if (obj == 5) {
                    href = '../../EquipmentNew/TaskFollowUpFrame_Maintenance.aspx?isDesk=1&CommID=' + commid;
                }
                else if (obj == 6) {
                    href = '../../ComprehensivePatrols/CpPlanExecutionFrame_Safe.aspx?isDesk=1&CommID=' + commid;
                }
                else if (obj == 7) {
                    href = '../../EquipmentNew/TaskFollowUpFrame_Inspection.aspx?isDesk=1&IsFireControl=1&CommID=' + commid;
                }
                else if (obj == 11) {
                    href = '../../ComprehensivePatrols/CpPlanExecutionFrame.aspx?isDesk=1&CommID=' + commid;
                }
                else if (obj == 12) {
                    href = '../../ComprehensivePatrols/TaskRectificationFrame.aspx?sy=1&CommID=' + commid;
                }
                else if (obj == 14) {
                    href = '../../ComprehensivePatrols/CpPlanExecutionFrame_Ambient.aspx?isDesk=1&typename=' + encodeURI(encodeURI(typename)) + '&CommID=' + commid;
                }
                else if (obj == 15) {
                    href = '../../ComprehensivePatrols/CpPlanExecutionFrame_Patrol.aspx?isDesk=1&typename=' + encodeURI(encodeURI(typename)) + '&CommID=' + commid;
                }
            }

            if (obj == 1) {
                href = '../../IncidentNewJH/IncidentAssignedBrowse.aspx';
            }
            else if (obj == 2) {
                href = '../../IncidentNewJH/IncidentProcessingContainer.aspx?sm=1';
            }
            else if (obj == 13) {
                href = '../../IncidentNewJH/IncidentProcessingContainer.aspx?sm=1&ts=1';
            }
            else if (obj == 3) {
                href = '../../Visit/VisitPlanList.aspx?sy=1&CommID=' + commid;
            }
            else if (obj == 10) {
                href = '../../HouseInspect/TaskExec.aspx?sy=1&CommID=' + commid;
            }
            else if (obj == 8) {
                href = '../NewDesktop/CommHJList.aspx?CommID=' + commid;
            }
            else if (obj == 9) {
                href = '../NewDesktop/CommXCList.aspx?CommID=' + commid;
            }
            window.location.href = href;
        }

        function n(href, index, title) {
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
                var r = '<iframe class="J_iframe" name="iframe' + a + '" width="100%" height="100%" src="' + t + '?v=4.0" frameborder="0" data-id="' + t + '" seamless></iframe>';
                top.$(".J_mainContent").find("iframe.J_iframe").hide().parents(".J_mainContent").append(r);
                var o = parent.layer.load(2, {
                    shade: [0.1, '#ffffff']
                });
                top.$(".J_mainContent iframe:visible").load(function () {
                    parent.layer.close(o);
                }), top.$(".J_menuTabs .page-tabs-content").append(s), e(top.$(".J_menuTab.active"))
            }
            return !1
        }

        function Init1() {
            //获取房屋状态列表 
            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=HousingStatusAuditList&IsOption=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('获取房屋状态列表');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init2() {
            //获取应收入账列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=AuditingFeeList&IsAuditing=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('获取应收入账列表');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init3() {
            //获取应收导入列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=AuditingInputFeesList&IsAuditing=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('获取应收导入列表');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init4() {
            //获取预交导入列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=AuditingInputPreCostsList&IsAuditing=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('获取预交导入列表');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init5() {
            //获取预交冲抵列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=AuditingPreList&IsAuditing=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('获取预交冲抵列表');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init6() {
            //获取费用减免审核列表

            var postStr = $('#MyDesk').serialize().replace('+00%3A00%3A00', '').replace('+23%3A59%3A59', '') + "&Method=DataPost&Class=AuditManageIndex&Command=WaiversFeeAuditList&IsAudit=0&SelAudit=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('获取费用减免审核列表');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init7() {
            //获取取消减免列表

            var postStr = $('#MyDesk').serialize().replace('+00%3A00%3A00', '').replace('+23%3A59%3A59', '') + "&Method=DataPost&Class=AuditManageIndex&Command=WaiversFeeList&IsAudit=";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('获取取消减免列表');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init8() {
            //获取 票据撤销 列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=RepealReceiptsList&IsAudit=&DrReceive=0&SelIsAudit=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('票据撤销');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init9() {
            //获取 费用退款 列表

            $("#EditBeginDate").val("");
            $("#EditEndDate").val("");
            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=RefundMultiAuditList&IsAudit=0&BusinessType=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('费用退款');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init10() {
            //获取 实收票据红冲 列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetList&IsAudit=0&ListType=WriteoffFeesReceiptsAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('实收票据红冲');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init11() {
            //获取 预交冲抵冲销 列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetList&IsAudit=0&ListType=WriteoffPreCostsOffsetAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('预交冲抵冲销');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init12() {
            //获取 减免冲抵冲销 列表 
            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetList&IsAudit=0&ListType=WriteoffWaiversFeeOffsetAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('减免冲抵冲销');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init13() {
            //获取 银行托收审核 列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=BankSurrTLAuditIndex&Command=search&IsAudit=0";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('银行托收审核');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init14() {
            //获取装修审核数据

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=Renovation&Command=GetListRenoAuditAllHTML5Index";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (result) {
                    if (result.result) {
                        var data = $.parseJSON(result.data);
                        console.log('获取装修审核数据');
                        console.log(data.length);
                        var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                        c = parseInt(c);
                        var n = data.length;
                        n = n + c;
                        $("#BusinessCheckCount").html(n);
                        $("#BusinessCheckCount1").html(n);

                    }
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function Init15() {
            //获取 报事关闭审核 列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentUnnormalCloseList&IsAudit=0&AuditState=审核中";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('报事关闭审核');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }

        function Init16() {
            //获取 报事延期审核 列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentDelayListGroupComm&IsAudit=0&AuditState=审核中";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('报事延期审核');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }

        function Init17() {
            //获取 报事协助审核 列表

            var postStr = $('#MyDesk').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentAssistList&IsAudit=0&AuditState=审核中";
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                    console.log('报事协助审核');
                    console.log(_Data.rows.length);
                    var c = $("#BusinessCheckCount").html().replace('(', '').replace(')', '');
                    c = parseInt(c);
                    var n = _Data.rows.length;
                    n = n + c;
                    $("#BusinessCheckCount").html(n);
                    $("#BusinessCheckCount1").html(n);

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }

        function LoadData() {
            Init1();// 房屋状态
            Init2(); //  应收入账
            // Init3();// 
            //Init4();// 
            Init5();// 预交冲抵
            Init6();// 费用减免审核
            //Init7();//
            Init8();//  票据撤销
            Init9();  // 费用退款
            Init10();// 票据红冲
            Init11();// 预交冲抵
            Init12(); //减免冲抵冲销
            Init13();// 银行托收
            Init14();//装修审核
            Init15();//报事关闭
            Init16();// 报事延期审核
            Init17();// 报事协助审核

        }

    </script>
    <script type="text/javascript">
        //业务审批
        function LoadBusinessCheckCount() {
            $.tool.DataPost('StatDesktop', 'BusinessCheckCount', '',
                function Init() {
                },
                function callback(_Data) {
                    $("#BusinessCheckCount").html("0");
                    $("#Loading").css("display", "none");
                    if (_Data.substring(0, 5) == "false") {
                        HDialog.Info(_Data.substring(6));
                    }
                    else {
                        var c = $("#BusinessCheckCount").html();
                        c = parseInt(c);
                        var n = parseInt(_Data);
                        n = n + c;
                        $("#BusinessCheckCount").html(n);
                    }
                },
                function completeCallback() {
                    //数据有返回,消除待办加载中
                    $("#WaitWorkLoading").css("display", "none");
                },
                function errorCallback() {
                });
        }


        //办公审批
        function LoadWaitWork(strType) {
            $.tool.DataPost('StatDesktop', 'WaitWork', 'Type=' + strType + '&Key=',
                function Init() {
                },
                function callback(_Data) {
                    $("#Loading").css("display", "none");
                    if (_Data.substring(0, 5) == "false") {
                        HDialog.Info(_Data.substring(6));
                    }
                    else {
                        var c = $("#WaitWorkCount").html().replace('(', '').replace(')', '');
                        c = parseInt(c);
                        var n = parseInt(_Data);
                        n = n + c;
                        $("#WaitWorkCount").html(n);
                        $("#WaitWorkCount1").html(n);
                    }
                },
                function completeCallback() {
                    //数据有返回,消除待办加载中
                    $("#WaitWorkLoading").css("display", "none");
                },
                function errorCallback() {
                });
        }

        function LoadWaitWorkCount() {
            $("#WaitWorkCount").html("0");
            LoadWaitWork('0001');
            LoadWaitWork('0002');
            LoadWaitWork('0003');
            LoadWaitWork('0004');
            LoadWaitWork('0005');
            LoadWaitWork('0006');
            LoadWaitWork('0007');
            LoadWaitWork('0008');
            LoadWaitWork('0009');
            LoadWaitWork('0010');
            LoadWaitWork('0011');
            LoadWaitWork('0012');
            LoadWaitWork('0013');
            LoadWaitWork('0014');

        }
        LoadWaitWorkCount();
        LoadData();


        setInterval(function () {
            LoadWaitWorkCount();
            LoadData();
        }, 600000);


        $(function () {
            var a = $("#ReturnValue").val();
            var obj = eval("(" + a.replace(/\\/g, "/") + ")");
            if ($("#CommId").val() == "" || $("#CommId").val() == "0") {
                $("#CommDiv").hide();
                $("#OrganDiv").show();
                $("#timeDiv").show();
                $("#Organqbgd").html(obj[0].ComletedRate);
                $("#Organtsgd").html(obj[1].ComletedRate);
                $("#Organgdpj").html(obj[19].ComletedRate);
                $("#Organkhbf").html(obj[2].ComletedRate);

                $("#Organsbxj").html(obj[6].ComletedRate);
                $("#Organsbwb").html(obj[7].ComletedRate);
                $("#Organsbgz").html(obj[20].ComletedRate);
                $("#Organfhcy").html(obj[8].ComletedRate);

                $("#Organaqxg").html(obj[9].ComletedRate);
                $("#Organxfxj").html(obj[10].ComletedRate);

                $("#Organhjbj").html(obj[11].ComletedRate);
                $("#Organlhfh").html(obj[12].ComletedRate);
                $("#Organshxs").html(obj[13].ComletedRate);
                $("#Organljqy").html(obj[14].ComletedRate);

                $("#Organgqxc").html(obj[3].ComletedRate);
                $("#Organzxxc").html(obj[4].ComletedRate);
                $("#Organkfxc").html(obj[5].ComletedRate);

                $("#Organpzhc").html(obj[15].ComletedRate);
                $("#Organpzzg").html(obj[16].ComletedRate);

                $("#Organwgfwnqq").html(obj[17].ComletedRate);
                $("#Organwgfbnsk").html(obj[18].ComletedRate);
            } else {
                InitTask();
                $("#CommDiv").show();
                $("#OrganDiv").hide();
                $("#timeDiv").show();
                $("#Commqbgd").html(obj[0].qbgd);
                $("#Commtsgd").html(obj[0].tsgd);
                $("#Commkhbf").html(obj[0].khbf);

                $("#Commsbxj").html(obj[0].sbxj);
                $("#Commsbwb").html(obj[0].sbwb);
                $("#Commfhcy").html(obj[0].fhcy);

                $("#Commaqxg").html(obj[0].aqxg);
                $("#Commxfxj").html(obj[0].xfxj);

                $("#Commhjbj").html(obj[0].hjbj);
                $("#Commlhfh").html(obj[0].lhfh);
                $("#Commshxs").html(obj[0].shxs);
                $("#Commljqy").html(obj[0].ljqy);

                $("#Commgqxc").html(obj[0].gqxc);
                $("#Commzxxc").html(obj[0].zxxc);
                $("#Commkfxc").html(obj[0].kfxc);

                $("#Commpzhc").html(obj[0].pzhc);
                $("#Commpzzg").html(obj[0].pzzg)
                if (null != obj[0].wgfwnqfhs)
                    $("#Commwgfwnqfhs").html(format(obj[0].wgfwnqfhs.toString()));
                if (null != obj[0].wgfwnqfje)
                    $("#Commwgfwnqfje").html(format(obj[0].wgfwnqfje.toString()));
                if (null != obj[0].wgfbnqfhs)
                    $("#Commwgfbnqfhs").html(format(obj[0].wgfbnqfhs.toString()));
                if (null != obj[0].wgfbnqfje)
                    $("#Commwgfbnqfje").html(format(obj[0].wgfbnqfje.toString()));
            }
        });

        function InitTask() {
            var postStr = "Method=DataPost&Class=TaskManagement&Command=GetTasksNissinSummaryDetailsTableList&page=1&rows=1&IsSumOrDetail=0&CommID=" + $("#CommId").val();
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
            postStr = "Method=DataPost&Class=TaskManagement&Command=GetTasksMonthlySummaryDetailsTableList&page=1&rows=1&IsSumOrDetail=0&CommID=" + $("#CommId").val();
            $.ajax({
                url: "/HM/M_Main/HC/DataPostControl.aspx",
                type: 'POST',
                data: postStr,
                dataType: 'json',
                cache: false,
                async: true,
                success: function (_Data) {
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }

        function format(num) {
            return num.replace(/(\d{1,3})(?=(\d{3})+(?:$|\.))/g, '$1,');
        }
    </script>

</body>
</html>
