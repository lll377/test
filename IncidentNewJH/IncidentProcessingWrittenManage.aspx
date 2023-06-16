<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentProcessingWrittenManage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentProcessingWrittenManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>书面报事详情</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>

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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="overflow-y: auto;">
    <form id="IncidentProcessingWrittenManage" runat="server">
        <table class="DialogTable">
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事信息</td>
            </tr>
            <tr>
                <td class="TdTitle">报事类型</td>
                <td class="TdContent">
                    <asp:DropDownList ID="DrClass" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                <td class="TdTitle">报事方式</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text1" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事来源</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text3" name="IncidentNum" runat="server" /></td>
                <td class="TdTitle">报事位置</td>
                <td class="TdContent">
                    <input id="Text2" type="radio" name="IncidentNum" checked runat="server" />户内
                    <input id="Text4" type="radio" name="IncidentNum" runat="server" />公区
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事编号</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="IncidentNum" name="IncidentNum" runat="server" /></td>
                <td class="TdTitle">是否投诉</td>
                <td class="TdContent">
                    <input id="Radio1" type="radio" name="TouShu" checked runat="server" />是
                    <input id="Radio2" type="radio" name="TouShu" runat="server" />否
                </td>
            </tr>
            <tr>
                <td class="TdTitle" rowspan="2">报事内容</td>
                <td class="TdContentSearch" rowspan="2">
                    <textarea id="Reason" rows="2" cols="51" runat="server"></textarea>
                </td>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text7" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事人</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text8" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事电话</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text5" name="IncidentNum" runat="server" />
                </td>
                <td class="TdTitle">报事类别</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text6" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事责任</td>
                <td class="TdContent">
                    <input id="Radio3" type="radio" name="ZeRen" checked runat="server" />物业类
                    <input id="Radio4" type="radio" name="ZeRen" runat="server" />地产类
                </td>
                <td class="TdTitle">预约处理时间</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text10" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">附  件</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text11" name="IncidentNum" runat="server" />
                </td>
                <td class="TdTitle">派工单号</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text9" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">处理时限</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text12" name="IncidentNum" runat="server" />
                </td>
                <td class="TdTitle">责任人</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text13" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">接单时间</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text14" name="IncidentNum" runat="server" />
                </td>
                <td class="TdTitle">到场时间</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text15" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">处理情况</td>
            </tr>
            <tr>
                <td class="TdContent" colspan="4">
                    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                    </div>
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">取消情况</td>
            </tr>
            <tr>
                <td class="TdTitle">取消人</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text16" name="IncidentNum" runat="server" />
                </td>
                <td class="TdTitle">取消时间</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text17" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">取消原因</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Text18" name="IncidentNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 10px;" colspan="4">
                    <input class="button" type="button" value="确认完成" id="btnSave" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" type="button" value="跟进" id="btnFollow" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" type="button" value="转发" id="btnTransmit" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" type="button" value="废弃" id="btnGiveUp" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" type="button" value="放弃返回" id="btnReturn" name="btnReturn" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    var column = [[
        { field: 'CustName', title: '跟进人', width: 100, align: 'center', sortable: true },
        { field: 'RoomSign', title: '跟进时间', width: 100, align: 'center', sortable: true },
        { field: 'CostName', title: '跟进内容', width: 100, align: 'center', sortable: true },
        { field: 'DebtsAmount', title: '逾期原因', width: 100, align: 'center', sortable: true }
    ]];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            title: '',
            nowrap: false,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Carpark", "search", "TableContainer", param);
            }
        });
    }

    //完成
    $("#btnSave").click(function () {
        var url = '../IncidentNewJH/IncidentProcessingComplete.aspx';
      
        HDialog.Open('1024', '480', url, "报事完成", false, function callback(_Data) {

        });
    });


    //跟进
    $("#btnFollow").click(function () {
        var url = '../IncidentNewJH/IncidentProcessingFollowManage.aspx';

        HDialog.Open('650', '300', url, "报事跟进", false, function callback(_Data) {

        });
    });


    //废弃
    $("#btnGiveUp").click(function () {
        var url = '../IncidentNewJH/IncidentProcessingGiveUp.aspx';

        HDialog.Open('650', '300', url, "废弃", false, function callback(_Data) {

        });

    });


    //报事转发
    $("#btnTransmit").click(function () {
        var url = '../IncidentNewJH/IncidentProcessingTransmit.aspx';

        HDialog.Open('650', '300', url, "转发", false, function callback(_Data) {

        });

    });



    $("#btnReturn").click(function () {
        HDialog.Close();
    });

    function InitTableHeight() {
        $("#TableContainer").css("height", "180px");
    }

    InitTableHeight();
    LoadList();
</script>
