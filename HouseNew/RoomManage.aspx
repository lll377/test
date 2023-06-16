<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomManage.aspx.cs" Inherits="M_Main.HouseNew.RoomManage" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <%--<link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />--%>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framedialog_eightcol.css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <style type="text/css">
        .auto-style1 {
            height: 20px;
            text-align: left;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        table tr {
            border: 1px double #F6F6F6;
        }
    </style>
</head>
<body style="overflow-y: auto">
    <form id="frmForm" runat="server">
           <%--房屋编号--%>
        <input id="RoomSignHistory" name="RoomSignHistory" type="hidden" runat="server"/>
        <%--房屋名称 --%>
        <input id="RoomNameHistory" name="RoomNameHistory" type="hidden" runat="server"/>
        <%--组团区域--%>
        <input id="RegionSNumNew" name="RegionSNumNew" type="hidden" runat="server"/>
        <input id="RegionSNumHistory" name="RegionSNumHistory" type="hidden" runat="server"/>
        <%--建筑面积--%>
        <input id="BuildAreaHistory" name="BuildAreaHistory" type="hidden" runat="server"/>
        <%--套内面积--%>
        <input id="InteriorAreaHistory" name="InteriorAreaHistory" type="hidden" runat="server"/>
        <%--公摊面积--%>
        <input id="CommonAreaHistory" name="CommonAreaHistory" type="hidden" runat="server"/>
        <%--房屋类型--%>
        <input id="RoomTypeNew" name="RoomTypeNew" type="hidden" runat="server"/>
        <input id="RoomTypeHistory" name="RoomTypeHistory" type="hidden" runat="server"/>   
        <%--产权性质--%>
        <input id="PropertyRightsNew" name="PropertyRightsNew" type="hidden" runat="server"/>
        <input id="PropertyRightsHistory" name="PropertyRightsHistory" type="hidden" runat="server"/>
        <%--使用性质--%>
        <input id="PropertyUsesNew" name="PropertyUsesNew" type="hidden" runat="server"/>
        <input id="PropertyUsesHistory" name="PropertyUsesHistory" type="hidden" runat="server"/>
        <%--使用状态--%>
        <input id="UsesStateNew" name="UsesStateNew" type="hidden" runat="server"/>
        <input id="UsesStateHistory" name="UsesStateHistory" type="hidden" runat="server"/>
        <%--合同交房时间--%>
        <input id="ContSubDateHistory" name="ContSubDateHistory" type="hidden" runat="server"/>
        <%--物业接管时间--%>
        <input id="TakeOverDateHistory" name="TakeOverDateHistory" type="hidden" runat="server"/>
        <%--集中交房时间--%>
        <input id="getHouseEndDateHistory" name="getHouseEndDateHistory" type="hidden" runat="server"/>
        <input id="getHouseStartDateHistory" name="getHouseStartDateHistory" type="hidden" runat="server"/>
        <%--实际交房时间--%>
        <input id="ActualSubDateHistory" name="ActualSubDateHistory" type="hidden" runat="server"/>
        <%--装修时间--%>
        <input id="FittingTimeHistory" name="FittingTimeHistory" type="hidden" runat="server"/>
        <%--入住时间--%>
        <input id="StayTimeHistory" name="StayTimeHistory" type="hidden" runat="server"/>

        <input type="hidden" name="HPropertyRights" id="HPropertyRights" />
        <input type="hidden" name="HPropertyUses" id="HPropertyUses" />
        <input id="HiAreaType" type="hidden" size="4" name="HidRoomState"
            runat="server"><input type="hidden" name="HRoomModel" id="HRoomModel" />
        <input type="hidden" name="HRegionSNum" id="HRegionSNum" runat="server" />
        <input class="easyui-validatebox" onkeypress="CheckNumeric();" id="hiYardArea"
            type="hidden" maxlength="20" size="10" name="hiYardArea" runat="server">
        <input class="easyui-validatebox" onkeypress="CheckNumeric();" id="hiInteriorArea"
            type="hidden" maxlength="20" size="10" name="BuildArea" runat="server">
        <input class="easyui-validatebox" onkeypress="CheckNumeric();" id="hiBuildArea"
            type="hidden" maxlength="20" size="10" name="BuildArea" runat="server"><input type="hidden" id="HAreaType" name="HAreaType" />

        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server" />
        <input id="RoomID" type="hidden" size="1" name="RoomID" runat="server" />

         <input id="CustID1" type="hidden" size="1" name="CustID1" runat="server" />
        <input id="CustID2" type="hidden" size="1" name="CustID2" runat="server" />

        <input id="HidChange" type="hidden" size="1" name="HidChange" runat="server" />
        <input id="hiback" type="hidden" size="1" name="hiback" runat="server" />
        <input size="1" type="hidden" name="hiIsTree" runat="server" id="hiIsTree" />
        <input type="hidden" id="FileList" name="FileList" />
        <script src="../jscript/Dialog.js" type="text/javascript"></script>

        <div id="Divreport" name="Divreport" style="width: 100%;" class="easyui-layout" title="">
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" name="info1" id="info1">
                        <a data-toggle="tab" href="#tab-1" aria-expanded="true">房屋基本信息</a>
                    </li>
                    <li class="" name="info2" id="info2">
                        <a data-toggle="tab" href="#tab-2" aria-expanded="false">房屋面积信息</a>
                    </li>
                    <li class="" name="info3" id="info3">
                        <a data-toggle="tab" href="#tab-3" aria-expanded="false">房屋状态信息</a>
                    </li>
                    <li class="" name="info4" id="info4">
                        <a data-toggle="tab" href="#tab-4" aria-expanded="false">房屋装修信息</a>
                    </li>

                    <li class="" name="info5" id="info5">
                        <a data-toggle="tab" href="#tab-5" aria-expanded="false">当前业主信息</a>
                    </li>
                    <li class="" name="info6" id="info6">
                        <a data-toggle="tab" href="#tab-6" aria-expanded="false">房屋转让历史</a>
                    </li>
                    <li class="" name="info7" id="info7">
                        <a data-toggle="tab" href="#tab-7" aria-expanded="false">当前租户信息</a>
                    </li>

                    <li class="" name="info8" id="info8">
                        <a data-toggle="tab" href="#tab-8" aria-expanded="false">房屋租赁历史</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body">
                            <div class="Frm">
                                <div class="SearchContainer">
                                    <table class="DialogTable" cellspacing="8" style="margin-bottom: 50px;">
                                        <tr>
                                            <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">基础信息</span> </td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">组团区域</td>
                                            <td class="DialogTdContent">
                                                <select id="RegionSNum" name="RegionSNum" data-options="editable:false,panelHeight: '100px'" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="DialogTdTitle">楼宇</td>
                                            <td class="DialogTdContent">
                                                <select id="BuildSNum" data-options="editable:true,panelHeight:'auto'" name="BuildSNum" onchange="BuildSNumChange();" runat="server" style="width: 75%">
                                                </select></td>

                                            <td class="DialogTdTitle">房屋编号</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="RoomSign" onblur="OnBlur_RoomSign();" data-options="required:true"
                                                    name="RoomSign" runat="server">
                                            <td class="DialogTdTitle">房屋名称</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="RoomName" maxlength="50" name="RoomName" runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">单元</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="UnitSNum" onblur="javascript:OnBlur_UnitSNum(this);" name="UnitSNum" runat="server">
                                                <input id="hiUnitSNum" type="hidden" size="1" name="hiUnitSNum" runat="server">
                                                <input class="easyui-validatebox" style="display: none" id="UnitName" maxlength="50" name="UnitName" runat="server"></td>
                                            <td class="DialogTdTitle">楼层</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="FloorSNum" onblur="javascript:OnBlur_FloorSNum(this);" name="FloorSNum" runat="server">
                                                <input id="hiFloorSNum" type="hidden" size="1" name="hiFloorSNum" runat="server">
                                                <input class="easyui-validatebox" style="display: none" id="FloorName" maxlength="50" name="FloorName" runat="server">
                                            </td>

                                            <td class="DialogTdTitle">同单元同楼层流水号</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'digital'" id="RoomSNum" onblur="javascript:CheckRoomSNum(this);" name="RoomSNum" runat="server"><div class="font_red" id="results"></div>
                                            </td>
                                            <td class="DialogTdTitle">面积类型</td>
                                            <td class="DialogTdContent">
                                                <select id="AreaType" name="AreaType" data-options="  editable:false,panelHeight: '100px'" runat="server">
                                                    <option value="0" selected>产权面积</option>
                                                    <option value="1">合同面积</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">建筑面积</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'digital'" id="BuildArea"
                                                    name="BuildArea1" runat="server" size="20"></td>
                                            <td class="DialogTdTitle">计费面积</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'digital'" id="CalcArea"
                                                    name="CalcArea" runat="server" size="20"></td>
                                            <td class="DialogTdTitle">套内面积</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="InteriorArea"
                                                    name="InteriorArea" runat="server"></td>
                                            <td class="DialogTdTitle">公摊面积</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="CommonArea"
                                                    name="CommonArea" runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">花园面积</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="GardenArea" value="0" data-options="prompt:'请输入数字',validType:'digital'"
                                                    name="RoomTowards" runat="server"></td>
                                            <td class="DialogTdTitle">地下室面积</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="YardArea"
                                                    name="YardArea" runat="server" value="0"></td>
                                            <td class="DialogTdTitle">大堂分摊面积</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="CommonLobbyArea"
                                                    name="CommonLobbyArea" runat="server" size="20"></td>
                                            <td class="DialogTdTitle">层间分摊面积</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="CommonLayerArea"
                                                    name="CommonLayerArea" runat="server" size="20"></td>

                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">公摊比率</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" onkeypress="CheckNumeric();" id="PoolRatio"
                                                    name="PoolRatio" runat="server"></td>
                                            <td class="DialogTdTitle">建筑结构</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="BuildStructure" maxlength="50" name="BuildStructure"
                                                    runat="server"></td>
                                            <td class="DialogTdTitle">单位面积承重参数</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" onkeypress="CheckNumeric();" id="BearParameters"
                                                    name="BearParameters" runat="server"></td>
                                            <td class="DialogTdTitle">房屋户型</td>
                                            <td class="DialogTdContent">
                                                <select id="RoomModel" name="RoomModel" data-options="   editable:false,panelHeight: '100px'" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">层&nbsp;&nbsp;&nbsp; 高</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="FloorHeight" maxlength="50" name="FloorHeight" runat="server"></td>
                                            <td class="DialogTdTitle">产权性质</td>
                                            <td class="DialogTdContent">
                                                <select id="PropertyRights" name="PropertyRights" data-options="   editable:false,panelHeight: '100px'" runat="server">
                                                    <option selected></option>
                                                </select></td>

                                            <td class="DialogTdTitle">使用性质</td>
                                            <td class="DialogTdContent">
                                                <select id="PropertyUses" data-options="   editable:false,panelHeight: '100px'" name="PropertyUses" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="DialogTdTitle">
                                                <input class="easyui-validatebox" onkeypress="CheckNumeric();" id="hiCommonArea"
                                                    type="hidden" maxlength="20" size="10" name="BuildArea" runat="server">使用状态</td>
                                            <td class="DialogTdContent">
                                                <select id="UsesState" data-options="   editable:false,panelHeight: '100px'" name="UsesState" runat="server" disabled>
                                                    <option selected></option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">入住状态</td>
                                            <td class="DialogTdContent">
                                                <select id="LiveStates" name="LiveStates" runat="server">
                                                    <option></option>
                                                </select>
                                                <a id="tipLiveStates" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                                            </td>
                                            <td class="DialogTdTitle">
                                                <input class="easyui-validatebox" onkeypress="CheckNumeric();" id="hiGardenArea"
                                                    type="hidden" maxlength="20" size="10" name="BuildArea" runat="server">交房状态</td>
                                            <td class="DialogTdContent">
                                                <select id="RoomState" name="RoomState" runat="server" data-options="  editable:false, panelHeight: '100px'">
                                                    <option></option>
                                                </select></td>

                                            <td class="DialogTdTitle">
                                                <label id="changetime">变更时间</label></td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" onkeypress="CheckDate();" id="ChangeDate"
                                                    onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" maxlength="10"
                                                    size="10" name="ChangeDate" runat="server"></td>
                                            <td class="DialogTdTitle">
                                                <input id="HidRoomState" type="hidden" size="4" name="HidRoomState"
                                                    runat="server">
                                                <lable id="ggyy">更改原因</lable>
                                            </td>
                                            <td class="DialogTdContent">
                                                <input id="ChageMemo" class="easyui-validatebox" maxlength="50" name="ChageMemo"
                                                    runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle" style="height: 40px">配置情况</td>
                                            <td colspan="7" style="width: 75%">
                                                <asp:CheckBox ID="Configuration1" runat="server" Text="空调系统"></asp:CheckBox><asp:CheckBox ID="Configuration2" runat="server" Text="通讯系统"></asp:CheckBox><asp:CheckBox ID="Configuration3" runat="server" Text="网络系统"></asp:CheckBox><asp:CheckBox ID="Configuration4" runat="server" Text="电视系统"></asp:CheckBox><asp:CheckBox ID="Configuration5" runat="server" Text="消防系统"></asp:CheckBox><asp:CheckBox ID="Configuration6" runat="server" Text="供水系统"></asp:CheckBox><asp:CheckBox ID="Configuration7" runat="server" Text="供电系统"></asp:CheckBox><asp:CheckBox ID="Configuration8" runat="server" Text="供气系统"></asp:CheckBox><asp:CheckBox ID="Configuration9" runat="server" Text="排烟系统"></asp:CheckBox><asp:CheckBox ID="Configuration10" runat="server" Text="隔油系统"></asp:CheckBox><asp:CheckBox ID="Configuration11" runat="server" Text="应急电源"></asp:CheckBox><asp:CheckBox ID="Configuration12" runat="server" Text="其它配置"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1" colspan="8">&nbsp;&nbsp;&nbsp;
                  <input class="easyui-validatebox" id="Advertising" style="display: none" maxlength="50" name="Advertising" runat="server">
                                                注：1、“同单元同楼层流水号”是按照楼宇、单元、楼层生成的房屋流水号，它将影响到房号在可视平面图中的位置，同一楼宇、单元、楼层的流水号不能重复；2、 房屋出租后，使用状态自动变更。3、输入实际交房时间后,交付状态自动变更。</td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">其他信息</span> </td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">房屋类型</td>
                                            <td class="DialogTdContent">
                                                <select id="RoomType" name="RoomType" data-options="editable:false,panelHeight: '100px'" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="DialogTdTitle">销售状态</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="SaleState" maxlength="50" name="SaleState" runat="server" type="text" /></td>


                                            <td class="DialogTdTitle">购房合同号</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="ContractSign" maxlength="50" name="ContractSign" runat="server" type="text" /></td>
                                            <td class="DialogTdTitle">营销编号</td>
                                            <td class="DialogTdContent">
                                                <input id="MarketID" name="MarketID" runat="server" disabled="disabled" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">房屋产权号</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="RightsSign" maxlength="50" name="RightsSign" runat="server" type="text" /></td>
                                            <td class="DialogTdTitle">合同交房时间</td>
                                            <td class="DialogTdContent">
                                                <input class="Wdate" id="ContSubDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ContSubDate" runat="server" type="text" /></td>
                                            <td class="DialogTdTitle">物业接管时间</td>
                                            <td class="DialogTdContent">
                                                <input class="Wdate" id="TakeOverDate" options="required:true" maxlength="50" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" name="TakeOverDate" runat="server" onblur="OnBlur_TakeOverDate();" /></td>
                                            <td class="DialogTdTitle">集中交房时间从</td>
                                            <td class="DialogTdContent">
                                                <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" id="getHouseStartDate"
                                                    name="getHouseStartDate" runat="server" /></td>

                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">集中交房时间到</td>
                                            <td class="DialogTdContent">
                                                <input class="Wdate" onkeypress="CheckDate();" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="getHouseEndDate"
                                                    name="getHouseEndDate" runat="server" /></td>
                                            <td class="DialogTdTitle">实际交房时间</td>
                                            <td class="DialogTdContent">
                                                <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="ActualSubDate" maxlength="50" name="ActualSubDate" onkeypress="CheckDate();" runat="server" type="text" /></td>
                                            <td class="DialogTdTitle">交付状态</td>
                                            <td class="DialogTdContent">
                                                <select id="PayState" data-options="editable:false,panelHeight: '100px'" name="PayState" runat="server" disabled="true">
                                                    <option selected></option>
                                                </select></td>

                                            <td class="DialogTdTitle">装修时间</td>
                                            <td class="DialogTdContent">
                                                <input class="Wdate" id="FittingTime" onkeypress="CheckDate();" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" maxlength="50" name="FittingTime" runat="server" type="text" /></td>


                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">装修情况</td>
                                            <td class="DialogTdContent">
                                                <input class="easyui-validatebox" id="Renovation" maxlength="50" name="Renovation" runat="server" type="text" /></td>
                                            <td class="DialogTdTitle">入住时间</td>
                                            <td class="DialogTdContent">
                                                <input class="Wdate" onkeypress="CheckDate();" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="StayTime" maxlength="50" name="StayTime" runat="server" type="text" /></td>
                                            <td class="DialogTdTitle">开始缴费时间</td>
                                            <td class="DialogTdContent">
                                                <input class="Wdate" id="PayBeginDate" onkeypress="CheckDate();" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" maxlength="50" name="PayBeginDate" runat="server" type="text" />
                                            </td>
                                            <td class="DialogTdTitle">
                                                <input id="hiPayBeginDate" type="hidden" size="4" name="hiPayBeginDate"
                                                    runat="server">
                                                <lable id="ggyy2">更改原因</lable>
                                            </td>
                                            <td class="DialogTdContent">
                                                <input id="PayDateChangeMemo" class="easyui-validatebox" maxlength="50" name="PayDateChangeMemo"
                                                    runat="server"></td>

                                        </tr>
                                        <tr style="display: none;">
                                            <td class="DialogTdTitle">开发主体</td>
                                            <td class="TdContentSearch">
                                                <select id="ConstUnitName" name="ConstUnitName" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'" runat="server">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdTitle">文件列表<a id="upbtn" href="javascript:void(0)">(上传)</a><input id="FileURL" name='FileURL' type="hidden" runat="server" /></td>
                                            <td colspan="7" style="height: 22px; width: 75%; border: 1px #cccccc solid">
                                                <span id="List" name='List' runat="server" />
                                            </td>
                                        </tr>


                                    </table>
                                    <table style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 22px; background-color: #f5f5f5; border-top: 1px solid #cccccc; left: 0px;">
                                        <tr>
                                            <td colspan="8">
                                                <input type="button" class="button" value="保存" id="BtnSave" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="button" class="button" value="关闭" id="BtnReturn" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer2"></div>
                            </div>
                        </div>
                    </div>

                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer3"></div>
                            </div>
                        </div>
                    </div>

                    <div id="tab-4" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer4"></div>
                            </div>
                        </div>
                    </div>

                    <div id="tab-5" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <iframe id="CustomerDetail1" src="" style="width: 100%; border: none; height:650px;" class="Frm"></iframe>
                        </div>
                    </div>

                    <div id="tab-6" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer6"></div>
                            </div>
                        </div>
                    </div>

                    <div id="tab-7" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <iframe id="CustomerDetail2" src="" style="width: 100%; border: none; height:650px;" class="Frm"></iframe>
                        </div>
                    </div>

                    <div id="tab-8" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer8"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
    <form id="uploadform" enctype='multipart/form-data' class="easyui-dialog" title="上传文件"
        data-options="closed: true,modal:true" style="width: 580px; height: 150px; padding: 10px;">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td class="DialogTdTitle"></td>
            </tr>
            <tr>
                <td class="DialogTdContent">
                    <input id="uploadfile" type="file" name="uploadfile" style="width: 80%;" />
                    <input id="btnSelFile" name="btnSelFile" class="button" type="button" onclick="upLoadFile();"
                        style="width: 72px; height: 32px" value="选择上传 " />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>



<script type="text/javascript">

    var w = $(window).width();
    var h = $(window).height();

    function InitTableHeight() {
        var h = $(window).height() - 38;
        $(".Frm").css({ "height": h + "px" });
        $("#TableContainer1").css("height", h + "px");
        $("#TableContainer2").css("height", h + "px");
        $("#TableContainer3").css("height", h + "px");
        $("#TableContainer4").css("height", h + "px");
        $("#TableContainer5").css("height", h + "px");
        $("#TableContainer6").css("height", h + "px");
        $("#TableContainer7").css("height", h + "px");
        $("#TableContainer8").css("height", h + "px");
    }
    $(".tabs-container li").click(function () {
        $('#tab-1').attr("class", "tab-pane");
        $('#tab-2').attr("class", "tab-pane");
        $('#tab-3').attr("class", "tab-pane");
        $('#tab-4').attr("class", "tab-pane");
        $('#tab-5').attr("class", "tab-pane");
        $('#tab-6').attr("class", "tab-pane");
        $('#tab-7').attr("class", "tab-pane");
        $('#tab-8').attr("class", "tab-pane");

        $('#info1').attr("class", "");
        $('#info2').attr("class", "");
        $('#info3').attr("class", "");
        $('#info4').attr("class", "");
        $('#info5').attr("class", "");
        $('#info6').attr("class", "");
        $('#info7').attr("class", "");
        $('#info8').attr("class", "");
        switch ($(this).attr("name")) {
            case "info1":
                $('#tab-1').attr("class", "tab-pane active");
                $('#info1').attr("class", "active");

                break;
            case "info2":
                $('#tab-2').attr("class", "tab-pane active");
                $('#info2').attr("class", "active");
                LoadList2();
                break;
            case "info3":
                $('#tab-3').attr("class", "tab-pane active");
                $('#info3').attr("class", "active");
                //alert(33);
                LoadList3();
                break;
            case "info4":
                $('#tab-4').attr("class", "tab-pane active");
                $('#info4').attr("class", "active");
                LoadList4();
                break;
            case "info5":
                $('#tab-5').attr("class", "tab-pane active");
                $('#info5').attr("class", "active");
                $("#CustomerDetail1").attr("src", "CustomerDetail.aspx?CustID=" + $("#CustID1").val());
                break;
            case "info6":
                $('#tab-6').attr("class", "tab-pane active");
                $('#info6').attr("class", "active");
                LoadList6();
                break;
            case "info7":
                $('#tab-7').attr("class", "tab-pane active");
                $('#info7').attr("class", "active");
                $("#CustomerDetail2").attr("src", "CustomerDetail.aspx?CustID=" + $("#CustID1").val());
                break;
            case "info8":
                $('#tab-8').attr("class", "tab-pane active");
                $('#info8').attr("class", "active");
                LoadList8();
                break;
        }
    });
</script>
<%--房屋面积--%>
<script language="javascript" type="text/javascript">
    var column2 = [[
        { field: 'oldAreaTypeName ', title: '修改前面积类型', width: 100, align: 'left', sortable: true },
        { field: 'AreaTypeName', title: '修改后面积类型', width: 100, align: 'left', sortable: true },
        { field: 'OldBuildArea', title: '修改前建筑面积', width: 100, align: 'left', sortable: true },
        { field: 'NewBuildArea', title: '修改后建筑面积', width: 100, align: 'left', sortable: true },
        { field: 'OldInteriorArea', title: '修改前套内面积', width: 100, align: 'left', sortable: true },
        { field: 'NewInteriorArea', title: '修改后套内面积', width: 100, align: 'left', sortable: true },
        { field: 'OldCommonArea', title: '修改前公摊面积', width: 100, align: 'left', sortable: true },
        { field: 'NewCommonArea', title: '修改后公摊面积', width: 100, align: 'left', sortable: true },
        { field: 'OldGardenArea', title: '修改前花园面积', width: 100, align: 'left', sortable: true },
        { field: 'NewGardenArea', title: '修改后花园面积', width: 100, align: 'left', sortable: true },
        { field: 'OldYardArea', title: '修改前庭院面积', width: 100, align: 'left', sortable: true },
        { field: 'NewYardArea', title: '修改后庭院面积', width: 100, align: 'left', sortable: true }
    ]];
    var frozenColumns2 = [[
        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
        { field: 'UserName', title: '修改人', width: 100, align: 'left', sortable: true },
        { field: 'ChangeDate', title: '修改日期', width: 150, align: 'left', sortable: true }
    ]]
    function LoadList2() {
        $("#TableContainer2").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Room&Command=searchroomareahis&RoomID=' + $('#RoomID').val(),
            method: "get",
            title: '',
            nowrap: false,
            pageSize: 15,
            pageList: [15, 30, 60],
            columns: column2,
            frozenColumns: frozenColumns2,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            sortOrder: "asc",
            onLoadSuccess: function (data) {
            }
        });
    }       
</script>
<%--房屋状态--%>
<script>
    var column3 = [[
        {
            field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true
        },
        { field: 'CustName', title: '客户名称', width: 250, align: 'left', sortable: true },
        { field: 'BuildArea', title: '建筑面积', width: 100, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true },
        { field: 'StateName', title: '交房状态', width: 100, align: 'left', sortable: true },
        {
            field: 'SubmitTime', title: '交房时间', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.SubmitTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FittingTime', title: '装修时间', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FittingTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'StayTime', title: '入住时间', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.StayTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'PayBeginDate', title: '缴费开始时间', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.PayBeginDate, "yyyy-MM-dd");
                return str;
            }
        }
    ]];
    function LoadList3() {
        $("#TableContainer3").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: 100,
            pageList: [100, 200, 500, 1000],
            pagination: true,
            columns: column3,
            fitColumns: true,
            singleSelect: true,
            border: false,
            remoteSort: false,
            rownumbers: true,
            width: "100%",
            border: false,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Room", "waitsplitroomsearch", "TableContainer3", param);
            },
            onLoadSuccess: function (data) {

            }
        });
    }



</script>
<%--房屋装修信息--%>
<script type="text/javascript">

    var column4 = [[
        { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
        {
            field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true
        },
        { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
        {
            field: 'ApplyDate', title: '申请日期', width: 140, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ApplyDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'RenoPermitSign', title: '许可证号', width: 180, align: 'left', sortable: true },
        {
            field: 'RenoStartDate', title: '装修开工时间', width: 140, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.RenoStartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ActRenoEndDate', title: '实际完工时间', width: 140, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ActRenoEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'ConsUnit', title: '施工单位', width: 280, align: 'left', sortable: true },
        { field: 'SceneRespMan', title: '现场负责人', width: 280, align: 'left', sortable: true },
        { field: 'SceneRespManTel', title: '负责人联系方式', width: 280, align: 'left', sortable: true },
        { field: 'cunt', title: '办证数量', width: 150, align: 'left', sortable: true },
        { field: 'RenoCustCharge', title: '装修收费金额', width: 150, align: 'left', sortable: true },
        { field: 'RuleCount', title: '装修整改单数', width: 150, align: 'left', sortable: true },
        { field: 'RenoStatus', title: '装修状态', width: 150, align: 'left', sortable: true }
    ]];

    function LoadList4() {

        $("#TableContainer4").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column4,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            sortOrder: "asc",
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("RoomRental", "GetYZXSearchList", "TableContainer4", param);
            },
            onLoadSuccess: function (data) {

            }
        });
    }
</script>
<%--房屋转让--%>
<script language="javascript" type="text/javascript">
    var column6 = [[
        {
            field: 'CustName', title: '现业主名称', width: 150, align: 'left', sortable: true
        },
        { field: 'MasterName', title: '原业主名称', width: 160, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 160, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 160, align: 'left', sortable: true },
        { field: 'FixedTel', title: '固定电话', width: 100, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '移动电话', width: 100, align: 'left', sortable: true },
        {
            field: 'ChargeTime', title: '变更时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = formatDate(row.ChargeTime, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'ChangeUsername', title: '经办人', width: 100, align: 'left', sortable: true }
    ]];


    function LoadList6() {
        $("#TableContainer6").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: 15,
            pageList: [15, 30, 60],
            columns: column6,
            fitColumns: true,
            remoteSort: false,
            pagination: true,
            width: "100%",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParamNoPage("RoomRental", "SaleRoomSearchList", "TableContainer6", param);
            },
            onLoadSuccess: function (data) {
            }
        });
    }
</script>
<%--房屋租赁--%>
<script language="javascript" type="text/javascript">
    var frozenColumns8 = [[
        { field: 'CommName', title: '管理项目', width: 100, align: 'left', sortable: true },
        { field: 'CustName', title: '租户名称', width: 200, align: 'left', sortable: true },
        { field: 'BuildName', title: '楼宇', width: 100, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 160, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 160, align: 'left', sortable: true }
    ]]
    var column8 = [[
        { field: 'FixedTel', title: '固定电话', width: 100, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '移动电话', width: 100, align: 'left', sortable: true },
        {
            field: 'StartDate', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.StartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'EndDate', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.EndDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ReletDate', title: '续约时间至', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ReletDate, "yyyy-MM-dd");
                return str;
            }
        },

        { field: 'ContSign', title: '合同编号', width: 100, align: 'left', sortable: true },
        {
            field: 'ChargeTime', title: '退租时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = '';
                if (row.IsActive == '0') {
                    str = formatDate(row.ChargeTime, "yyyy-MM-dd");
                }
                return str;
            }
        },
        {
            field: 'ChargeCause', title: '退租原因', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = '';
                if (row.IsActive == '0') {
                    str = row.ChargeCause;
                }
                return str;
            }
        }
    ]];

    function ViewDetail(strCustID, strLiveID, strRoomID) {
        HDialog.Open(w, h, '../RentalNew/LeaseRoomNewManage.aspx?OPType=Detail&CustID=' + strCustID + '&LiveID=' + strLiveID + '&RoomID=' + strRoomID, '租赁详情', false, function (_Data) {
            if (_Data == '1') {
                LoadList8();
            }
        });
    }
    function LoadList8() {
        $("#TableContainer8").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: 100,
            pageList: [100, 200, 500, 1000],
            columns: column8,
            fitColumns: false,
            frozenColumns: frozenColumns8,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("RoomRental", "LeaseInfoSeachList", "TableContainer8", param);
            },
            onLoadSuccess: function (data) {

            }
        });
        $('#SearchDlg').dialog('close');
    }

    $(function () {
              //房屋编号
        $("#RoomSignHistory").val($("#RoomSign").val());
             //房屋名称
             $("#RoomNameHistory").val($("#RoomName").val());
              //组团区域
             var index=document.getElementById("RegionSNum").selectedIndex;//获取当前选择项的索引.
             var temp= document.getElementById("RegionSNum").options[index].text;//获取当前选择项的文本.
             $("#RegionSNumHistory").val(temp);
             //建筑面积
             $("#BuildAreaHistory").val($("#BuildArea").val());
              //套内面积
             $("#InteriorAreaHistory").val($("#InteriorArea").val());
              //公摊面积
             $("#CommonAreaHistory").val($("#CommonArea").val());
              //房屋类型
             index=document.getElementById("RoomType").selectedIndex;//获取当前选择项的索引.
             temp= document.getElementById("RoomType").options[index].text;//获取当前选择项的文本.
             $("#RoomTypeHistory").val(temp);
              
              //产权性质
             index=document.getElementById("PropertyRights").selectedIndex;//获取当前选择项的索引.
             temp= document.getElementById("PropertyRights").options[index].text;//获取当前选择项的文本.
             $("#PropertyRightsHistory").val(temp);
             //使用性质
             index=document.getElementById("PropertyUses").selectedIndex;//获取当前选择项的索引.
             temp= document.getElementById("PropertyUses").options[index].text;//获取当前选择项的文本.
             $("#PropertyUsesHistory").val(temp);
             //使用状态
             index=document.getElementById("UsesState").selectedIndex;//获取当前选择项的索引.
             temp= document.getElementById("UsesState").options[index].text;//获取当前选择项的文本.
             $("#UsesStateHistory").val(temp);
             //合同交房时间
             $("#ContSubDateHistory").val($("#ContSubDate").val());
              //物业接管时间
             $("#TakeOverDateHistory").val($("#TakeOverDate").val());
               //集中交房时间
             $("#getHouseEndDateHistory").val($("#getHouseEndDate").val());
             $("#getHouseStartDateHistory").val($("#getHouseStartDate").val());
                //实际交房时间
             $("#ActualSubDateHistory").val($("#ActualSubDate").val());
                  //装修时间
             $("#FittingTimeHistory").val($("#FittingTime").val());
              //入住时间
             $("#StayTimeHistory").val($("#StayTime").val());

        InitTableHeight();
    });

</script>

<script type="text/javascript">
    //function SelDealMan() {

    //    HDialog.Open('640', '480', '../DialogNew/SelectBasicInfoCom.aspx', '选择房产代付公司', false, function callback(_Data) {
    //        var arrRet = _Data.split('\t');
    //        //alert(arrRet);
    //        $("#ConstUnitName").searchbox("setValue", arrRet[1]);
    //        $("#BasID").val(arrRet[0]);
    //    });

    //}
    $('#tipLiveStates').tooltip({
        position: 'top',
        content: '<div><p>①未入住：月居住天数A=0天；</p><p>②非常住：0天＜A≤10天；</p><p>③一般常住：10天＜A≤20天；</p><p>④常住：A＞20天</p></div>',
    });

    function BuildSNumChange() {
        var newvalue = document.getElementById("BuildSNum").value;


        $.ajax({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Room&Command=initadd&BuildSNum=' + newvalue + '&FloorSNum=' + $('#FloorSNum').val() + '&UnitSNum=' + $('#UnitSNum').val(),
            type: 'get',
            dataType: 'text',
            cache: false,
            async: true,
            success: function (_Data) {
                var Data = eval("(" + _Data + ")"); //转换为json对象
                $('#UnitSNum').val(Data.UnitSNum);
                $('#FloorSNum').val(Data.FloorSNum);
                $('#RoomSNum').val(Data.RoomSNum);
                //$('#RoomSign').val(Data.RoomSign);
                $('#HidRoomState').val(Data.HidRoomState);
                $('#RegionSNum').val(Data.RegionSNum);

                $("#hiUnitSNum").val(Data.UnitSNum);
                $("#hiFloorSNum").val(Data.FloorSNum);

                if ($("#UnitName").val() == '') {
                    $("#UnitName").val(Data.UnitSNum + "单元");
                }
                if ($("#FloorName").val() == '') {
                    $("#FloorName").val(Data.FloorSNum + "层");
                }
            },
            complete: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            }
        });
    }

    //上传文件相关js
    function UploadCallBack(url, addr, Name) {
        var Id = Getid();
        var Id1 = Id + "h";
        var vFileURL = "{'FilPath':'" + addr + "','AdjunctName':'" + Name + "'}";

        $("#FileURL").val($("#FileURL").val() + "," + vFileURL);

        var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"Delete(this,'" + Id1 + "','" + url + "','" + Name + "');\">&nbsp;<img src='../Images/cancel.png' style='width:12px;height:12px;cursor:pointer'  title='删除'/>&nbsp;</span><input id=\"" + Id1 + "\" Type='hidden' value='" + url + "'>"
        $("#List").append(v);
        GetAttach();
    }

    function Delete(obj, hid, addr, Name) {

        var vFileURL = "," + "{'FilPath':'" + addr + "','AdjunctName':'" + Name + "'}";
        var vFileURLStr = $("#FileURL").val().replace(vFileURL, "");
        $("#FileURL").val(vFileURLStr);

        var FileName = document.getElementById(hid).value;
        upLoadFileDelete(obj, FileName);

    }

    function GetAttach() {
        var v = $("#List").html();
        re = /\"/g;
        var mi = v.replace(re, "'");
        $("#FileList").val(mi);
    }

    function SpecialView() {
        var v = $("#FileList").val();
        $("#List").html(v)
    }

    function Getid() {
        d = new Date();
        var s = "";
        s += d.getYear();
        s += (d.getMonth() + 1);
        s += d.getDate();
        s += d.getHours();
        s += d.getMinutes();
        s += (d.getSeconds());
        return s;
    }


    //检查序号
    function CheckBuildSNum() {
        var strBuildSNum = $("#BuildSNum").val();
        var strBuildID = $("#BuildID").val();
        $.ajax({
            url: "../House/CheckBuildSNum.aspx?BuildSNum=" + strBuildSNum + "&BuildID=" + strBuildID,
            type: 'Post',
            dataType: 'text',
            cache: false,
            async: true,
            success: function (_Data) {
                var varReturn = _Data;
                var varObjects = varReturn.split("\t");

                parent.layer.alert(varObjects[0]);
            },
            complete: function (XMLHttpRequest, textStatus, errorThrown) {

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            }
        });
    }

    $("#upbtn").click(function () {

        $('#uploadform').parent().appendTo($("form:first"))
        $('#uploadform').dialog('open');
    });

    function upLoadFile() {

        if ($('#uploadfile').val() == "") {
            HDialog.Info("请选择要上传的本地文件!");
            return false;
        }
        var fileupload = document.getElementById("uploadfile");
        var maxsize = 10 * 1024 * 1024;
        var size = fileupload.files[0].size;
        if (size > parseInt(maxsize)) {
            HDialog.Info("不能上传超过10M的附件！");
            return false;
        }
        $.tool.pageLoadInfo("上传中，请等待");

        var options = {
            type: "POST",
            url: "../AjaxUploadFile.aspx?Cmd=ins&FileType=room&FileURL=",
            //data: "upfile=" + $("#uploadfile").val(),
            success: function (data, status) {
                //alert(data);
                var stringArray = data.split("|");
                var FileName = stringArray[1];
                var FileError = stringArray[2];
                var FileURL = stringArray[3];
                var FileServerName = stringArray[4];
                if (stringArray[0] == "1") {
                    //stringArray[0]    成功状态(1为成功，0为失败)
                    //stringArray[1]    文件名
                    //stringArray[2]    消息提示
                    //stringArray[3]    文件路径
                    UploadCallBack(FileURL, FileServerName, FileName);
                    HDialog.Info('上传成功');
                    $('#uploadfile').val('');
                    $('#uploadform').dialog('close');
                }
                else {
                    HDialog.Info(FileError);
                }
                $.tool.pageUnLoading();
            },
            error: function (data, status, e) {
                HDialog.Info("上传失败:" + e.toString());
                $.tool.pageUnLoading();
            }
        };
        $('#uploadform').ajaxSubmit(options);

        return false; //.NET按钮控件取消提交
    }

    function upLoadFileDelete(obj, filename) {
        var postFileName = encodeURI(filename);
        $.ajax
            ({
                type: "POST",
                url: "../AjaxUploadFile.aspx?Cmd=del&FileType=room&FileURL=" + postFileName,
                data: "",
                success: function (data, status) {
                    //alert(data);
                    var stringArray = data.split("|");
                    var FileName = stringArray[1];
                    var FileError = stringArray[2];
                    if (stringArray[0] == "1") {
                        //stringArray[0]    成功状态(1为成功，0为失败)
                        //stringArray[1]    文件名
                        //stringArray[2]    消息提示
                        //stringArray[3]    文件路径
                        HDialog.Info('删除成功');
                        $('#uploadfile').val('');

                        $(obj).prev().remove();
                        $(obj).remove();
                        GetAttach();

                    }
                    else {
                        HDialog.Info(FileError);
                    }

                },
                error: function (data, status, e) {
                    alert("上传失败:" + e.toString());
                }
            });
        return false; //.NET按钮控件取消提交
    }


    //获得序号
    function GetRoomSNum() {

        var strBuildSNum = $("#BuildSNum").val();
        var strUnitSNum = $("#UnitSNum").val();
        var strFloorSNum = $("#FloorSNum").val();
        var strRoomID = $("#RoomID").val();

        $("#results").val("");
        //alert(strRoomID);

        if ((strBuildSNum != "") && (strUnitSNum != "")) {

            $.ajax({
                url: "../House/GetRoomSNum.aspx?BuildSNum=" + strBuildSNum + "&UnitSNum=" + strUnitSNum + "&FloorSNum=" + strFloorSNum + "&RoomID=" + strRoomID,
                type: 'Post',
                dataType: 'text',
                cache: false,
                async: true,
                success: function (_Data) {
                    var varReturn = _Data;
                    var varObjects = varReturn.split("\t");

                    $("#RoomSNum").val(varObjects[0]);
                    if (varObjects[1] != "") {
                        $("#RoomSign").val(varObjects[1]);
                    }
                    $("#hiUnitSNum").val($("UnitSNum").val());
                    $("#hiFloorSNum").val($("FloorSNum").val());

                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }
    }

    function OnBlur_TakeOverDate() {
        var strTakeOverDate = $("#TakeOverDate").val();

        $("#PayBeginDate").val(strTakeOverDate);
    }


    function OnBlur_RoomSign() {
        if ($('#hiOPType').val() == "add") {
            var reg = /[\u4e00-\u9fa5]/g;
            var strFloorName = $('#FloorName').val();
            if (strFloorName != null && strFloorName != "") {
                strFloorName = strFloorName.replace(reg, "");
                $("#FloorSNum").val(strFloorName);
                $('#hiFloorsNum').val(strFloorName);
            }
            var strUnitName = $('#UnitName').val();
            if (strUnitName != null && strUnitName != "") {
                strUnitName = strUnitName.replace(reg, "");
                $("#UnitSNum").val(strUnitName);
                $('#hiUnitsNum').val(strUnitName);
            }
            var strBuildSNum = $("#BuildSNum").val();
            var strUnitSNum = $("#UnitSNum").val();
            var strFloorSNum = $("#FloorSNum").val();
            var roomSign = $('#RoomSign').val();
            if ((strBuildSNum != "") && (strUnitSNum != "")) {
                $.ajax({
                    type: "post",
                    url: "RoomManage.aspx/GetRoomSign",
                    data: "{'strRoomSgin':'" + roomSign + "','strBuildSNum':'" + strBuildSNum + "','strUnitSNum':'" + strUnitSNum + "','strFloorSNum':'" + strFloorSNum + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "true") {
                            HDialog.Info("房屋编号重复");
                            $('#RoomSign').val("");
                            $('#RoomName').val("");
                        } else {
                            $('#RoomName').val($('#RoomSign').val());
                        }
                    },
                    error: function (err) {

                    }
                });
            }
        }
    }

    function OnBlur_UnitSNum(obj) {
        var strValue = $('#UnitSNum').val();
        if (strValue != null && strValue != "") {
            var reg = /[\u4e00-\u9fa5]/g;
            strValue = strValue.replace(reg, "");
            $('#UnitSNum').val(strValue);
            $('#hiUnitSNum').val(strValue);

            $("#UnitName").val(strValue);
        }
    } 

    function OnBlur_FloorSNum(obj) {
        var strValue = $('#FloorSNum').val();
        if (strValue != null && strValue != "") {
             var reg = /[\u4e00-\u9fa5]/g;
              strValue = strValue.replace(reg, "");
            $('#FloorSNum').val(strValue);
            $('#hiFloorSNum').val(strValue); 

            $("#FloorName").val(strValue);
        }
    } 

    function isRealNum(val) {
        // isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除， 
        if (val === "" || val == null) {
            return false;
        }
        if (!isNaN(val)) {

            //对于空数组和只有一个数值成员的数组或全是数字组成的字符串，isNaN返回false，例如：'123'、[]、[2]、['123'],isNaN返回false,
            //所以如果不需要val包含这些特殊情况，则这个判断改写为if(!isNaN(val) && typeof val === 'number' )

            return true;
        }

        else {
            return false;
        }
    }
     

    $("#BtnSave").click(function () {
        var cmd = $("#hiOPType").val();
        OnBlur_RoomSign();
        var hiback = $("#hiback").val();
        if (hiback == "HouseingStatusBrowse") {

        }
        else {
            if ($('#RoomSign').val() == "") {
                HDialog.Info("请输入房屋编号,此项不能为空!");
                $('#RoomSign').focus();
                return false;
            }
            if ($('#UnitSNum').val() == "") {
                HDialog.Info("请输入单元序号,此项不能为空!");
                $('#UnitSNum').focus();
                return false;
            }
            if ($('#FloorSNum').val() == "") {
                HDialog.Info("请输入楼层序号,此项不能为空!");
                $('#FloorSNum').focus();
                return false;
            }

            if ($('#UnitName').val() == "") {
                HDialog.Info("请输入单元名称,此项不能为空!");
                $('#UnitName').focus();
                return false;
            }
            if ($('#FloorName').val() == "") {
                HDialog.Info("请输入楼层名称,此项不能为空!");
                $('#FloorName').focus();
                return false;
            }

            if ($('#RoomSNum').val() == "") {
                HDialog.Info("请输入同单元同楼层流水号,此项不能为空!");
                $('#RoomSNum').focus();
                return false;
            }
            if ($('#TakeOverDate').val() == "") {
                HDialog.Info("请输入物业接管时间,此项不能为空!");
                $('#TakeOverDate').focus();
                return false;
            }

            var results = $("#results").val();
            if (results != "") {
                HDialog.Info(results);

                return false;
            }
        }


        var RoomModel = $("#RoomModel").find("option:selected").text();
        var PropertyUses = $("#PropertyUses").find("option:selected").text();
        var PropertyRights = $("#PropertyRights").find("option:selected").text();
        var AreaType = $("#AreaType").find("option:selected").text();
        var RegionSNum = $("#RegionSNum").find("option:selected").val();

        $("#HRoomModel").val(RoomModel);
        $("#HPropertyUses").val(PropertyUses);
        $("#HPropertyRights").val(PropertyRights);
        $("#HAreaType").val(AreaType);
        $("#HRegionSNum").val(RegionSNum);


        var strBuildArea = $("#BuildArea").val();
        var strInteriorArea = $("#InteriorArea").val();
        var strCommonArea = $("#CommonArea").val();
        var strBuildAreaSum = parseFloat(strInteriorArea) + parseFloat(strCommonArea)

        if (Number(strBuildAreaSum) != Number(strBuildArea)) {
            HDialog.Prompt('建筑面积不等于套内面积与公摊面积之和', function PostData() {
                $.tool.DataPostChk('frmForm', 'Room', cmd, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('保存成功');
                            SuccessClose();
                        }
                        else {
                            var data = _Data.split("|");
                            if (data[0] == "true") {
                                HDialog.Info(data[1]);
                                SuccessClose();
                            }
                            HDialog.Info(data[1]);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            });
        }
        else {
            $.tool.DataPostChk('frmForm', 'Room', cmd, $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    var data = _Data.split("|");
                    if (data[0] == "true") {
                        HDialog.Info(data[1]);
                        SuccessClose();
                    }
                    HDialog.Info(data[1]);
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        }



    });

    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", document.body.clientWidth * 0.15 * 0.75);
    });

    $("#BtnReturn").click(function () {
        //alert( $("#RoomModel").combo.);
        close();
    });
    function close() {
        HDialog.Close('');
    }
    function SuccessClose() {
        HDialog.Close('1');
    }
    function setvisbal() {
        if ($('#hiOPType').val() == 'add' || $('#hiOPType').val() == 'search') {

            $('#changetime').hide();
            $('#ChangeDate').hide();
            $('#ggyy').hide();
            $('#ChageMemo').hide();
        }
        if ($('#hiOPType').val() == 'search') {
            $('#BtnSave').hide();
            $('#btnSelFile').hide();

            $("input").each(function () {
                var key = $(this).attr("id");
                if (key != "BtnReturn") {
                    $(this).attr("disabled", "disabled");
                }
            });

            $("select").each(function () {

                $(this).attr("disabled", "disabled");
            });

        }
    }
    setvisbal();
</script>
