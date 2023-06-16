<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentSeach.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentSeach" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css">
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style>
        .datagrid-mask-msg {
            height: 40px;
        }

        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 230px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        #CostNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 99%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;" scroll="no">
    <form id="frmForm" runat="server">

        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server" />
        <input id="hiRegionSNum" name="hiRegionSNum" type="hidden" runat="server" />
        <input id="hiIncidentDealStateName" name="hiIncidentDealStateName" type="hidden" runat="server" />
        <input id="hiBuildSNum" name="hiBuildSNum" type="hidden" runat="server" />
        <input id="hiOverdueReason" name="hiOverdueReason" type="hidden" runat="server" />
        <input id="hiServiceQuality" name="hiServiceQuality" type="hidden" runat="server" />
        <input id="isBigCorpTypeID" name="isBigCorpTypeID" value="0" type="hidden" runat="server" />

        <input id="hiIncidentType" name="hiIncidentType" type="hidden" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 500px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr id="IsShow">
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent" colspan="7">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">查询范围</td>
                    <td class="TdContent">
                        <select id="IsDelete" name="IsDelete" style="width: 140px;" data-options="editable:false, panelHeight:'auto'" runat="server">
                            <option value=""></option>
                            <option value="全部">全部</option>
                            <option value="0" selected="selected">有效</option>
                            <option value="1">废弃</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事编号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentNum" name="IncidentNum" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">派工单号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="CoordinateNum" name="CoordinateNum" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="DrClass" name="DrClass" runat="server" style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事方式</td>
                    <td class="TdContent">
                        <select id="InfoSource" name="InfoSource" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" runat="server">
                        </select>
                    </td>
                    <td class="TdTitle">报事来源</td>
                    <td class="TdContent">
                        <select id="IncidentSource" name="IncidentSource" style="width: 140px;" runat="server">
                            <option value=''></option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">管家</td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContent">
                        <%--      <input type="text" id="Text3" name="CoordinateNum"  runat="server" />--%>
                        <select id="BuildSNum" runat="server" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" name="BuildSNum">
                        </select>

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
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">公区名称</td>
                    <td class="TdContent">
                        <input type="text" id="RegionalPlace" name="RegionalPlace" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">公区方位</td>
                    <td class="TdContent">
                        <input type="text" id="LocalePositionName" name="LocalePositionName" style="width: 137px;" runat="server" />

                        <%-- <input type="text" class="easyui-searchbox" data-options="prompt:'',multiple:true" id="LocalePositionName" name="LocalePositionName"
                            style="width: 140px;" searcher="SelLocalePosition" runat="server" />
                        <input id="LocalePositionCode" type="hidden" name="LocalePositionCode" />--%>
                    </td>
                    <td class="TdTitle">公区功能</td>
                    <td class="TdContent">
                        <input type="text" id="LocaleFunctionName" name="LocaleFunctionName" style="width: 137px;" runat="server" />

                        <%--   <input type="text" class="easyui-searchbox" data-options="prompt:'',multiple:true" id="LocaleFunctionName" name="LocaleFunctionName"
                            style="width: 140px;" searcher="SelLocaleFunction" runat="server" />
                        <input id="LocaleFunctionCode" type="hidden" name="LocaleFunctionCode" />--%>
                    </td>


                </tr>
                <tr>
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
                        <input type="text" class="easyui-searchbox"
                            data-options=" multiple: true " id="BigTypeName" name="BigTypeName"
                            style="width: 140px;" searcher="SelTypeName" runat="server" />
                        <input id="TypeID" type="hidden" name="TypeID" />
                    </td>
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
                        <select id="DueAmount" name="DueAmount" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">是否设备</td>
                    <td class="TdContent">
                        <select id="EqId" name="EqId" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">设备空间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="MacRoName" name="MacRoName" onclick="SelSpace();" runat="server" />
                        <%-- <input type="text" class="easyui-combobox"
                            data-options=" multiple: true "  id="MacRoName"  name="MacRoName" style="width: 140px;" searcher="SelSpace" runat="server" />--%>
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                    </td>

                    <td class="TdTitle">工单状态</td>
                    <td class="TdContent">
                        <select id="IncidentDealStateName" name="IncidentDealStateName" class="easyui-combobox"
                            data-options="multiple: true" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="未分派">未分派</option>
                            <option value="处理中">处理中</option>
                            <option value="已完成">已完成</option>
                            <option value="已关闭">已关闭</option>
                            <option value="已回访">已回访</option>
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

                </tr>
                <tr>

                    <td class="TdTitle">逾期原因</td>
                    <td class="TdContent">
                        <select id="OverdueReason" runat="server" class="easyui-combobox"
                            data-options="multiple: true" style="width: 140px;">
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
                    <td class="TdTitle">关闭类型</td>
                    <td class="TdContent">
                        <select id="CloseType" name="CloseType" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="0">正常关闭</option>
                            <option value="1">非正常关闭</option>
                        </select>
                    </td>
                    <td class="TdTitle">回访状态</td>
                    <td class="TdContent">
                        <select id="IsReply" name="IsReply" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="0">未回访</option>
                            <option value="1">已回访</option>
                        </select>
                    </td>

                </tr>
                <tr>

                    <td class="TdTitle">回访结果</td>
                    <td class="TdContent">
                        <select id="ReplyResult" name="ReplyResult" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="1">成功</option>
                            <option value="0">不成功</option>
                        </select>
                    </td>
                    <td class="TdTitle">回访评价</td>
                    <td class="TdContent">
                        <select id="ServiceQuality" name="ServiceQuality" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="非常满意">非常满意</option>
                            <option value="满意">满意</option>
                            <option value="一般">一般</option>
                            <option value="不满意">不满意</option>
                            <option value="非常不满意">非常不满意</option>
                            <option value="无效评价">无效评价</option>
                        </select>
                    </td>
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

                </tr>
                <tr>
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

                </tr>
                <tr>
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

                </tr>
                <tr>
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

                </tr>
                <tr>
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
                    <td class="TdTitle">受理人</td>
                    <td class="TdContent">
                        <input type="text" id="AdmiMan" name="AdmiMan" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">分派人</td>
                    <td class="TdContent">
                        <input type="text" id="DispMan" name="DispMan" style="width: 137px;" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContent">
                        <input type="text" id="DealMan" name="DealMan" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">关闭人</td>
                    <td class="TdContent">
                        <input type="text" id="CloseUser" name="CloseUser" style="width: 137px;" runat="server" />
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
                    <td class="TdTitle">业务类型</td>
                    <td class="TdContent">
                        <select id="TaskCategory" name="TaskCategory" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="品质">品质管理</option>
                            <option value="巡查">巡查管理</option>
                            <option value="设备">设备管理</option>
                            <option value="安全">安全管理</option>
                            <option value="环境">环境管理</option>
                            <option value="验房">验房管理</option>
                            <option value="拜访">拜访管理</option>
                        </select>
                    </td>
                </tr>
                   <tr>

                    <td class="TdTitle">是否跟进</td>
                    <td class="TdContent">
                        <select id="IsFollowUp" name="IsFollowUp" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事方式</td>
                   <td class="TdContent">
                        <select id="DispDealWay" name="DispDealWay" style="width: 140px;" runat="server">
                            <option value="" selected>全部</option>
                            <option value="员工APP抢单">员工APP抢单</option>
                            <option value="员工APP派单">员工APP派单</option>
                            <option value="ERP派单">ERP派单</option>
                            <option value="口头派工">口头派工</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent">
                    </td>
                    <td class="TdTitle"><td>
                    <td class="TdContent">
                    </td>

                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 10px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <input type="hidden" name="TaskEqId" id="TaskEqId" value="" runat="server" />
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
        <input type="hidden" id="BigCorpTypeID" name="BigCorpTypeID" runat="server" />

        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input type="hidden" id="HiIFCode" name="HiIFCode"  />
        <input type="hidden" id="HiIFName" name="HiIFName"  />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function SelCommInfo() {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    //alert(arrRet.id);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }


            function SelBuild() {
                var varReturn;
                HDialog.Open('700', '400', "../dialogNew/NewMultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var DData = JSON.parse(_Data);
                        var BuildNames = "";
                        var BuildSNum = "";
                        if (DData.length > 0) {
                            for (var i = 0; i < DData.length; i++) {
                                if (parseInt(DData[i].attributes.BuildSNum) != 0) {
                                    BuildSNum = BuildSNum + "," + DData[i].attributes.BuildSNum;
                                    BuildNames = BuildNames + "," + DData[i].text;
                                }
                            }
                        }
                        if (BuildSNum != "") {
                            $('#BuildSNum').val(BuildSNum.substring(1, BuildSNum.length));
                            $('#BuildNames').val(BuildNames.substring(1, BuildNames.length));
                        }
                        else {
                            HDialog.Info("所选楼宇单元无报事!");
                        }
                    }
                });
            }
            function SelTypeName() {
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                //var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/CorpIncidentTypeDlg.aspx";
                HDialog.Open('650', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=0&Duty=&IsCheck=1&IsEdit=true&IsAll=True&IsBigClass=0', '选择报事类别', false, function callback(_Data) {
                    //HDialog.Open('650', '500', '../DialogNew/NewCorpIncidentTypeBigDlg2.aspx?ClassID=' + $('#DrClass').val() + '&Duty=' + $('#Duty').val() +'&IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    // HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    //alert(arrRet.id);
                    //alert(arrRet.code);
                    $("#TypeID").val(arrRet.id);
                    $("#BigCorpTypeID").val(arrRet.id);
                    $("#BigTypeName").searchbox("setValue", arrRet.text);

                });

            }

            //设备空间名称
            function SelSpace() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../DialogNew/RankSpace.aspx?CommId=' + CommID, '选择设备机房', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        var strO = $("#SpaceId").val();
                        var strL = $("#MacRoName").val();
                        $("#SpaceId").val(strO + ',' + varObjects.SpaceId);
                        $("#MacRoName").val(strL + "," + varObjects.MacRoName);
                    }
                });
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
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', true, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#TypeName").val("");
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        location.href = "../IncidentNewJH/IncidentSeachCreateExcel.aspx?showCode=" + $("#HiIFCode").val();
                    }
                }, '-',
                {
                    text: '显示设置',
                    iconCls: 'icon-filter',
                    handler: function () {
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
                                //var showCode = "IncidentNum,RoomSign,RegionalPlace,IncidentContent,DealSituation,";
                                //var showName = "报事编号,房屋编号,公区名称,报事内容,处理情况,";
                                var showCode = "IncidentNum,RoomSign,RegionalPlace,IncidentContent,DealSituation,";
                                var showName = "报事编号,房屋编号,公区名称,报事内容,处理情况,";
                                var arrRet = JSON.parse(_Data);
                                $("#hiColumn").val(arrRet.HideColumn);
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
                }
            ];
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

                var opType = $("#hiIncidentType").val();
                //alert(opType);
                if (opType == "XM") {
                    $("#IsShow").hide();
                }
                else {
                    $("#IsShow").show();
                }

            }
            InitTableHeight();
            var frozenColumns = [[
                {
                    field: 'IncidentNum', title: '报事编号', width: 170, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail(" + index + ");\">" + row.IncidentNum + "</a>";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                { field: 'RegionalPlace', title: '公区名称', width: 100, align: 'left', sortable: true },
               
                { field: 'IncidentContent', title: '报事内容', width: 200, align: 'left', sortable: true },
                { field: 'DealSituation', title: '处理情况', width: 150, align: 'left', sortable: true },
            ]]

            var column = [[
             { field: 'OrganName', title: '区域名称', width: 120, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true },
                {
                    field: 'IncidentDealStateName', title: '工单状态', width: 60, align: 'left', sortable: true
                },
                { field: 'CoordinateNum', title: '派工单号', width: 120, align: 'left', sortable: true },


                {
                    field: 'DrClass', title: '报事类型', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.DrClass == '1') {
                            str = "书面报事";
                        } else if (row.DrClass == '2') {
                            str = "口派报事";
                        }
                        return str;
                    }

                },
                { field: 'Duty', title: '报事责任', width: 80, align: 'left', sortable: true },
                {
                    field: 'BigTypeName', title: '报事类别', width: 100, align: 'left', sortable: true
                },
                { field: 'FineTypeName', title: '原因细类', width: 120, align: 'left', sortable: true },
                { field: 'DealLimit', title: '处理时限(小时)', width: 80, align: 'left', sortable: true },
                { field: 'IncidentMode', title: '报事方式', width: 80, align: 'left', sortable: true },
                { field: 'IncidentSource', title: '报事来源', width: 80, align: 'left', sortable: true },
                { field: 'IncidentPlace', title: '报事位置', width: 80, align: 'left', sortable: true },
                { field: 'LocalePositionName', title: '公区方位', width: 100, align: 'left', sortable: true },
                { field: 'LocaleFunctionName', title: '公区功能', width: 100, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 220, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'IncidentMan', title: '报事人', width: 200, align: 'left', sortable: true },
                { field: 'Phone', title: '报事电话', width: 100, align: 'left', sortable: true },
                { field: 'DealMan', title: '责任人', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '管家', width: 100, align: 'left', sortable: true },
                { field: 'AdmiMan', title: '受理人', width: 200, align: 'left', sortable: true },
                { field: 'IncidentDate', title: '受理时间', width: 200, align: 'left', sortable: true },
                { field: 'ReserveDate', title: '预约处理时间', width: 200, align: 'left', sortable: true },
                { field: 'DispDate', title: '分派时间', width: 150, align: 'left', sortable: true },
                { field: 'DispMan', title: '分派人', width: 150, align: 'left', sortable: true },
                { field: 'ReceivingDate', title: '接单时间', width: 150, align: 'left', sortable: true },
                { field: 'ArriveData', title: '到场时间', width: 150, align: 'left', sortable: true },
                { field: 'MainEndDate', title: '完成时间', width: 150, align: 'left', sortable: true },
                { field: 'FinishUser', title: '完成人', width: 150, align: 'left', sortable: true },

                { field: 'RatedWorkHour', title: '额定工时', width: 100, align: 'left', sortable: true },
                { field: 'KPIRatio', title: '绩效系数', width: 100, align: 'left', sortable: true },
                { field: 'RatedWorkHourNumber', title: '完成数量', width: 100, align: 'left', sortable: true },
                {
                    field: 'IsTouSu', title: '是否投诉', width: 88, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = '';
                        if (value == '1') {
                            str = "是";
                        }
                        else {
                            str = "否";
                        }
                        return str;
                    }
                },
                { field: 'DueAmount', title: '收费金额', width: 100, align: 'left', sortable: true },
                { field: 'EquipmentName', title: '设备名称', width: 100, align: 'left', sortable: true },
                { field: 'CloseTime', title: '关闭时间', width: 100, align: 'left', sortable: true },
                { field: 'CloseUser', title: '关闭人', width: 100, align: 'left', sortable: true },
                { field: 'CloseSituation', title: '关闭情况', width: 200, align: 'left', sortable: true },
                {
                    field: 'CloseType', title: '关闭类型', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value == '0') {
                            str = "正常关闭";
                        }
                        if (value == '1') {
                            str = "非正常关闭";
                        }
                        return str;
                    }
                },
                { field: 'NoNormalCloseReasons', title: '非正常关闭原因', width: 100, align: 'left', sortable: true },
                {
                    field: 'IsBeoverdue', title: '是否逾期', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'IsBeoverdueHour', title: '处理逾期小时', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value != 0 && value != '') {
                            str = value;
                        }
                        return str;
                    }
                },
                { field: 'OverdueReason', title: '逾期原因', width: 80, align: 'left', sortable: true },
                { field: 'reminderCount', title: '催办', width: 100, align: 'left', sortable: true },
                { field: 'ReplyContent', title: '回访情况', width: 100, align: 'left', sortable: true },
                {
                    field: 'ReplyResult', title: '回访结果', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value == '1') {
                            str = "成功回访";
                        }
                        if (value == '0') {
                            str = "不成功回访";
                        }
                        return str;
                    }
                },
                { field: 'ServiceQuality', title: '回访评价', width: 100, align: 'left', sortable: true },
                { field: 'ReplyDate', title: '回访时间', width: 100, align: 'left', sortable: true },
                { field: 'ReplyMan', title: '回访人', width: 100, align: 'left', sortable: true },
                { field: 'IsTransmit', title: '是否转发', width: 100, align: 'left', sortable: true },
                {
                    field: 'CloseGoBackTime', title: '取消完成', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value == '' || value == null) {
                            str = "否";
                        }
                        else {
                            str = "是";
                        }
                        return str;
                    }
                },
                {
                    field: 'ReplyGoBackTime', title: '取消关闭', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value == '' || value == null) {
                            str = "否";
                        }
                        else {
                            str = "是";
                        }
                        return str;
                    }
                },
                { field: 'DeleteDate', title: '废弃时间', width: 100, align: 'left', sortable: true },
                { field: 'DeleteMan', title: '废弃人', width: 100, align: 'left', sortable: true },
                { field: 'DeleteReasons', title: '废弃原因', width: 100, align: 'left', sortable: true }

            ]];
            function LoadList() {
                var InfoSource = $("#InfoSource").combobox('getText');
                $('#hiInfoSource').val(InfoSource);

                var RegionSNum = $("#RegionSNum").combobox('getText');
                $("#hiRegionSNum").val(RegionSNum);

                var BuildSNum = $("#BuildSNum").combobox('getText');
                $("#hiBuildSNum").val(BuildSNum);
                //alert($("#hiBuildSNum").val());

                var IncidentDealStateName = $("#IncidentDealStateName").combobox('getText');
                $("#hiIncidentDealStateName").val(IncidentDealStateName);

                var OverdueReason = $("#OverdueReason").combobox('getText');
                $("#hiOverdueReason").val(OverdueReason);

                var ServiceQuality = $("#ServiceQuality").combobox('getText');
                $("#hiServiceQuality").val(ServiceQuality);

                if ($("#IncidentDate1").val() == '')
                    $("#IncidentDate1").val("2001-01-01 00:00:00");
                if ($("#IncidentDate2").val() == '')
                    $("#IncidentDate2").val("2020-01-01 00:00:00");
                if ($("#ReserveDate1").val() == '')
                    $("#ReserveDate1").val("2001-01-01 00:00:00");
                if ($("#ReserveDate2").val() == '')
                    $("#ReserveDate2").val("2020-01-01 00:00:00");


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    remoteSort: false,
                    rownumbers: true,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    border: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog("close");
            }
            $.parser.parse('#SearchDlg');
            LoadList();
            function Detail(rowIndex) {
                var w = $(window).width();
                var h = $(window).height();
                //$('.easyui-dialog').parent().appendTo($("form:first"));
                var rows = $('#TableContainer').datagrid('getRows');
                var row = rows[rowIndex];
                Cache.SetData("IncidentInfos", JSON.stringify(row));
                var content = '../IncidentNewJH/IncidentControlManage.aspx?IncidentID=' + row.IncidentID;
                HDialog.Open(w, h, content, '报事查询详细记录', true, function callback(_Data) {
                    Cache.SetData("IncidentInfos", '');
                });
            }

            //setTimeout(function () {
            //    LoadList();
            //}, 3000);


            /* ****公区选择----begin*****/
            function SelRegionalPlace() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../IncidentNewJH/Dialog/IncidentRegionalDlg.aspx?CommId=' + CommID, '选择公区', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        var RegionalID = varObjects.RegionalID;
                        var RegionalPlace = varObjects.RegionalPlace;
                        $("#RegionalPlace").val(RegionalID);
                        $("#RegionalPlaceName").searchbox("setValue", RegionalPlace);
                    }
                });
            }

            function SelLocalePosition() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../IncidentNewJH/Dialog/IncidentPublicLocaleDlg.aspx?LocaleType=公区方位&CommId=' + CommID, '选择公区方位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        var IID = varObjects.IID;
                        var DictionaryName = varObjects.DictionaryName;
                        $("#LocalePositionCode").val(IID);
                        $("#LocalePositionName").searchbox("setValue", DictionaryName);
                    }
                });
            }


            function SelLocaleFunction() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../IncidentNewJH/Dialog/IncidentPublicLocaleDlg.aspx?LocaleType=公区功能&CommId=' + CommID, '选择公区功能', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        var IID = varObjects.IID;
                        var DictionaryName = varObjects.DictionaryName;
                        $("#LocaleFunctionCode").val(IID);
                        $("#LocaleFunctionName").searchbox("setValue", DictionaryName);
                    }
                });
            }
              /* ****公区选择----end*****/
        </script>
    </form>
</body>
</html>
