<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentReplyBrowse.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentReplyBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>



    <style>
        label {
            font-weight: 500;
        }

        td, th {
            padding-top: 5px;
        }

        .TdContent input[type="text"] {
            height: 21px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;" scroll="no">
    <form id="frmForm" runat="server">
        <input class="Control_ItemInput" id="TypeID" style="height: 22px; width: 80px" type="hidden"
            size="8" name="TypeID" runat="server">
        <input class="Control_ItemInput" id="hiTypeName" style="height: 22px; width: 64px" type="hidden" size="5" name="hiTypeName" runat="server">
        <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />
        <input id="BigCorpTypeID1" name="BigCorpTypeID1" type="hidden" runat="server" />
        <input id="ReplyResult" name="ReplyResult" type="hidden" value="" runat="server" />
        <input id="SearchType" name="SearchType" type="hidden" value="1" runat="server" />
        <input type="hidden" id="IsMore" name="IsMore" value="0" runat="server" />
        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server" />

        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" id="li1" data-flag="tabButton" style="color: red;"><a data-toggle="tab" href="#" onclick="setSearchType(1);" aria-expanded="true">待回访</a>
                </li>
                <li class="" id="li2" data-flag="tabButton" style="color: red;"><a data-toggle="tab" href="#" onclick="setSearchType(2);" aria-expanded="false">不成功回访</a>
                </li>
                <li class="" id="li3" data-flag="tabButton" style="color: red;"><a data-toggle="tab" href="#" onclick="setSearchType(3);" aria-expanded="false">成功并满意回访</a>
                </li>
                <li class="" id="li4" data-flag="tabButton" style="color: red;"><a data-toggle="tab" href="#" onclick="setSearchType(4);" aria-expanded="false">成功但不满意回访</a>
                </li>
                <li class="" id="li5" data-flag="tabButton" style="color: red;"><a data-toggle="tab" href="#" onclick="setSearchType(5);" aria-expanded="false">成功但无效评价</a>
                </li>
            </ul>
        </div>
        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <select id="CloseType" onchange="CloseTypeChange()" name="CloseType" style="color: #8a8a8a; width: 130px">
                            <option selected="selected" style='color: #8a8a8a' value="">关闭类型</option>
                            <option value="0" style="color: #000000">正常关闭</option>
                            <option value="1" style="color: #000000">非正常关闭</option>
                        </select>&nbsp;
                    </td>
                    <td>
                        <select id="IsTousu" onchange="TouSuChange()" name="IsTousu" style="color: #8a8a8a; width: 130px">
                            <option selected="selected" style='color: #8a8a8a' value="">是否投诉</option>
                            <option value="0" style="color: #000000">否</option>
                            <option value="1" style="color: #000000">是</option>
                        </select>&nbsp;</td>
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
                        <select id="IncidentSource" onchange="SourceChange()" style="color: #8a8a8a; width: 130px" name="IncidentSource" runat="server">
                            <%--<option  style='color: #8a8a8a' value="">报事来源</option>
                            <option value="客户报事" selected="selected" style="color: #000000">客户报事</option>
                            <option value="自查报事" style="color: #000000">自查报事</option>--%>
                        </select>&nbsp;</td>
                    <td>
                        <select id="IncidentPlace" onchange="IncidentPlaceChange()" style="color: #8a8a8a; width: 130px" name="IncidentPlace" runat="server">
                            <%--<option selected="selected" style='color: #8a8a8a' value=''>报事位置</option>
                            <option value="户内" style="color: #000000">户内</option>--%>
                            <%--<option value="公区" style="color: #000000">公区</option>--%>
                        </select>&nbsp;
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick=" JavaScript:SearchMore(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">更多筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>

                </tr>
            </table>
        </div>

        <div id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 400px; padding: 10px;">

            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">报事编号</td>
                    <td class="TdContent">
                        <input type="text" id="IncidentNum" name="IncidentNum" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">派工单号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="CoordinateNum" name="CoordinateNum" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">回访评价</td>
                    <td class="TdContent">
                        <select id="ServiceQuality" name="ServiceQuality" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="非常满意">非常满意</option>
                            <option value="满意">满意</option>
                            <option value="一般">一般</option>
                            <option value="不满意">不满意</option>
                            <option value="很不满意">很不满意</option>
                        </select>
                    </td>
                    <td class="TdTitle">回访人</td>
                    <td class="TdContent">
                        <input type="text" id="ReplyMan" name="ReplyMan" style="width: 137px;" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">报事方式</td>
                    <td class="TdContent">
                        <select id="IncidentMode" name="IncidentMode" style="width: 140px;" runat="server">
                        </select>
                    </td>
                    <td class="TdTitle">报事来源</td>
                    <td class="TdContent">
                        <select id="IncidentSource1" name="IncidentSource1" style="width: 140px;" runat="server">
                            <%--<option value=''></option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>--%>
                        </select>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" style="width: 140px;" runat="server">
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
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContent">
                        <select id="BuildSNum" style="width: 140px;" runat="server" name="BuildSNum"></select>
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" style="width: 140px;" searcher="SelRoomSign" runat="server" />
                        <input type="hidden" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="CustName" data-options="editable:false" name="CustName"
                            style="width: 140px;" searcher="SelCust" runat="server" />
                        <input id="CustID" type="hidden" name="CustID" />
                    </td>
                    <td class="TdTitle">报事电话</td>
                    <td class="TdContent">
                        <input type="text" id="Phone" name="Phone" style="width: 137px;" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">报事位置</td>
                    <td class="TdContent">
                        <select id="IncidentPlace1" name="IncidentPlace1" style="width: 140px;" runat="server">

                            <%--<option value="户内">户内</option>--%>
                            <%-- <option value="公区">公区</option>--%>
                        </select>
                    </td>
                    <td class="TdTitle">公区名称</td>
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
                    <td class="TdTitle">报事类别</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="BigTypeName1" name="BigTypeName1" data-options="editable:false"
                            style="width: 140px;" searcher="SelTypeName1" runat="server" />

                    </td>
                </tr>


                <tr>
                    <td class="TdTitle">是否投诉</td>
                    <td class="TdContent">
                        <select id="IsTousu1" name="IsTousu1" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否收费</td>
                    <td class="TdContent">
                        <select id="DrFees1" name="DrFees1" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否设备</td>
                    <td class="TdContent">
                        <select id="EqId" name="EqId" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
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
                        <select id="CloseType1" name="CloseType1" style="width: 140px;" runat="server">
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
                        <input type="text" id="OverdueReason" name="OverdueReason" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">逾期时长</td>
                    <td class="TdContent">
                        <select id="Operat" runat="server" style="width: 50px;">
                            <option value=""></option>
                            <option value=">">></option>
                            <option value="=">=</option>
                            <option value="<"><</option>
                            <option value="<>"><></option>
                        </select>
                        <input type="text" id="IsBeoverdueHour" name="IsBeoverdueHour" style="width: 80px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="IncidentDate1" name="IncidentDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="IncidentDate2" name="IncidentDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">预约处理时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDate1" name="ReserveDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDate2" name="ReserveDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
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
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList(1);">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="btnClearMore();">清 空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="HiIFCode" name="HiIFCode" value=" " runat="server" />
        <input type="hidden" id="HiIFName" name="HiIFName" value=" " runat="server" />
        <input type="hidden" id="HiObject" name="HiObject" value=" " runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function setSearchType(value) {
                $("li[data-flag='tabButton']").each(function (index, data) {
                    $(data).removeClass();
                })
                $("#li" + value).addClass('active');
                $("#SearchType").val(value);
                LoadList(0);
            }
            function SelTypeName() {
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('650', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=0&Duty=&IsCheck=1&IsEdit=true&IsAll=True', '选择报事类别', false, function callback(_Data) {
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
                HDialog.Open('650', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=0&Duty=&IsCheck=1&IsEdit=true&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    //HDialog.Open('650', '500', '../DialogNew/NewCorpIncidentTypeBigDlg2.aspx?ClassID=1&IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);

                    $("#TypeID").val(arrRet.id);
                    $("#hiTypeName").val(arrRet.TypeName);
                    $("#BigCorpTypeID1").val(arrRet.id);
                    $("#BigTypeName1").searchbox("setValue", arrRet.TypeName);

                });

            }

            function SelDealMan1() {
                HDialog.Open('640', '480', '../DialogNew/HouseKeeper.aspx', '选择管家', false, function callback(_Data) {
                    var arrRet = _Data.split('\t');
                    $("#RoleNames1").searchbox("setValue", arrRet[2]);
                });

            }

            function InitTableHeight() {
                var h = $(window).height() - 70;
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var frozenColumns = [[
                {
                    field: 'reply', title: '回访', width: 60, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"replyIncident(" + index + ");\">回访</a>";
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
                    field: 'IncidentNum', title: '报事编号', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('报事关闭详细页面'," + index + ");\">" + row.IncidentNum + "</a>";
                        return str;
                    }
                }
            ]]
            var column = [[
                { field: 'FinishUser', title: 'FinishUser', width: 25, align: 'left', sortable: true, hidden: true },

                { field: 'IncidentContent', title: '报事内容', width: 200, align: 'left', sortable: true },
                { field: 'BigTypeName', title: '报事类别', width: 100, align: 'left', sortable: true },
                { field: 'IncidentSource', title: '报事来源', width: 100, align: 'left', sortable: true },
                { field: 'IncidentPlace', title: '报事位置', width: 100, align: 'left', sortable: true },
                { field: 'RegionalPlace', title: '公区名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 160, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 120, align: 'left', sortable: true },
                { field: 'IsTouSuName', title: '是否投诉', width: 80, align: 'left', sortable: true },
                { field: 'IncidentMan', title: '报事人', width: 100, align: 'left', sortable: true },
                { field: 'Phone', title: '报事电话', width: 100, align: 'left', sortable: true },
                { field: 'ReserveDate', title: '预约处理时间', width: 140, align: 'left', sortable: true },
                { field: 'MainEndDate', title: '完成时间', width: 140, align: 'left', sortable: true },
                {
                    field: 'DueAmount', title: '是否收费', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "否";
                        if (row.DueAmount > 0) {
                            str = "是";
                        }
                        return str;
                    }
                },
                { field: 'CloseTime', title: '关闭时间', width: 140, align: 'left', sortable: true },
                {
                    field: 'CloseType', title: '关闭类型', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = '';
                        if (parseInt(value) == 0) {
                            str = "<font color='green'> 正常关闭</font>";
                        }
                        else {
                            str = "<font color='red'> 非正常关闭</font>";
                        }
                        return str;
                    }
                },
                {
                    field: 'IsBeoverdue', title: '是否逾期', width: 60, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var date1 = new Date(Date.parse(row.MainEndDate)).getTime();
                        var date2 = new Date(Date.parse(row.ReserveDate)).getTime();
                        var date3 = date2 - date1;   //时间差的毫秒数     
                        var hours = Math.floor(date3 / (3600 * 1000)) + parseInt(row.DealLimit);
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
                    field: 'IsBeoverdueHour', title: '逾期时间(小时)', width: 100, align: 'left', sortable: true,
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
                { field: 'reminderCount', title: '催办', width: 60, align: 'left', sortable: true },
                { field: 'ServiceQuality', title: '回访评价', width: 100, align: 'left', sortable: true },
                { field: 'ReplyDate', title: '回访时间', width: 140, align: 'left', sortable: true }

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
                    fitColumns: false,
                    rownumbers: true,
                    pagination: true,
                    border: false,
                    remoteSort: false,
                    frozenColumns: frozenColumns,
                    width: "100%",
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentReplySearchNew", "TableContainer", param);//IncidentReplySearchNew
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                if ($("#SearchType").val() != '1') {
                    //$('#TableContainer').datagrid('hideColumn', 'reply');
                    $('#TableContainer').datagrid('hideColumn', 'back');
                } else {
                    $('#TableContainer').datagrid('showColumn', 'reply');
                    $('#TableContainer').datagrid('showColumn', 'back');
                }
                $("#SearchDlg").dialog("close");
            }
            LoadList(0);

            function SelCust() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                HDialog.Open('1100', '530', "../DialogNew/CustDlg.aspx", '选择客户名称', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#IncidentMan').val(data.CustName);
                    $('#CustID').val(data.CustID);
                    var roomsign = data.NewRoomSigns;
                    dataobj = roomsign.split(',');
                    if (dataobj.length > 1) {
                        var roomsign1 = dataobj[0].substr(0, dataobj[0].indexOf('['));
                        $('#RoomSign').searchbox("setValue", roomsign1);
                    }
                    else {
                        $('#RoomSign').searchbox("setValue", roomsign.substr(0, roomsign.indexOf('[')));
                    }
                });

            }
            function SelRoomSign() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', true, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }

            function ViewDetail(title, rowIndex) {
                var rows = $('#TableContainer').datagrid('getRows');
                var row = rows[rowIndex];
                Cache.SetData("IncidentReplyIDs", JSON.stringify(row));
                ViewReplyDetailPage();
            }

            function ViewCustDetail(title, OpType, ID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../HouseNew/CustomerDetail.aspx?Back=IncidentAccept&CustID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                });
            }

            function SearchMore() {
                $("#SearchDlg").dialog("open");
                btn_clean();
            }
            function ViewReplyDetailPage() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../IncidentNewJH/IncidentReplyDetailPage.aspx?SearchType=' + $("#SearchType").val(), '回访详细页面', false, function callback(_Data) {
                    Cache.SetData("IncidentReplyIDs", '');
                    if (_Data) {
                        LoadList($('#IsMore').val());
                    }
                });
            }
            //回访
            function replyIncident(rowIndex) {
                var rows = $('#TableContainer').datagrid('getRows');
                var row = rows[rowIndex];
                if (row != null) {
                    HDialog.Open('720', '400', '../IncidentNewJH/IncidentReplyPage.aspx?IncidentID=' + row.IncidentID + '&IncidentNum=' + row.IncidentNum, '回访登记', false, function callback(_Data) {
                        if (_Data == "1") {
                            HDialog.Info('回访成功!');
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
                    var url = '../IncidentNewJH/IncidentBackPage.aspx?OpType=CancleCut&IncidentID=' + row.IncidentID + '&CloseTime=' + row.CloseTime + '&CloseUserCode=' + row.CloseUserCode + '&CloseUser=' + row.CloseUser;
                    HDialog.Open('680', '300', url, '取消关闭', false, function callback(_Data) {
                        LoadList($('#IsMore').val());
                    });
                }
            };

            function TouSuChange() {
                if ($("#IsTousu").val() == "") {
                    $("#IsTousu").css('color', '#8a8a8a');
                }
                else {
                    $("#IsTousu").css('color', '#000000');
                    $("#IsTousu1").val($("#IsTousu").val());
                }
                LoadList(0);
            }
            function FeesChange() {
                if ($("#DrFees").val() == "") {
                    $("#DrFees").css('color', '#8a8a8a');
                } else {
                    $("#DrFees").css('color', '#000000');
                    $("#DrFees1").val($("#DrFees").val());
                }
                LoadList(0);
            }
            function SourceChange() {
                if ($("#IncidentSource").val() == "") {
                    $("#IncidentSource").css('color', '#8a8a8a');
                } else {
                    $("#IncidentSource").css('color', '#000000');
                    $("#IncidentSource1").val($("#IncidentSource").val());
                }
                LoadList(0);
            }
            function IncidentPlaceChange() {
                if ($("#IncidentPlace").val() == "") {
                    $("#IncidentPlace").css('color', '#8a8a8a');
                } else {
                    $("#IncidentPlace").css('color', '#000000');
                    $("#IncidentPlace1").val($("#IncidentPlace").val());
                }
                LoadList(0);
            }
            function CloseTypeChange() {
                if ($("#CloseType").val() == "") {
                    $("#CloseType").css('color', '#8a8a8a');
                } else {
                    $("#CloseType").css('color', '#000000');
                    $("#CloseType1").val($("#CloseType").val());
                }
                LoadList(0);
            }
            $(function () {
                $("#IncidentSource").css('color', '#8a8a8a');
                $("#DueAmount").css('color', '#8a8a8a');
                $("#IsTousu").css('color', '#8a8a8a');
                $("#DrFees").css('color', '#8a8a8a');
                $("#IncidentPlace").css('color', '#8a8a8a');
                $("#CloseType").css('color', '#8a8a8a');

                //五分钟刷新
                setInterval(function () {
                    LoadList(0);
                }, 180000);
            })

            function btn_clean() {
                $("#CloseType").val(null);
                $("#CloseType").css('color', '#8a8a8a');
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
                $("#IncidentNum").val("");
                $("#CoordinateNum").val("");
                $("#ServiceQuality").val("");
                $("#ReplyMan").val("");
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
                $("#IncidentPlace1").val("");
                $("#RegionalPlace").val("");
                $("#Duty").val("");
                $("#BigCorpTypeID1").val(null);
                $("#BigTypeName1").searchbox("setValue", null);
                $("#IsTousu1").val("");
                $("#DrFees1").val("");
                $("#EqId").val("");
                $("#MacRoName").val("");
                $("#CloseType1").val("");
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

        </script>
    </form>
</body>
</html>
