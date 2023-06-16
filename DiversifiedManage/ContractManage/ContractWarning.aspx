<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractWarning.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractWarning" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同预警</title>
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
    <script type="text/javascript" src="../../jscript/uuid.js"></script>
    <style type="text/css">
        .dlg_table tr td.title {
            width: 10%;
            text-align: right;
            color: #7f7f7f;
        }

        .dlg_table tr td.text {
            width: 20%;
            text-align: left;
        }

        .textbox-label {
            cursor: pointer;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'120'">
        <div id="tab0" data-issel="true" title="合同到期预警" style="overflow: hidden;">
            <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
        </div>
        <div id="tab1" data-issel="false" title="合同执行预警" style="overflow: hidden;">
            <div id="TableContainerImplement" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
        </div>
        <div id="tab2" data-issel="false" title="合同提成预警" style="overflow: hidden;">
            <div id="TableContainerRoyalty" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
        </div>
    </div>
    <%--合同到期预警--%>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="padding: 5px; width: 1000px" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFrom">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">项目名称</td>
                    <td class="text" colspan="5">
                        <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',width:'93%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm('frmFrom');}" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </td>
                </tr>
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
                </tr>
                <tr>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName" typ="text" name="ContractName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同开始时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeBegin" name="ContractBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeEnd" name="ContractBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>合同结束时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeBegin" name="ContractEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeEnd" name="ContractEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>机构部门/负责人</span></td>
                    <td class="text">
                        <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName('frmFrom');},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                                    $(e.data.target).textbox('clear');
                                                    $('#DutyDepCode').val('');
                                                    $('#DutyUserCode').val('');
                                            }}] " />

                        <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                        <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">签约时间</td>
                    <td class="text">
                        <input type="text" id="ContractSignTimeBegin" name="ContractSignTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="ContractSignTimeEnd" name="ContractSignTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">变更状态</td>
                    <td class="text">
                        <select id="ContractChangeType" name="ContractChangeType" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:'100'">
                            <option value=""></option>
                            <option value="变更">变更</option>
                            <option value="终止">终止</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="title">发起时间</td>
                    <td class="text">
                        <input type="text" id="WorkStartDateBegin" name="WorkStartDateBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="WorkStartDateEnd" name="WorkStartDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere('frmFrom')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <%--合同执行预警--%>
    <div id="dlg_searchImplement" class="easyui-dialog" title="筛选" style="padding: 5px; width: 1000px" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFromImplement">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">项目名称</td>
                    <td class="text" colspan="5">
                        <input type="text" id="CommName2" name="CommName2" class="easyui-textbox" runat="server"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',width:'93%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm('frmFromImplement');}" />
                        <input type="hidden" id="CommID2" name="CommID2" runat="server" />
                    </td>
                </tr>
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
                </tr>
                <tr>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName2" typ="text" name="ContractName2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同开始时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeBegin2" name="ContractBeginTimeBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeEnd2" name="ContractBeginTimeEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>合同结束时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeBegin2" name="ContractEndTimeBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeEnd2" name="ContractEndTimeEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>机构部门/负责人</span></td>
                    <td class="text">
                        <input id="DutyDepNameAndUserName2" name="DutyDepNameAndUserName2" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName('frmFromImplement');},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                                    $(e.data.target).textbox('clear');
                                                    $('#DutyDepCode').val('');
                                                    $('#DutyUserCode').val('');
                                            }}] " />

                        <input type="hidden" id="DutyDepCode2" name="DutyDepCode2" runat="server" />
                        <input type="hidden" id="DutyUserCode2" name="DutyUserCode2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">签约时间</td>
                    <td class="text">
                        <input type="text" id="ContractSignTimeBegin2" name="ContractSignTimeBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="ContractSignTimeEnd2" name="ContractSignTimeEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">变更状态</td>
                    <td class="text">
                        <select id="ContractChangeType2" name="ContractChangeType2" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:'100'">
                            <option value=""></option>
                            <option value="变更">变更</option>
                            <option value="终止">终止</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="title">发起时间</td>
                    <td class="text">
                        <input type="text" id="WorkStartDateBegin2" name="WorkStartDateBegin2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="WorkStartDateEnd2" name="WorkStartDateEnd2" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGridImplement();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere('frmFromImplement')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <%--合同提成预警--%>
    <div id="dlg_searchRoyalty" class="easyui-dialog" title="筛选" style="padding: 5px; width: 1000px" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFromRoyalty">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">项目名称</td>
                    <td class="text" colspan="5">
                        <input type="text" id="CommName3" name="CommName3" class="easyui-textbox" runat="server"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',width:'93%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm('frmFromRoyalty');}" />
                        <input type="hidden" id="CommID3" name="CommID3" runat="server" />
                    </td>
                </tr>
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
                </tr>
                <tr>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName3" typ="text" name="ContractName3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同开始时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeBegin3" name="ContractBeginTimeBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeEnd3" name="ContractBeginTimeEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>合同结束时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeBegin3" name="ContractEndTimeBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeEnd3" name="ContractEndTimeEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>机构部门/负责人</span></td>
                    <td class="text">
                        <input id="DutyDepNameAndUserName3" name="DutyDepNameAndUserName3" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName('frmFromRoyalty');},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                                    $(e.data.target).textbox('clear');
                                                    $('#DutyDepCode').val('');
                                                    $('#DutyUserCode').val('');
                                            }}] " />

                        <input type="hidden" id="DutyDepCode3" name="DutyDepCode3" runat="server" />
                        <input type="hidden" id="DutyUserCode3" name="DutyUserCode3" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">签约时间</td>
                    <td class="text">
                        <input type="text" id="ContractSignTimeBegin3" name="ContractSignTimeBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="ContractSignTimeEnd3" name="ContractSignTimeEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">变更状态</td>
                    <td class="text">
                        <select id="ContractChangeType3" name="ContractChangeType3" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:'100'">
                            <option value=""></option>
                            <option value="变更">变更</option>
                            <option value="终止">终止</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="title">发起时间</td>
                    <td class="text">
                        <input type="text" id="WorkStartDateBegin3" name="WorkStartDateBegin3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="WorkStartDateEnd3" name="WorkStartDateEnd3" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGridRoyalty();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere('frmFromRoyalty')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            var h = $(window).height();
            $('.easyui-tabs').css("height", h + 'px');
            $('#tab0,#tab1,#tab2').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            InitDataGrid();
        });
        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //合同执行预警
                    setTimeout(function () {
                        InitDataGridImplement();
                    }, 300);
                } else if (index == 2) {
                    //合同提成预警
                    setTimeout(function () {
                        InitDataGridRoyalty();
                    }, 300);
                }
            }
        }
        function ClearWhere(frmFormName = 'frmFrom') {
            if (frmFormName == 'frmFrom') {
                $('#frmFrom').form('clear');
                if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                    $("#CommName").textbox("setValue", $('#HidCommName').val());
                    $("#CommID").val($('#HidCommID').val());
                }
            } else if (frmFormName == 'frmFromImplement') {
                $('#frmFromImplement').form('clear');
                if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                    $("#CommName2").textbox("setValue", $('#HidCommName').val());
                    $("#CommID2").val($('#HidCommID').val());
                }
            } else if (frmFormName == 'frmFromRoyalty') {
                $('#frmFromRoyalty').form('clear');
                if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                    $("#CommName3").textbox("setValue", $('#HidCommName').val());
                    $("#CommID3").val($('#HidCommID').val());
                }
            }
        }
        //选择项目
        function SelComm(frmFormName = 'frmFrom') {
            if ($('#HidCommID').val() == "" || $('#HidCommID').val() == "0") {
                LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Dialog/Comm.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
                    if (data) {
                        data = $.parseJSON(data);
                        var id = "", text = "";
                        $.each(data, function (i, item) {
                            id += "," + item.CommID;
                            text += "," + item.CommName;
                        });
                        id = id.substr(1);
                        text = text.substr(1);
                        if (frmFormName == 'frmFrom') {
                            $("#CommID").val(id);
                            $("#CommName").textbox('setValue', text);
                        } else if (frmFormName == 'frmFromImplement') {
                            $("#CommID2").val(id);
                            $("#CommName2").textbox('setValue', text);
                        } else if (frmFormName == 'frmFromRoyalty') {
                            $("#CommID3").val(id);
                            $("#CommName3").textbox('setValue', text);
                        }
                    }
                });
            }
        }
        //选择 机构部门/负责人
        function SelDutyDepNameAndUserName(frmFormName = 'frmFrom') {
            LayerDialog.OpenWin('640', '400', '../DiversifiedManage/Dialog/SelContractDutyUserAndDep.aspx', "机构部门/负责人选择", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    if (frmFormName == 'frmFrom') {
                        $('#DutyUserCode').val(data.UserCode);
                        $('#DutyDepCode').val(data.DepCode);
                        $('#DutyDepNameAndUserName').textbox("setValue", data.DepName + "-" + data.UserName);
                    } else if (frmFormName == 'frmFromImplement') {
                        $('#DutyUserCode2').val(data.UserCode);
                        $('#DutyDepCode2').val(data.DepCode);
                        $('#DutyDepNameAndUserName2').textbox("setValue", data.DepName + "-" + data.UserName);
                    } else if (frmFormName == 'frmFromRoyalty') {
                        $('#DutyUserCode3').val(data.UserCode);
                        $('#DutyDepCode3').val(data.DepCode);
                        $('#DutyDepNameAndUserName3').textbox("setValue", data.DepName + "-" + data.UserName);
                    }

                }
            });
        }
        //合同到期预警
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert("温馨提示", '没有需要导出的合同到期预警数据!');
                        return;
                    }
                    window.open("ContractWarning_SignExport.aspx?" + $('#frmFrom').serialize());
                }
            }
        ];
        var column = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 120, align: 'center' },
            { field: 'EndDays', title: '合同到期时间', width: 80, align: 'center' },
            { field: 'BuyerCustName', title: '客户名称', width: 200, align: 'center' },
            {
                field: 'RoomSigns', title: '房屋编号', width: 320, align: 'left'
            },
            { field: 'BuyerConnectTel', title: '联系电话', width: 120, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 180, align: 'left' },
            { field: 'ContractSign', title: '合同编号', width: 180, align: 'left' },
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
            { field: 'ContractPeriod', title: '合同期限(月)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准(元)', width: 100, align: 'center' },
            { field: 'ContractTotalPrice', title: '合同总额(元)', width: 100, align: 'center' },
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
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }

        ]];
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                rowStyler: function (index, row) {
                    if (row.EndDays != "" && parseInt(row.EndDays) < 0) {
                        return 'color:red;';

                    }
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractWarningSearchList";
                    var paramJson = $.getFromParam("frmFrom");
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('1', '');
                        param[key] = Values;
                    }
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                }
            });
            $('#dlg_search').dialog('close');
        }

        //合同执行预警
        var toolbarImplement = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_searchImplement').dialog('open');
                }
            }, '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var Rows = $("#TableContainerImplement").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert("温馨提示", '没有需要导出的合同执行预警数据!');
                        return;
                    }
                    ExportTable('合同执行预警信息', $('#TableContainerImplement'), columnImplement);
                }
            }
        ];
        var columnImplement = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 120, align: 'center' },
            { field: 'NoChargeMonth', title: '未计费年月', width: 100, align: 'center' },
            { field: 'BuyerCustName', title: '客户名称', width: 200, align: 'center' },
            {
                field: 'RoomSigns', title: '房屋编号', width: 320, align: 'left'
            },
            { field: 'BuyerConnectTel', title: '联系电话', width: 120, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 180, align: 'left' },
            { field: 'ContractSign', title: '合同编号', width: 180, align: 'left' },
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
            { field: 'ContractPeriod', title: '合同期限(月)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准(元)', width: 100, align: 'center' },
            { field: 'ContractTotalPrice', title: '合同总额(元)', width: 100, align: 'center' },
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
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' },

        ]];
        function InitDataGridImplement() {
            $("#TableContainerImplement").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                //pageSize: top.ListPageSize,
                //pageList: top.ListPageList,
                columns: columnImplement,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: false,
                width: "100%",
                toolbar: toolbarImplement,
                rowStyler: function (index, row) {
                    if (row.EndDays != "" && parseInt(row.EndDays) < 0) {
                        return 'color:red;';
                    }
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractWarningSearchList_Implement";
                    var paramJson = $.getFromParam("frmFromImplement");
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('2', '');
                        param[key] = Values;
                    }
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                }
            });
            $('#dlg_searchImplement').dialog('close');
        }

        //合同提成预警
        var toolbarRoyalty = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_searchRoyalty').dialog('open');
                }
            }, '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var Rows = $("#TableContainerRoyalty").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert("温馨提示", '没有需要导出的合同执行预警数据!');
                        return;
                    }
                    ExportTable('合同提成预警信息', $('#TableContainerRoyalty'), columnRoyalty);
                }
            }
        ];
        var columnRoyalty = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 120, align: 'center' },
            { field: 'NoChargeMonth', title: '未计费年月', width: 100, align: 'center' },
            { field: 'BuyerCustName', title: '客户名称', width: 200, align: 'center' },
            {
                field: 'RoomSigns', title: '房屋编号', width: 320, align: 'left'
            },
            { field: 'BuyerConnectTel', title: '联系电话', width: 120, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 180, align: 'left' },
            { field: 'ContractSign', title: '合同编号', width: 180, align: 'left' },
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
            { field: 'ContractPeriod', title: '合同期限(月)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准(元)', width: 100, align: 'center' },
            { field: 'ContractTotalPrice', title: '合同总额(元)', width: 100, align: 'center' },
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
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' },

        ]];
        function InitDataGridRoyalty() {
            $("#TableContainerRoyalty").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                //pageSize: top.ListPageSize,
                //pageList: top.ListPageList,
                columns: columnRoyalty,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: false,
                width: "100%",
                toolbar: toolbarRoyalty,
                rowStyler: function (index, row) {
                    if (row.EndDays != "" && parseInt(row.EndDays) < 0) {
                        return 'color:red;';
                    }
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractWarningSearchList_Royalty";
                    var paramJson = $.getFromParam("frmFromRoyalty");
                    for (var key in paramJson) {
                        var Values = paramJson[key]
                        key = key.replaceAll('3', '');
                        param[key] = Values;
                    }
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                }
            });
            $('#dlg_searchRoyalty').dialog('close');
        }


        function ExportTable(strXlsName, exportGrid, Column) {
            var f = $('<form action="/HM/M_Main/export.aspx" method="post" id="fm1"></form>');
            var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
            var l = $('<input type="hidden" id="txtName" name="txtName" />');
            i.val(ChangeToTablex(exportGrid, Column, Column));
            i.appendTo(f);
            l.val(strXlsName);
            l.appendTo(f);
            f.appendTo(document.body).submit();
            document.body.removeChild(f);
        }
        function ChangeToTablex(printDatagrid, HeadcolumnsList, columnsList) {
            var tableString = '<table cellspacing="0" class="pb">';
            var frozenColumns = undefined;  // 得到frozenColumns对象
            var columns = HeadcolumnsList; //printDatagrid.datagrid("options").columns;    // 得到columns对象
            var nameList = columnsList;

            // 载入title
            if (typeof columns != 'undefined' && columns != '') {
                $(columns).each(function (index) {
                    tableString += '\n<tr>';
                    if (typeof frozenColumns != 'undefined' && typeof frozenColumns[index] != 'undefined') {
                        for (var i = 0; i < frozenColumns[index].length; ++i) {
                            if (!frozenColumns[index][i].hidden) {
                                tableString += '\n<th width="' + frozenColumns[index][i].width + '"';
                                if (typeof frozenColumns[index][i].rowspan != 'undefined' && frozenColumns[index][i].rowspan > 1) {
                                    tableString += ' rowspan="' + frozenColumns[index][i].rowspan + '"';
                                }
                                if (typeof frozenColumns[index][i].colspan != 'undefined' && frozenColumns[index][i].colspan > 1) {
                                    tableString += ' colspan="' + frozenColumns[index][i].colspan + '"';
                                }
                                tableString += '>' + frozenColumns[0][i].title + '</th>';
                            }
                        }
                    }
                    for (var i = 0; i < columns[index].length; ++i) {
                        if (!columns[index][i].hidden) {
                            tableString += '\n<th width="' + columns[index][i].width + '"';
                            if (typeof columns[index][i].rowspan != 'undefined' && columns[index][i].rowspan > 1) {
                                tableString += ' rowspan="' + columns[index][i].rowspan + '"';
                            }
                            if (typeof columns[index][i].colspan != 'undefined' && columns[index][i].colspan > 1) {
                                tableString += ' colspan="' + columns[index][i].colspan + '"';
                            }
                            tableString += '>' + columns[index][i].title + '</th>';
                        }
                    }
                    tableString += '\n</tr>';
                });
            }
            // 载入内容
            var rows = printDatagrid.datagrid("getRows"); // 这段代码是获取当前页的所有行
            for (var i = 0; i < rows.length; i++) {
                tableString += '\n<tr>';
                for (var j = 0; j < nameList[0].length; j++) {
                    tableString += '\n<td';
                    if (nameList[0][j].align != 'undefined' && nameList[0][j].align != '') {
                        tableString += ' style="text-align:' + nameList[0][j].align + ';"';
                    }
                    tableString += '>';
                    var FiledName = nameList[0][j].field;
                    tableString += rows[i][FiledName];
                    tableString += '</td>';
                }
                tableString += '\n</tr>';
            }
            tableString += '\n</table>';
            return tableString;
        }

    </script>
</body>
</html>
