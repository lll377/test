<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentControlSeach.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentControlSeach" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Cache.js"></script>

    <style>
        /*.TdTitle {
            width: 10%;
        }
        #SearchDlg tr {
            height: 30px;
        }
        #SearchDlg input {
            width: 140px;
        }
        #SearchDlg select {
            width: 144px;
        }*/
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;" scroll="no">
    <form id="frmForm" runat="server">
        <input type="hidden" id="IsMore" name="IsMore" value="0" runat="server" />

        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server"/>

        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <select id="IsTousu" onchange="TouSuChange()" name="IsTousu" style="color: #8a8a8a; width: 130px">
                            <option selected="selected" style='color: #8a8a8a' value="">是否投诉</option>
                            <option value="0" style="color: #000000">否</option>
                            <option value="1" style="color: #000000">是</option>
                        </select>&nbsp;
                    </td>
                    <td>
                        <select id="DrFees" onchange="FeesChange()" name="DrFees" style="color: #8a8a8a; width: 130px">
                            <option selected="selected" style='color: #8a8a8a' value="">是否收费</option>
                            <option value="0" style="color: #000000">否</option>
                            <option value="1" style="color: #000000">是</option>
                        </select>&nbsp;
                    </td>
                    <td>
                        <input type="text" id="BigTypeName" searcher="SelTypeName" data-options="prompt:'报事类别' " style="width: 130px" class="easyui-searchbox" runat="server" name="BigTypeName" />&nbsp;
                    </td>

                    <td>
                        <select id="IncidentSource" onchange="SourceChange()" style="color: #8a8a8a; width: 130px" name="IncidentSource">
                            <option selected="selected" style='color: #8a8a8a' value="">报事来源</option>
                            <option value="客户报事" style="color: #000000">客户报事</option>
                            <option value="自查报事" style="color: #000000">自查报事</option>
                        </select>&nbsp;
                    </td>
                    <td>
                        <input type="text" class="easyui-searchbox" style="width: 130px" id="RoleNames" data-options="prompt:'管家'" name="RoleNames" searcher="SelDealMan" runat="server" />
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>

                    <td>
                        <a href="javascript:void(0)" onclick="btn_clean();" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text" >清空</span><span class="l-btn-icon icon-reload">&nbsp;</span></span></a>
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick=" JavaScript: M()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">更多筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>

                    <%--<td>
                        <a href="javascript:void(0)" onclick=" JavaScript: void(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">显示设置</span><span class="l-btn-icon icon-filter">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>--%>
                </tr>
            </table>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 400px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">关闭状态</td>
                    <td class="TdContent">
                        <select id="IsClose" name="IsClose" disabled style="width: 140px;" runat="server">
                            <option value="0">未关闭</option>
                            <option value="1">已关闭</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事编号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentNum" name="IncidentNum" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">派工单号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="CoordinateNum" name="CoordinateNum" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">是否退回</td>
                    <td class="TdContent">
                        <select id="CloseGoBackTime" name="CloseGoBackTime" style="width: 137px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事方式
                    </td>
                    <td class="TdContent">
                        <select id="IncidentMode" name="IncidentMode" style="width: 140px;" runat="server">
                        </select>
                    </td>
                    <td class="TdTitle">报事来源</td>
                    <td class="TdContent">
                        <select id="IncidentSource1" name="IncidentSource1" style="width: 140px;" runat="server">
                            <option value=''></option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select type="text" id="RegionSNum" name="RegionSNum" style="width: 137px;" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">管家</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoleNames1" name="RoleNames1"
                            searcher="SelDealMan1" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇
                    </td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BuildSNum" Style="width: 140px;" runat="server"></asp:DropDownList>
                    </td>
                    <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" data-options="editable:false"
                            style="width: 144px;" searcher="SelRoomSign" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="CustName" name="CustName" data-options="editable:false"
                            style="width: 144px;" searcher="SelCust" runat="server" />
                    </td>
                    <td class="TdTitle">报事电话</td>
                    <td class="TdContent">
                        <input type="text" id="Phone" name="Phone" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事位置
                    </td>
                    <td class="TdContent">
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">公区名称
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RegionalPlace" name="RegionalPlace" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">报事责任</td>
                    <td class="TdContent">
                        <select id="Duty" name="Duty" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="BigTypeName1" name="BigTypeName1" data-options="editable:false"
                            style="width: 140px;" searcher="SelTypeName1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否投诉
                    </td>
                    <td class="TdContent">
                        <select id="IsTousu1" name="IsTousu1" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否收费
                    </td>
                    <td class="TdContent">
                        <select id="DrFees1" name="DrFees1" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否设备</td>
                    <td class="TdContent">
                        <select id="EqId" name="EqId" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">设备空间</td>
                    <td class="TdContent">
                        <input type="text" id="MacRoName" name="MacRoName" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">关闭类型</td>
                    <td class="TdContent">
                        <select id="CloseType" name="CloseType" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="0">正常关闭</option>
                            <option value="1">非正常关闭</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否逾期</td>
                    <td class="TdContent">
                        <select id="IsBeoverdue" name="IsBeoverdue" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">逾期原因</td>
                    <td class="TdContent">
                        <select id="OverdueReason" runat="server" style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">逾期时长</td>
                    <td class="TdContent">
                        <select id="Operat" runat="server" style="width: 50px;">
                            <option value=">">></option>
                            <option value="=">=</option>
                            <option value="<"><</option>
                            <option value="<>"><></option>
                        </select>
                        <input type="text" id="IsBeoverdueHour" name="IsBeoverdueHour" style="width: 80px;" value="0" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">报事时间从
                    </td>
                    <td class="TdDateContent">
                        <input id="IncidentDate1" name="IncidentDate1" class="Wdate" runat="server" data-options="editable:false"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd 00:00:00', skin: 'default' })" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdDateContent">
                        <input id="IncidentDate2" name="IncidentDate2" class="Wdate" runat="server" data-options="editable:false"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd 23:59:59', skin: 'default' })" />
                    </td>

                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdDateContent">
                        <input type="text" id="ReserveDate1" name="ReserveDate1" class="Wdate" runat="server" data-options="editable:false"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdDateContent">
                        <input type="text" id="ReserveDate2" name="ReserveDate2" class="Wdate" runat="server" data-optons="editable:false"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">分派时间
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="DispDate1" name="DispDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="DispDate2" name="DispDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">接单时间
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReceivingDate1" name="ReceivingDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReceivingDate2" name="ReceivingDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">到场时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ArriveData1" name="ArriveData1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ArriveData2" name="ArriveData2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">完成时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="MainEndDate1" name="MainEndDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="MainEndDate2" name="MainEndDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">关闭时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="CloseTime1" name="CloseTime1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="CloseTime2" name="CloseTime2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">回访时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReplyDate1" name="ReplyDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReplyDate2" name="ReplyDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理人</td>
                    <td class="TdContent">
                        <input type="text" id="AdmiMan" name="AdmiMan" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">分派人</td>
                    <td class="TdContent">
                        <input type="text" id="DispMan" name="DispMan" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContent">
                        <input type="text" id="DealMan" name="DealMan" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">关闭人</td>
                    <td class="TdContent">
                        <input type="text" id="CloseMan" name="CloseMan" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 10px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList(1);">确定筛选</a>&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="btnClearMore();">清 空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input id="CustID" type="hidden" name="CustID" runat="server" />
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <input id="TypeID" type="hidden" name="TypeID" runat="server" />
        <input class="Control_ItemInput" id="hiTypeName" style="height: 22px; width: 64px" type="hidden" size="5" name="hiTypeName" runat="server">
        <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />
        <input id="BigCorpTypeID1" name="BigCorpTypeID1" type="hidden" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            //更多筛选
            function M() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                btn_clean();
            }


            function SelDealMan() {
                if ($("#RoleNames").searchbox("getValue") == "") {
                    HDialog.Open('640', '480', '../DialogNew/HouseKeeper.aspx', '选择管家', false, function callback(_Data) {
                        var arrRet = _Data.split('\t');
                        $("#RoleNames").searchbox("setValue", arrRet[2]);
                        $("#RoleNames1").searchbox("setValue", arrRet[2]);
                        LoadList(0);
                    });
                }
                else {
                    LoadList(0);
                }
            }

            function SelDealMan1() {
                HDialog.Open('640', '480', '../DialogNew/HouseKeeper.aspx', '选择管家', false, function callback(_Data) {
                    var arrRet = _Data.split('\t');
                    $("#RoleNames1").searchbox("setValue", arrRet[2]);
                });

            }

            function SelTypeName() {
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=&IsCheck=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                //HDialog.Open('650', '500', '../DialogNew/NewCorpIncidentTypeBigDlg2.aspx?ClassID=1&IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#TypeID").val(arrRet.id);
                    $("#hiTypeName").val(arrRet.TypeName);
                    $("#BigCorpTypeID").val(arrRet.id);
                    $("#BigTypeName").searchbox("setValue", arrRet.TypeName);
                    $("#BigCorpTypeID1").val(arrRet.id);
                    $("#BigTypeName1").searchbox("setValue", arrRet.TypeName);
                    LoadList(0);
                });

            }
            function SelTypeName1() {
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=&IsCheck=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                //HDialog.Open('650', '500', '../DialogNew/NewCorpIncidentTypeBigDlg2.aspx?ClassID=1&IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#TypeID").val(arrRet.id);
                    $("#hiTypeName").val(arrRet.TypeName);
                    $("#BigCorpTypeID1").val(arrRet.id);
                    $("#BigTypeName1").searchbox("setValue", arrRet.TypeName);

                });

            }

            function SelRoomSign() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);
                });
            }

            function SelCust() {
                $('#RoomID').val("");
                $('#RoomSign').searchbox("setValue", "");

                HDialog.Open('900', '430', '../DialogNew/CustDlg.aspx?Ram=' + Math.random(), '选择客户名称', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);

                    $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + encodeURI($("#CustID").val()),
                        function Init() {
                        },
                        function callback(RoomSignData) {

                            varObjects = JSON.parse(RoomSignData);
                            if (varObjects.length > 0) {

                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {

                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";

                                    if (vIsDelLive == 1) {
                                        strTmp = "(历史)";
                                    }

                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;
                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

                                }
                                $('#SelRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    panelWidth: 'auto',
                                    onChange: function (n, o) {
                                        var data = $('#SelRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {
                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }



            function InitTableHeight() {
                var h = $(window).height() - 30;
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var frozenColumns = [[
                {
                    field: '跟进', title: '跟进', width: 45, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewPages('gj'," + index + ");\">跟进</a>";
                        return str;
                    }
                },
                {
                    field: 'colse', title: '关闭', width: 60, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"cutIncident(" + index + ");\">关闭</a>&nbsp;&nbsp;";
                        return str;
                    }
                },
                {
                    field: 'back', title: '退回', width: 60, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"backIncident(" + index + ");\">退回</a>";
                        return str;
                    }
                },
                {
                    field: 'IncidentNum', title: '报事编号', width: 130, align: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('报事关闭详细页面'," + index + ");\">" + row.IncidentNum + "</a>";
                        return str;
                    }
                }
            ]]
            var column = [[
                { field: 'IncidentContent', title: '报事内容', width: 200, align: 'left', sortable: true },
                { field: 'BigTypeName', title: '报事类别', width: 100, align: 'left', sortable: true },
                { field: 'IncidentSource', title: '报事来源', width: 80, align: 'left', sortable: true },
                { field: 'IncidentPlace', title: '报事位置', width: 80, align: 'left', sortable: true },
                { field: 'RegionalPlace', title: '公区名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 110, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 160, align: 'left', sortable: true },
                { field: 'IncidentMan', title: '报事人', width: 160, align: 'left', sortable: true },
                { field: 'Phone', title: '报事电话', width: 100, align: 'left', sortable: true },


                { field: 'ReserveDate', title: '预约处理时间', width: 140, align: 'left', sortable: true },
                { field: 'MainEndDate', title: '完成时间', width: 140, align: 'left', sortable: true },
                {
                    field: 'DueAmount', title: '是否收费', width: 60, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "否";
                        if (row.DueAmount > 0) {
                            str = "是";
                        }
                        return str;
                    }
                },
                { field: 'CloseTime', title: '关闭时间', width: 140, align: 'left', sortable: true },
                //{
                //    field: 'CloseType', title: '关闭类型', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                //        var str = '';
                //        if (parseInt(value) == 0) {
                //            str = "<font color='green'> 正常关闭</font>";
                //        }
                //        else {
                //            str = "<font color='red'> 非正常关闭</font>";
                //        }
                //        return str;
                //    }
                //},
                {
                    field: 'IsBeoverdue', title: '是否逾期', width: 60, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var date1 = new Date(Date.parse(row.MainEndDate)).getTime();
                        var date2 = new Date(Date.parse(row.ReserveDate)).getTime();
                        var date3 = date2 - date1;   //时间差的毫秒数     
                        var hours = Math.floor(date3 / (3600 * 1000)) + parseInt(row.DealLimit)
                        var str = "";
                        if (hours > 0) {
                            str = "否"
                        }
                        else {
                            str = "是"
                        }
                        return str;
                    }
                },
                {
                    field: 'IsBeoverdueHour', title: '逾期时间(小时)', width: 100, align: 'left', sortable: true
                    //formatter: function (value, row, index) {
                    //    var date1 = new Date(Date.parse(row.MainEndDate)).getTime();
                    //    var date2 = new Date(Date.parse(row.ReserveDate)).getTime();
                    //    var date3 = date2 - date1;   //时间差的毫秒数     
                    //    var hours = Math.floor(date3 / (3600 * 1000)) + parseInt(row.DealLimit)
                    //    var str = "0";
                    //    if (hours < 0) {
                    //        str = -hours
                    //    }
                    //    return str;
                    //}
                },
                { field: 'reminderCount', title: '催办', width: 60, align: 'left', sortable: true }
            ]];
            function LoadList(isMore) {
                $('#IsMore').val(isMore);
                var InfoSource = $("#IncidentMode").find("option:selected").text();
                $("#hiInfoSource").val(InfoSource);

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    rownumbers: true,
                    pagination: true,
                    singleSelect: true,
                    border: false,
                    width: "100%",
                    remoteSort: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentCloseSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        //$("#SearchDlg").dialog("close");
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList(0);

            function ViewDetail(title, rowIndex) {
                var rows = $('#TableContainer').datagrid('getRows');
                var row = rows[rowIndex];
                Cache.SetData("IncidentReplyIDs", JSON.stringify(row));
                 var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../IncidentNewJH/IncidentCutDetailPage.aspx', title, false, function callback(_Data) {
                    if (_Data == 1) {
                        LoadList($('#IsMore').val());
                    }
                });
            }


            function ViewPages(option, rowIndex) {
                var url = "";
                var title = "";
                var rows = $('#TableContainer').datagrid('getRows');
                var row = rows[rowIndex];
                if (!row) {
                    HDialog.Info('请选择一行数据后再操作');
                    return;
                }
                url = '../IncidentNewJH/IncidentFollowUp.aspx?IncidentID=' + row.IncidentID + "&gjType=complete";
                title = "报事跟进";
                w = 720;
                h = 350;
                HDialog.Open(w, h, url, title, false, function callback(_Data) {
                    if (_Data) {
                        LoadList($('#IsMore').val());
                    }
                });
            }

            function ViewCustDetail(title, OpType, ID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../HouseNew/CustomerDetail.aspx?Back=IncidentAccept&CustID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                });
            }
            //报事关闭
            function cutIncident(rowIndex) {
                var rows = $('#TableContainer').datagrid('getRows');
                var row = rows[rowIndex];
                if (row != null) {
                    //11259，长信报事关闭页面 筛选已关闭的工单还能再次进行关闭续作限制
                    if (row.IsClose == "1") {
                       HDialog.Info('当前报事已关闭！');
                       return;
                    }

                    HDialog.Open('750', '450', '../IncidentNewJH/IncidentCutPage.aspx?IncidentID=' + row.IncidentID, '关闭', false, function callback(_Data) {
                        if (_Data) {
                            LoadList($('#IsMore').val());
                        }
                    });
                }
            }
            //退回
            function backIncident(rowIndex) {
                var rows = $('#TableContainer').datagrid('getRows');
                var row = rows[rowIndex];
                if (row != null) {
                    var pIncidentID = row.IncidentID || '';
                    var pMainEndDate = row.MainEndDate || '';
                    var pFinishUserCode = row.FinishUserCode || '';
                    var pFinishUser = row.FinishUser || '';
                    var url = '../IncidentNewJH/IncidentBackPage.aspx?OpType=CancleFinished&IncidentID=' + pIncidentID + '&LastFinishTime=' + pMainEndDate + '&LastFinishUserCode=' + pFinishUserCode + '&LastFinishUser=' + pFinishUser;
                    HDialog.Open('680', '300', url, '取消完成', false, function callback(_Data) {
                       LoadList($('#IsMore').val());
                    });
                }
            };
            $(document).ready(function () {
                $("#IncidentSource").css('color', '#8a8a8a');
                $("#DrFees").css('color', '#8a8a8a');
                $("#IsTousu").css('color', '#8a8a8a');

            });
            function TouSuChange() {
                if ($("#IsTousu").val() == "") {
                    $("#IsTousu").css('color', '#8a8a8a');
                }
                else {
                    $("#IsTousu").css('color', '#000000');
                }
                $("#IsTousu1").val($("#IsTousu").val());
                LoadList(0);
            }
            function FeesChange() {
                if ($("#DrFees").val() == "") {
                    $("#DrFees").css('color', '#8a8a8a');
                } else {
                    $("#DrFees").css('color', '#000000');
                }
                $("#DrFees1").val($("#DrFees").val());
                LoadList(0);
            }
            function SourceChange() {
                if ($("#IncidentSource").val() == "") {
                    $("#IncidentSource").css('color', '#8a8a8a');
                } else {
                    $("#IncidentSource").css('color', '#000000');
                }
                $("#IncidentSource1").val($("#IncidentSource").val());
                LoadList(0);
            }


            function btn_clean() {
                $("#IsTousu").val(null);
                $("#IsTousu").css('color', '#8a8a8a');
                $("#DrFees").val(null);
                $("#DrFees").css('color', '#8a8a8a');
                $("#IncidentSource").val(null);
                $("#IncidentSource").css('color', '#8a8a8a');
                $("#TypeID").val(null);
                $("#hiTypeName").val(null);
                $("#BigCorpTypeID").val(null);
                $("#BigTypeName").searchbox("setValue", null);
                $("#RoleNames").searchbox("setValue", null);
            }

            //清空更多
            function btnClearMore() {
                $("#IsClose").val("0");
                $("#IncidentNum").val("");
                $("#CoordinateNum").val("");

                $("#IncidentMode").val("");
                $("#IncidentSource1").val("");
                $("#RegionSNum").val("");
                $("#RoleNames1").searchbox("setValue", "");
                $("#BuildSNum").val("");
                $('#RoomSign').searchbox("setValue", "");
                $("#RoomID").val("");
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val("");
                $("#Phone").val("");
                $("#IncidentPlace").val("");
                $("#RegionalPlace").val("");
                $("#Duty").val("");
                $("#BigCorpTypeID1").val(null);
                $("#BigTypeName1").searchbox("setValue", null);
                $("#IsTousu1").val("");
                $("#DrFees1").val("");
                $("#EqId").val("");
                $("#MacRoName").val("");
                $("#CloseType").val("");
                $("#IsBeoverdue").val("");
                $("#IsBeoverdueHour").val("");

                $("#IncidentDate1").val("");
                $("#IncidentDate2").val("");
                $("#ReserveDate1").val("");
                $("#ReserveDate2").val("");
                $("#DispDate1").val("");
                $("#DispDate2").val("");
                $("#ReceivingDate1").val("");
                $("#ReceivingDate2").val("");
                $("#ArriveData1").val("");
                $("#ArriveData2").val("");
                $("#MainEndDate1").val("");
                $("#MainEndDate2").val("");
                $("#CloseTime1").val("");
                $("#CloseTime2").val("");
                $("#ReplyDate1").val("");
                $("#ReplyDate2").val("");


                $("#AdmiMan").val("");
                $("#DispMan").val("");
                $("#DealMan").val("");
                $("#CloseMan").val("");
                
            }


            $(function () {
            //五分钟刷新
            setInterval(function () {
                LoadList();
            }, 180000);
           })

        </script>
    </form>
</body>
</html>
