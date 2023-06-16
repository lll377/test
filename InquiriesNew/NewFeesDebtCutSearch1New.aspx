<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesDebtCutSearch1New.aspx.cs" Inherits="M_Main.InquiriesNew.NewFeesDebtCutSearch1New" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        #CommNames {
            width: 486px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <input style="width: 8px" id="hiRoomSigns" size="1" type="hidden" name="hiRoomSigns" runat="server" />
        <input style="width: 8px" id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input style="width: 8px" id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />
        <input style="width: 8px" id="CustID" class="easyui-validatebox" size="1" type="hidden" name="CustID" runat="server" />
        <input style="width: 12px" id="hiCustName" class="easyui-validatebox" size="1" type="hidden" name="hiCustName" runat="server" />
        <input style="width: 8px" id="RoomID" class="easyui-validatebox" size="1" type="hidden" name="RoomID" runat="server" />
        <input style="width: 8px" id="hiRoomSign" class="easyui-validatebox" size="1" type="hidden" name="hiRoomSign" runat="server" />
        <input style="width: 8px" id="CarparkIDs" class="easyui-validatebox" size="1" type="hidden" name="CarparkIDs" runat="server" />
        <input style="width: 8px" id="hiCarparkNames" class="easyui-validatebox" size="1" type="hidden" name="hiCarparkNames" runat="server" />
        <input style="width: 8px" id="hiParkNames" class="easyui-validatebox" size="1" type="hidden" name="hiParkNames" runat="server" />
        <input style="width: 8px" id="ParkIDs" class="easyui-validatebox" size="1" type="hidden" name="ParkIDs" runat="server" />
        <input style="width: 8px" id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />
        <input style="width: 8px" id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input style="width: 8px" id="hPropertyUses" size="1" type="hidden" name="hPropertyUses" runat="server" />
        <input style="width: 8px" id="hPropertyRights" size="1" type="hidden" name="hPropertyRights" runat="server" />
        <input style="width: 8px" id="hParkingPropertyUses" size="1" type="hidden" name="hParkingPropertyUses" runat="server" />
        <input id="CostIDs" class="easyui-validatebox" size="1" type="hidden" name="CostIDs" runat="server" />
        <input id="StanIDs" class="easyui-validatebox" size="1" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" class="easyui-validatebox" size="1" type="hidden" name="hiStanNames" runat="server" />
        <input style="height: 22px; width: 32px" id="Hidden14" size="1" type="hidden" name="PageIndex" runat="server" />
        <input style="height: 21px; width: 24px" id="Hidden15" size="1" type="hidden" name="PrintParms" runat="server" />
        <input style="height: 22px; width: 24px" id="Hidden16" size="1" type="hidden" name="CostGeneType" runat="server" />
        <input style="height: 21px; width: 24px" id="Hidden17" size="1" type="hidden" name="OptCode" runat="server" />
        <input style="height: 21px; width: 24px" id="Hidden18" size="1" type="hidden" name="Flag" runat="server">
        <input type="hidden" value="" id="CustTypeName" name="CustTypeName" />
        <input id="CommID" size="1" type="hidden" name="CommID" runat="server" />
        <div id="tb">
            <table border="0" style="font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: auto;" align="left">收款截止时间&nbsp;<input type="text" class="Wdate"
                        onclick="WdatePicker()" id="FeesStopEndDate" runat="server" name="FeesStopEndDate" />&nbsp;
             时间类型&nbsp;<select id="FeesDateType" name="FeesDateType" runat="server">
                 <option value="1" selected>费用日期</option>
                 <option value="2">应收日期</option>
             </select>&nbsp;
             费用时间从&nbsp;<input type="text" class="Wdate"
                 onclick="WdatePicker()" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="Wdate"
                     onclick="WdatePicker()" id="EditEndDate" name="EditEndDate" /></td>
                    <td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计欠费</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选欠费</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">Excel导出</a>


                        <input style="height: 22px; width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
                            runat="server" /><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                                runat="server" /><input style="height: 22px; width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                                    runat="server" /><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                                        runat="server" /><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server" />
                    </td>
                    <td style="color: red">*右键点击表头显示隐藏列</td>
                </tr>
            </table>
        </div>



        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 400px; padding: 10px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" readonly="readonly" id="CommNames" onclick="SelCommInfo()" name="CommNames" runat="server" />
                        <input type="text" readonly="readonly" id="CommName" style="display: none" name="CommName" runat="server" />
                        <input id="hiCommNames" type="hidden" size="1" name="hiCommNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false" name="BuildNames" runat="server" />
                        <input id="BuildSNums" name="BuildSNums" type="hidden" />
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            size="14" name="RegionNames" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" onchange="ChangeCustTypeID(this)" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" /><input id="Hidden1" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="Hidden2" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" />

                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" style="width: 150px" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                        <input id="Hidden3" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="Hidden4" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" />

                    </td>
                    <td class="TdTitle">房屋状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">查询范围</td>
                    <td class="TdContentSearch">
                        <select id="SearchRange" name="SearchRange" runat="server">
                            <option value="0" selected>全部客户</option>
                            <option value="1">银行代收客户</option>
                            <option value="2">非银行代收客户</option>
                        </select></td>
                    <td class="TdTitle">代收银行</td>
                    <td class="TdContentSearch">
                        <select id="BankName" name="BankName" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark"
                            name="CarparkNames" runat="server">
                        <input class="Control_ItemInput" id="Hidden5" style="width: 8px;" type="hidden"
                            size="1" name="CarparkIDs" runat="server"><input class="Control_ItemInput" id="Hidden6" style="width: 8px;" type="hidden"
                                size="1" name="hiCarparkNames" runat="server">
                    </td>
                    <td class="TdTitle">车位</td>
                    <td class="TdContentSearch">
                        <input id="ParkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelPark"
                            name="ParkNames" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server"></td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContentSearch">
                        <input id="StanNames" class="easyui-searchbox" data-options="editable:false" searcher="SelStan"
                            name="StanNames" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">欠费时间</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol1" name="CompSymbol1" runat="server">
                            <option selected></option>
                        </select><input style="width: 100px" id="Comp_Month" class="Control_Iteminput" onkeypress="CheckNumeric();"
                            maxlength="50" size="26" name="Comp_Month" runat="server">月</td>
                    <td class="TdTitle">欠费金额</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol2" name="CompSymbol2" runat="server">
                            <option selected></option>
                        </select><input style="width: 100px;" id="Comp_Amount" class="Control_Iteminput" onkeypress="CheckNumeric();"
                            maxlength="50" size="26" name="Comp_Amount" runat="server">元</td>
                </tr>
                <%-- <tr>
                    <td class="TdTitle">是否垫付</td>
                    <td class="TdContentSearch">
                        <select id="IsProperty" name="IsProperty" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">是否预收</td>
                    <td class="TdContentSearch">
                        <select id="IsPrec" name="IsPrec" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>--%>
                <tr>
                    <td class="TdTitle">房屋使用性质</td>
                    <td class="TdContentSearch">
                        <select id="PropertyUses" name="PropertyUses" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">房屋产权性质</td>
                    <td class="TdContentSearch">
                        <select id="PropertyRights" name="PropertyRights" runat="server">
                            <option selected></option>
                        </select>

                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">车位产权性质</td>
                    <td class="TdContentSearch">

                        <select id="ParkingPropertyUses" name="ParkingPropertyUses" runat="server">
                            <option selected></option>
                            <option value="自有产权">自有产权</option>
                            <option value="业主产权">业主产权</option>
                            <option value="共有产权">共有产权</option>
                            <option value="产权不明">产权不明</option>
                            <option value="其它产权">其它产权</option>
                        </select>

                    </td>
                    <td class="TdTitle">是否排除冻结</td>
                    <td class="TdContentSearch">
                        <select name="IsFrozen" id="IsFrozen" runat="server">
                            <option value="1">是</option>
                            <option value="0" selected>否</option>
                        </select>
                    </td>

                </tr>
                <%-- <tr>
                    <td>是否无本金有合同违约金</td>
                    <td class="TdContentSearch">
                        <select id="IsLateFee" name="IsLateFee" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch">
                       </td>
                </tr>--%>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>

                    </td>
                </tr>
            </table>
        </div>


        <div class="easyui-datagrid" id="TableContainer">
        </div>


        <div id="menu" class="easyui-menu" style="width: 50px; display: none;">
            <!--放置一个隐藏的菜单Div-->
            <div id="RoomDiv">房屋信息</div>
            <div>客户信息</div>
            <div>车位信息</div>
            <div>收费标准</div>
            <div>抄表信息</div>
            <div data-options="iconCls:'icon-save'" onclick="test();">删除</div>
        </div>



        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">


            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#hiIsSQLData').val(-1);
                if ($("#CommID").val() == "") {
                    $("#CommNames").show();
                    $("#CommName").hide();
                } else {
                    $("#CommName").show();
                    $("#CommNames").hide();
                }
            }
            InitFunction();

            function SelCommInfo() {

                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }


            function ExcuteOnServer() {
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }
                document.getElementById('hiIsSQLData').value = 2;
                $("#hPropertyUses").val($("#PropertyUses").find("option:selected").text());
                $("#hPropertyRights").val($("#PropertyRights").find("option:selected").text());
                $("#hParkingPropertyUses").val($("#ParkingPropertyUses").find("option:selected").text());
                LoadList();
                $('#SearchDlg').dialog('close');

                //ABC,AC,AB,BC,A,B,C




            }
            var w = $(window).width();
            var h = $(window).height();


            function SelBuild() {
                var varReturn;
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }


                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx?CommID=" + commId, '楼宇选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var BuildSNums = "";
                        var BuildNames = "";
                        $('#BuildSNums').val(BuildSNums);
                        $('#BuildNames').searchbox('setValue', BuildNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                                BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                        $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                    }
                });

            }

            function SelRegion() {
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }
                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx?CommID=" + commId, '组团选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var RegionSNums = "";
                        var RegionNames = "";


                        $('#RegionSNums').val(RegionSNums);
                        $('#RegionNames').searchbox('setValue', RegionNames);
                        $('#hiRegionNames').val(RegionNames);



                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {

                                RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                                RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                        $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));

                        $('#hiRegionNames').val(RegionNames);

                    }
                });

            }

            function SelCarpark() {

                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }

                HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx?CommID=" + commId, '车位区域选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");


                        var CarparkIDs = "";
                        var CarparkNames = "";
                        $('#CarparkIDs').val(CarparkIDs);
                        $('#CarparkNames').searchbox('setValue', CarparkNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                CarparkIDs = CarparkIDs + "," + varObjects[i].split(',')[0];
                                CarparkNames = CarparkNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#CarparkIDs').val(CarparkIDs.substring(1, CarparkIDs.length));
                        $('#CarparkNames').searchbox('setValue', CarparkNames.substring(1, CarparkNames.length));

                    }
                });

            }

            function SelPark() {

                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }
                HDialog.Open('700', '400', "../dialogNew/MultiParkDlg.aspx?CommID" + commId, '车位选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");


                        var data = _Data.split('|');
                        if (data.length > 0) {
                            var ParkIDs = "";
                            var ParkNames = "";

                            for (var i = 0; i < data.length; i++) {
                                if (data[i] != "") {
                                    var obj = JSON.parse(data[i]);
                                    if (obj.ParkID != 0) {
                                        ParkIDs = ParkIDs + "," + obj.ParkID;
                                        ParkNames = ParkNames + ',' + obj.ParkName;
                                    }
                                }
                            }

                            $('#ParkIDs').val(ParkIDs.substring(1, ParkIDs.length));
                            $('#ParkNames').searchbox('setValue', ParkNames.substring(1, ParkNames.length));


                        }



                    }
                });

            }


            function SelCost() {
                var varReturn;

                var w = 700;
                var h = 400;

                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }

                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx?CommID=" + commId, '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }
                });

                return false;
            }

            function SelCust() {

                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/MultiCustDlg.aspx?CommID=" + commId;

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    //var data = JSON.parse(_Data);
                    //$('#CustName').searchbox("setValue", data.CustName);
                    //$('#CustID').val(data.CustID);
                    var strCustIDNames = "";
                    var strCustIDs = "";
                    if (_Data != "") {//**获得返回 刷新
                        var data = _Data.split('|');
                        if (data.length > 0) {

                            for (var i = 0; i < data.length; i++) {
                                if (data[i] != "") {
                                    var obj = JSON.parse(data[i]);
                                    strCustIDNames = strCustIDNames + "," + obj.CustName;
                                    strCustIDs = strCustIDs + ',' + obj.CustID;
                                }
                            }
                        }
                    }
                    $('#CustName').searchbox("setValue", strCustIDNames);
                    $('#CustID').val(strCustIDs);

                    //$.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                    //    function Init() {
                    //    },
                    //    function callback(_Data) {

                    //        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    //        if (varObjects.length > 0) {

                    //            var RoomData = [];
                    //            for (var i = 0; i < varObjects.length; i++) {

                    //                var vIsDelLive = varObjects[i].IsDelLive;
                    //                var strTmp = "";

                    //                if (vIsDelLive == 1) {
                    //                    strTmp = "(历史)";
                    //                }
                    //                var RoomID = varObjects[i].RoomID;
                    //                var RoomSign = varObjects[i].RoomSign;
                    //                var Buildarea = varObjects[i].BuildArea;

                    //                var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                    //                RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                    //            }

                    //            $('#SelectRoomID').combobox({
                    //                data: RoomData,
                    //                valueField: 'RoomID',
                    //                textField: 'RoomText',
                    //                onChange: function (n, o) {


                    //                    var data = $('#SelectRoomID').combobox('getData');
                    //                    if (data.length > 0) {
                    //                        for (var i = 0; i < data.length; i++) {
                    //                            if (n == data[i].RoomID) {

                    //                                $('#RoomSign').searchbox('setValue', data[i].RoomText);
                    //                                var buildArea = data[i].RoomID.split("|")[1];
                    //                                $('#BuildArea').val(buildArea);
                    //                                $('#RoomID').val(data[i].RoomID.split("|")[0]);

                    //                                break;
                    //                            }
                    //                        }
                    //                    }
                    //                }
                    //            });
                    //        }
                    //    },
                    //    function completeCallback() {
                    //    },
                    //    function errorCallback() {
                    //    });

                });
            }

            function SelRoom() {
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/NewMultiRoomDlg.aspx?CommID=" + commId;

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    //var data = JSON.parse(_Data);
                    //$('#RoomSign').searchbox("setValue", data.RoomSign);
                    //$('#CustName').searchbox("setValue", data.CustName);
                    //$('#CustID').val(data.CustID);
                    //$('#RoomID').val(data.RoomID);
                    //$('#BuildArea').val(data.BuildArea);
                    //$('#CalcArea').val(data.BuildArea);

                    if (_Data != "") {//**获得返回 刷新
                        var data = _Data.split('◆');// SelAll + "◆" + SelRoomSigns + "◆" + SelRoomIDs;
                        var SelAll = data[0];
                        var SelRoomSigns = data[1];
                        var SelRoomIDs = data[2];

                        if (SelAll != "1") {
                            $('#RoomSign').searchbox('setValue', SelRoomSigns);
                            SelRoomSigns = SelRoomSigns.replace(/\|/gm, ',');
                            SelRoomIDs = SelRoomIDs.replace(/\|/gm, ',');

                            SelRoomSigns = SelRoomSigns.substring(1, SelRoomSigns.length);
                            SelRoomIDs = SelRoomIDs.substring(1, SelRoomIDs.length);

                            $('#RoomID').val(SelRoomIDs);
                        }
                    }
                });

            }

            function SelStan() {
                var tmpCostIDs = $('#CostIDs').val();

                if (tmpCostIDs == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                    NewFeesDueCutSearch.btnSelCost.focus();
                    return false;
                }

                var w = 700;
                var h = 400;


                HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random(), '收费标准选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#StanIDs').val(varObjects[0]);
                        $('#StanNames').searchbox('setValue', varObjects[1]);


                        var varObjects = _Data.split("|");
                        var StanIDs = "";
                        var StanNames = "";


                        $('#StanIDs').val(StanIDs);
                        $('#StanNames').searchbox('setValue', StanNames);



                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                StanIDs = StanIDs + "," + varObjects[i].split(',')[0];
                                StanNames = StanNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#StanIDs').val(StanIDs.substring(1, StanIDs.length));
                        $('#StanNames').searchbox('setValue', StanNames.substring(1, StanNames.length));

                    }
                });

                return false;
            }
            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });

            function setIsSQLData() {
                document.getElementById('hiIsSQLData').value = 1;
            }

            var column = [
                [
                    { title: '客户信息', field: 'a1', colspan: 1, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '房屋信息', field: 'a2', colspan: 16, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '车位信息', field: 'a3', colspan: 11, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { field: 'CostName', rowspan: 2, title: '费用名称', align: 'center', sortable: true, fixed: true, width: 200 },
                    { title: '收费标准', field: 'a4', colspan: 4, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { field: 'CalcAmount', rowspan: 2, title: '数量1', align: 'center', sortable: true, fixed: true, width: 100 },
                    { field: 'CalcAmount2', rowspan: 2, title: '数量2', align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '抄表信息', field: 'a5', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },

                    { field: 'FeeDueYearMonth', rowspan: 2, title: '费用日期', align: 'center', sortable: true, fixed: true, width: 150 },

                    {
                        field: 'AccountsDueDate', rowspan: 2, title: '应收日期', align: 'center', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                            var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    {
                        field: 'FeesStateDate', rowspan: 2, title: '开始日期', align: 'center', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                            var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    {
                        field: 'FeesEndDate', rowspan: 2, title: '结束日期', align: 'center', sortable: true, fixed: true, width: 150, formatter: function (value, row, index) {
                            var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    { field: '增值税率', title: '税率', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },

                    { title: '应收金额', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, },
                    { title: '实收金额', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '预交冲抵', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '减免冲抵', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '欠收金额', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '合同违约金', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '红冲金额', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100 },
                    { field: 'PrecBalance', rowspan: 2, title: '截止预交余额', align: 'center', sortable: true, fixed: true, width: 100 },
                    { field: 'StatMemo', rowspan: 2, title: '代扣返回信息', align: 'center', sortable: true, fixed: true, width: 300 },
                    { field: 'FeesMemo', rowspan: 2, title: '费用备注', align: 'center', sortable: true, fixed: true, width: 200 },
                    { field: 'ArrearsTypeName', rowspan: 2, title: '欠费原因', align: 'center', sortable: true, fixed: true, width: 100 }

                ],
                [
                    { field: '客户类别', title: '客户类别', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'UserName', title: '管家', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'RegionName', title: '组团区域', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'BuildName', title: '楼宇名称', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋建筑面积', title: '建筑面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋套内面积', title: '套内面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋公摊面积', title: '公摊面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋花园面积', title: '花园面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋地下室面积', title: '地下室面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋计费面积', title: '计算面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋产权性质', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '楼宇类型', title: '楼宇类型', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋使用性质', title: '使用性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'RoomUsesState', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'NowStateName', title: '房屋状态', width: 100, align: 'center', sortable: true, hidden: true },
                    {
                        field: '房屋实际交房时间', title: '实际交房时间', width: 150, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                            var str = formatDate(row.房屋实际交房时间, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'RoomActualSubCondition', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'CarparkName', title: '车位区域', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkRoomSign', title: '车位路址', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkName', title: '车位编号', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位面积', title: '车位面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位计费面积', title: '计算面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkCategoryName', title: '车位类别', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkType', title: '车位类型', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位产权性质', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkPropertyUses', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
                    {
                        field: '车位实际交房时间', title: '实际交付时间', width: 100, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                            var str = formatDate(row.车位实际交房时间, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'ParkActualSubCondition', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'PayTypeName', title: '计费方式', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'StanFormulaName', title: '计算方式', width: 150, align: 'center', sortable: true, hidden: true },
                    { field: 'StanAmount', title: '收费标准', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ChargeCycleName', title: '计算周期', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'StartDegree', title: '起度', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'EndDegree', title: '止度', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'Dosage', title: '用量', width: 100, align: 'center', sortable: true, hidden: true },



                    //应收金额
                    { field: 'DueAmount', title: '含税金额', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'DueAmountTax', title: '税费', align: 'center', sortable: true, width: 100
                    },
                    {
                        field: 'DueAmountTaxAmount', title: '不含税金额', align: 'center', sortable: true, width: 100
                    },

                    //实收
                    { field: 'PaidAmount', title: '含税金额', align: 'center', sortable: true, width: 100 },
                    { field: 'PaidAmountTax', title: '税费', align: 'center', sortable: true, width: 100 },
                    { field: 'PaidAmountTaxAmount', title: '不含税金额', align: 'center', sortable: true, width: 100 },

                    //预交冲抵
                    { field: 'PrecAmount', title: '含税金额', align: 'center', sortable: true, width: 100 },
                    { field: 'PrecAmountTax', title: '税费', align: 'center', sortable: true, width: 100 },
                    { field: 'PrecAmountTaxAmount', title: '不含税金额', align: 'center', sortable: true, width: 100 },


                    //减免
                    { field: 'WaivAmount', title: '含税金额', align: 'center', sortable: true, width: 100 },
                    { field: 'WaivAmountTax', title: '税费', align: 'center', sortable: true, width: 100 },
                    { field: 'WaivAmountTaxAmount', title: '不含税金额', align: 'center', sortable: true, width: 100 },


                    //欠收金额
                    { field: 'DebtsAmount', title: '含税金额', align: 'center', sortable: true, width: 100 },
                    { field: 'DebtsAmountTax', title: '税费', align: 'center', sortable: true, width: 100 },
                    { field: 'DebtsAmountTaxAmount', title: '不含税金额', align: 'center', sortable: true, width: 100 },

                    //合同违约金
                    { field: 'LateFeeAmount', title: '含税金额', align: 'center', sortable: true, width: 100 },
                    { field: 'LateFeeAmountTax', title: '税费', align: 'center', sortable: true, width: 100 },
                    { field: 'LateFeeAmountTaxAmount', title: '不含税金额', align: 'center', sortable: true, width: 100 },


                    //冲销金额
                    { field: 'WriteOffAmount', title: '含税金额', align: 'center', sortable: true, width: 100 },
                    { field: 'WriteOffAmountTax', title: '税费', align: 'center', sortable: true, width: 100 },
                    { field: 'WriteOffAmountTaxAmount', title: '不含税金额', align: 'center', sortable: true, width: 100 }

                ]
            ];

            var frozenColumns = [[

                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, fixed: true, width: 100 }

            ]];

            //function ToExcel() {
            //    HDialog.Open(500, 150, "../InquiriesNew/SelectiveCompression.aspx", '选择', false, function callback(_Data) {
            //        if (_Data != '') {
            //            var obj = JSON.parse(_Data);
            //            if (obj == "0") {
            //                window.location.href = "../InquiriesNew/FeesArrearsDunningCre.aspx?OType=0&Flag=ABC";
            //            } else {
            //                window.location.href = "../InquiriesNew/FeesArrearsDunningCre.aspx?OType=1&Flag=ABC";
            //            }
            //        }
            //    });
            //}

            function ToExcel() {
                HDialog.Open(500, 150, "../InquiriesNew/SelectiveCompression.aspx", '选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        if (obj == "0") {
                            window.location.href = "../InquiriesNew/FeesDebtCutSearchCreNew.aspx?OType=0&Flag=ABC&CommID=" + $("#CommID").val();
                        } else {
                            window.location.href = "../InquiriesNew/FeesDebtCutSearchCreNew.aspx?OType=1&Flag=ABC&CommID=" + $("#CommID").val();
                        }
                    }
                });
            }

            function SearchDlg() {

                btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }

            function btnClear_OnClick() {


                document.getElementById('CustID').value = "";
                document.getElementById('hiCustName').value = "";

                document.getElementById('RoomID').value = "";

                $('#CustName').searchbox('setValue', '');
                document.getElementById('hiCustName').value = "";

                document.getElementById('RoomID').value = "";
                // document.getElementById('RoomSign').value = "";
                $('#RoomSign').searchbox('setValue', '');

                document.getElementById('hiRoomSign').value = "";

                document.getElementById('CostIDs').value = "";
                $('#CostNames').searchbox('setValue', '');
                document.getElementById('hiCostNames').value = "";

                document.getElementById('StanIDs').value = "";
                $('#StanNames').searchbox('setValue', '');
                document.getElementById('hiStanNames').value = "";

                document.getElementById('RoomIDs').value = "";

                document.getElementById('CustTypeID').value = "";
                document.getElementById('ChargeTypeID').value = "";

                document.getElementById('ParkIDs').value = "";
                $('#ParkNames').searchbox('setValue', '');
                document.getElementById('hiParkNames').value = "";

                document.getElementById('CarparkIDs').value = "";
                document.getElementById('CarparkNames').value = "";
                document.getElementById('hiCarparkNames').value = "";

                document.getElementById('Comp_Month').value = "";
                document.getElementById('Comp_Amount').value = "";


                document.getElementById('RegionSNums').value = "";
                document.getElementById('RegionNames').value = "";
                document.getElementById('hiRegionNames').value = "";


                document.getElementById("PropertyUses").value = "";
                document.getElementById("hPropertyUses").value = "";


                document.getElementById("PropertyRights").value = "";
                document.getElementById("hPropertyRights").value = "";

                document.getElementById("ParkingPropertyUses").value = "";
                document.getElementById("hParkingPropertyUses").value = "";

            }

            function LoadList() {



                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: '#tb',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    view: myview,
                    showFooter: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("NewFeesDebtCutSearch1New", "LoadData", "TableContainer", param);
                    },
                    onHeaderContextMenu: function (e, field) {
                        e.preventDefault();
                        if (!cmenu) {
                            createColumnMenu();
                        }
                        cmenu.menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        });
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {


                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                    },
                    onLoadSuccess: function (data) {

                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                CustName: "<span style='color:red'>累计合计</span>",
                                DueAmount: "<span style='color:red'>0</span>",
                                PaidAmount: "<span style='color:red'>0</span>",
                                PrecAmount: "<span style='color:red'>0</span>",
                                WaivAmount: "<span style='color:red'>0</span>",
                                RefundAmount: "<span style='color:red'>0</span>",
                                DebtsAmount: "<span style='color:red'>0</span>",
                                DueAmountTax: "<span style='color:red'>0</span>",
                                DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                DebtsAmountTax: "<span style='color:red'>0</span>",
                                DebtsAmountTaxAmount: "<span style='color:red'>0</span>",
                                WaivAmountTax: "<span style='color:red'>0</span>",
                                WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                PrecAmountTax: "<span style='color:red'>0</span>",
                                PrecAmountTaxAmount: "<span style='color:red'>0</span>",
                                PaidAmountTax: "<span style='color:red'>0</span>",
                                PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                LateFeeAmountTax: "<span style='color:red'>0</span>",
                                LateFeeAmountTaxAmount: "<span style='color:red'>0</span>"
                            }
                        ]);
                        if (document.getElementById('hiIsSQLData').value != "-1") {
                            $.tool.DataPostNoLoading('NewFeesDebtCutSearch1New', "NewFeesDebtCutSearch1Sum", $('#frmForm').serialize(),
                                function Init() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>0</span>",
                                            PaidAmount: "<span style='color:red'>0</span>",
                                            PrecAmount: "<span style='color:red'>0</span>",
                                            WaivAmount: "<span style='color:red'>0</span>",
                                            RefundAmount: "<span style='color:red'>0</span>",
                                            DebtsAmount: "<span style='color:red'>0</span>",
                                            LateFeeAmount: "<span style='color:red'>0</span>",
                                            DueAmountTax: "<span style='color:red'>0</span>",
                                            DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                            DebtsAmountTax: "<span style='color:red'>0</span>",
                                            DebtsAmountTaxAmount: "<span style='color:red'>0</span>",
                                            WaivAmountTax: "<span style='color:red'>0</span>",
                                            WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                            PrecAmountTax: "<span style='color:red'>0</span>",
                                            PrecAmountTaxAmount: "<span style='color:red'>0</span>",
                                            PaidAmountTax: "<span style='color:red'>0</span>",
                                            PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                            LateFeeAmountTax: "<span style='color:red'>0</span>",
                                            LateFeeAmountTaxAmount: "<span style='color:red'>0</span>"
                                        }
                                    ]);
                                },
                                function callback(_Data) {

                                    var Data = eval("(" + _Data + ")"); //转换为json对象
                                    var obj = Data.rows[0];
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>" + obj.DueAmount + "</span>",
                                            PaidAmount: "<span style='color:red'>" + obj.PaidAmount + "</span>",
                                            PrecAmount: "<span style='color:red'>" + obj.PrecAmount + "</span>",
                                            WaivAmount: "<span style='color:red'>" + obj.WaivAmount + "</span>",
                                            RefundAmount: "<span style='color:red'>" + obj.RefundAmount + "</span>",
                                            DebtsAmount: "<span style='color:red'>" + obj.DebtsAmount + "</span>",
                                            LateFeeAmount: "<span style='color:red'>" + obj.LateFeeAmount + "</span>",
                                            DueAmountTax: "<span style='color:red'>" + obj.DueAmountTax + "</span>",
                                            DueAmountTaxAmount: "<span style='color:red'>" + obj.DueAmountTaxAmount + "</span>",
                                            DebtsAmountTax: "<span style='color:red'>" + obj.DebtsAmountTax + "</span>",
                                            DebtsAmountTaxAmount: "<span style='color:red'>" + obj.DebtsAmountTaxAmount + "</span>",
                                            WaivAmountTax: "<span style='color:red'>" + obj.WaivAmountTax + "</span>",
                                            WaivAmountTaxAmount: "<span style='color:red'>" + obj.WaivAmountTaxAmount + "</span>",
                                            PrecAmountTax: "<span style='color:red'>" + obj.PrecAmountTax + "</span>",
                                            PrecAmountTaxAmount: "<span style='color:red'>" + obj.PrecAmountTaxAmount + "</span>",
                                            PaidAmountTax: "<span style='color:red'>" + obj.PaidAmountTax + "</span>",
                                            PaidAmountTaxAmount: "<span style='color:red'>" + obj.PaidAmountTaxAmount + "</span>",
                                            LateFeeAmountTax: "<span style='color:red'>" + obj.LateFeeAmountTax + "</span>",
                                            LateFeeAmountTaxAmount: "<span style='color:red'>" + obj.LateFeeAmountTaxAmount + "</span>"


                                        }
                                    ]);
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>0</span>",
                                            PaidAmount: "<span style='color:red'>0</span>",
                                            PrecAmount: "<span style='color:red'>0</span>",
                                            WaivAmount: "<span style='color:red'>0</span>",
                                            RefundAmount: "<span style='color:red'>0</span>",
                                            DebtsAmount: "<span style='color:red'>0</span>",
                                            LateFeeAmount: "<span style='color:red'>0</span>",
                                            DueAmountTax: "<span style='color:red'>0</span>",
                                            DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                            DebtsAmountTax: "<span style='color:red'>0</span>",
                                            DebtsAmountTaxAmount: "<span style='color:red'>0</span>",
                                            WaivAmountTax: "<span style='color:red'>0</span>",
                                            WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                            PrecAmountTax: "<span style='color:red'>0</span>",
                                            PrecAmountTaxAmount: "<span style='color:red'>0</span>",
                                            PaidAmountTax: "<span style='color:red'>0</span>",
                                            PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                            LateFeeAmountTax: "<span style='color:red'>0</span>",
                                            LateFeeAmountTaxAmount: "<span style='color:red'>0</span>"

                                        }
                                    ]);
                                });
                        }
                    }
                });

            }

            var cmenuList = ['客户信息', '房屋信息', '车位信息', '收费标准', '抄表信息'];

            var cmenuColumnList = [['a1', '客户类别']
                , ['a2', , 'UserName', 'RegionName', 'BuildName', '房屋建筑面积', '房屋套内面积', '房屋公摊面积', '房屋花园面积', '房屋地下室面积',
                '房屋计费面积', '房屋产权性质', '楼宇类型', '房屋使用性质', 'RoomUsesState', 'NowStateName',
                '房屋实际交房时间', 'RoomActualSubCondition']
                , ['a3', 'CarparkName', 'ParkRoomSign', 'ParkName', '车位面积', '车位计费面积', 'ParkCategoryName', 'ParkType'
                , '车位产权性质', 'ParkPropertyUses', '车位实际交房时间', 'ParkActualSubCondition']
                , ['a4', 'PayTypeName', 'StanFormulaName', 'StanAmount', 'ChargeCycleName']
                , ['a5', 'StartDegree', 'EndDegree', 'Dosage']]


            var cmenu;
            function createColumnMenu() {



                cmenu = $('<div/>').appendTo('body');
                cmenu.menu({
                    onClick: function (item) {


                        var j = 0
                        for (var i = 0; i < cmenuList.length; i++) {
                            if (item.name == cmenuList[i]) {
                                j = i;
                                break;
                            }
                        }

                        var cmd = 'hideColumn';
                        if (item.iconCls == 'icon-ok') {
                            cmd = 'hideColumn';
                            cmenu.menu('setIcon', {
                                target: item.target,
                                iconCls: 'icon-empty'
                            });

                        } else {
                            cmd = 'showColumn';

                            cmenu.menu('setIcon', {
                                target: item.target,
                                iconCls: 'icon-ok'
                            });
                        }
                        for (var k = 0; k < cmenuColumnList[j].length; k++) {

                            $('#TableContainer').datagrid(cmd, cmenuColumnList[j][k]);

                        }
                    }
                });




                for (var i = 0; i < cmenuList.length; i++) {
                    var field = cmenuList[i];

                    cmenu.menu('appendItem', {
                        text: field,
                        name: field,
                        iconCls: 'icon-empty'
                    });
                }
            }

            //初始化加载数据
            LoadList();
            //展示进度
            // ShowProgress();
            //获取执行情况进度
          //  ProgressInterval = setInterval("TakeProgress()", 5000);





            function SearchData() {

                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目!");
                    return;
                }

                $('#hiIsSQLData').val('1');
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 5000);
            }


            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('NewFeesDebtCutSearch1New', 'StartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        //  LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }


            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('NewFeesDebtCutSearch1New', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                             
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {

                                LoadList();

                                CloseProgress();

                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }

            function ChangeCustTypeID(obj) {
                var val = $(obj).find("option:selected").text();

                $("#CustTypeName").val(val);
            }



        </script>
    </form>
</body>
</html>

