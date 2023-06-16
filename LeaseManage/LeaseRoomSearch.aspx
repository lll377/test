<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseRoomSearch.aspx.cs" Inherits="M_Main.LeaseManage.LeaseRoomSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房屋租赁查询</title>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/echarts-3.7.2/echarts.min.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        body, html, form {
            padding: 0px;
            margin: 0px;
            overflow: hidden;
        }

        .SearchTable {
            width: 1000px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            line-height: 20px;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 95%;
            height: 40px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 10%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .tabs-container .tabs-left .panel-body {
            margin-left: 0px;
        }

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }

        .toolbartable {
            margin: 0;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }
    </style>
</head>
<body>
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <div class="tabs-container">
        <ul class="nav nav-tabs" id="MainNavTabs">
            <li class="active" id="ContractSearch" name="ContractSearch" refpage="ContractSearch" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">租赁合同查询</a>
            </li>
            <li id="RoomSearch" name="RoomSearch" refpage="RoomSearch" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="true">租赁房屋查询</a>
            </li>
            <li id="Dynamic" name="Dynamic" refpage="Dynamic" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="true">租赁动态查询</a>
            </li>
            <li id="FeesSearch" name="FeesSearch" refpage="FeesSearch" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="true">合同费用查询</a>
            </li>
        </ul>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <div class="Content">
                        <div id="dlg_search_Contract" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
                            <form id="frmFromContract">
                                <table class="SearchTable">
                                    <tr>
                                        <td class="TdTitle">管理项目</td>
                                        <td class="TdContentSearch" colspan="5">
                                            <textarea id="ContractCommName" name="ContractCommName" runat="server" class="easyui-validatebox" onclick="SelContractComm();" readonly="readonly"></textarea>
                                            <input type="hidden" id="ContractCommID" name="ContractCommID" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">租户名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="TenantryCustName" name="TenantryCustName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseRoomSigns" name="LeaseRoomSigns" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">合同编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractSign" name="ContractSign" class="easyui-validatebox" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractName" name="ContractName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">合同开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractBeginTimeBegin" name="ContractBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractBeginTimeEnd" name="ContractBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractEndTimeBegin" name="ContractEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractEndTimeEnd" name="ContractEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">机构部门/负责人</td>
                                        <td class="TdContentSearch">
                                            <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-searchbox" searcher="SelDutyDepNameAndUserName" data-options="editable:false" />
                                            <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                                            <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">签约时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractSignTimeBegin" name="ContractSignTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractSignTimeEnd" name="ContractSignTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">变更状态</td>
                                        <td class="TdContentSearch">
                                            <select id="ContractChangeType" name="ContractChangeType" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                                                <option value=""></option>
                                                <option value="变更">变更</option>
                                                <option value="退租">退租</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">发起时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="WorkStartDateBegin" name="WorkStartDateBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="WorkStartDateEnd" name="WorkStartDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">审批状态</td>
                                        <td class="TdContentSearch">
                                            <select id="AuditStatus" name="AuditStatus" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                                                <option value=""></option>
                                                <option value="未启动">未启动</option>
                                                <option value="审核中">审核中</option>
                                                <option value="已驳回">已驳回</option>
                                                <option value="审批不通过">审批不通过</option>
                                                <option value="已审核">已审核</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">是否退租</td>
                                        <td class="TdContentSearch">
                                            <select id="IsRentOut" name="IsRentOut" class="easyui-combobox" style="width: 60px;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                                                <option value=""></option>
                                                <option value="否" selected>否</option>
                                                <option value="是">是</option>
                                            </select>
                                        </td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="6">
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadContractDataGrid();">确定筛选</a>
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div style="width: 100%; background-color: #cccccc;" id="TableContainerContract"></div>
                    </div>
                </div>
            </div>
            <div id="tab-2" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <div class="Content">
                        <div id="dlg_search_Room" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
                            <form id="frmFromRoom">
                                <table class="SearchTable">
                                    <tr>
                                        <td class="TdTitle">管理项目</td>
                                        <td class="TdContentSearch" colspan="7">
                                            <textarea id="RoomCommName" name="RoomCommName" runat="server" class="easyui-validatebox" style="width: 100%" onclick="SelRoomComm();" readonly="readonly"></textarea>
                                            <input type="hidden" id="RoomCommID" name="RoomCommID" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">租户名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="TenantryCustName0" name="TenantryCustName0" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomSign0" name="RoomSign0" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomName0" name="RoomName0" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">合同编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractSign0" name="ContractSign0" class="easyui-validatebox" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">租赁开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseBeginTimeBegin0" name="LeaseBeginTimeBegin0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseBeginTimeEnd0" name="LeaseBeginTimeEnd0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">租赁结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseEndTimeBegin0" name="LeaseEndTimeBegin0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseEndTimeEnd0" name="LeaseEndTimeEnd0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">优惠免租结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentFreeEndTimeBegin0" name="RentFreeEndTimeBegin0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentFreeEndTimeEnd0" name="RentFreeEndTimeEnd0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">顺延起租开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="PostPoneBeginTimeBegin0" name="PostPoneBeginTimeBegin0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="PostPoneBeginTimeEnd0" name="PostPoneBeginTimeEnd0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">入住时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInTimeBegin0" name="CheckInTimeBegin0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInTimeEnd0" name="CheckInTimeEnd0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">退租时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutTimeBegin0" name="RentOutTimeBegin0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutTimeEnd0" name="RentOutTimeEnd0" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">入住办理人</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInUserName0" name="CheckInUserName0" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">退租办理人</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutUserName0" name="RentOutUserName0" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">是否入住</td>
                                        <td class="TdContentSearch">
                                            <select id="IsCheckIn" name="IsCheckIn" class="easyui-combobox" style="width: 60px;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                                                <option value=""></option>
                                                <option value="否">否</option>
                                                <option value="是" selected>是</option>
                                            </select>
                                        </td>
                                        <td class="TdTitle">是否退租</td>
                                        <td class="TdContentSearch">
                                            <select id="IsRentOut0" name="IsRentOut0" class="easyui-combobox" style="width: 60px;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                                                <option value=""></option>
                                                <option value="否" selected>否</option>
                                                <option value="是">是</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="8">
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadRoomDataGrid();">确定筛选</a>
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearRoomWhere();">清空</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div style="width: 100%; background-color: #cccccc;" id="TableContainerRoom"></div>
                    </div>
                </div>
            </div>
            <div id="tab-3" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <div class="row Content" style="overflow: hidden;">
                        <div class="col-md-3" style="height: 100%;" id="gaugeDiv"></div>
                        <div class="col-md-9">
                            <div class="row PieToolbar" style="height: 40px; padding-top: 15px;">
                                <table style="width: auto;">
                                    <tr>
                                        <td style="width: 120px; text-align: right;">统计年度&nbsp;&nbsp;&nbsp;</td>
                                        <td class="TdContentSearch">
                                            <input id="StaticYear" name="StaticYear" type="text" onclick="WdatePicker({ dateFmt: 'yyyy', skin: 'default' })" format="date" />
                                        </td>
                                        <td style="text-align: right;">统计维度截止日&nbsp;&nbsp;&nbsp;</td>
                                        <td>
                                            <select id="StaticDay" name="StaticDay" style="width: 60px;" class="easyui-combobox" data-options="editable:false,panelHeight:'130'">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="21">21</option>
                                                <option value="22">22</option>
                                                <option value="23">23</option>
                                                <option value="24">24</option>
                                                <option value="25">25</option>
                                                <option value="26">26</option>
                                                <option value="27">27</option>
                                                <option value="28">28</option>
                                                <option value="29">29</option>
                                                <option value="30">30</option>
                                                <option value="31">31</option>
                                            </select>
                                        </td>
                                        <td style="text-align: left;">&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="StaticSearch();">统计</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="row">
                                <div id="LineDiv" style="height: 100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tab-4" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <div class="Content">
                        <div id="dlg_search_Fees" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
                            <form id="frmFromFees">
                                <table class="SearchTable">
                                    <tr>
                                        <td class="TdTitle">管理项目</td>
                                        <td class="TdContentSearch" colspan="7">
                                            <textarea id="FeesCommName" name="FeesCommName" runat="server" class="easyui-validatebox" style="width: 100%" onclick="SelFeesComm();" readonly="readonly"></textarea>
                                            <input type="hidden" id="FeesCommID" name="FeesCommID" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">租户名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CustName" name="CustName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomSign1" name="RoomSign1" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomName1" name="RoomName1" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">合同编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractSign1" name="ContractSign1" class="easyui-validatebox" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">应收时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="FeesDueDateBegin" name="FeesDueDateBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="FeesDueDateEnd" name="FeesDueDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">预警时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="WarningDays" name="WarningDays" class="easyui-numberbox" runat="server" data-options="min:1" />
                                        </td>
                                        <td class="TdTitle">是否欠费</td>
                                        <td class="TdContentSearch">
                                            <select id="IsDebts" name="IsDebts" class="easyui-combobox" style="width: 60px;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                                                <option value=""></option>
                                                <option value="否">否</option>
                                                <option value="是" selected>是</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="8">
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadFeesDataGrid();">确定筛选</a>
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearFeesWhere();">清空</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div style="width: 100%; background-color: #cccccc;" id="TableContainerFees"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //初始化页面控件高度
        function InitTableHeight() {
            var h = $(window).height();
            var NavTabsHeight = $('#MainNavTabs').height();
            $('.Content').css({ "height": h - NavTabsHeight + "px" });
            $('#LineDiv').css({ "height": h - NavTabsHeight - 40 + "px" });
        }


        /* 租赁合同查询 */
        var ColumnContract = [[
            { field: 'CommName', title: '管理项目', width: 190, align: 'left' },
            { field: 'TenantryCustName', title: '租户名称', width: 220, align: 'left' },
            {
                field: 'LeaseRoomSigns', title: '房屋编号', width: 200, align: 'left', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'FixedTel', title: '固定电话', width: 120, align: 'center' },
            { field: 'TenantryConnectTel', title: '移动电话', width: 120, align: 'center' },
            {
                field: 'ContractSign', title: '合同编号', width: 180, align: 'left', formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"LeaseContractView('" + row.ID + "','')\" href=\"javascript:void(0);\">" + value + "</a>";
                    return str;
                }
            },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'left' },
            {
                field: 'ContractBeginTime', title: '合同开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'ContractEndTime', title: '合同结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'ContractTotalPrice', title: '合同总额', width: 100, align: 'center' },
            { field: 'DutyDepName', title: '机构部门', width: 200, align: 'center' },
            { field: 'DutyUserName', title: '负责人', width: 100, align: 'center' },
            {
                field: 'ContractSignTime', title: '签约时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'WorkStartUserName', title: '发起人', width: 100, align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: 150, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: 80, align: 'center' },
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
        ]];
        var ToolBarContract = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_Contract').dialog('open');
                }
            }, '-',
            {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var rows = $("#TableContainerContract").datagrid("getRows");
                    if (rows.length == 0) {
                        HDialog.Info('没有需要导出的租赁合同数据!');
                        return;
                    }
                    window.open("LeaseRoomSearch_ContractExport.aspx?" + $('#frmFromContract').serialize());
                }
            }
        ];
        //选择项目
        function SelContractComm() {
            if ($('#HidCommID').val() == "") {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#ContractCommID").val(arrRet.id);
                    $("#ContractCommName").val(arrRet.name);
                });
            }
        }
        //清空
        function ClearWhere() {
            $('#frmFromContract').form('clear');
            $('#IsRentOut').combobox("setValue", '否');
            if ($('#HidCommID').val() != "") {
                $("#ContractCommID").val($('#HidCommID').val());
                $("#ContractCommName").val($('#HidCommName').val());
            }
        }
        //选择机构/负责人
        function SelDutyDepNameAndUserName() {
            HDialog.Open(600, 450, "../DialogNew/ContractUserDlg.aspx", '机构部门/负责人选择', false, function callback(_Data) {
                if (_Data != "") {
                    var data = JSON.parse(_Data);
                    $('#DutyUserCode').val(data.UserCode);
                    $('#DutyDepCode').val(data.DepCode);
                    $('#DutyDepNameAndUserName').searchbox("setValue", data.DepName + "-" + data.UserName);
                }
            });
        }
        //查看合同详情
        function LeaseContractView(ID) {
            var w = $(window).width() - 100;
            var h = $(window).height();
            HDialog.Open(w, h, '../LeaseManage/LeaseContractDetail.aspx?OpType=edit&ID=' + ID, "租赁合同详情", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }
        //租赁合同列表加载
        function LoadContractDataGrid() {
            $("#TableContainerContract").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: ColumnContract,
                pageSize: 50,
                pageList: [50, 100, 300],
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: ToolBarContract,
                rownumbers: true,
                border: false,
                height: '100%',
                rowStyler: function (index, row) {
                    if (row.IsRentOut == '否' && row.ContractRemindOfExpiration != "" && row.WarningDays <= 0) {
                        return "color:red";
                    }
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "GetLeaseContractSearchList";
                    var paramJson = $.getFromParam("frmFromContract");
                    for (var key in paramJson) {
                        param[key] = paramJson[key];
                    }
                },
                onLoadSuccess: function (data) {
                }
            });
            $('#dlg_search_Contract').dialog('close');
        }

        /* 租赁房屋查询 */
        var ColumnRoom = [[
            { field: 'CommName', title: '管理项目', width: 220, align: 'left' },
            { field: 'TenantryCustName', title: '租户名称', width: 220, align: 'left' },
            { field: 'FixedTel', title: '固定电话', width: 120, align: 'center' },
            { field: 'MobilePhone', title: '移动电话', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 180, align: 'left' },
            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: 180, align: 'left' },
            { field: 'BuildArea', title: '建筑面积', width: 100, align: 'left' },
            { field: 'RoomRentalArea', title: '计租面积', width: 100, align: 'left' },
            {
                field: 'LeaseBeginTime', title: '租赁开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'LeaseEndTime', title: '租赁结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'CheckInTime', title: '入住时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'CheckInUserName', title: '入住办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'RentOutTime', title: '退租时间', width: 150, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'RentOutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'RentOutReason', title: '退租原因', width: 100, align: 'center' }
        ]];
        var ToolBarRoom = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_Room').dialog('open');
                }
            }, '-',
            {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //单项目 
                    if ($("#RoomCommID").val() == "") {
                        HDialog.Info('请选择项目!');
                        return;
                    }
                    var rows = $("#TableContainerRoom").datagrid("getRows");
                    if (rows.length == 0) {
                        HDialog.Info('没有需要导出的租赁房屋数据!');
                        return;
                    }
                    var paramJson = $.getFromParam("frmFromRoom");
                    var RoomParam = "";
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('0', '');
                        RoomParam += key + "=" + Values + "&";
                    }
                    if (RoomParam.length > 0) {
                        RoomParam = RoomParam.substring(0, RoomParam.length - 1);
                    }
                    window.open("LeaseRoomSearch_RoomExport.aspx?" + RoomParam);
                }
            }
        ];
        function SelRoomComm() {
            if ($('#HidCommID').val() == "") {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=0', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#RoomCommID").val(arrRet.id);
                    $("#RoomCommName").val(arrRet.name);
                });
            }
        }
        function ClearRoomWhere() {
            $('#frmFromRoom').form('clear');
            if ($('#HidCommID').val() != "") {
                $("#RoomCommID").val($('#HidCommID').val());
                $("#RoomCommName").val($('#HidCommName').val());
            }
        }
        //租赁房屋列表加载
        function LoadRoomDataGrid() {
            $("#TableContainerRoom").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: ColumnRoom,
                pageSize: 50,
                pageList: [50, 100, 300],
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: ToolBarRoom,
                rownumbers: true,
                border: false,
                height: '100%',
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "GetLeaseRoomSearchList";
                    var paramJson = $.getFromParam("frmFromRoom");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('0', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search_Room').dialog('close');
        }

        /* 租赁动态加载 */
        //统计
        function StaticSearch() {
            //判断是否选择了年度
            if ($('#StaticYear').val() == "") {
                HDialog.Info("请选择统计年度");
                return;
            }
            var Parameterst = "StaticYear=" + $('#StaticYear').val() + "&StaticDay=" + $('#StaticDay').combobox("getValue");
            $.tool.DataPostJson('LeaseManage', 'GetLeaseDynamicData', Parameterst,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        var varObj = JSON.parse(data.data);
                        LoadDynamic(varObj);
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //加载图表
        function LoadDynamic(varObj) {
            var myChart1 = echarts.init(document.getElementById('gaugeDiv'));
            myChart1.clear();
            var option1 = {
                tooltip: {
                    formatter: "{b} : {c}%"
                },
                series: [
                    {
                        name: '当前出租率',
                        radius: "95%",
                        type: 'gauge',
                        detail: { formatter: '{value}%' },
                        data: [{ value: varObj.PieData, name: '当前出租率' }]
                    }
                ]
            };
            // 为echarts对象加载数据 
            myChart1.setOption(option1);

            var myChart2 = echarts.init(document.getElementById('LineDiv'));
            myChart2.clear();
            var option2 = {
                legend: {
                    right: 50,
                    data: varObj.LineLegend
                },
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: {
                    type: 'category',
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                },
                yAxis: {
                    type: 'value',
                    max: 100,
                    min: 0
                },
                series: varObj.LineData
            };

            // 为echarts对象加载数据 
            myChart2.setOption(option2);
        }

        /* 租赁费用查询 */
        var ToolBarFees = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_Fees').dialog('open');
                }
            }, '-',
            {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //单项目 
                    if ($("#FeesCommID").val() == "") {
                        HDialog.Info('请选择项目!');
                        return;
                    }
                    var rows = $("#TableContainerFees").datagrid("getRows");
                    if (rows.length == 0) {
                        HDialog.Info('没有需要导出的合同费用数据!');
                        return;
                    }
                    var paramJson = $.getFromParam("frmFromFees");
                    var FeesParam = "";
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('1', '');
                        FeesParam += key + "=" + Values + "&";
                    }
                    if (FeesParam.length > 0) {
                        FeesParam = FeesParam.substring(0, FeesParam.length - 1);
                    }
                    window.open("LeaseRoomSearch_FeesExport.aspx?" + FeesParam);
                }
            }
        ];
        var ColumnFees = [[
            { field: 'CommName', title: '管理项目', width: '220', align: 'left' },
            { field: 'ContractSign', title: '合同编号', width: '180', align: 'left' },
            { field: 'CustName', title: '客户名称', width: '200', align: 'left' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: '200', align: 'left' },
            { field: 'CostName', title: '费用项目', width: '140', align: 'left' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: '140', align: 'center' },
            {
                field: 'FeesDueDate', title: '应收日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesStateDate', title: '开始日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesEndDate', title: '结束日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DueAmount', title: '应收金额', width: '80', align: 'center' },
            { field: 'PaidAmount', title: '实收金额', width: '80', align: 'center' },
            { field: 'PrecAmount', title: '预交冲抵', width: '80', align: 'center' },
            { field: 'WaivAmount', title: '减免冲销', width: '80', align: 'center' },
            { field: 'DebtsAmount', title: '欠费金额', width: '80', align: 'center' }
        ]]
        function ClearFeesWhere() {
            $('#frmFromFees').form('clear');
            $('#IsDebts').combobox("setValue", '是');
            if ($('#HidCommID').val() != "") {
                $("#FeesCommID").val($('#HidCommID').val());
                $("#FeesCommName").val($('#HidCommName').val());
            }
        }
        function SelFeesComm() {
            if ($('#HidCommID').val() == "") {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=0', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#FeesCommID").val(arrRet.id);
                    $("#FeesCommName").val(arrRet.name);
                });
            }
        }

        function LoadFeesDataGrid() {
            $("#TableContainerFees").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: ColumnFees,
                pageSize: 50,
                pageList: [50, 100, 300],
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: ToolBarFees,
                rownumbers: true,
                border: false,
                height: '100%',
                rowStyler: function (index, row) {
                    if (row.WarningDays < 0 && row.DebtsAmount > 0) {
                        return "color:red";
                    }
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "GetLeaseFeesSearchList";
                    var paramJson = $.getFromParam("frmFromFees");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('1', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search_Fees').dialog("close");
        }

        $.getFromParam = function (fromName) {
            var key = "", val = "", paramJson = {};
            $("#" + fromName + " input,#" + fromName + " textarea,#" + fromName + " select").each(function (i, item) {
                if (typeof ($(this).attr("id")) != "undefined") {
                    key = $(this).attr("id");
                    if (typeof key !== typeof undefined && key !== false && key != "__EVENTTARGET" && key != "__EVENTARGUMENT" && key != "__VIEWSTATE" && key != "__VIEWSTATEGENERATOR" && key != "__EVENTVALIDATION" && key.indexOf('_easyui') == -1) {
                        if ($(this).hasClass("easyui-datebox")) {
                            val = $(this).datebox("getValue");
                        } else if ($(this).hasClass("easyui-datetimebox")) {
                            val = $(this).datetimebox("getValue");
                        } else if ($(this).hasClass("easyui-textbox")) {
                            val = $(this).textbox("getValue");
                        } else if ($(this).hasClass("easyui-numberbox")) {
                            val = $(this).numberbox("getValue");
                        } else if ($(this).hasClass("easyui-combotree")) {
                            val = $(this).combotree("getValue");
                        } else if ($(this).hasClass("easyui-combobox")) {
                            var options = $(this).combobox("options");
                            if (options.multiple) {
                                val = $(this).combobox("getValues").toString();
                            } else {
                                val = $(this).combobox("getValue");
                            }
                        } else if ($(this).hasClass("easyui-searchbox")) {
                            val = $(this).searchbox("getValue");
                        } else {
                            if ($(this).attr("type") == "checkbox") {
                                val = $(this).is(":checked").toString();
                            } else {
                                val = $(this).val();
                            }
                        }
                        if ($(this).attr("type") != "button") {
                            paramJson[key] = val;
                        }
                    }
                }
                if ($(this).attr("type") == "radio" && typeof ($(this).attr("name")) != "undefined") {
                    key = $(this).attr("name");
                    if (!paramJson.hasOwnProperty(key)) {
                        val = $("input[name='" + key + "']:checked").val();
                        paramJson[key] = val;
                    }
                }
            });
            return paramJson;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }
        //页面初始化
        $(function () {
            //初始化页面高度
            InitTableHeight();
            var date = new Date();
            var year = date.getFullYear();
            $('#StaticYear').val(year);
            $('#StaticDay').combobox("setValue", '31');
            $(".tabs-container li").click(function () {
                if ($(this).attr("refsel") == "1") {
                    return;
                }
                $(this).attr("refsel", "1");
                switch ($(this).attr("name")) {
                    case "ContractSearch":
                        //租赁合同查询
                        setTimeout("LoadContractDataGrid()", 10);
                        break;
                    case "RoomSearch":
                        //租赁房屋查询
                        setTimeout("LoadRoomDataGrid()", 10);
                        break;
                    case "Dynamic":
                        //租赁动态查询
                        setTimeout("StaticSearch()", 10);
                        break;
                    case "FeesSearch":
                        //租赁费用查询
                        setTimeout("LoadFeesDataGrid()", 10);
                        break;
                }
            });
            //datebox 添加清空
            var buttons = $.extend([], $.fn.datebox.defaults.buttons);
            buttons.splice(1, 0, {
                text: '清空',
                handler: function (target) {
                    $(target).datebox("setValue", "");
                }
            });
            $('.easyui-datebox').datebox({
                buttons: buttons
            });

            LoadContractDataGrid();
        })
    </script>
</body>
</html>
