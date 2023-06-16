<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentAssignedBrowse.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentAssignedBrowse" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <%--<script type="text/javascript" src="../jscript/Authority.js"></script>--%>
    <script src="../jscript/QXhistory.js"></script>
</head>
<body onload="Win_OnLoad()">
    <form id="frmForm" runat="server">
        <input id="TypeCode" style="height: 22px; width: 40px" type="hidden" size="1" name="TypeCode" runat="server">
        <input id="PageIndex" style="height: 22px; width: 24px" type="hidden" size="1" name="PageIndex" runat="server">
        <input class="Control_ItemInput" id="hiCustName" style="height: 19px; width: 56px" type="hidden" size="4" name="hiCustName" runat="server">
        <input class="Control_ItemInput" id="CustID" style="height: 19px; width: 8px" type="hidden" size="1" name="CustID" runat="server">
        <input class="Control_ItemInput" id="TypeID" style="height: 22px; width: 80px" type="hidden" size="8" name="TypeID" runat="server">
        <input class="Control_ItemInput" id="hiTypeName" style="height: 22px; width: 64px" type="hidden" size="5" name="hiTypeName" runat="server">

        <input class="Control_ItemInput" id="TypeID1" style="height: 22px; width: 80px" type="hidden" size="8" name="TypeID1" runat="server">
        <input class="Control_ItemInput" id="hiTypeName1" style="height: 22px; width: 64px" type="hidden" size="5" name="hiTypeName1" runat="server">
        <input id="RoomID" style="height: 19px; width: 12px" type="hidden" size="1" name="RoomID" runat="server">
        <input id="PrintParms" style="height: 21px; width: 8px" type="hidden" size="1" name="PrintParms" runat="server">
        <input id="TableSign" style="height: 22px; width: 16px" type="hidden" size="1" name="TableSign" runat="server">
        <input id="hiSearchSql" style="height: 22px; width: 16px" type="hidden" size="1" name="hiSearchSql" runat="server">
        <input id="hiSearchData" style="height: 22px; width: 16px" type="hidden" size="1" name="hiSearchData" runat="server">
        <input id="IncidentID" type="hidden" size="1" name="IncidentID" runat="server">
        <input id="RoleList" name="RoleList" type="hidden" runat="server" />
        <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />

        <input id="IsMore" name="IsMore" type="hidden" value="0" />
        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server" />

        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <select id="IsTouSu" onchange="TouSuChange()" style="color: #000000; width: 130px" name="IsTouSu" runat="server">
                            <option selected="selected" style='color: #8a8a8a' value='投诉'>投诉</option>
                            <option value="0" style="color: #000000">否</option>
                            <option value="1" style="color: #000000">是</option>
                        </select>&nbsp;
                    </td>
                    <td>
                        <select id="Duty" onchange="DrAChange()" style="color: #000000; width: 130px" name="Duty" runat="server">
                            <option selected="selected" style='color: #8a8a8a' value='报事责任'>报事责任</option>
                            <option value="物业类" style="color: #000000">物业类</option>
                            <option value="地产类" style="color: #000000">地产类</option>
                        </select>
                        &nbsp;
                    </td>
                    <td>
                        <input type="text" id="BigTypeName" searcher="SelTypeName" data-options="prompt:'报事类别' " style="width: 130px" class="easyui-searchbox" runat="server" name="BigTypeName" />
                        &nbsp;</td>
                    <td>
                        <select id="IncidentSource" onchange="IncidentSourceChange()" style="color: #000000; width: 130px" name="IncidentSource" runat="server">
                            <option selected="selected" style='color: #8a8a8a' value='报事来源'></option>
                            <option value="客户报事" style="color: #000000">客户报事</option>
                            <option value="自查报事" style="color: #000000">自查报事</option>
                        </select>
                        &nbsp;
                    </td>
                    <td>
                        <select id="IncidentPlace" onchange="IncidentPlaceChange()" style="color: #000000; width: 130px" name="IncidentPlace" runat="server">
                            <option selected="selected" style='color: #8a8a8a' value='报事位置'>报事位置</option>
                            <option value="户内" style="color: #000000">户内</option>
                            <option value="公区" style="color: #000000">公区</option>
                        </select>&nbsp;
                    </td>
                    <%--<td>
                        <a href="javascript:void(0)" onclick=" JavaScript:LoadList(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>--%>
                    <%--<td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick=" JavaScript:PL();" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">批量派工</span><span class="l-btn-icon icon-man">&nbsp;</span></span></a>
                    </td>--%>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>

                    <%--  <td>
                        <a href="javascript:void(0)" onclick=" JavaScript:Print(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">批量打印派工单</span><span class="l-btn-icon icon-print">&nbsp;</span></span></a></td>
                    <td>                     
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>--%>
                    <td>
                        <a href="javascript:void(0)" onclick=" JavaScript: Print()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">打印空白派工单</span><span class="l-btn-icon icon-print">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick=" JavaScript: M()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">更多筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <%-- <td>
                        <a href="javascript:void(0)" onclick=" JavaScript: RealEstateRetransmission()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">地产工单重发</span><span class="l-btn-icon icon-edit">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>--%>
                    <td id="giveup">
                        <a href="javascript:void(0)" onclick=" JavaScript: GiveUp()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">废弃</span><span class="l-btn-icon icon-cancel">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <%--<td>
                        <a href="javascript:void(0)" onclick=" JavaScript: Show(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">显示设置</span><span class="l-btn-icon icon-filter">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>--%>
                </tr>
            </table>
        </div>

        <div id="TableContainer">
        </div>

        <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 130px; padding: 10px;">
            <table id="tabtishi" cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red; display: none;'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、打印空白派工单用于夜间手填派工单等，单号为临时编号，打印张数可在“报事查询”模块检核。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、手填派工单收回后必须补录到系统，并重新生成正式单号。
                    </td>
                </tr>
            </table>
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1050px; height: 290px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">派工状态</td>
                    <td class="TdContent">
                        <select id="DrDispType" name="DrDispType" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="0" selected="selected">未分派</option>
                            <option value="1">已分派</option>

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
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="SelClass" name="SelClass" runat="server" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>


                <tr>
                    <td class="TdTitle">报事方式</td>
                    <td class="TdContent">
                        <select id="InfoSource" name="InfoSource" style="width: 140px;" runat="server">
                        </select>
                    </td>
                    <td class="TdTitle">报事来源
                    </td>
                    <td class="TdContent">
                        <select id="IncidentSource1" name="IncidentSource1" style="width: 140px;" runat="server">
                            <option value=''></option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>

                    </td>
                    <td class="TdTitle">组团区域
                    </td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" style="width: 140px;" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">管家
                    </td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" style="width: 137px;" runat="server" />
                    </td>
                </tr>


                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContent">
                        <select id="BuildSNum" runat="server" style="width: 140px;" name="BuildSNum"></select>

                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" style="width: 140px;" searcher="SelRoomSign" runat="server" />
                        <input type="hidden" id="Hidden1" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="CustName" data-options="editable:false" name="CustName"
                            style="width: 140px;" searcher="SelCust" runat="server" />
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
                            <option value=""></option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">公区名称</td>
                    <td class="TdContent">
                        <input type="text" id="RegionalPlace" name="RegionalPlace" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">报事责任</td>
                    <td class="TdContent">
                        <select id="Duty1" name="Duty1" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事类别</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName" data-options="editable:false"
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

                    <td class="TdTitle">是否设备</td>
                    <td class="TdContent">
                        <select id="EqId" name="EqId" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">设备空间</td>
                    <td class="TdContentSearch">

                        <input type="text" class="easyui-searchbox" id="MacRoName" name="MacRoName"
                            style="width: 140px;" searcher="SelSpace" runat="server" />
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                    </td>

                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
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
                    <td class="TdTitle" style="width: 8%;">预约处理时间</td>
                    <td class="TdContent">
                        <input type="text" id="ReserveStartDate" name="ReserveStartDate" style="width: 140px;" class="Wdate" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" id="ReserveEndDate" name="ReserveEndDate" style="width: 140px;" class="Wdate" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" />
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
                    <td class="TdTitle">工单类型</td>
                    <td class="TdContent">
                        <select id="CMRIsConsistent" name="CMRIsConsistent" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <%-- <option value="3">物业工单</option>--%> <%-- //0/null未同步/无需同步，1已同步，2已同步录入--%>
                            <%--  <option value="12">地产工单</option>--%>
                            <option value="1">地产工单(物业转地产)</option>
                            <option value="2">地产工单(地产转物业)</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>


                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">确定筛选</a>&nbsp;
                       <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchRmove();">清空</a>
                    </td>
                </tr>
            </table>
        </div>


        <input type="button" id="BtnPrint" onserverclick="BtnPrint_ServerClick" runat="server" />
        <input type="hidden" id="HiIFCode" name="HiIFCode" value=" " runat="server" />
        <input type="hidden" id="HiIFName" name="HiIFName" value=" " runat="server" />
        <input type="hidden" id="HiObject" name="HiObject" value=" " runat="server" />
        <input type="hidden" id="IsSelectAll" runat="server" />
        <input type="hidden" id="AllData" runat="server" />
        <input type="hidden" id="IsSearch" value="0" runat="server" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>


        <script type="text/javascript">

            function SelTypeName() {
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=0&Duty=&IsCheck=1&IsBigClass=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                    //HDialog.Open('650', '500', '../DialogNew/NewCorpIncidentTypeBigDlg2.aspx?ClassID=1&IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsSearch=1', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);

                    //$("#TypeID").val(arrRet.id);
                    $("#hiTypeName").val(arrRet.TypeName);
                    //  $("#TypeName").val(arrRet.TypeName);
                    $("#BigCorpTypeID").val(arrRet.id);
                    $("#BigTypeName").searchbox("setValue", arrRet.TypeName);

                    LoadList();
                });

            }
            function SelTypeName1() {
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=0&Duty=&IsCheck=1&IsEdit=true&IsBigClass=1&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                    //HDialog.Open('650', '500', '../DialogNew/NewCorpIncidentTypeBigDlg2.aspx?ClassID=1&IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsSearch=1', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);

                    $("#TypeID").val(arrRet.id);
                    $("#TypeName").searchbox("setValue", arrRet.TypeName);


                });

            }

            function SearchRmove() {
                $("#DrDispType").val("");
                $("#IncidentNum").val("");
                $("#CoordinateNum").val("");
                $("#SelClass").val("");
                $("#InfoSource").val("");
                $("#IncidentSource1").val("");
                $("#RegionSNum").val("");
                $("#UserName").val("");
                $("#BuildSNum").val("");
                $('#RoomSign').searchbox("setValue", "");

                $('#CustID').val("");

                $("#Phone").val("");
                $("#IncidentPlace1").val("");
                $("#RegionalPlace").val("");
                $("#Duty1").val("");
                $("#TypeName").searchbox("setValue", "");
                $("#IsTousu1").val("");
                $("#EqId").val("");
                $("#MacRoName").val("");
                $("#IncidentDate1").val(getCurrentMonthFirst());
                $("#IncidentDate2").val(getCurrentMonthLast());
                $("#ReserveStartDate").val(getCurrentMonthFirst());
                $("#ReserveEndDate").val(getCurrentMonthLast());
                $("#AdmiMan").val("");
                $("#DispMan").val("");

                $('#CustName').searchbox("setValue", '');



            }


            Date.prototype.Format = function (fmt) { //author: meizz
                var o = {
                    "M+": this.getMonth() + 1, //月份
                    "d+": this.getDate(), //日
                    "h+": this.getHours(), //小时
                    "m+": this.getMinutes(), //分
                    "s+": this.getSeconds(), //秒
                    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                    "S": this.getMilliseconds() //毫秒
                };
                if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                for (var k in o)
                    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                return fmt;
            }


            /**
         * 获取当前月的第一天
         */
            function getCurrentMonthFirst() {
                var date = new Date();
                date.setDate(1);
                return date.Format('yyyy-MM-dd 00:00:00');
            }
            /**
             * 获取当前月的最后一天
             */
            function getCurrentMonthLast() {
                var date = new Date();
                var currentMonth = date.getMonth();
                var nextMonth = ++currentMonth;
                var nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
                var oneDay = 1000 * 60 * 60 * 24;


                return new Date(nextMonthFirstDay - oneDay).Format('yyyy-MM-dd 23:59:59');

            }


            function SelCust() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                HDialog.Open('1100', '530', "../DialogNew/CustDlg.aspx", '选择客户名称', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#IncidentMan').val(data.CustName);
                    $('#CustID').val(data.CustID);
                    //$('#Phone').val(data.MobilePhone);
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
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }

            function Win_OnLoad() {
                var strPrintParms = getObject("PrintParms").value;
                if (strPrintParms != "") {
                    showOperatWin(strPrintParms);

                    getObject("PrintParms").value = "";
                }
            }

            //更多筛选
            function M() {

                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }

            //打印
            function Print() {

                $('#SearchDlg').parent().appendTo($("form:first"));
                $("#BtnPrint").click();
                LoadList();
            }

            //废弃
            function GiveUp() {

                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info("请选择要废弃的报事!");
                }
                else {
                    //$.tool.DataPostNoLoading('IncidentAcceptNew_Search', 'JudeAssignedPost', "IncidentID=" + row.IncidentID, null,
                    //    function callback(_Data) {
                    //        if (_Data >= 1) {
                    //            DelRecord(row.IncidentID);
                    //        }
                    //        else {
                    //            HDialog.Info("您无此权限!");
                    //        }
                    //    });
                    DelRecord(row.IncidentID);
                }
            }

            //批量分派
            function PL() {

                var row = $("#TableContainer").datagrid("getSelected");

                if (row != null) {
                    ViewAssignedBatchManage("批量派工");
                }
                else {
                    HDialog.Info("请选择批量派工数据项");
                }
            }


            //显示设置
            function Show() {

                var showColumns = $("#TableContainer").datagrid('getColumnFields');
                var result = "";
                $.each(showColumns, function (index, item) {
                    columnOptions = $("#TableContainer").datagrid('getColumnOption', item);
                    if (!columnOptions.hidden) {
                        result += item + ",";
                    }
                })
                HDialog.Open('950', '500', '../IncidentNewJH/IncidentSearchSetColumns.aspx?columns=' + result, '显示设置', false, function callback(_Data) {
                    if (_Data != "") {
                        var showCode = "BigTypeName,";
                        var showName = "报事类别,";

                        var arrRet = JSON.parse(_Data);
                        var showColumnArray = arrRet.ShowColumn.split(',');
                        var hideColumnArray = arrRet.HideColumn.split(',');
                        $.each(showColumnArray, function (index, item) {
                            if (item != "") {
                                showCode += item + ",";

                                $("#TableContainer").datagrid('showColumn', item);
                                showName += $("#TableContainer").datagrid('getColumnOption', item).title + ",";
                            }
                        })

                        $.each(hideColumnArray, function (index, item) {
                            if (item != "") {
                                $("#TableContainer").datagrid('hideColumn', item);
                            }
                        })

                        $("#HiIFCode").val(showCode);
                        $("#HiIFName").val(showName);
                    }
                });

            }





            function InitTableHeight() {
                var h = $(window).height();
                var h1 = $('#divtt').height();
                h = h - h1;
                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();


            var frozenColumns = [[

                {
                    field: '', checkbox: true
                },
                //{ field: 'OrganName', title: '区域名称', width: 150, align: 'center', sortable: true },
                //{ field: 'CommName', title: '项目名称', width: 150, align: 'center', sortable: true },
                {
                    field: 'IncidentID', title: '催办', width: 80, align: 'center', sortable: true, formatter: function (value, row, index) {
                        //if (row.CMRIsConsistent == "1" && row.Duty == "地产类") {
                        //    return "-";
                        //} else if (row.CMRIsConsistent != "1" && row.Duty == "地产类") {
                        //    return "未同步";
                        //}
                        var reminderCount = 0;
                        if (row.reminderCount > 0) {
                            reminderCount = row.reminderCount;
                        }
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewRemindersDetail('催办','addReminders','" + row.IncidentID + "');\">催办(" + reminderCount + ")</a>";
                        return str;
                    }
                },
                {
                    field: 'Incidentp', title: '分派', width: 60, align: 'center', sortable: true, formatter: function (value, row, index) {
                        //if (row.CMRIsConsistent == "1" && row.Duty == "地产类") {
                        //    return "-";
                        //} else if (row.CMRIsConsistent != "1" && row.Duty == "地产类") {
                        //    return "未同步";
                        //}
                        //else 
                        if (row.ReWorkDate != '' && row.ReWorkDate != null) {
                            return "<a class=\"HrefStyle\" style=\"color:red;\" href='#' onclick=\" ViewAssignedBatchManageDan('报事分派','Edit','" + row.IncidentID + "','" + row.IncidentMan + "');\">分派</a>";
                        }
                        return "<a class=\"HrefStyle\" href='#' onclick=\"ViewAssignedBatchManageDan('报事分派','Edit','" + row.IncidentID + "','" + row.IncidentMan + "');\">分派</a>";
                    }
                },
                {
                    field: 'IncidentNum', title: '报事编号', width: 160, align: 'center', sortable: true, formatter: function (value, row, index) {
                        //if (row.ReWorkDate != '' && row.ReWorkDate !=null) {
                        //    return "<a class=\"HrefStyle\" style=\"color:red;\" href='#' onclick=\" ViewDetail('报事分派详情','Edit','" + row.IncidentID + "');\">" + row.IncidentNum +"(返工)</a>";
                        //}
                        return "<a class=\"HrefStyle\" href='#' onclick=\"ViewDetail('报事分派详情','Edit','" + row.IncidentID + "');\">" + row.IncidentNum + "</a>";

                    }
                }
            ]]

            var column = [[
                { field: 'IncidentContent', title: '报事内容', width: 200, align: 'center', sortable: true },
                { field: 'BigTypeName', title: '报事类别', width: 200, align: 'center', sortable: true },
                { field: 'IncidentSource', title: '报事来源', width: 200, align: 'center', sortable: true },
                { field: 'IncidentPlace', title: '报事位置', width: 120, align: 'center', sortable: true },
                { field: 'RegionalPlace', title: '公区名称', width: 200, align: 'center', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 200, align: 'center', sortable: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'center', sortable: true },
                { field: 'IncidentMan', title: '报事人', width: 200, align: 'center', sortable: true },
                { field: 'Phone', title: '报事电话', width: 200, align: 'center', sortable: true },
                { field: 'ReserveDate', title: '预约处理时间', width: 200, align: 'center', sortable: true }
            ]]



            //设备空间名称
            function SelSpace() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../DialogNew/RankSpace.aspx?CommId=' + CommID, '选择设备机房', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#SpaceId").val(varObjects.SpaceId);
                        $("#MacRoName").searchbox("setValue", varObjects.MacRoName);
                    }
                });
            }


            function formatRowFontColor(value, rowData, rowIndex) {
                var userRoleArray = $("#RoleList").val().replace(/'/g, "").split(",");
                var isChangeColor = false;
                //alert(rowData);
                $.each(userRoleArray, function (index, item) {
                    if (item != "" && rowData.RoleID.indexOf(item) > -1) {
                        isChangeColor = true;
                        return;
                    }
                })
                if (isChangeColor) {
                    return "<label style='color:darkgreen'>" + value + "</label>"
                }
                return value;
            }

            function RealEstateRetransmission() {
                //var row = $("#TableContainer").datagrid("getSelected");
                //if (row == null) {
                //    HDialog.Info("请选择要重新发送的地产报事!");
                //}
                //else {
                //    if (row.CMRIsConsistent == '2') {
                //        HDialog.Info("请选择物业传地产工单信息，当前工单为地产传物业后手动生成工单信息!");
                //        return false;
                //    }
                //    //绑定类型
                //    $.tool.DataGet('IncidentAcceptNew', 'RealEstateRetransmission', 'IncidentID=' + row.IncidentID,
                //        function Init() {
                //        },
                //        function callback(Data) {

                //            var returnstr = Data.split('|');
                //            if (returnstr[0] == "true") { LoadList(); }
                //            HDialog.Info(returnstr[1]);
                //        },
                //        function completeCallback() {
                //        },
                //        function errorCallback() {
                //        });
                //}
            }
            function Search() {
                $("#AllData").val('');
                $("#IsSelectAll").val('');


                $("#IsSearch").val(1);
                $("#IsMore").val('1');

                LoadList();

            }

            LoadList();

            function LoadList() {
                var InfoSource = $("#InfoSource").find("option:selected").text();
                $('#hiInfoSource').val(InfoSource);

                $('#TableContainer').datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    sortName: "IncidentID",
                    pagination: true,
                    rownumbers: true,
                    selectOnCheck: true,
                    checkOnSelect: false,
                    border: false,
                    frozenColumns: frozenColumns,
                    width: "100%",
                    //toolbar: toolbar,
                    sortOrder: "desc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentPoolSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        if ($('#IsSelectAll').val() == "1") {
                            $("#TableContainer").datagrid('checkAll');
                            var rows = $("#TableContainer").datagrid('getRows');

                            $.each(rows, function (index, item) {
                                $('#TableContainer').datagrid("checkRow", index);

                                if ($("#AllData").val().indexOf(item.IncidentID) < 0) {
                                    $("#AllData").val($("#AllData").val() + "|" + item.IncidentID);
                                }
                            });
                        }
                        else {
                            var rows = $("#TableContainer").datagrid('getRows');
                            $.each(rows, function (index, item) {
                                if ($("#AllData").val().indexOf(item.IncidentID) > -1) {
                                    $('#TableContainer').datagrid("checkRow", index);
                                }
                            });
                        }
                    },
                    onCheck: function (rowIndex, rowData) {
                        if ($("#AllData").val().indexOf(rowData.IncidentID) < 0) {
                            $("#AllData").val($("#AllData").val() + "|" + rowData.IncidentID);
                        }
                    },
                    onUncheck: function (rowIndex, rowData) {
                        $('#IsSelectAll').val(0);
                        if ($('#AllData').val().indexOf(rowData.IncidentID) > -1) {
                            $('#AllData').val($('#AllData').val().replace("|" + rowData.IncidentID, ''));
                        }
                    },
                    onCheckAll: function (rows) {
                        $('#IsSelectAll').val(1);

                        $.each(rows, function (index, item) {
                            if ($('#AllData').val().indexOf(item.IncidentID) < 0) {
                                $('#AllData').val($('#AllData').val() + "|" + item.IncidentID);
                            }
                        });
                    },
                    onUncheckAll: function (rows) {
                        $('#IsSelectAll').val(0);

                        $.each(rows, function (index, item) {
                            if ($('#AllData').val().indexOf(item.IncidentID) > -1) {
                                $('#AllData').val($('#AllData').val().replace("|" + item.IncidentID, ''));
                            }
                        });
                    }
                });
            }

            function ViewDetail(title, OpType, ID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../IncidentNewJH/IncidentAssignedManage.aspx?IncidentID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                    //alert(_Data);
                    if (_Data == 1) {
                        HDialog.Info("保存成功");
                        Cache.SetData("IncidentAssignedIDs", '');
                        $("#AllData").val('');
                        $('#IsSelectAll').val(0);
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }

            //批量分派
            function ViewAssignedBatchManage(title) {
                Cache.SetData("IncidentAssignedIDs", $("#AllData").val());
                HDialog.Open('800', '300', '../IncidentNewJH/IncidentAssignedBatchManage.aspx', title, false, function callback(_Data) {
                    if (_Data == 1) {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        Cache.SetData("IncidentAssignedIDs", '');
                        Cache.SetData("IncidentAssignedTypeIDs", '');
                        $("#AllData").val('');
                        $('#IsSelectAll').val(0);
                    }
                    LoadList();
                });
            }

            //分派
            function ViewAssignedBatchManageDan(title, OpType, ID, IncidentMan) {
                //alert(ID);
                Cache.SetData("IncidentAssignedIDs", $("#AllData").val());
                HDialog.Open('800', '350', '../IncidentNewJH/IncidentAssignedBatchManage.aspx?IncidentID=' + ID + '&OpType=' + OpType + '&IncidentMan=' + IncidentMan, title, false, function callback(_Data) {
                    //alert(_Data);
                    if (_Data == 1) {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        Cache.SetData("IncidentAssignedIDs", '');
                        Cache.SetData("IncidentAssignedTypeIDs", '');
                        $("#AllData").val('');
                        $('#IsSelectAll').val(0);

                    }
                    LoadList();
                });

            }

            function ViewRemindersDetail(title, OpType, ID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open('650', '280', '../IncidentNewJH/IncidentAcceptReminders.aspx?IncidentID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                    if (_Data == 1) {
                        LoadList();
                    }
                });
            }

            function Clear() {
                $('#CustName').val('');
                $('#IncidentEndDate').val('');
            }

            function DelRecord(IncidentID) {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {
                    HDialog.Prompt('是否删除此报事', function (r) { DeleteDetail("删除报事信息", 'delete', row.IncidentID); });
                }
            }

            function DeleteDetail(title, OpType, ID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open('650', '280', '../IncidentNewJH/IncidentAssignedDeleteReasons.aspx?IncidentID=' + ID + '&OpType=' + OpType, title, false,
                    function callback(_Data) {
                        //if (_Data == "1") {
                        LoadList();
                        //}
                        $('#SearchDlg').parent().appendTo($("form:first"));
                    });
            }

            $(document).ready(function () {
                $("#giveup").hide();
                $("#IsTouSu").val('投诉');
                $("#IsTouSu").css('color', '#8a8a8a');
                $("#IsTouSu").focus(function () {
                    if (this.value == '投诉') {
                        $("#IsTouSu").css('color', '#000');
                    }

                });
                $("#IsTouSu").blur(function () {
                    if (this.value == null || this.value == '') {
                        this.value = '投诉';
                        $("#IsTouSu").css('color', '#8a8a8a');
                    }
                });



                $("#IncidentPlace").val('报事位置');

                $("#IncidentPlace").css('color', '#8a8a8a');
                $("#IncidentPlace").focus(function () {

                    if (this.value == '报事位置') {
                        $("#IncidentPlace").css('color', '#000');
                    }

                });
                $("#IncidentPlace").blur(function () {

                    if (this.value == null || this.value == '') {

                        this.value = '报事位置';
                        $("#IncidentPlace").css('color', '#8a8a8a');
                    }

                });


                $("#IncidentSource").val('报事来源');

                $("#IncidentSource").css('color', '#8a8a8a');

                $("#IncidentSource").focus(function () {

                    if (this.value == '报事来源') {
                        $("#IncidentSource").css('color', '#000');
                    }

                });
                $("#IncidentSource").blur(function () {

                    if (this.value == null || this.value == '') {

                        this.value = '报事来源';
                        $("#IncidentSource").css('color', '#8a8a8a');
                    }

                });


                $("#Duty").val('报事责任');
                $("#Duty").css('color', '#8a8a8a');
                $("#Duty").focus(function () {

                    if (this.value == '报事责任') {
                        $("#Duty").css('color', '#000');
                    }
                });
                $("#Duty").blur(function () {

                    if (this.value == null || this.value == '') {
                        this.value = '报事责任';
                        $("#Duty").css('color', '#8a8a8a');
                    }

                });



            });

            function TouSuChange() {
                if ($("#IsTouSu").val() == "投诉") {
                    $("#IsTouSu").css('color', '#8a8a8a');
                }
                LoadList();
            }

            function DrAChange() {

                if ($("#Duty").val() == "报事责任") {
                    $("#Duty").css('color', '#8a8a8a');
                }
                LoadList();
            }
            function IncidentSourceChange() {
                if ($("#IncidentSource").val() == "报事来源") {
                    $("#IncidentSource").css('color', '#8a8a8a');
                }
                LoadList();

            }
            function IncidentPlaceChange() {
                if ($("#IncidentPlace").val() == "报事位置") {
                    $("#IncidentPlace").css('color', '#8a8a8a');
                }
                $("#IsMore").val('0');
                LoadList();

            }

            $(function () {
                //五分钟刷新
                setInterval(function () {
                    LoadList();
                }, 180000);

                //判断工单池是否有废弃权限
                CheckAuthority('1022', function callback(_Data) {
                    if (_Data == "true") {
                        $("#giveup").show();
                    }
                    else {
                        $("#giveup").hide();
                    }
                });
            })

        </script>
    </form>
</body>
</html>
