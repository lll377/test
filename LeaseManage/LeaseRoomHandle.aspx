<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseRoomHandle.aspx.cs" Inherits="M_Main.LeaseManage.LeaseRoomHandle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房屋租赁办理</title>
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
    <style type="text/css">
        body, html, form {
            padding: 0px;
            margin: 0px;
            overflow: hidden;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            line-height: 20px;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 94%;
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
    <div class="tabs-container">
        <ul class="nav nav-tabs" id="MainNavTabs">
            <li class="active" id="drz" name="drz" refpage="drz" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">待入住</a>
            </li>
            <li id="yrz" name="yrz" refpage="yrz" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="true">已入住</a>
            </li>
            <li id="dtz" name="dtz" refpage="dtz" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="true">待退租</a>
            </li>
            <li id="ytz" name="ytz" refpage="ytz" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="true">已退租</a>
            </li>
        </ul>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <div class="Content">
                        <div id="dlg_search_DRZ" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
                            <form id="frmFromDRZ">
                                <table class="SearchTable">
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
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="8">
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadDRZDataGrid();">确定筛选</a>
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmFromDRZ').form('clear');">清空</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div style="width: 100%; background-color: #cccccc;" id="TableContainerDRZ"></div>
                    </div>
                </div>
            </div>
            <div id="tab-2" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <div class="Content">
                        <div id="dlg_search_YRZ" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
                            <form id="frmFromYRZ">
                                <table class="SearchTable">
                                    <tr>
                                        <td class="TdTitle">租户名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="TenantryCustName1" name="TenantryCustName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomSign1" name="RoomSign" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomName1" name="RoomName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">合同编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractSign1" name="ContractSign" class="easyui-validatebox" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">租赁开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseBeginTimeBegin1" name="LeaseBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseBeginTimeEnd1" name="LeaseBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">租赁结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseEndTimeBegin1" name="LeaseEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseEndTimeEnd1" name="LeaseEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">优惠免租结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentFreeEndTimeBegin1" name="RentFreeEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentFreeEndTimeEnd1" name="RentFreeEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">顺延起租开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="PostPoneBeginTimeBegin1" name="PostPoneBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="PostPoneBeginTimeEnd1" name="PostPoneBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">入住时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInTimeBegin1" name="CheckInTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInTimeEnd1" name="CheckInTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">退租时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutTimeBegin1" name="RentOutTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutTimeEnd1" name="RentOutTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">入住办理人</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInUserName1" name="CheckInUserName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">退租办理人</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutUserName1" name="RentOutUserName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="8">
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadYRZDataGrid();">确定筛选</a>
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmFromYRZ').form('clear');">清空</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div style="width: 100%; background-color: #cccccc;" id="TableContainerYRZ"></div>
                    </div>
                </div>
            </div>
            <div id="tab-3" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <div class="Content">
                        <div id="dlg_search_DTZ" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
                            <form id="frmFromDTZ">
                                <table class="SearchTable">
                                    <tr>
                                        <td class="TdTitle">租户名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="TenantryCustName2" name="TenantryCustName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomSign2" name="RoomSign" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomName2" name="RoomName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">合同编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractSign2" name="ContractSign" class="easyui-validatebox" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">租赁开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseBeginTimeBegin2" name="LeaseBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseBeginTimeEnd2" name="LeaseBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">租赁结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseEndTimeBegin2" name="LeaseEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseEndTimeEnd2" name="LeaseEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">优惠免租结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentFreeEndTimeBegin2" name="RentFreeEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentFreeEndTimeEnd2" name="RentFreeEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">顺延起租开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="PostPoneBeginTimeBegin2" name="PostPoneBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="PostPoneBeginTimeEnd2" name="PostPoneBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">入住时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInTimeBegin2" name="CheckInTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInTimeEnd2" name="CheckInTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">退租时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutTimeBegin2" name="RentOutTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutTimeEnd2" name="RentOutTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">入住办理人</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInUserName2" name="CheckInUserName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">退租办理人</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutUserName2" name="RentOutUserName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="8">
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadDTZDataGrid();">确定筛选</a>
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmFromDTZ').form('clear');">清空</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div style="width: 100%; background-color: #cccccc;" id="TableContainerDTZ"></div>
                    </div>
                </div>
            </div>
            <div id="tab-4" class="tab-pane active">
                <div class="panel-body" style="padding: 0px;">
                    <div class="Content">
                        <div id="dlg_search_YTZ" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
                            <form id="frmFromYTZ">
                                <table class="SearchTable">
                                    <tr>
                                        <td class="TdTitle">租户名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="TenantryCustName3" name="TenantryCustName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomSign3" name="RoomSign" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">房屋名称</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RoomName3" name="RoomName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">合同编号</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="ContractSign3" name="ContractSign" class="easyui-validatebox" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">租赁开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseBeginTimeBegin3" name="LeaseBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseBeginTimeEnd3" name="LeaseBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">租赁结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseEndTimeBegin3" name="LeaseEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="LeaseEndTimeEnd3" name="LeaseEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">优惠免租结束时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentFreeEndTimeBegin3" name="RentFreeEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentFreeEndTimeEnd3" name="RentFreeEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">顺延起租开始时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="PostPoneBeginTimeBegin3" name="PostPoneBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="PostPoneBeginTimeEnd3" name="PostPoneBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">入住时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInTimeBegin3" name="CheckInTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInTimeEnd3" name="CheckInTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">退租时间</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutTimeBegin3" name="RentOutTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                        <td class="TdTitle">至</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutTimeEnd3" name="RentOutTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">入住办理人</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="CheckInUserName3" name="CheckInUserName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle">退租办理人</td>
                                        <td class="TdContentSearch">
                                            <input type="text" id="RentOutUserName3" name="RentOutUserName" class="easyui-validatebox" runat="server" />
                                        </td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContentSearch"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="8">
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadYTZDataGrid();">确定筛选</a>
                                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmFromYTZ').form('clear');">清空</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div style="width: 100%; background-color: #cccccc;" id="TableContainerYTZ"></div>
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
            var w = $(window).width();
            $('.Content').css({ "height": h - NavTabsHeight + "px" });
        }

        var Column = [[
            { field: 'ck', checkbox: true },
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
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'RentOutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'RentOutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        var ColumnNoCheck = [[
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
            { field: 'RentOutReason', title: '退租原因', width: 200, align: 'center' }
        ]];

        /* 待入住 */
        var ToolBarDRZ = [
            {
                text: '入住确认',
                iconCls: 'icon-ok',
                handler: function () {
                    AdmissionConfirmation();
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_DRZ').dialog('open');
                }
            }
        ];
        //入住确认
        function AdmissionConfirmation() {
            var CheckedRows = $('#TableContainerDRZ').datagrid("getChecked");
            if (CheckedRows.length == 0) {
                HDialog.Info("请选择需要办理入住的数据");
                return;
            }
            var LeaseRoomIdList = "";
            for (var i = 0; i < CheckedRows.length; i++) {
                LeaseRoomIdList += CheckedRows[i].ID + ",";
            }
            if (LeaseRoomIdList.length > 0) {
                LeaseRoomIdList = LeaseRoomIdList.substring(0, LeaseRoomIdList.length - 1);
            }
            HDialog.Open(440, 320, '../LeaseManage/LeaseRoomCheckIn.aspx?LeaseRoomIdList=' + LeaseRoomIdList, '入住确认', false,
                function callback(_Data) {
                    if (_Data != "") {
                        LoadDRZDataGrid();
                        $(".tabs-container li").each(function (e) {
                            if ($(this).attr("name") == "yrz") {
                                $(this).attr("refsel", "0");
                                return false;//实现break功能
                            }
                        });
                    }
                });
        }
        //待入住列表加载
        function LoadDRZDataGrid() {
            $("#TableContainerDRZ").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: Column,
                pageSize: 50,
                pageList: [50, 100, 300],
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                pagination: true,
                toolbar: ToolBarDRZ,
                rownumbers: true,
                border: false,
                height: '100%',
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "GetLeaseRoomList";
                    param["State"] = 'DRZ';
                    var paramJson = $.getFromParam("frmFromDRZ");
                    for (var key in paramJson) {
                        param[key] = paramJson[key];
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $("#dlg_search_DRZ").dialog("close");
        }

        /* 已入住 */
        var ToolBarYRZ = [
            {
                text: '费用转移',
                iconCls: 'icon-edit',
                handler: function () {
                    CostTransfer();
                }
            }, '-',
            {
                text: '费用反转移',
                iconCls: 'icon-edit',
                handler: function () {
                    CostBackTransfer();
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_YRZ').dialog('open');
                }
            }
        ];
        //费用转移
        function CostTransfer() {
            var SelectedRow = $('#TableContainerYRZ').datagrid("getSelected");
            if (SelectedRow == null) {
                HDialog.Info("请选择需要进行费用转移的房屋");
                return;
            }
            var w = $(window).width();
            var h = $(window).height();
            HDialog.Open(w, h, '../LeaseManage/LeaseRoomTransferFees.aspx?LeaseRoomID=' + SelectedRow.ID, '租赁合同费用转移', false,
                function callback(_Data) {
                    if (_Data != "") {
                        LoadYRZDataGrid();
                    }
                });
        }
        //费用反转移
        function CostBackTransfer() {
            var SelectedRow = $('#TableContainerYRZ').datagrid("getSelected");
            if (SelectedRow == null) {
                HDialog.Info("请选择需要进行费用反转移的房屋");
                return;
            }
            var w = $(window).width();
            var h = $(window).height();
            HDialog.Open(w, h, '../LeaseManage/LeaseRoomTransferFeesRollBack.aspx?LeaseRoomID=' + SelectedRow.ID, '租赁合同费用反转移', false,
                function callback(_Data) {
                    if (_Data != "") {
                        LoadYRZDataGrid();
                    }
                });
        }
        //已入住列表加载
        function LoadYRZDataGrid() {
            $("#TableContainerYRZ").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: ColumnNoCheck,
                pageSize: 50,
                pageList: [50, 100, 300],
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: ToolBarYRZ,
                rownumbers: true,
                border: false,
                height: '100%',
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "GetLeaseRoomList";
                    param["State"] = 'YRZ';
                    var paramJson = $.getFromParam("frmFromYRZ");
                    for (var key in paramJson) {
                        param[key] = paramJson[key];

                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search_YRZ').dialog('close');
        }

        /* 待退租 */
        var ToolBarDTZ = [
            {
                text: '退租确认',
                iconCls: 'icon-ok',
                handler: function () {
                    RentWithdrawal();
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_DTZ').dialog('open');
                }
            }
        ];
        //退租确认
        function RentWithdrawal() {
            var CheckedRows = $('#TableContainerDTZ').datagrid("getChecked");
            if (CheckedRows.length == 0) {
                HDialog.Info("请选择需要办理退租的数据");
                return;
            }
            var LeaseRoomIdList = "";
            for (var i = 0; i < CheckedRows.length; i++) {
                LeaseRoomIdList += CheckedRows[i].ID + ",";
            }
            if (LeaseRoomIdList.length > 0) {
                LeaseRoomIdList = LeaseRoomIdList.substring(0, LeaseRoomIdList.length - 1);
            }
            HDialog.Open(440, 320, '../LeaseManage/LeaseRoomRentOut.aspx?LeaseRoomIdList=' + LeaseRoomIdList, '退租确认', false,
                function callback(_Data) {
                    if (_Data != "") {
                        LoadDTZDataGrid();
                        $(".tabs-container li").each(function (e) {
                            if ($(this).attr("name") == "ytz") {
                                $(this).attr("refsel", "0");
                                return false;//实现break功能
                            }
                        });
                    }
                });
        }
        //待退租列表加载
        function LoadDTZDataGrid() {
            $("#TableContainerDTZ").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: Column,
                pageSize: 50,
                pageList: [50, 100, 300],
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                pagination: true,
                toolbar: ToolBarDTZ,
                rownumbers: true,
                border: false,
                height: '100%',
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "GetLeaseRoomList";
                    param["State"] = 'DTZ';
                    var paramJson = $.getFromParam("frmFromDTZ");
                    for (var key in paramJson) {
                        param[key] = paramJson[key];
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search_DTZ').dialog('close');
        }

        /* 已退租 */
        var ToolBarYTZ = [
            {
                text: '费用转移',
                iconCls: 'icon-edit',
                handler: function () {
                    YZTCostTransfer();
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_YTZ').dialog('open');
                }
            }
        ];
        //费用转移
        function YZTCostTransfer() {
            var SelectedRow = $('#TableContainerYTZ').datagrid("getSelected");
            if (SelectedRow == null) {
                HDialog.Info("请选择需要进行费用转移的房屋");
                return;
            }
            var w = $(window).width();
            var h = $(window).height();
            HDialog.Open(w, h, '../LeaseManage/LeaseRoomTransferFees.aspx?LeaseRoomID=' + SelectedRow.ID, '租赁合同费用转移', false,
                function callback(_Data) {
                    if (_Data != "") {
                        LoadYTZDataGrid();
                    }
                });
        }
        //待退租列表加载
        function LoadYTZDataGrid() {
            $("#TableContainerYTZ").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: ColumnNoCheck,
                pageSize: 50,
                pageList: [50, 100, 300],
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: ToolBarYTZ,
                rownumbers: true,
                border: false,
                height: '100%',
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "GetLeaseRoomList";
                    param["State"] = 'YTZ';
                    var paramJson = $.getFromParam("frmFromYTZ");
                    for (var key in paramJson) {
                        param[key] = paramJson[key];
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search_YTZ').dialog('close');
        }

        $.getFromParam = function (fromName) {
            var key = "", val = "", paramJson = {};
            $("#" + fromName + " input").each(function (i, item) {
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
                            key = key.substring(0, key.length - 1);
                            paramJson[key] = val;
                        }
                    }
                }
                if ($(this).attr("type") == "radio" && typeof ($(this).attr("name")) != "undefined") {
                    key = $(this).attr("name");
                    if (!paramJson.hasOwnProperty(key)) {
                        val = $("input[name='" + key + "']:checked").val();
                        key = key.substring(0, key.length - 1);
                        paramJson[key] = val;
                    }
                }
            });
            return paramJson;
        }

        //页面初始化
        $(function () {
            //初始化页面高度
            InitTableHeight();

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

            $(".tabs-container li").click(function () {
                if ($(this).attr("refsel") == "1") {
                    return;
                }
                $(this).attr("refsel", "1");
                switch ($(this).attr("name")) {
                    case "drz":
                        //待入住
                        setTimeout("LoadDRZDataGrid()", 10);
                        break;
                    case "yrz":
                        //已入住
                        setTimeout("LoadYRZDataGrid()", 10);
                        break;
                    case "dtz":
                        //待退租
                        setTimeout("LoadDTZDataGrid()", 10);
                        break;
                    case "ytz":
                        //已退租
                        setTimeout("LoadYTZDataGrid()", 10);
                        break;
                }
            });
            LoadDRZDataGrid();
        })
    </script>
</body>
</html>
