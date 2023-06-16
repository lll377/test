<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Programming.RentControlTable.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>规划管理-租控表</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>

    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/layer/layer.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/layer/extend/layer.ext.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/context/drag.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <link href="/HM/M_Main/Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <style type="text/css">
        .form-horizontal {
            padding: 3px;
        }

            .form-horizontal .form-group {
                margin: 0;
                margin-top: 5px;
            }

                .form-horizontal .form-group:first-child {
                    margin: 0;
                }

        .tabs-header {
            background-color: white;
        }

        .StaticsBar {
            padding: 5px 0px;
            background-color: #F5F5F5;
        }

            .StaticsBar .col-sm-2 {
                padding: 5px;
                cursor: pointer;
            }

            .StaticsBar .col-xs-2 {
                padding: 5px;
                cursor: pointer;
            }

        .ItemGroup {
            cursor: pointer;
            padding: 10px 0px;
            border-radius: 5px;
            background-color: white;
            box-shadow: 1px 2px 10px #CCCCCC;
            white-space: nowrap;
        }

            .ItemGroup label {
                display: inline-block;
                font-family: PingFang SC;
                color: #293745;
                font-size: 12px;
                font-weight: 600;
            }

        .Item_KZ {
            padding: 0px;
            width: 45px;
            height: 45px;
            background: linear-gradient(-60deg, #FF5757, #EF9719);
            border-radius: 15px;
        }

            .Item_KZ label {
                font-size: 14px;
                font-weight: 700;
                color: #FFFFFF;
                line-height: 45px;
                width: 45px;
                text-align: center;
                letter-spacing: 2px;
            }

        .Item_YZ {
            padding: 0px;
            width: 45px;
            height: 45px;
            background: linear-gradient(70deg, #4FACFE, #00F2FE);
            border-radius: 15px;
        }

            .Item_YZ label {
                font-size: 14px;
                font-weight: 700;
                color: #FFFFFF;
                line-height: 45px;
                width: 45px;
                text-align: center;
                letter-spacing: 2px;
            }

        .Item_RZ {
            padding: 0px;
            width: 45px;
            height: 45px;
            background: linear-gradient(-60deg, #57C6E1, #836DF0);
            border-radius: 15px;
        }

            .Item_RZ label {
                font-size: 14px;
                font-weight: 700;
                color: #FFFFFF;
                line-height: 45px;
                width: 45px;
                text-align: center;
                letter-spacing: 2px;
            }

        .Item_DZ {
            padding: 0px;
            width: 45px;
            height: 45px;
            background: linear-gradient(-60deg, #FCCB90, #D57EEB);
            border-radius: 15px;
        }

            .Item_DZ label {
                font-size: 14px;
                font-weight: 700;
                color: #FFFFFF;
                line-height: 45px;
                width: 45px;
                text-align: center;
                letter-spacing: 2px;
            }

        .Item_CZL {
            padding: 0px;
            margin-bottom: 4px;
            width: 45px;
            height: 45px;
            background: linear-gradient(-60deg, #F6D365, #FDA085);
            border-radius: 15px;
        }

            .Item_CZL label {
                padding-top: 5px;
                font-size: 14px;
                font-weight: 700;
                color: #FFFFFF;
                line-height: normal;
                width: 45px;
                text-align: center;
                letter-spacing: 2px;
            }

        .Item_ZJJJ {
            padding: 0px;
            margin-bottom: 4px;
            width: 45px;
            height: 45px;
            background: linear-gradient(-60deg, #C471F5, #FA71CD);
            border-radius: 15px;
        }

            .Item_ZJJJ label {
                padding-top: 5px;
                font-size: 14px;
                font-weight: 700;
                color: #FFFFFF;
                line-height: normal;
                width: 45px;
                text-align: center;
                letter-spacing: 2px;
            }

        #RoomList ul {
            line-height: 30px;
            background: #FFFFFF;
            border-radius: 10px;
        }

            #RoomList ul li {
                list-style: none;
                font-weight: bold;
                font-size: 12px;
                font-family: PingFang SC;
            }

        .RoomYz {
            color: #44B5FE;
            padding-top: 5px;
            box-shadow: 1px 2px 5px #CCCCCC;
        }

            .RoomYz:hover {
                box-shadow: 3px 6px 10px #CCCCCC;
            }

        .RoomRz {
            color: #8978F0;
            padding-top: 5px;
            box-shadow: 1px 2px 5px #CCCCCC;
        }

            .RoomRz:hover {
                box-shadow: 3px 6px 10px #CCCCCC;
            }

        .RoomDz {
            color: #DC8DDA;
            padding-top: 5px;
            box-shadow: 1px 2px 5px #CCCCCC;
        }

            .RoomDz:hover {
                box-shadow: 3px 6px 10px #CCCCCC;
            }


        #PlanarGraphDiv {
            margin: 0;
            padding: 0;
            font: 14px/1.5em simsun;
            overflow: hidden;
            width: 100%;
            height: 100%;
        }

        .button {
            height: 26px;
            line-height: 26px;
            width: 80px;
        }

        #canvas {
            position: absolute;
            left: 0px;
            top: 0px;
            z-index: 9;
            border: 2px dashed #ccc;
            padding: 10px;
            background: #fff;
        }

        .transparent {
            filter: alpha(opacity=50);
            -moz-opacity: 0.5;
            -khtml-opacity: 0.5;
            opacity: 0.5;
        }

        .box {
            width: 200px;
            height: 100px;
            cursor: pointer;
            position: absolute;
            top: 30px;
            left: 30px;
            z-index: 99;
        }

            .box .bg {
                width: 100%;
                height: 100%;
                background-color: orange;
            }

            .box .coor {
                width: 10px;
                height: 10px;
                overflow: hidden;
                cursor: se-resize;
                position: absolute;
                right: 0;
                bottom: 0;
                background-color: red;
            }

            .box .content {
                position: absolute;
                left: 50%;
                top: 50%;
                z-index: 99;
                text-align: center;
                font: bold 14px/1.5em simsun;
                background-color: transparent;
                border: none;
            }

        .PlanarGraphRoomDetail {
            background-color: #F5F5F5;
            display: none;
            position: relative;
            z-index: 999;
            border-radius: 6px;
            border: 1px solid #cccccc;
            box-shadow: 1px 2px 5px #cccccc;
            padding: 10px 0;
        }

            .PlanarGraphRoomDetail ul {
                padding: 5px 0px 5px 20px;
                background-color: white;
                line-height: 24px;
                border-radius: 4px 4px 4px 4px;
            }

                .PlanarGraphRoomDetail ul li {
                    list-style: none;
                    font-size: 12px;
                    font-weight: bold;
                }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden">
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
        <div id="tab0" data-issel="true" title="树形图" style="overflow: hidden;">
            <div id="layout" class="easyui-layout" data-options="fit:true,border:false">
                <div data-options="region:'west',border:true,width:260,title:'楼宇列表'">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <div class="col-sm-12 col-xs-12" style="padding: 0">
                                <label class="control-label"></label>
                                <input id="TreeBuildName" name="TreeBuildName" class="easyui-textbox" data-options="prompt:'楼宇、单元、楼层',
                                    icons:[{
                                        iconCls:'icon-clear',
                                        handler: function(e){
                                        $(e.data.target).textbox('clear');
                                        }}] " />
                                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:63" onclick="SearchTree();">筛选</a>
                            </div>
                        </div>
                    </form>
                    <ul id="tree" class="easyui-tree"></ul>
                </div>
                <div data-options="region:'center',border:false">
                    <div class="easyui-layout" data-options="fit:true">
                        <div data-options="region:'north',border:false,height:125" style="overflow: hidden;">
                            <form id="frm" class="form-horizontal" role="form" style="padding: 0px; margin: 0px;">
                                <div class="form-group">
                                    <div class="col-sm-2 col-md-2" style="padding: 0; text-align: center;">
                                        <label class="control-label">楼宇</label>
                                        <input id="BuildName" name="BuildName" class="easyui-textbox" data-options="width:'100px'" />
                                    </div>
                                    <div class="col-sm-2 col-md-2" style="padding: 0; text-align: center;">
                                        <label class="control-label">单元</label>
                                        <input type="hidden" id="TypeID" name="TypeID" />
                                        <input id="UnitSNum" name="UnitSNum" class="easyui-textbox" data-options="width:'100px'" />
                                    </div>
                                    <div class="col-sm-2 col-md-2" style="padding: 0; text-align: center;">
                                        <label class="control-label">楼层</label>
                                        <input id="FloorSNum" name="FloorSNum" class="easyui-textbox" data-options="width:'100px'" />
                                    </div>
                                    <div class="col-sm-2 col-md-2" style="padding: 0; text-align: center;">
                                        <label class="control-label">房号</label>
                                        <input id="RoomSign" name="RoomSign" class="easyui-textbox" data-options="width:'100px'" />
                                    </div>
                                    <div class="col-sm-2 col-md-2" style="padding: 0; text-align: center;">
                                        <label class="control-label">状态</label>
                                        <input id="RentRoomState" name="RentRoomState" class="easyui-combobox"
                                            data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100px',
                                                valueField:'id',textField:'text',data: [{id: '待租',text: '待租'},{id: '认租',text: '认租'},{id: '已租',text: '已租'}]"
                                            runat="server" />
                                    </div>
                                    <div class="col-sm-2 col-md-2" style="padding: 0">
                                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:65" onclick="InitRoomData();">筛选</a>
                                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:65" onclick="$('#frm').form('clear')">清空</a>
                                    </div>
                                </div>
                                <div class="form-group StaticsBar">
                                    <div class="col-sm-2 col-xs-2" onclick="Search('')">
                                        <div class="form-group ItemGroup">
                                            <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                                <div class="Item_KZ">
                                                    <label>可租</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 5px;">
                                                <div>
                                                    <label id="KZ_Count_Tree">100</label>套
                                                </div>
                                                <div>
                                                    <label id="KZ_SquareMetre_Tree">999999.99</label>平米
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 col-xs-2 " onclick="Search('已租')">
                                        <div class="form-group ItemGroup">
                                            <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                                <div class="Item_YZ">
                                                    <label>已租</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 5px;">
                                                <div>
                                                    <label id="YZ_Count_Tree">100</label>套
                                                </div>
                                                <div>
                                                    <label id="YZ_SquareMetre_Tree">999999.99</label>平米
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 col-xs-2 " onclick="Search('认租')">
                                        <div class="form-group ItemGroup">
                                            <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                                <div class="Item_RZ">
                                                    <label>认租</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 5px;">
                                                <div>
                                                    <label id="RZ_Count_Tree">100</label>套
                                                </div>
                                                <div>
                                                    <label id="RZ_SquareMetre_Tree">999999.99</label>平米
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 col-xs-2 " onclick="Search('待租')">
                                        <div class="form-group ItemGroup">
                                            <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                                <div class="Item_DZ">
                                                    <label>待租</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 5px;">
                                                <div>
                                                    <label id="DZ_Count_Tree">100</label>套
                                                </div>
                                                <div>
                                                    <label id="DZ_SquareMetre_Tree">999999.99</label>平米
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 col-xs-2 ">
                                        <div class="form-group ItemGroup">
                                            <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                                <div class="Item_CZL">
                                                    <label>
                                                        出租<br />
                                                        率</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 14px;">
                                                <div>
                                                    <label id="RentOutRate_Tree">100</label>%
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 col-xs-2 ">
                                        <div class="form-group ItemGroup">
                                            <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                                <div class="Item_ZJJJ">
                                                    <label>
                                                        租金<br />
                                                        均价</label>
                                                </div>

                                            </div>
                                            <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 14px;">
                                                <div>
                                                    <label id="RentQuote_Tree">100.00</label>元
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div data-options="region:'center',border:false">
                            <div class="easyui-layout" data-options="fit:true,border:false">
                                <div data-options="region:'center',border:false" style="background-color: #F5F5F5;">
                                    <div id="RoomList" style="width: 100%;">
                                    </div>
                                </div>
                                <div data-options="region:'south',border:true" style="overflow: hidden; width: 100%">
                                    <div id="pp" class="easyui-pagination" style="margin: 0px; padding: 0px; width: 100%;" data-options=""></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="tab1" data-issel="false" title="平面图" style="overflow: hidden;">
            <div class="easyui-layout" data-options="fit:true" style="">
                <div data-options="region:'north',border:false,height:125" style="overflow: hidden;">
                    <form id="frmPlanarGraph" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label right-sidebar-toggle">平面图名称</label>
                            <div class="col-sm-2 col-xs-2">
                                <input id="PlanarGraphName" name="PlanarGraphName" class="easyui-textbox" data-options="prompt:'请选择平面图!',editable:true,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelPlanarGraph();}" />
                            </div>
                            <div class="col-sm-2 col-xs-2">
                                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:120" onclick="HideDiv();">隐藏房屋列表</a>
                            </div>
                        </div>
                        <div class="form-group StaticsBar" style="padding-top: 5px">
                            <div class="col-sm-2 col-xs-2">
                                <div class="form-group ItemGroup">
                                    <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                        <div class="Item_KZ">
                                            <label>可租</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 5px;">
                                        <div>
                                            <label id="KZ_Count_PlanarGraph">0</label>套
                                        </div>
                                        <div>
                                            <label id="KZ_SquareMetre_PlanarGraph">0.00</label>平米
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2 col-xs-2 ">
                                <div class="form-group ItemGroup">
                                    <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                        <div class="Item_YZ">
                                            <label>已租</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 5px;">
                                        <div>
                                            <label id="YZ_Count_PlanarGraph">0</label>套
                                        </div>
                                        <div>
                                            <label id="YZ_SquareMetre_PlanarGraph">0.00</label>平米
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2 col-xs-2 ">
                                <div class="form-group ItemGroup">
                                    <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                        <div class="Item_RZ">
                                            <label>认租</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 5px;">
                                        <div>
                                            <label id="RZ_Count_PlanarGraph">0</label>套
                                        </div>
                                        <div>
                                            <label id="RZ_SquareMetre_PlanarGraph">0.00</label>平米
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2 col-xs-2 ">
                                <div class="form-group ItemGroup">
                                    <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                        <div class="Item_DZ">
                                            <label>待租</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 5px;">
                                        <div>
                                            <label id="DZ_Count_PlanarGraph">0</label>套
                                        </div>
                                        <div>
                                            <label id="DZ_SquareMetre_PlanarGraph">0.00</label>平米
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2 col-xs-2 ">
                                <div class="form-group ItemGroup">
                                    <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                        <div class="Item_CZL">
                                            <label>
                                                出租<br />
                                                率</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 14px;">
                                        <div>
                                            <label id="RentOutRate_PlanarGraph">0.00</label>%
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2 col-xs-2 ">
                                <div class="form-group ItemGroup">
                                    <div class="col-sm-4 col-xs-4" style="padding-left: 10px;">
                                        <div class="Item_ZJJJ">
                                            <label>
                                                租金<br />
                                                均价</label>
                                        </div>

                                    </div>
                                    <div class="col-sm-8 col-xs-8" style="padding: 0px 0px 0px 10px; margin-top: 14px;">
                                        <div>
                                            <label id="RentQuote_PlanarGraph">0.00</label>元
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div id="PlanarGraphDiv" data-options="region:'center',border:false" style="overflow: hidden;">
                    <div id="canvas">
                        <p>请选择平面图!</p>
                    </div>
                </div>
                <!-- 平面图区块对应的房屋列表 -->
                <div class="PlanarGraphRoomDetail animated fadeInRight" style="overflow-y: auto;">
                </div>
            </div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            var h = $(window).height();
            var w = $(window).width();
            $('#tab').css("height", h + 'px');
            $('#tab0,#tab1').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            $('#pp').pagination({
                width: '100%',
                pageList: [20, 32, 52],
                pageSize: 20,
                pageNumber: 1,
                showPageInfo: true,
                onSelectPage: function (pageNumber, pageSize) {
                    $(this).pagination('loading');
                    InitRoomData();
                    $(this).pagination('loaded');
                },
                afterPageText: '/{pages}',
                displayMsg: '共{total}套房屋'
            });
            LoadTree();
            InitRoomData();
            LoadTreeBaseData();//加载页面头数据
        });
        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //平面图
                    setTimeout(function () {
                        //LoadBaseData("PlanarGraph");
                    }, 300);
                }
            }
        }
        //筛选楼栋树
        function SearchTree() {
            $('#tree').tree("doFilter", $('#TreeBuildName').textbox('getValue'));
        }
        //加载楼栋树
        function LoadTree() {
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
                    $.messager.progress('close');
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "RentingPublicClass";
                    param.Method = "GetBuildTree";
                    param.BuildNum = "";
                    param.TreeBuildName = "";
                    $.messager.progress({
                        title: '温馨提示',
                        msg: '正在加载数据,请稍候...',
                        interval: 3000
                    });
                },
                onBeforeSelect: function (node) {
                },
                onSelect: function (row) {
                    $("#UnitSNum").textbox('setValue', row.attributes.UnitSNum);
                    $("#FloorSNum").textbox('setValue', row.attributes.FloorSNum);
                    var BuildName = "";
                    if (row.attributes.Type != '项目') {
                        if (row.attributes.Type == '楼宇') { BuildName = row.text; }
                        else {
                            row = $("#tree").tree('getParent', row.target);
                            while (!$("#tree").tree('isLeaf', row.target)) {
                                if (row.attributes.Type == '楼宇') {
                                    BuildName = row.text;
                                    break;
                                }
                                row = $("#tree").tree('getParent', row.target);
                            }
                        }
                    }
                    $("#BuildName").textbox('setValue', BuildName);
                    LoadTreeBaseData();
                    InitRoomData();
                },
                onLoadError: function (arguments) {
                    $.messager.progress('close');
                    $.messager.alert("温馨提示", '系统错误!');
                }
            });
        }

        //加载房屋列表
        function InitRoomData() {
            var options = $('#pp').pagination('options');
            var param = {
                "RoomSign": $("#RoomSign").textbox('getValue'),
                "BuildName": $('#BuildName').textbox('getValue'),
                "UnitSNum": $('#UnitSNum').textbox('getValue'),
                "FloorSNum": $("#FloorSNum").textbox('getValue'),
                "RentRoomState": $("#RentRoomState").combobox('getValue'),
                "page": options.pageNumber,
                "rows": options.pageSize
            };
            $.dataPostJson('Renting_RentControlTable', 'GetRoomList', param, true, false,
                function Init() {
                },
                function callback(data) {
                    $('#RoomList').empty();
                    var total = 0;
                    if (data.rows.length > 0) {
                        total = data.total;
                        var RoomData = data.rows;
                        var DataRows = Math.ceil(total / 4);
                        //循环行数
                        for (var i = 0; i < DataRows; i++) {
                            var ItemRoomData = [];
                            for (var k = (i * 4); k < (i + 1) * 4; k++) {
                                if (k < RoomData.length) {
                                    ItemRoomData.push(RoomData[k]);
                                }
                            }
                            CreateRoomList_Tree(ItemRoomData);
                        }
                    }
                    $('#pp').pagination({ total: total });
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //构建树形图房屋列表
        function CreateRoomList_Tree(ItemRoomData) {
            var ItemRowStr = '<div class="form-group">';
            ItemRoomData.forEach((itemRow) => {
                var Class = "RoomYz";
                if (itemRow.RentRoomState == "认租") {
                    Class = "RoomRz";
                } else if (itemRow.RentRoomState == "待租") {
                    Class = "RoomDz";
                }
                ItemRowStr += '<div class="col-sm-3 col-xs-3" style="cursor:pointer;" onclick="RoomClick(\'' + itemRow.RoomID + '\',\'' + itemRow.CommID + '\')">';
                ItemRowStr += '<ul class="' + Class + '">';
                ItemRowStr += '<li>';
                ItemRowStr += '房屋: ' + itemRow.RoomSign + '</li > ';
                ItemRowStr += '<li>';
                ItemRowStr += '面积: ' + itemRow.BuildArea + ' 平米</li>';
                ItemRowStr += '<li>';
                ItemRowStr += '状态: ' + itemRow.RentRoomState + '</li>';
                ItemRowStr += '</ul>';
                ItemRowStr += '</div>';
            });
            ItemRowStr += '</div>';
            $('#RoomList').append(ItemRowStr);
        }
        function Search(flag) {
            //$('#frm').form('clear');
            $('#RentRoomState').combobox("setValue", flag);
            $('#pp').pagination({ pageNumber: 1 });
            InitRoomData();
        }
        //点击房屋 加载房屋明细
        function RoomClick(RoomID, CommID) {
            var param = { "RoomID": RoomID, "CommID": CommID };
            LayerDialog.OpenWin('800', '540', '/HM/M_Main/Renting/Programming/RentControlTable/Detail.aspx?' + $.param(param), "房屋详情", true, function callback(_Data) {
                if (_Data != "") {

                }
            });
        }
        //加载树形图 页面头数据
        function LoadTreeBaseData() {
            $.dataPostJson("Renting_RentControlTable", 'GetTreeSumData', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('.StaticsBar label').each(function (e) {
                            if ($(this).attr("id")) {
                                if ($(this).attr("id").includes("Tree")) {
                                    var CurrID = $(this).attr("id").replaceAll('_Tree', "");
                                    $(this).text(data[CurrID]);
                                }
                            }
                        })
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });

        }

        /* 加载平面图和平面图区域 */

        //选择平面图
        function SelPlanarGraph() {
            LayerDialog.OpenWin('600', '400', '/HM/M_Main/Renting/Dialog/PlanarGraphSelect.aspx', "选择平面图", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $('#PlanarGraphName').textbox("setValue", data.PlanarGraphName);
                    $(".PlanarGraphRoomDetail").hide();
                    $('.PlanarGraphRoomDetail').empty();
                    LoadPlanarGraphData(data.ID, data.PlanarGraphUrl);
                    LoadPlanarGraphBaseData(data.ID, "");
                }
            });
        }
        //加载平面图的页面头数据
        function LoadPlanarGraphBaseData(PlanarGraphID, PlanarGraphDetailID) {
            $.dataPostJson("Renting_RentControlTable", 'GetPlanarGraphSumData', { "PlanarGraphID": PlanarGraphID, "PlanarGraphDetailID": PlanarGraphDetailID }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('.StaticsBar label').each(function (e) {
                            if ($(this).attr("id")) {
                                if ($(this).attr("id").includes("PlanarGraph")) {
                                    var CurrID = $(this).attr("id").replaceAll('_PlanarGraph', "");
                                    $(this).text(data[CurrID]);
                                }
                            }
                        })
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        //加载平面图
        function LoadPlanarGraphData(ID, PlanarGraphUrl) {
            //加载平面图
            $('#canvas').html('<img class="PicImg" src="' + PlanarGraphUrl + '" />');
            //创建拖拽方法
            $("#canvas").mousedown(function (e) {
                var canvas = $(this);
                e.preventDefault();
                var pos = $(this).position();
                this.posix = { 'x': e.pageX - pos.left, 'y': e.pageY - pos.top };
                $.extend(document, {
                    'move': true, 'move_target': this, 'call_down': function (e, posix) {
                        canvas.css({
                            'cursor': 'move',
                            'top': e.pageY - posix.y,
                            'left': e.pageX - posix.x
                        });
                    }, 'call_up': function () {
                        canvas.css('cursor', 'default');
                    }
                });
            });

            //获取平面图上的区块数据
            $.dataPostJson('Renting_RentControlTable', 'GetAllPlanarGraphDetail', { "PlanarGraphID": ID }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        var ResultData = $.parseJSON(data.data);
                        ResultData.forEach((itemRow) => {
                            createBox(itemRow);
                        });
                    } else { $.messager.alert("温馨提示", data.msg); }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //创建区块
        function createBox(data) {
            var guid = new GUID();
            var dataId = data.ID || guid.newGUID();
            var value = data.Text || '';
            var color = data.Color || '';
            var height = data.Height || 0;
            var width = data.Width || 0;
            var pageX = parseInt(data.PageX) || 0;
            var pageY = parseInt(data.PageY) || 0;
            //var ItemData = data.ItemData.replaceAll('"', "'");
            //更新计数器并记录当前计数
            //创建区域块
            var pos = $("#canvas").position();
            var box = $('<div class="box" onclick="LoadPlanarGraphList(\'' + dataId + '\');" ><pre class="content">' + value + '</pre><div class="bg transparent" style="background-color:' + color + '"></div></div>').css({
                width: width,
                height: height,
                top: pageY > 0 ? pageY : (pos.top > 0 ? 0 : pos.top * -1 + 50),
                left: pageX > 0 ? pageX : (pos.left > 0 ? 0 : pos.left * -1 + 30)
            }).appendTo("#canvas");

            //计算文本位置
            box.find('.content').css({
                marginLeft: box.find('.content').width() / 2 * -1,
                marginTop: box.find('.content').height() / 2 * -1
            });
        }

        function LoadPlanarGraphList(PlanarGraphDetailID) {
            LoadPlanarGraphBaseData("", PlanarGraphDetailID);//加载头数据
            $(".PlanarGraphRoomDetail").hide();
            var w = $('#tab1').width();
            var h = $('#tab1').height();
            $(".PlanarGraphRoomDetail").css({
                width: '300px',
                height: h - 130,
                top: 120,
                left: w - 305
            }).show();
            $('.PlanarGraphRoomDetail').empty();
            //frmPlanarGraphRoomDetail
            //获取平面图 区块 对应的房屋数据
            $.dataPostJson('Renting_RentControlTable', 'GetPlanarGraphRoomList', { "PlanarGraphDetailID": PlanarGraphDetailID }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.length > 0) {
                        //构建平面图 房屋列表
                        data.forEach((itemRow) => {
                            var ItemRowStr = '<div class="form-group" style="background-color:white;">';
                            var Class = "RoomYz";
                            if (itemRow.RentRoomState == "认租") {
                                Class = "RoomRz";
                            } else if (itemRow.RentRoomState == "待租") {
                                Class = "RoomDz";
                            }
                            ItemRowStr += '<div class="col-sm-12 col-xs-12" style="cursor:pointer;" onclick="RoomClick(\'' + itemRow.RoomID + '\',\'' + itemRow.CommID + '\')">';
                            ItemRowStr += '<ul class="' + Class + '">';
                            ItemRowStr += '<li>';
                            ItemRowStr += '房屋: ' + itemRow.RoomSign + '</li > ';
                            ItemRowStr += '<li>';
                            ItemRowStr += '面积: ' + itemRow.BuildArea + ' 平米</li>';
                            ItemRowStr += '<li>';
                            ItemRowStr += '状态: ' + itemRow.RentRoomState + '</li>';
                            ItemRowStr += '</ul>';
                            ItemRowStr += '</div>';
                            ItemRowStr += '</div>';
                            $('.PlanarGraphRoomDetail').append(ItemRowStr);
                        })
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function HideDiv() {
            $(".PlanarGraphRoomDetail").hide();
        }
    </script>
</body>
</html>
