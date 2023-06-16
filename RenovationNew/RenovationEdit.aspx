<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenovationEdit.aspx.cs" Inherits="M_Main.RenovationNew.RenovationEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修登记编辑</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script src="../jscript/help.js" type="text/javascript"></script>
    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        /*    .bootstrap_table tr td.title {
            width: 10%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 40%;
            text-align: left;
        }*/
    </style>
</head>
<body>
    <input type="hidden" name="ApplicationPath" id="ApplicationPath" runat="server" />
    <form id="mainForm" runat="server">
        <input type="hidden" name="PrintRegister" id="PrintRegister" runat="server" />
        <input type="hidden" name="PrintLicence" id="PrintLicence" runat="server" />



        <input type="hidden" name="OpType" id="OpType" />
        <input type="hidden" name="AuditState" id="AuditState" value="未送审" />
        <input type="hidden" name="QRCode" id="QRCode" />
        <input type="hidden" name="FeesRoleCodes" id="FeesRoleCodes" />
        <input type="hidden" name="FeesRoleSortCodes" id="FeesRoleSortCodes" />
        <input type="hidden" name="StoppageDays" id="StoppageDays" />




        <div style="padding: 5px">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">基础信息</legend>
                <div class="divPrint add">
                    <%--<input type="button" id="BtnPrintRegister" class="button" value="打印装修登记表" runat="server" />--%>
                    <%--<input type="button" id="BtnPrintLicence" class="button" value="打印装修许可证" runat="server" />--%>
                    <input type="button" id="BtnPrintLicence" class="button" value="打印装修许可证" onclick="OpenPrintLicence()" />
                </div>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>客户名称</span>
                        </td>
                        <td class="text">
                            <input id="CustName" name="CustName" class="easyui-textbox" data-options="prompt: '请单击右侧\'放大镜\'按钮进行操作!', editable: false, tipPosition: 'bottom', required: true, multiline: false, width: '350px',
                        buttonText: '', buttonIcon: 'icon-search', onClickButton: function () { SelCust(); },
                        icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).textbox('clear');
                            }
                        }]" />
                            <input type="hidden" id="CustID" name="CustID" />
                        </td>
                        <td class="title">
                            <span>可选房号</span>
                        </td>
                        <td class="text">
                            <input id="RoomNum" name="RoomNum" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',multiline:false,width:'350px'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>房屋编号</span></td>
                        <td class="text">
                            <input id="RoomSign" name="RoomSign" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'350px',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRoom();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                            <input type="hidden" id="RoomID" name="RoomID" />
                        </td>
                        <td class="title"><span>联系电话</span></td>
                        <td class="text">
                            <input id="ContactPhone" name="ContactPhone" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',validType:['phoneAndMobile']" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>申请日期</span></td>
                        <td class="text">
                            <input id="ApplyDate" name="ApplyDate" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]"
                                runat="server" />
                        </td>
                        <td class="title"><span>装修类型</span></td>
                        <td class="text">
                            <input id="RenovationType" name="RenovationType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',required:true,panelHeight:'auto',
                         valueField:'id',textField:'text',data: [{id: '单项施工',text: '单项施工'},{id: '常规装修',text: '常规装修'}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>装修前房屋情况</span></td>
                        <td class="text" colspan="3">
                            <input id="HousesBeforeSituation" name="HousesBeforeSituation" class="easyui-textbox" data-options="tipPosition:'bottom',multiline:true,width:'1055px',height:'50px'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>装修内容</span></td>
                        <td class="text">
                            <input id="RenovationContent" name="RenovationContent" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',multiline:true,width:'430px',height:'300px'" />
                        </td>
                        <td class="text" colspan="2">
                            <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>装修开工时间</span></td>
                        <td class="text">
                            <input id="StartDate" name="StartDate" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                        <td class="title"><span>预计完工时间</span></td>
                        <td class="text">
                            <input id="EstimateEndDate" name="EstimateEndDate" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom',validType:['dateFormat','dateCompare[\'#StartDate\',\'不能小于装修开工时间!\']'],icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>预计装修天数</span></td>
                        <td class="text">
                            <input id="EstimateEndDay" name="EstimateEndDay" class="easyui-numberbox" data-options="readonly:true,editable:false,tipPosition:'bottom',value:'0'" />
                        </td>
                        <td class="title"><span>是否自装</span></td>
                        <td class="text">
                            <input class="easyui-radiobutton" id="OneselfOutfitYes" name="OneselfOutfit" data-options="value:'是',label:'是',labelWidth:18,labelAlign:'right'" />
                            <input class="easyui-radiobutton" id="OneselfOutfitNo" name="OneselfOutfit" data-options="value:'否',label:'否',labelWidth:40,labelAlign:'right',checked:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>施工单位名称</span></td>
                        <td class="text">
                            <input id="BuildCompany" name="BuildCompany" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'350px'" />
                        </td>
                        <td class="title"><span>统一信用代码</span></td>
                        <td class="text">
                            <input id="CreditCode" name="CreditCode" class="easyui-textbox" data-options="tipPosition:'bottom'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>有无资质</span></td>
                        <td class="text">
                            <input class="easyui-radiobutton" id="QualificationYes" name="Qualification" data-options="value:'有',label:'有',labelWidth:18,labelAlign:'right'" />
                            <input class="easyui-radiobutton" id="QualificationNo" name="Qualification" data-options="value:'无',label:'无',labelWidth:40,labelAlign:'right',checked:true" />
                        </td>
                        <td class="title"><span>资质等级</span></td>
                        <td class="text">
                            <input id="QualificationLevel" name="QualificationLevel" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>单位负责人</span></td>
                        <td class="text">
                            <input id="BuildCompanyLeadPerson" name="BuildCompanyLeadPerson" class="easyui-textbox" data-options="tipPosition:'bottom'" />
                        </td>
                        <td class="title"><span>单位负责人电话</span></td>
                        <td class="text">
                            <input id="BuildCompanyLeadPersonPhone" name="BuildCompanyLeadPersonPhone" class="easyui-textbox" data-options="tipPosition:'bottom',validType:['phoneAndMobile']" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>进场人数</span></td>
                        <td class="text">
                            <input id="EnterSitePersonNum" name="EnterSitePersonNum" class="easyui-numberbox" data-options="tipPosition:'bottom'" />
                        </td>
                        <td class="title"><span>是否留宿</span></td>
                        <td class="text">
                            <input class="easyui-radiobutton" id="StayOvernightYes" name="StayOvernight" data-options="value:'是',label:'是',labelWidth:18,labelAlign:'right'" />
                            <input class="easyui-radiobutton" id="StayOvernightNo" name="StayOvernight" data-options="value:'否',label:'否',labelWidth:40,labelAlign:'right',checked:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>现场负责人</span></td>
                        <td class="text">
                            <input id="NewSiteLeadPerson" name="NewSiteLeadPerson" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                        </td>
                        <td class="title"><span>现场负责人电话</span></td>
                        <td class="text">
                            <input id="NewSiteLeadPersonPhone" name="NewSiteLeadPersonPhone" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',validType:['phoneAndMobile']" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>有无图纸方案</span></td>
                        <td class="text">
                            <input class="easyui-radiobutton" id="DrawingYes" name="Drawing" data-options="value:'有',label:'有',labelWidth:18,labelAlign:'right'" />
                            <input class="easyui-radiobutton" id="DrawingNo" name="Drawing" data-options="value:'无',label:'无',labelWidth:40,labelAlign:'right',checked:true" />
                        </td>
                        <td class="title"><span>经办人</span></td>
                        <td class="text">
                            <input id="HandlePerson" name="HandlePerson" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>经办时间</span></td>
                        <td class="text">
                            <input id="HandleDate" name="HandleDate" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]"
                                runat="server" />
                        </td>
                        <td class="title"><span>信息来源</span></td>
                        <td class="text">
                            <input id="InfoSource" name="InfoSource" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',required:true,panelHeight:'auto',
                         valueField:'id',textField:'text',value:'现场提交',data: [{id: '现场提交',text: '现场提交'},{id: '电话提交',text: '电话提交'},{id: '其它方式',text: '其它方式'},{id: '客户线下报事',text: '客户线下报事'},
                        {id: '员工线下报事',text: '员工线下报事'},{id: '网络监控报事',text: '网络监控报事'},{id: '其它报事方式',text: '其它报事方式'},{id: '呼叫中心报事',text: '呼叫中心报事'},
                        {id: '业主线上报事',text: '业主线上报事'},{id: '员工线上报事',text: '员工线上报事'}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>装修许可证编号</span></td>
                        <td class="text" colspan="3">
                            <input id="LicenceNum" name="LicenceNum" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>备注:</span></td>
                        <td class="text" colspan="3">
                            <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'1055px',height:'50px'" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">完工信息</legend>
                <table class="bootstrap_table completeinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title"><span>实际完工时间</span></td>
                        <td class="text">
                            <input id="ActualCompleteDate" name="ActualCompleteDate" class="easyui-datebox" data-options="editable:false,tipPosition:'bottom',validType:['dateFormat','dateCompare[\'#StartDate\',\'不能小于装修开工时间!\']'],icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                        <td class="title"><span>实际装修天数</span></td>
                        <td class="text">
                            <input id="ActualCompleteDay" name="ActualCompleteDay" class="easyui-numberbox" data-options="readonly:true,tipPosition:'bottom'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>装修状态</span></td>
                        <td class="text">
                            <input id="RenovationState" name="RenovationState" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',required:true,panelHeight:'auto',
                         value:'申请',valueField:'id',textField:'text',data: [{id: '申请',text: '申请'},{id: '装修',text: '装修'},{id: '停工',text: '停工'},{id: '完工',text: '完工'}]" />
                        </td>
                        <td class="title"><span>变更时间</span></td>
                        <td class="text">
                            <input id="RenovationChangeDate" name="RenovationChangeDate" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>装修状态<br />
                            变更原因</span></td>
                        <td class="text" colspan="3">
                            <input id="RenovationChangeReason" name="RenovationChangeReason" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'1055px',height:'50px'" />
                        </td>
                    </tr>

                    <tr>
                        <td class="title"><span>房屋状态</span></td>
                        <td class="text">
                            <input id="HandOverHousesState" name="HandOverHousesState" class="easyui-combobox" />
                        </td>
                        <td class="title"><span>变更时间</span></td>
                        <td class="text">
                            <input id="HandOverHousesChangeDate" name="HandOverHousesChangeDate" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>交房变更原因</span></td>
                        <td class="text" colspan="3">
                            <input id="HandOverHousesChangeReason" name="HandOverHousesChangeReason" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'1055px',height:'50px'" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <div style="height: 60px"></div>
        </div>
        <%--   <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>--%>
        <div class="btnFixed">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="送审" id="btnSaveAuditing" onclick="SaveAuditing();" />
            <input type="button" class="button" value="审批通过" id="btnCheckPass" onclick="SaveCheckPass();" />
            <input type="button" class="button" value="审批不通过" id="btnCheckNoPass" onclick="SaveCheckNoPass();" />
            <input type="button" class="button" value="驳回" id="btnReturn" onclick="SaveReturn();" />
            <input type="hidden" name="ID" id="ID" runat="server" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>

    </form>
    <script type="text/javascript">
        function OpenPage(id) {
            var value = $("#" + id).val();
            if (isValueNull(value)) {
                window.open(value, "_blank", "menubar=no,toolbar=no,status=no,scrollbars=yes,resizable=yes");
                $("#" + id).val('')
            }
        }
        function OpenPrintLicence() {
            window.open("RenovationPrintLicence.aspx?ID=" + $("#ID").val());
        }
        function Print() {
            OpenPage("PrintRegister");
            OpenPage("PrintLicence");
        }

        function SelCust() {
            HDialog.Open('1000', '450', '../DialogNew/CustDlg.aspx', '选择客户', true, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContactPhone").textbox('setValue', data.MobilePhone);
                    $("#CustID").val(data.CustID);
                    //$("#CustID").textbox('setValue', data.CustID);
                    $("#CustName").textbox('setText', data.CustName);
                    $.tool.DataPostJson('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                        function Init() {
                        },
                        function callback(data) {
                            if (data) {
                                var roomData = [];
                                $.each(data, function (index, element) {
                                    var str = "";
                                    if (element.IsDelLive == 1) {
                                        str = "(历史)";
                                    }
                                    var RoomID = element.RoomID;
                                    //var RoomText = element.RoomSign + "(" + element.BuildArea + ")" + str;
                                    var RoomText = element.RoomSign;
                                    roomData.push({ "Text": RoomText, "ID": RoomID });
                                });
                                if (roomData) {
                                    $('#RoomNum').combobox({
                                        data: roomData,
                                        valueField: 'ID',
                                        textField: 'Text',
                                        value: '',
                                        onSelect: function (record) {
                                            if (record) {
                                                $("#RoomID").val(record.ID);
                                                $("#RoomSign").textbox('setText', record.Text);
                                                //$("#RoomID").textbox('setValue', record.ID);
                                                //$("#RoomID").textbox('setText', record.Text);
                                                SetRoomState();
                                            }
                                        }
                                    });
                                }
                            }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                    $("#RoomID").textbox('setText', "");
                    $("#RoomID").textbox('setValue', "");
                }
            });
        }

        function SelRoom() {
            HDialog.Open('1000', '450', '../DialogNew/RoomDlg.aspx', '选择房屋', true, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContactPhone").textbox('setValue', data.MobilePhone);
                    $("#CustID").val(data.CustID);
                    //$("#CustID").textbox('setValue', data.CustID);
                    $("#CustName").textbox('setText', data.CustName);
                    //$("#RoomID").textbox('setValue', data.RoomID);
                    $("#RoomID").val(data.RoomID);
                    $("#RoomSign").textbox('setText', data.RoomSign);
                    $("#HandOverHousesState").combobox('setValue', data.RoomState);
                }
            });
        }

        //设置房屋状态
        function SetRoomState() {
            $.tool.DataPostJson('Renovation', 'GetModelRoom', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $("#HandOverHousesState").combobox('setValue', data.RoomState);
                        //$("#HandOverHousesState").combobox('select', data.RoomState);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function ChangeQualification(checked) {
            if (checked) {
                $('#QualificationLevel').textbox("enableValidation");
            } else {
                $('#QualificationLevel').textbox("disableValidation");
            }
        }

        function ChangeOneselfOutfit(checked) {
            if (checked) {
                $('#BuildCompany').textbox("disable");
                $('#CreditCode').textbox("disable");
                $('#QualificationYes').radiobutton("disable");
                $('#QualificationNo').radiobutton("disable");
                $('#QualificationLevel').textbox("disable");
                $('#BuildCompanyLeadPerson').textbox("disable");
                $('#BuildCompanyLeadPersonPhone').textbox("disable");
                $('#EnterSitePersonNum').textbox("disable");
                $('#StayOvernightYes').radiobutton("disable");
                $('#StayOvernightNo').radiobutton("disable");
            } else {

                $('#BuildCompany').textbox("enable");
                $('#CreditCode').textbox("enable");
                $('#QualificationYes').radiobutton("enable");
                $('#QualificationNo').radiobutton("enable");
                $('#QualificationLevel').textbox("enable");
                $('#BuildCompanyLeadPerson').textbox("enable");
                $('#BuildCompanyLeadPersonPhone').textbox("enable");
                $('#EnterSitePersonNum').textbox("enable");
                $('#StayOvernightYes').radiobutton("enable");
                $('#StayOvernightNo').radiobutton("enable");
            }
        }



        function InitControl() {
            //$('#CustID').textbox('textbox').bind('click', function (e) {
            //    SelCust();
            //});

            //$('#RoomID').textbox('textbox').bind('click', function (e) {
            //    SelRoom();
            //});

            $('#RoomID').textbox({
                onChange: function (newValue, oldValue) {
                    if ($("#OpType").val() == "Add") {
                        $.tool.DataPostJson('Renovation', 'IsCheckRenovation', $.JQForm.GetStrParam(),
                            function Init() {
                            },
                            function callback(data) {
                                if (!data.result) {
                                    $.messager.alert('温馨提示', data.msg);
                                }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }
                }
            });
            $('#HandOverHousesState').combobox({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: 'post',
                queryParams: {
                    "Method": "DataPost",
                    "Class": "Renovation",
                    "Command": "GetListRoomState",
                },
                valueField: 'RoomState',
                textField: 'StateName',
                editable: false,
                tipPosition: 'bottom',
                width: '350px',
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });


            $('#StartDate').datebox({
                onHidePanel: function (date) {
                    var startDate = $('#StartDate').datebox("getValue");
                    var endDate = $('#EstimateEndDate').datebox("getValue");
                    if (isValueNull(startDate) && isValueNull(endDate)) {
                        var day = GetBetweenDateDay(startDate, endDate) + 1;
                        if (0 > day) {
                            day = 0;
                        }
                        $('#EstimateEndDay').numberbox("setValue", day);
                    }

                }
            });

            $('#EstimateEndDate').datebox({
                onHidePanel: function (date) {
                    var startDate = $('#StartDate').datebox("getValue");
                    var endDate = $('#EstimateEndDate').datebox("getValue");
                    if (isValueNull(startDate) && isValueNull(endDate)) {
                        var day = GetBetweenDateDay(startDate, endDate) + 1;
                        if (0 > day) {
                            day = 0;
                        }
                        $('#EstimateEndDay').numberbox("setValue", day);
                    }

                }
            });

            $('#ActualCompleteDate').datebox({
                onHidePanel: function (date) {
                    var startDate = $('#StartDate').datebox("getValue");
                    var endDate = $('#ActualCompleteDate').datebox("getValue");
                    if (isValueNull(startDate) && isValueNull(endDate)) {
                        var day = GetBetweenDateDay(startDate, endDate) + 1 - parseInt($("#StoppageDays").val());
                        if (0 > day) {
                            day = 0;
                        }
                        $('#ActualCompleteDay').numberbox("setValue", day);
                    }

                }
            });

            $('#QualificationLevel').textbox("disableValidation");
            $("#QualificationYes").radiobutton({
                onChange: function (checked) {
                    ChangeQualification(checked);
                }
            });
            //是否自装
            $("#OneselfOutfitYes").radiobutton({
                onChange: function (checked) {
                    ChangeOneselfOutfit(checked);
                }
            });

        }

        $(function () {
            Print();
            InitControl();
            InitPage();
            InitDataGrid();
        });
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Edit("新增", "Add", "");
                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        Edit('编辑', "Edit", row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        Del(row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }
        ];
        var column = [[
            {
                field: 'Content', title: '内容', align: 'left', sortable: true, formatter: function (value, row, index) {
                    var val = value;
                    if (value.length > 88) {
                        val = value.substring(0, 88) + "...";
                    }
                    return val;
                }
            }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                title: "装修内容项列表",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: false,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: true,
                border: true,
                pagination: true,
                width: "100%",
                height: '300px',
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {
                    $("#RenovationContent").textbox('setValue', row.Content);
                },
                onDblClickRow: function (index, row) {
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Renovation", "GetListRenovationContent", "dg", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
        }

        function Edit(title, OpType, ID) {
            var urlParam = $.param({ "OpType": OpType, "ID": ID });
            HDialog.OpenWin('800', '450', '../RenovationNew/RenovationContentEdit.aspx?' + urlParam, title, true, function callback(data) {
                //if (isValueNull(data)) {
                InitDataGrid();
                //}
            });
        }
        function Del(idList) {
            $.messager.confirm('温馨提示', '确定删除?', function (r) {
                if (r) {
                    $.tool.DataPostJson('Renovation', 'DelRenovationContent', "idList=" + idList,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                InitDataGrid();
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }
        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            $("#OpType").val(OpType);
            $("#ID").val($.getUrlParam("RID"));
            if (OpType == "Edit") {
                InitData();
            } else if (OpType == "Detailed") {
                $(".btnFixed,.divPrint").hide();
                ControlDisable(".bootstrap_table input");
                InitData();
            }
            else if (OpType == "ViewDetail") {
                $(".divPrint").hide();
                ControlDisable(".bootstrap_table input");
                InitData();
            }
            else {
                AuditStateControl("未送审", "申请");
            }
            //$('#Sort').numberbox('textbox').attr('maxlength', 8);
        }
        function ControlDisable(id) {
            $(id).each(function () {
                var key = $(this).attr("id");
                if (isValueNull(key) && key.indexOf("_easyui") == -1) {
                    if ($(this).hasClass("easyui-datebox")) {
                        $(this).datebox("disable");
                    } else if ($(this).hasClass("easyui-textbox")) {
                        var value = $(this).textbox("getValue");
                        var text = $(this).textbox("getText");
                        $(this).textbox("disable");
                        $(this).textbox("setValue", value);
                        $(this).textbox("setText", text);
                    } else if ($(this).hasClass("easyui-numberbox")) {
                        $(this).numberbox("disable");
                    } else if ($(this).hasClass("easyui-combobox")) {
                        $(this).combobox("disable");
                    } else if ($(this).hasClass("easyui-radiobutton")) {
                        $(this).radiobutton("disable");
                    }
                }
            });
        }
        function AuditStateControl(auditState, renovationState) {
            $(".divPrint").hide();

            ControlDisable(".completeinfo input");
            //判断状态隐藏页面按钮
            switch (auditState) {
                case "未送审":
                    $('#btnCheckPass').hide();
                    $('#btnCheckNoPass').hide();
                    $('#btnReturn').hide();
                    //ControlDisable(".completeinfo input");
                    break;
                case "审核中":
                    $('#btnSave').hide();
                    $('#btnSaveAuditing').hide();
                    break;
                case "已审核":
                    $('#btnSaveAuditing').hide();
                    $('#btnCheckPass').hide();
                    $('#btnCheckNoPass').hide();
                    $('#btnReturn').hide();
                    ControlDisable(".baseinfo input");
                    if (renovationState == "完工") {
                        $('#btnSave').hide();
                        //ControlDisable(".completeinfo input");
                    }
                    $(".divPrint").show();
                    break;
                case "审核不通过":
                    $('#btnCheckPass').hide();
                    $('#btnCheckNoPass').hide();
                    $('#btnReturn').hide();
                    //ControlDisable(".completeinfo input");
                    break;
            }
        }

        function InitData() {
            $.tool.DataPostJson('Renovation', 'GetModelRenovation', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    data = data[0];
                    var opType = $("#OpType").val();
                    if (opType == "Edit") {

                    }

                    if (data.RenovationState == "停工" && !data.MinStoppageBeginTime) {
                        data.RenovationState = "装修";
                        data.RenovationChangeDate = data.MaxStoppageEndTime;
                        data.RenovationChangeReason = "停工结束";
                    }

                    $('#mainForm').form('load', data);
                    $("#CustID").val(data.CustID);
                    //$("#CustID").textbox('setValue', data.CustID);
                    $("#CustName").textbox('setText', data.CustName);
                    //$("#RoomID").textbox('setValue', data.RoomID);
                    $("#RoomID").val(data.RoomID);
                    $("#RoomSign").textbox('setText', data.RoomSign);


                    if (opType == "Edit") {
                        ChangeQualification(data.Qualification == "有");
                        ChangeOneselfOutfit(data.OneselfOutfit == "是");
                    }

                    AuditStateControl(data.AuditState, data.RenovationState);

                    $("#ID").val(data.ID);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJson('Renovation', 'SaveRenovation', $.JQForm.GetStrParam(),
                    function Init() {
                        $("#btnSave").attr("disabled", "disabled");
                    },
                    function callback(data) {
                        if (data.result) {
                            Close();
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {
                        $("#btnSave").removeAttr("disabled");
                    }, function errorCallback() {
                        $("#btnSave").removeAttr("disabled");
                    });
            }
        }
        //送审
        function SaveAuditing() {
            ////判断是否上传附件，若未上传附件允许送审
            //var Flag = true;
            //$.tool.DataPostInfoAsync('Renovation', 'CheckFileIsNull', 'RID=' + $("#ID").val(),
            //    function Init() {
            //    },
            //    function callback(_Data) {
            //        if (_Data == '0') {
            //            HDialog.Info("必须录入至少一条装修附件才能送审");
            //            Flag = false;
            //        }
            //    },
            //    function completeCallback() {
            //    },
            //    function errorCallback() {
            //    }, '', false);
            //if (Flag == true) {
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJson('Renovation', 'SaveRenovationAuditing', $.JQForm.GetStrParam(),
                    function Init() {
                        $("#btnSaveAuditing").attr("disabled", "disabled");
                    },
                    function callback(data) {
                        if (data.result) {
                            Close();
                        } else {
                            HDialog.Info(data.msg);
                        }
                    },
                    function completeCallback() {
                        $("#btnSaveAuditing").removeAttr("disabled");
                    }, function errorCallback() {
                        $("#btnSaveAuditing").removeAttr("disabled");
                    });
            }
            //}
        }
        //审核通过
        function SaveCheckPass() {
            $.tool.DataPostJson('Renovation', 'SaveRenoCheckPass', $.JQForm.GetStrParam(),
                function Init() {
                    $("#btnCheckPass").attr("disabled", "disabled");
                },
                function callback(data) {
                    if (data.result) {
                        Close();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                    $("#btnCheckPass").removeAttr("disabled");
                }, function errorCallback() {
                    $("#btnCheckPass").removeAttr("disabled");
                });
        }
        //审核不通过
        function SaveCheckNoPass() {
            $.tool.DataPostJson('Renovation', 'SaveRenoCheckNoPass', $.JQForm.GetStrParam(),
                function Init() {
                    $("#btnCheckNoPass").attr("disabled", "disabled");
                },
                function callback(data) {
                    if (data.result) {
                        Close();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                    $("#btnCheckNoPass").removeAttr("disabled");
                }, function errorCallback() {
                    $("#btnCheckNoPass").removeAttr("disabled");
                });
        }
        //驳回
        function SaveReturn() {
            $.tool.DataPostJson('Renovation', 'SaveRenoReturn', $.JQForm.GetStrParam(),
                function Init() {
                    $("#btnReturn").attr("disabled", "disabled");
                },
                function callback(data) {
                    if (data.result) {
                        Close();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                    $("#btnReturn").removeAttr("disabled");
                }, function errorCallback() {
                    $("#btnReturn").removeAttr("disabled");
                });
        }

        function Close() {
            HDialog.CloseWindow("", parent.window.name);
        }
    </script>
</body>
</html>
