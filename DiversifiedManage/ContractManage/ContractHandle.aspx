<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractHandle.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractHandle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同办理页面</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            background-color: white;
        }

        .dlg_table tr td.title {
            width: 10%;
            text-align: right;
            color: #7f7f7f;
        }

        .dlg_table tr td.text {
            width: 15%;
            text-align: left;
        }


        .textbox-label {
            cursor: pointer;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .tabs-header {
            background-color: white;
        }
    </style>
</head>
<body>
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'120'">
        <div id="tab0" data-issel="true" title="待启用点位" style="overflow: hidden;">
            <div id="TableContainerWait" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab1" data-issel="false" title="已启用点位" style="overflow: hidden;">
            <div id="TableContainerComplete" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab2" data-issel="false" title="待退租点位" style="overflow: hidden;">
            <div id="TableContainerWaitExist" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab3" data-issel="false" title="已退租点位" style="overflow: hidden;">
            <div id="TableContainerCompleteExist" style="background-color: #cccccc;"></div>
        </div>
    </div>
    <div id="dlg_Waitsearch" class="easyui-dialog" title="筛选" style="padding: 5px; width: 1100px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmWait">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="BuyerCustName" typ="text" name="BuyerCustName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSigns" typ="text" name="RoomSigns" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同编号</span></td>
                    <td class="text">
                        <input id="ContractSign" typ="text" name="ContractSign" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName" typ="text" name="ContractName" runat="server" class="easyui-textbox" />
                    </td>

                </tr>
                <tr>
                    <td class="title"><span>点位编号</span></td>
                    <td class="text">
                        <input id="ContractPointNumber" typ="text" name="ContractPointNumber" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位名称</span></td>
                    <td class="text">
                        <input id="ContractPointName" typ="text" name="ContractPointName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位开始时间</span></td>
                    <td class="text">
                        <input type="text" id="PointBeginTimeBegin" name="PointBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="PointBeginTimeEnd" name="PointBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位结束时间</span></td>
                    <td class="text">
                        <input type="text" id="PointEndTimeBegin" name="PointEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="PointEndTimeEnd" name="PointEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>优惠免租结束时间</span></td>
                    <td class="text">
                        <input type="text" id="RentFreeEndTimeBegin" name="RentFreeEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="RentFreeEndTimeEnd" name="RentFreeEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>启用时间</span></td>
                    <td class="text">
                        <input type="text" id="InTimeBegin" name="InTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="InTimeEnd" name="InTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>退租时间</span></td>
                    <td class="text">
                        <input type="text" id="OutTimeBegin" name="OutTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="OutTimeEnd" name="OutTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>启用办理人</span></td>
                    <td class="text">
                        <input id="InUserName" typ="text" name="InUserName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>退租办理人</span></td>
                    <td class="text">
                        <input id="OutUserName" typ="text" name="OutUserName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="8">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadWaitGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmWait').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_Completesearch" class="easyui-dialog" title="筛选" style="padding: 5px; width: 1100px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmComplete">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="BuyerCustName2" typ="text" name="BuyerCustName2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSigns2" typ="text" name="RoomSigns2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同编号</span></td>
                    <td class="text">
                        <input id="ContractSign2" typ="text" name="ContractSign2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName2" typ="text" name="ContractName2" runat="server" class="easyui-textbox" />
                    </td>

                </tr>
                <tr>
                    <td class="title"><span>点位编号</span></td>
                    <td class="text">
                        <input id="ContractPointNumber2" typ="text" name="ContractPointNumber2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位名称</span></td>
                    <td class="text">
                        <input id="ContractPointName2" typ="text" name="ContractPointName2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位开始时间</span></td>
                    <td class="text">
                        <input type="text" id="PointBeginTimeBegin2" name="PointBeginTimeBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="PointBeginTimeEnd2" name="PointBeginTimeEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位结束时间</span></td>
                    <td class="text">
                        <input type="text" id="PointEndTimeBegin2" name="PointEndTimeBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="PointEndTimeEnd2" name="PointEndTimeEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>优惠免租结束时间</span></td>
                    <td class="text">
                        <input type="text" id="RentFreeEndTimeBegin2" name="RentFreeEndTimeBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="RentFreeEndTimeEnd2" name="RentFreeEndTimeEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>启用时间</span></td>
                    <td class="text">
                        <input type="text" id="InTimeBegin2" name="InTimeBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="InTimeEnd2" name="InTimeEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>退租时间</span></td>
                    <td class="text">
                        <input type="text" id="OutTimeBegin2" name="OutTimeBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="OutTimeEnd2" name="OutTimeEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>启用办理人</span></td>
                    <td class="text">
                        <input id="InUserName2" typ="text" name="InUserName2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>退租办理人</span></td>
                    <td class="text">
                        <input id="OutUserName2" typ="text" name="OutUserName2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="8">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadCompleteGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmComplete').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_WaitExistsearch" class="easyui-dialog" title="筛选" style="padding: 5px; width: 1100px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmWaitExist">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="BuyerCustName3" typ="text" name="BuyerCustName3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSigns3" typ="text" name="RoomSigns3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同编号</span></td>
                    <td class="text">
                        <input id="ContractSign3" typ="text" name="ContractSign3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName3" typ="text" name="ContractName3" runat="server" class="easyui-textbox" />
                    </td>

                </tr>
                <tr>
                    <td class="title"><span>点位编号</span></td>
                    <td class="text">
                        <input id="ContractPointNumber3" typ="text" name="ContractPointNumber3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位名称</span></td>
                    <td class="text">
                        <input id="ContractPointName3" typ="text" name="ContractPointName3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位开始时间</span></td>
                    <td class="text">
                        <input type="text" id="PointBeginTimeBegin3" name="PointBeginTimeBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="PointBeginTimeEnd3" name="PointBeginTimeEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位结束时间</span></td>
                    <td class="text">
                        <input type="text" id="PointEndTimeBegin3" name="PointEndTimeBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="PointEndTimeEnd3" name="PointEndTimeEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>优惠免租结束时间</span></td>
                    <td class="text">
                        <input type="text" id="RentFreeEndTimeBegin3" name="RentFreeEndTimeBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="RentFreeEndTimeEnd3" name="RentFreeEndTimeEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>启用时间</span></td>
                    <td class="text">
                        <input type="text" id="InTimeBegin3" name="InTimeBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="InTimeEnd3" name="InTimeEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>退租时间</span></td>
                    <td class="text">
                        <input type="text" id="OutTimeBegin3" name="OutTimeBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="OutTimeEnd3" name="OutTimeEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>启用办理人</span></td>
                    <td class="text">
                        <input id="InUserName3" typ="text" name="InUserName3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>退租办理人</span></td>
                    <td class="text">
                        <input id="OutUserName3" typ="text" name="OutUserName3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="8">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadWaitExistGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmWaitExist').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_CompleteExistsearch" class="easyui-dialog" title="筛选" style="padding: 5px; width: 1100px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmCompleteExist">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="BuyerCustName4" typ="text" name="BuyerCustName4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSigns4" typ="text" name="RoomSigns4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同编号</span></td>
                    <td class="text">
                        <input id="ContractSign4" typ="text" name="ContractSign4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName4" typ="text" name="ContractName4" runat="server" class="easyui-textbox" />
                    </td>

                </tr>
                <tr>
                    <td class="title"><span>点位编号</span></td>
                    <td class="text">
                        <input id="ContractPointNumber4" typ="text" name="ContractPointNumber4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位名称</span></td>
                    <td class="text">
                        <input id="ContractPointName4" typ="text" name="ContractPointName4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位开始时间</span></td>
                    <td class="text">
                        <input type="text" id="PointBeginTimeBegin4" name="PointBeginTimeBegin4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="PointBeginTimeEnd4" name="PointBeginTimeEnd4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位结束时间</span></td>
                    <td class="text">
                        <input type="text" id="PointEndTimeBegin4" name="PointEndTimeBegin4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="PointEndTimeEnd4" name="PointEndTimeEnd4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>优惠免租结束时间</span></td>
                    <td class="text">
                        <input type="text" id="RentFreeEndTimeBegin4" name="RentFreeEndTimeBegin4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="RentFreeEndTimeEnd4" name="RentFreeEndTimeEnd4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>启用时间</span></td>
                    <td class="text">
                        <input type="text" id="InTimeBegin4" name="InTimeBegin4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="InTimeEnd4" name="InTimeEnd4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>退租时间</span></td>
                    <td class="text">
                        <input type="text" id="OutTimeBegin4" name="OutTimeBegin4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="OutTimeEnd4" name="OutTimeEnd4" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>启用办理人</span></td>
                    <td class="text">
                        <input id="InUserName4" typ="text" name="InUserName4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>退租办理人</span></td>
                    <td class="text">
                        <input id="OutUserName4" typ="text" name="OutUserName4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="8">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadCompleteExistGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmCompleteExist').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            var h = $(window).height();
            var w = $(window).width();
            $('.easyui-tabs').css("height", h + 'px');
            $('#tab0,#tab1,#tab2,#tab3').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            LoadWaitGrid();
        });
        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //已启用点位
                    setTimeout(function () {
                        LoadCompleteGrid();
                    }, 300);
                } else if (index == 2) {
                    //待退租点位
                    setTimeout(function () {
                        LoadWaitExistGrid();
                    }, 300);
                } else if (index == 3) {
                    //已退租点位
                    setTimeout(function () {
                        LoadCompleteExistGrid();
                    }, 300);
                }
            }
        }
        /* 待启用点位 */
        var toolbarWait = [
            {
                text: '启用确认',
                iconCls: 'icon-ok',
                handler: function () {
                    var CheckedRows = $('#TableContainerWait').datagrid("getChecked");
                    if (CheckedRows.length == 0) {
                        $.messager.alert('温馨提示', "请选择需要办理启用的点位数据");
                        return;
                    }
                    var ContractPoindIDs = "";
                    for (var i = 0; i < CheckedRows.length; i++) {
                        ContractPoindIDs += CheckedRows[i].ID + ",";
                    }
                    if (ContractPoindIDs.length > 0) {
                        ContractPoindIDs = ContractPoindIDs.substring(0, ContractPoindIDs.length - 1);
                    }
                    var param = { "ContractPoindIDs": ContractPoindIDs, };
                    LayerDialog.OpenWin('450', '340', '../DiversifiedManage/ContractManage/ContractHandlePointCheckIn.aspx?' + $.param(param), "启用确认", false, function callback(_Data) {
                        if (_Data != "") {
                            $.messager.alert('温馨提示', "启用确认成功");
                            LoadWaitGrid();
                            //将已启用页面重新加载
                            var ItemTabSet = $('#tab').tabs('getTab', 1);
                            ItemTabSet.data("issel", false);
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_Waitsearch').dialog('open');
                }
            }
        ];
        var columnWait = [[
            { field: 'ck', checkbox: true },
            { field: 'BuyerCustName', title: '客户名称', width: 140, align: 'left' },
            { field: 'RoomSigns', title: '房屋编号', width: 280, align: 'left' },
            { field: 'MobilePhone', title: '移动电话', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'left' },
            { field: 'ContractPointNumber', title: '点位编号', width: 190, align: 'center' },
            { field: 'ContractPointName', title: '点位名称', width: 180, align: 'center' },
            { field: 'ContractPointArea', title: '点位面积', width: 80, align: 'center' },
            { field: 'ChargeNumber', title: '计费数量', width: 80, align: 'center' },
            {
                field: 'PointBeginTime', title: '开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PointEndTime', title: '结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'InTime', title: '启用时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'InUserName', title: '启用办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'OutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'OutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'OutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        //加载 待启用点位 列表
        function LoadWaitGrid() {
            $("#TableContainerWait").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnWait,
                rownumbers: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarWait,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractHandleList";
                    param["State"] = 'Wait';
                    var paramJson = $.getFromParam("frmWait");
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('1', '');
                        param[key] = Values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_Waitsearch').dialog('close');
        }

        /* 已启用点位 */
        var toolbarComplete = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_Completesearch').dialog('open');
                }
            }
        ];
        var columnComplete = [[
            { field: 'BuyerCustName', title: '客户名称', width: 140, align: 'left' },
            { field: 'RoomSigns', title: '房屋编号', width: 280, align: 'left' },
            { field: 'MobilePhone', title: '移动电话', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'left' },
            { field: 'ContractPointNumber', title: '点位编号', width: 190, align: 'center' },
            { field: 'ContractPointName', title: '点位名称', width: 180, align: 'center' },
            { field: 'ContractPointArea', title: '点位面积', width: 80, align: 'center' },
            { field: 'ChargeNumber', title: '计费数量', width: 80, align: 'center' },
            {
                field: 'PointBeginTime', title: '开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PointEndTime', title: '结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'InTime', title: '启用时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'InUserName', title: '启用办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'OutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'OutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'OutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        //加载 已启用点位 列表
        function LoadCompleteGrid() {
            $("#TableContainerComplete").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnComplete,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarComplete,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractHandleList";
                    param["State"] = 'Complete';
                    var paramJson = $.getFromParam("frmComplete");
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('2', '');
                        param[key] = Values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_Completesearch').dialog('close');
        }

        /* 待退租点位 */
        var toolbarWaitExist = [
            {
                text: '退租确认',
                iconCls: 'icon-ok',
                handler: function () {
                    var CheckedRows = $('#TableContainerWaitExist').datagrid("getChecked");
                    if (CheckedRows.length == 0) {
                        $.messager.alert('温馨提示', "请选择需要办理退租的点位数据");
                        return;
                    }
                    var ContractPoindIDs = "";
                    for (var i = 0; i < CheckedRows.length; i++) {
                        ContractPoindIDs += CheckedRows[i].ID + ",";
                    }
                    if (ContractPoindIDs.length > 0) {
                        ContractPoindIDs = ContractPoindIDs.substring(0, ContractPoindIDs.length - 1);
                    }
                    var param = { "ContractPoindIDs": ContractPoindIDs, };
                    LayerDialog.OpenWin('450', '340', '../DiversifiedManage/ContractManage/ContractHandlePointRentOut.aspx?' + $.param(param), "退租确认", false, function callback(_Data) {
                        if (_Data != "") {
                            $.messager.alert('温馨提示', "退租确认成功");
                            LoadWaitExistGrid();
                            //将已启用页面重新加载
                            var ItemTabSet = $('#tab').tabs('getTab', 3);
                            ItemTabSet.data("issel", false);
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_WaitExistsearch').dialog('open');
                }
            }
        ];
        var columnWaitExist = [[
            { field: 'ck', checkbox: true },
            { field: 'BuyerCustName', title: '客户名称', width: 140, align: 'left' },
            { field: 'RoomSigns', title: '房屋编号', width: 280, align: 'left' },
            { field: 'MobilePhone', title: '移动电话', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'left' },
            { field: 'ContractPointNumber', title: '点位编号', width: 190, align: 'center' },
            { field: 'ContractPointName', title: '点位名称', width: 180, align: 'center' },
            { field: 'ContractPointArea', title: '点位面积', width: 80, align: 'center' },
            { field: 'ChargeNumber', title: '计费数量', width: 80, align: 'center' },
            {
                field: 'PointBeginTime', title: '开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PointEndTime', title: '结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'InTime', title: '启用时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'InUserName', title: '启用办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'OutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'OutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'OutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        //加载 待退租点位 列表
        function LoadWaitExistGrid() {
            $("#TableContainerWaitExist").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnWaitExist,
                rownumbers: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarWaitExist,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractHandleList";
                    param["State"] = 'WaitExist';
                    var paramJson = $.getFromParam("frmWaitExist");
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('3', '');
                        param[key] = Values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_WaitExistsearch').dialog('close');
        }

        /* 已退租点位 */
        var toolbarCompleteExist = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_CompleteExistsearch').dialog('open');
                }
            }
        ];
        var columnCompleteExist = [[
            { field: 'BuyerCustName', title: '客户名称', width: 140, align: 'left' },
            { field: 'RoomSigns', title: '房屋编号', width: 280, align: 'left' },
            { field: 'MobilePhone', title: '移动电话', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'left' },
            { field: 'ContractPointNumber', title: '点位编号', width: 190, align: 'center' },
            { field: 'ContractPointName', title: '点位名称', width: 180, align: 'center' },
            { field: 'ContractPointArea', title: '点位面积', width: 80, align: 'center' },
            { field: 'ChargeNumber', title: '计费数量', width: 80, align: 'center' },
            {
                field: 'PointBeginTime', title: '开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PointEndTime', title: '结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'InTime', title: '启用时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'InUserName', title: '启用办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'OutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'OutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'OutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        //加载 已退租点位 列表
        function LoadCompleteExistGrid() {
            $("#TableContainerCompleteExist").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnCompleteExist,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarCompleteExist,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractHandleList";
                    param["State"] = 'CompleteExist';
                    var paramJson = $.getFromParam("frmCompleteExist");
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('4', '');
                        param[key] = Values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_CompleteExistsearch').dialog('close');
        }
    </script>
</body>
</html>
