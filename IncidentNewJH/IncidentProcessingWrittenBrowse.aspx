<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentProcessingWrittenBrowse.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentProcessingWrittenBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>书面报事</title>
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
    <script src="../jscript/QXhistory.js"></script>

</head>
<body>
    <form id="IncidentProcessingVerbalBrowse" runat="server">
        <input id="TypeID" type="hidden" size="1" name="TypeID" runat="server" />
        <input id="hiTypeName" type="hidden" size="1" name="hiCostName" runat="server" />
        <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />
        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server" />

        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <input type="text" id="BigTypeName" searcher="SelTypeName" data-options="prompt:'报事类别' " style="width: 130px" class="easyui-searchbox" runat="server" name="BigTypeName" />&nbsp;</td>
                    <td>
                        <select id="IncidentSource" onchange="IncidentSourceChange()" style="color: #8a8a8a; width: 130px" name="IncidentSource" runat="server">
                            <option selected="selected" style='color: #8a8a8a' value=''>报事来源</option>
                            <option value="客户报事" style="color: #000000">客户报事</option>
                            <option value="自查报事" style="color: #000000">自查报事</option>
                        </select>
                        &nbsp;</td>
                    <td>
                        <input name="RoomSignId" type="text" id="RoomSignId" placeholder="双击选择房号" ondblclick="dbRoomSign();" autocomplete="off" />&nbsp;
                      <%--  <select id="IncidentPlace" onchange="IncidentPlaceChange()" style="color: #000000; width: 130px" name="IncidentPlace" runat="server">
                            <option selected="selected" style='color: #8a8a8a' value=''>报事位置</option>
                            <option value="户内" style="color: #000000">户内</option>
                            <option value="公区" style="color: #000000">公区</option>
                        </select>&nbsp;--%>
                    </td>
                    <td>
                        <input name="DealManName" type="text" id="DealManName" placeholder="双击选择责任人" ondblclick="dbDealManName();" autocomplete="off" />
                        <input id="DealManCode" name="DealManCode" type="hidden" runat="server" />
                        &nbsp;
                    </td>
                    <%-- <td>
                        <a href="javascript:void(0)" onclick=" JavaScript:LoadList(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>--%>
                    <td>
                        <a href="javascript:void(0)" onclick=" JavaScript:CancelParm(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">清空</span><span class="l-btn-icon icon-reload">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick="FilterMore();" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">更多筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td id="giveup">
                        <a href="javascript:void(0)" onclick=" JavaScript: GiveUp()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">废弃</span><span class="l-btn-icon icon-cancel">&nbsp;</span></span></a></td>
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
            style="width: 1000px; height: 380px;">

            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">

                <tr>
                    <td class="TdTitle">处理状态：</td>
                    <td class="TdContent">
                        <select id="AchieveMore" name="Achieve" style="width: 140px;">
                            <option selected="selected"></option>
                            <option value="否">未逾期</option>
                            <option value="是">已逾期</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事编号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentNum" name="IncidentNum" style="width: 137px;" />
                    </td>
                    <td class="TdTitle">派工单号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="CoordinateNum" name="CoordinateNum" style="width: 137px;" />
                    </td>

                    <td class="TdTitle">是否退回</td>
                    <td class="TdContent">
                        <select id="isBack" name="isBack" style="width: 140px;">
                            <option></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>


                </tr>

                <tr>
                    <td class="TdTitle">报事方式</td>
                    <td class="TdContent">
                        <select id="InfoSource" name="InfoSource" style="width: 140px;" runat="server">
                        </select>
                    </td>

                    <td class="TdTitle">报事来源</td>
                    <td class="TdContent">
                        <select id="IncidentSource1" name="IncidentSource1" style="width: 140px;">
                            <option value=''></option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" style="width: 140px;" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">管家</td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" style="width: 137px;" />
                    </td>

                </tr>

                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContent">
                        <select id="BuildSNum" style="width: 140px;" runat="server" name="BuildSNum"></select>
                    </td>

                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" style="width: 140px;" searcher="SelRoomSign" />
                        <input type="hidden" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-searchbox" id="CustName" name="CustName" style="width: 140px;" searcher="SelCust" />
                        <input id="CustID" type="hidden" name="CustID" />
                    </td>
                    <td class="TdTitle">报事电话</td>
                    <td class="TdContent">
                        <input type="text" id="Phone" name="Phone" style="width: 137px;" />
                    </td>

                </tr>

                <tr>
                    <td class="TdTitle">报事位置</td>
                    <td class="TdContent">
                        <select id="IncidentPlace1" name="IncidentPlace1" style="width: 140px;">
                            <option value=""></option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">公区名称</td>
                    <td class="TdContent">
                        <input type="text" id="RegionalPlace" name="RegionalPlace" style="width: 137px;" />
                    </td>
                    <td class="TdTitle">报事责任</td>
                    <td class="TdContent">
                        <select id="Duty" name="Duty" style="width: 140px;">
                            <option value=""></option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事类别</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName" data-options="editable:false"
                            style="width: 140px;" searcher="SelTypeName1" />
                        <input type="hidden" id="TypeIDMore" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">是否投诉</td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否收费</td>
                    <td class="TdContent">
                        <select id="DrFees" name="DrFees" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="1">是</option>
                            <option value="0">否</option>
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

                        <input type="text" class="easyui-searchbox" id="MacRoName" name="MacRoName" style="width: 140px;" searcher="SelSpace" runat="server" />
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否转发</td>
                    <td class="TdContent">
                        <select style="width: 140px;">
                            <option></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>

                    <td class="TdTitle">是否逾期</td>
                    <td class="TdContent">
                        <select id="IsBeoverdue" name="IsBeoverdue" style="width: 140px;">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">逾期原因</td>
                    <td class="TdContent">
                        <select id="OverdueReason" name="OverdueReason" runat="server" style="width: 140px;">
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
                    <td class="TdTitle">受理时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="IncidentDateStart" name="IncidentDateStart" style="width: 140px;"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="IncidentDateEnd" name="IncidentDateEnd" style="width: 140px;"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">预约处理时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDateStart" name="ReserveDateStart" style="width: 140px;"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDateEnd" name="ReserveDateEnd" style="width: 140px;"
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
                        <input type="text" class="Wdate" id="MainEndDate1" name="MainEndDateStart" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="MainEndDate2" name="MainEndDateEnd" style="width: 140px;" runat="server"
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
                    <td class="TdTitle">完成人</td>
                    <td class="TdContent">
                        <input type="text" id="CloseMan" name="CloseMan" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>

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
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 10px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadListMore();">确定筛选</a>&nbsp;
                       <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="SearchRmove();">清空</a>
                    </td>
                </tr>
            </table>
        </div>

        <input id="DrClass" name="DrClass" value="1" type="hidden" />
        <input id="IsMore" name="IsMore" value="0" type="hidden" />
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
    </form>
</body>
</html>
<script type="text/javascript">

    function SearchRmove() {
        $("#AchieveMore").val("");
        $("#IncidentNum").val("");
        $("#CoordinateNum").val("");
        $("#InfoSource").val("");
        $("#IncidentSource1").val("");
        $("#RegionSNum").val("");
        $("#UserName").val("");
        $("#BuildSNum").val("");
        $('#RoomSign').searchbox("setValue", "");

        $('#CustName').searchbox("setValue", '');
        $("#Phone").val("");
        $("#IncidentPlace1").val("");
        $("#RegionalPlace").val("");
        $("#Duty").val("");
        $("#TypeName").searchbox("setValue", "");
        $("#IncidentDateStart").val("");
        $("#IncidentDateEnd").val("");
        $("#ReserveDateStart").val("");
        $("#ReserveDateEnd").val("");
        $("#MainEndDateStart").val("");
        $("#MainEndDateEnd").val("");
        $("#IsBeoverdue").val("");
        $("#IsBeoverdueHour").val("");
        $("#AdmiMan").val("");
        $("#DealMan").val("");

        $("#isBack").val("");
        $("#IsTousu").val("");

        $("#DrFees").val("");
        $("#EqId").val("");
        $("#MacRoName").val("");
        $("#DispDate1").val("");
        $("#DispDate2").val("");
        $("#ReceivingDate1").val("");
        $("#ReceivingDate2").val("");
        $("#ArriveData1").val("");
        $("#ArriveData2").val("");
        $("#MainEndDate1").val("");
        $("#MainEndDate2").val("");
        $("#AdmiMan").val("");
        $("#DispMan").val("");
        $("#DealMan").val("");
        $("#CloseMan").val("");
    }

    var frozenColumns = [[
        {
            field: '批量', title: '批量', checkbox: true
        },
        //{ field: 'OrganName', title: '区域名称', width: 150, align: 'center', sortable: true },
        //{ field: 'CommName', title: '项目名称', width: 150, align: 'center', sortable: true },
        {
            field: 'IncidentID', title: '催办', width: 80, align: 'center', sortable: true, formatter: function (value, row, index) {
                var reminderCount = 0;
                if (row.reminderCount > 0) {
                    reminderCount = row.reminderCount;
                }
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewRemindersDetail('报事催办','addReminders','" + row.IncidentID + "');\">催办(" + reminderCount + ")</a>";
                return str;
            }
        },
        {
            field: '跟进', title: '跟进', width: 45, align: 'center', sortable: true,
            formatter: function (value, row, index) {
                var yangsi = "";
                if (row.IsIncidentForward == "是") {
                    yangsi = "style='color:#808080;'";
                }
                var str = "<a class=\"HrefStyle\" " + yangsi + " href='#' onclick=\"ViewPages('gj'," + index + ");\">跟进</a>";
                return str;
            }
        },
        {
            field: '转发', title: '转发', width: 45, align: 'center', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewPages('open'," + index + ");\">转发</a>";
                return str;
            }
        },
        {
            field: '协助', title: '协助', width: 45, align: 'center', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewPages('xz'," + index + ");\">协助</a>";
                return str;
            }
        },
        {
            field: '延期', title: '延期', width: 45, align: 'center', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewPages('yq'," + index + ");\">延期</a>";
                return str;
            }
        },
        {
            field: '完成', title: '完成', width: 45, align: 'center', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewPages('finish'," + index + ");\">完成</a>";
                return str;
            }
        },
        {
            field: 'IncidentNum', title: '报事编号', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewPages('deal'," + index + ");\">" + value + "</a>";
                return str;
            }
        },
    ]]

    function ViewRemindersDetail(title, OpType, ID) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open('650', '200', '../IncidentNewJH/IncidentAcceptReminders.aspx?IncidentID=' + ID + '&OPType=' + OpType, title, false, function callback(_Data) {
            if (_Data == 1) {
                LoadList();
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
        var w = 720;
        var h = 320;
        switch (option) {
            case "open":
                url = '../IncidentNewJH/IncidentProcessingTransmit.aspx?IncidentID=' + row.IncidentID + "&DrClass=" + row.DrClass +
                    "&BigCorpTypeID=" + row.BigCorpTypeID + "&BigCorpTypeCode=" + row.BigCorpTypeCode +
                    "&TypeName=" + row.BigTypeName + "&IncidentDuty=" + row.Duty + "&DealMan=" + row.DealMan + "&UserCodes=" +
                    row.DealManCode + "&IncidentPlace=" + row.IncidentPlace + "&CommID=" + row.CommID;
                title = "报事转发";
                break;
            case "gj":
                url = '../IncidentNewJH/IncidentFollowUp.aspx?IncidentID=' + row.IncidentID + "&Achieve=" + row.IsBeoverdue + "&gjType=deal";
                title = "报事跟进";
                w = 780;
                h = 450;
                break;
            case "finish":
                url = '../IncidentNewJH/IncidentProcessingFinish.aspx?IncidentID=' + row.IncidentID + "&IncidentMan=" + row.IncidentMan + "&IncidentNum=" + row.IncidentNum;
                title = "报事完成";
                w = $(window).width();
                h = $(window).height();
                Cache.SetData("IncidentDeals", JSON.stringify(row));
                break;
            case "deal":
                url = '../IncidentNewJH/IncidentWrittenDeal.aspx?IncidentID=' + row.IncidentID;
                title = "报事处理详情";
                w = $(window).width();
                h = $(window).height();
                Cache.SetData("IncidentDeals", JSON.stringify(row));
                break;
            case "xz":
                url = '../IncidentNewJH/IncidentAssistManageDetail.aspx?id=&IncidentID=' + row.IncidentID + '&OpType=insert&DealUserCode=' + row.DealManCode + '&IncidentNum=' + row.IncidentNum + '&CoordinateNum=' + row.CoordinateNum + '&CommName=' + row.CommName + '&TypeID=' + row.TypeID;
                title = "报事协助申请";
                w = $(window).width();
                h = $(window).height();
                Cache.SetData("IncidentDeals", JSON.stringify(row));
                break;
            case "yq":
                url = '../IncidentNewJH/IncidentDelayApplyManageDetail.aspx?id=&IncidentID=' + row.IncidentID + '&OpType=insert';
                title = "报事延期申请";
                w = $(window).width();
                h = $(window).height();
                Cache.SetData("IncidentDeals", JSON.stringify(row));
                break;
        }
        HDialog.Open(w, h, url, title, false, function callback(_Data) {
            if (_Data) {
                LoadList(rowIndex);

            }
        });
    }

    //清空查询条件
    function CancelParm() {
        $('#TypeName').searchbox("setValue", '');
        $("#TypeID").val("");
        $("#IncidentMode").val("");
        $("#IncidentPlace").val("");
        $("#DrAchieve").val("");
        $('#BigTypeName').searchbox("setValue", '');
        $('#BigCorpTypeID').val("");
        $('#DealManCode').val(null);
        $('#DealManName').val(null);
        $('#RoomSignId').val("");

        LoadList();
    }


    function GiveUp() {
        var rows = $('#TableContainer').datagrid('getChecked');
        if (rows == "") {
            HDialog.Info('请选择报事项!');
            return;
        }
        else {
            var SelIncidentIDs = "";
            $.each(rows, function (key, val) {
                SelIncidentIDs += rows[key]["IncidentID"] + ",";

            });
            SelIncidentIDs = SelIncidentIDs.substr(0, SelIncidentIDs.length - 1);
            Cache.SetData("IncidentIDs", SelIncidentIDs);
            $.tool.DataPostNoLoading('IncidentAcceptNew_Search', 'JudeAssignedPost', "IncidentID=" + SelIncidentIDs, null,
                function callback(_Data) {
                    if (_Data.split('|')[0] == "true") {
                        var url = '../IncidentNewJH/IncidentProcessingGiveUp.aspx';
                        var title = "报事废弃";
                        HDialog.Open('600', '300', url, title, false, function callback(_Data) {
                            if (_Data == "true") {
                                LoadList();
                            }
                        });
                    }
                    else {
                        HDialog.Info(_Data.split('|')[1]);
                    }
                });
        }
    }
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

    //选择客户
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
        HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', true, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
        });
    }


    function SelTypeName() {
        var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
        HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=&IsCheck=1&IsEdit=true&IncidentPlace=&IsBigClass=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
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
        HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=&IsCheck=1&IsEdit=true&IncidentPlace=&IsBigClass=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
            //HDialog.Open('650', '500', '../DialogNew/NewCorpIncidentTypeBigDlg2.aspx?ClassID=1&IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
            //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsSearch=1', '选择报事类别', false, function callback(_Data) {
            var arrRet = JSON.parse(_Data);

            $("#TypeID").val(arrRet.id);
            $("#TypeName").searchbox("setValue", arrRet.TypeName);


        });

    }

    var column = [[
        { field: 'IncidentContent', title: '报事内容', width: 200, align: 'left', sortable: true },
        { field: 'BigTypeName', title: '报事类别', width: 120, align: 'left', sortable: true },
        { field: 'IncidentSource', title: '报事来源', width: 80, align: 'left', sortable: true },
        { field: 'IncidentPlace', title: '报事位置', width: 80, align: 'left', sortable: true },
        { field: 'RegionalPlace', title: '公区名称', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 120, align: 'left', sortable: true },
        { field: 'CustName', title: '客户名称', width: 110, align: 'left', sortable: true },
        { field: 'IncidentMan', title: '报事人', width: 110, align: 'left', sortable: true },
        { field: 'Phone', title: '报事电话', width: 120, align: 'left', sortable: true },
        { field: 'ReserveDate', title: '预约处理时间', width: 150, align: 'left', sortable: true },
        { field: 'IsBeoverdue', title: '是否逾期', width: 60, align: 'left', sortable: true },
        { field: 'IsBeoverdueHour', title: '逾期时间', width: 150, align: 'left', sortable: true },
        {
            field: 'CloseGoBackTime', title: '是否被退回', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = '';
                if (value == null || value == '') {
                    str = "否";
                }
                else {
                    str = "是";
                }
                return str;
            }
        }

    ]];

    function LoadList(rowindex) {
        var InfoSource = $("#InfoSource").find("option:selected").text();
        $("#hiInfoSource").val(InfoSource);

        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            checkOnSelect: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: false,
            frozenColumns: frozenColumns,
            rownumbers: true,
            pagination: true,
            border: false,
            sortName: "IncidentID",
            remoteSort: false,
            width: "100%",
            sortOrder: "desc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentWrittenSearch", "TableContainer", param);
            },
            onLoadSuccess: function (data) {
                if (rowindex != undefined && rowindex != "") {
                    $('#TableContainer').datagrid('selectRow', rowindex);
                }
            }
        });
        $("#SearchDlg").dialog("close");
    }

    function FilterMore() {
        $('#SearchDlg').parent().appendTo($("form:first"))
        $('#SearchDlg').dialog('open');
    }

    function LoadListMore() {
        $("#IsMore").val(1);
        LoadList();
    }

    //选择报事类别更多查询
    function SelTypeNameMore() {
        HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', true, function callback(_Data) {
            var arrRet = JSON.parse(_Data);
            $("#TypeIDMore").val(arrRet.id);
            $("#TypeNameMore").searchbox("setValue", arrRet.text);
        });
    }


    $(document).ready(function () {
        $("#IncidentPlace").css('color', '#8a8a8a');
        $("#IncidentSource").css('color', '#8a8a8a');
        $("#Achieve").css('color', '#8a8a8a');

    });
    //$('#RoomSignId').dblclick(function (e) {
    //    var conent = "../DialogNew/RoomDlg.aspx";
    //    HDialog.Open('1000', '600', conent, '房屋选择', false, function callback(_Data) {
    //        var data = JSON.parse(_Data);
    //        $('#RoomSignId').val(data.RoomSign);
    //    });
    //});
    function dbRoomSign() {
        var conent = "../DialogNew/RoomDlg.aspx";
        HDialog.Open('1000', '600', conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSignId').val(data.RoomSign);
            LoadList();
        });
    }
    function dbDealManName() {
        var CommID = $("#hiCommID").val();
        HDialog.Open('760', '450', '../DialogNew/SelJHUser.aspx?CommID=' + CommID + '&IsCheck=1', '选择人员', true, function callback(_Data) {
            if (_Data != "") {//**获得返回的参数信息
                var varUserName = "";
                var varUserCode = "";
                if (_Data.indexOf(']') < 1) {
                    _Data = "[" + _Data + "]";
                }
                $.each(JSON.parse(_Data), function (i, obj) {
                    varUserName += "," + obj.UserName;
                    varUserCode += "," + obj.UserCode;
                });
                if (varUserName != "") {
                    $("#DealManName").val(varUserName.substring(1, varUserName.lengh));
                    $('#DealManCode').val(varUserCode.substring(1, varUserCode.length));
                }
                LoadList();
            }
        });
    }
    function DrAChange() {
        if ($("#Achieve").val() == "") {
            $("#Achieve").css('color', '#8a8a8a');
        }
        else {
            $("#Achieve").css('color', '#000000');
        }
        LoadList();
    }
    function IncidentSourceChange() {
        if ($("#IncidentSource").val() == "") {
            $("#IncidentSource").css('color', '#8a8a8a');
        } else {
            $("#IncidentSource").css('color', '#000000');
        }
        LoadList();
    }
    function IncidentPlaceChange() {
        if ($("#IncidentPlace").val() == "") {
            $("#IncidentPlace").css('color', '#8a8a8a');
        } else {
            $("#IncidentPlace").css('color', '#000000');
        }
        LoadList();
    }
    function InitTableHeight() {
        var h = $(window).height();
        var h1 = $('#divtt').height();
        h = h - h1;
        $("#TableContainer").css("height", h + "px");
        $("#giveup").hide();

        //判断是否有废弃权限
        CheckAuthority('1024', function callback(_Data) {
            if (_Data == "true") {
                $("#giveup").show();
            }
            else {
                $("#giveup").hide();
            }
        });
        var ts = getQueryStr("ts");
        if (ts == "1") {
            $("#IsTousu").val("1");
            $("#IsMore").val(1);
        }
        LoadList();
    }

    $(function () {
        InitTableHeight();
        //五分钟刷新
        setInterval(function () {
            LoadList();
        }, 180000);

        ////判断是否有废弃权限
        //CheckAuthority('1024', function callback(_Data) {
        //    if (_Data == "true") {
        //        $("#giveup").show();
        //    }
        //    else {
        //        $("#giveup").hide();
        //    }
        //});

    })
    function getQueryStr(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) { return pair[1]; }
        }
        return (false);
    }
</script>
