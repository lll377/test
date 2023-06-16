<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DutyInformartionBasics.aspx.cs" Inherits="M_Main.DutyManage.DutyInformartionBasics" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>值班登记基础信息</title>
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
        .redcolor textarea {
            color: red;
        }

        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        .bootstrap_table tr td.title {
            width: 10%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 40%;
            text-align: left;
        }
    </style>
</head>
<body>
    <input type="hidden" name="ApplicationPath" id="ApplicationPath" runat="server" />
    <form id="mainForm" runat="server">
        
        <div style="padding: 5px">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">基础信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title"><span>项目名称</span></td>
                        <td class="text">
                            <input id="CommName" name="CommName" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',readonly:'readonly', width: '350px'" />
                            <input type="hidden" id="CommID" name="CommID" />
                        </td>
                        <td class="title"><span>岗位名称</span></td>
                        <td class="text">
                            <input id="RoleCode" name="RoleCode" class="easyui-textbox" data-options="prompt: '请单击右侧\'放大镜\'按钮进行操作!', 
                                            editable: false, 
                                            tipPosition: 'bottom', 
                                            required: true, 
                                            multiline: false, 
                                            width: '350px', 
                                            buttonText: '', 
                                            buttonIcon: 'icon-search', 
                                            onClickButton: function () { 
                                                SelRole(); 
                                            },
                                            icons: [{
                                                iconCls: 'icon-clear',
                                                handler: function (e) {
                                                    $(e.data.target).textbox('clear');
                                                }
                                            }]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>值班点位</span></td>
                        <td class="text">
                            <input id="DutyPoint" name="DutyPoint" class="easyui-textbox" data-options="tipPosition:'bottom',required: true,  width: '350px',readonly:'readonly'" />
                        </td>
                        <td class="title"><span>任务来源</span></td>
                        <td class="text">
                            <input id="InfoSource" name="InfoSource" class="easyui-combobox" data-options="editable:false, width: '350px',
                                            tipPosition:'bottom',
                                            required:true,
                                            panelHeight:'auto',
                                            valueField:'id',
                                            required: true, 
                                            textField:'text',
                                            value:'1',
                                            data: [
                                                {id: '1',text: '接班'},
                                                {id: '2',text: '新建'}
                                            ],
                                            onChange:function (newValue,oldValue) { 
                                                SelInfoSource(newValue,oldValue); 
                                            }" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="scheduler-border TaskOver">
                <legend class="scheduler-border">上班交班信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td colspan="4">
                            <table style="width: 100%; height: 70px; text-align: center;" id="LastDutyInfo">
                                <tr>
                                    <th>岗位名称</th>
                                    <th>值班点位</th>
                                    <th>值班人</th>
                                    <th>值班日期</th>
                                    <th>值班班次</th>
                                    <th>开始时间</th>
                                    <th>结束时间</th>
                                    <th>交班异常报告</th>
                                    <%--<th>接班</th>--%>
                                </tr>
                                <tr>
                                    <td><span id="lastRoleName"></span></td>
                                    <td><span id="lastDutyPoint"></span></td>
                                    <td>
                                        <div id="lastDutyUserCode"><a href="#">查看</a></div>
                                    </td>
                                    <td><span id="lastDutyDate"></span></td>
                                    <td><span id="lastDutyShiftsName"></span></td>
                                    <td><span id="lastBeginTime"></span></td>
                                    <td><span id="lastEndTime"></span></td>
                                    <td><span id="lastHandoverAbnormalReport"></span></td>
                                    <%--<td><input class="easyui-checkbox" name="fruit" id="" /></td>--%>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">本班值班信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr class="TaskOver">
                        <td class="title">本班接班确认</td>
                        <td class="text" colspan="3">
                            <input class="easyui-checkbox" name="fruit" id="CheckRegister" data-options="checked: true" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上班交班事项确认无误
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input class="easyui-checkbox" name="fruit" id="CheckMaterial" data-options="checked: true" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上班交班物资确认无误
                        </td>
                    </tr>
                    <tr class="TaskOver">
                        <td class="title">接班异常报告</td>
                        <td class="text" colspan="3">
                            <input id="TakeoverAbnormalReport" name="TakeoverAbnormalReport" class="easyui-textbox" data-options="required:false,
                                            tipPosition:'bottom',multiline:true,width:'91.5%',height:'50px',cls:'redcolor'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>值班人</span></td>
                        <td class="text">
                            <input id="UserCode" name="UserCode" class="easyui-textbox" data-options="prompt: '请单击右侧\'放大镜\'按钮进行操作!', 
                                            editable: false, 
                                            tipPosition: 'bottom', 
                                            required: true, 
                                            multiline: false, 
                                            width: '350px', 
                                            buttonText: '', 
                                            buttonIcon: 'icon-search', 
                                            onClickButton: function () { 
                                                SelUser(); 
                                            },
                                            icons: [{
                                                iconCls: 'icon-clear',
                                                handler: function (e) {
                                                    $(e.data.target).textbox('clear');
                                                }
                                            }]" />
                        </td>
                        <td class="title"><span>值班日期</span></td>
                        <td class="text">
                            <input id="DutyDate" name="DutyDate" class="easyui-datebox" data-options="required:true, width: '350px',
                                            editable:false,
                                            tipPosition:'bottom',
                                            required: true, 
                                            readonly:'readonly',
                                            icons:[{
                                                iconCls:'icon-clear',
                                                handler: function(e){
                                                    $(e.data.target).datebox('clear');
                                                }
                                            }]"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>值班班次</span></td>
                        <td class="text">
                            <input id="DutyShifts" name="DutyShifts" class="easyui-combobox" data-options="editable:false, width: '350px',
                                            tipPosition:'bottom',
                                            required:true,
                                            panelHeight:'auto',
                                            valueField:'id',
                                            required: true, 
                                            textField:'text',
                                            value:'1',
                                            data: [
                                                {id: '1',text: '白班'},
                                                {id: '2',text: '中班'},
                                                {id: '3',text: '夜班'},
                                                {id: '4',text: '行政班'}
                                            ]" />
                        </td>
                        <td class="title"><span>开始时间</span></td>
                        <td class="text">
                            <input id="BeginTime" name="BeginTime" runat="server" class="easyui-datetimebox" data-options=" width: '350px',
                                            editable:false,
                                            readonly:'readonly',
                                            required: true, 
                                            tipPosition:'bottom',
                                            icons:[{
                                                iconCls:'icon-clear',
                                                handler: function(e){
                                                    $(e.data.target).datebox('clear');
                                                }
                                            }]" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">本班交班信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title"><span>是否交班</span></td>
                        <td class="text">
                            <input id="IsHandover" name="IsHandover" class="easyui-combobox" data-options="editable:false, width: '350px',
                                            tipPosition:'bottom',
                                            panelHeight:'auto',
                                            valueField:'id',
                                            textField:'text',
                                            value:'0',
                                            data: [
                                                {id: '1',text: '是'},
                                                {id: '0',text: '否'}
                                            ]" />
                        </td>
                        <td class="title"><span>是否正常</span></td>
                        <td class="text">
                            <input id="IsNormal" name="IsNormal" class="easyui-combobox" data-options="editable:false, width: '350px',
                                            tipPosition:'bottom',
                                            panelHeight:'auto',
                                            valueField:'id',
                                            textField:'text',
                                            value:'',
                                            data: [
                                                {id: '',text: ''},
                                                {id: '1',text: '是'},
                                                {id: '0',text: '否'}
                                            ]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">交班异常报告</td>
                        <td class="text" colspan="3">
                            <input id="HandoverAbnormalReport" name="HandoverAbnormalReport" class="easyui-textbox" data-options="required:false,
                                            tipPosition:'bottom',multiline:true,width:'91.5%',height:'50px',cls:'redcolor'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>结束时间</span></td>
                        <td class="text">
                            <input id="EndTime" name="EndTime" runat="server" class="easyui-datetimebox" data-options=" width: '350px',
                                            editable:false,
                                            readonly:'readonly',
                                            tipPosition:'bottom',
                                            icons:[{
                                                iconCls:'icon-clear',
                                                handler: function(e){
                                                    $(e.data.target).datebox('clear');
                                                }
                                            }]" />
                        </td>
                        <td class="title"><span>下班是否接班</span></td>
                        <td class="text">
                            <input class="easyui-checkbox" name="fruit" id="IsTakeover" data-options="checked: false,disabled:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>附件</span></td>
                        <td class="text" colspan="1">
                            <div id="tdFiles" style="height: 30px;"><a href="#">点击上传文件</a></div>
                        </td>
                    </tr>
                </table>
            </fieldset>

            <fieldset class="scheduler-border audit">
                <legend class="scheduler-border">审核信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title"><span>审核人</span></td>
                        <td class="text">
                             <input id="CheckUserName" name="CheckUser" class="easyui-textbox" data-options="tipPosition:'bottom', width: '350px',readonly:'readonly'" runat="server" />
                             <input id="CheckUser" name="CheckUser" type="hidden" runat="server"/>
                        </td>
                        <td class="title"><span>审核时间</span></td>
                        <td class="text">
                            <input id="CheckTime" name="CheckTime" runat="server" class="easyui-datetimebox" data-options=" width: '350px',
                                            editable:false,
                                            readonly:'readonly',
                                            tipPosition:'bottom',
                                            icons:[{
                                                iconCls:'icon-clear',
                                                handler: function(e){
                                                    $(e.data.target).datebox('clear');
                                                }
                                            }]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">审核意见</td>
                        <td class="text" colspan="3">
                            <input id="CheckRemark" name="CheckRemark" class="easyui-textbox" data-options="required:false,
                                            tipPosition:'bottom',multiline:true,width:'91.5%',height:'50px',cls:'redcolor'"  runat="server"/>
                        </td>
                    </tr>
                </table>
            </fieldset>


        </div>
        <div style="height: 80px;"></div>
        <div class="btnFixed">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="返回" id="btnClose" onclick="Close();" />
        </div>
        <input type="hidden" name="OpType" id="OpType" />
        <input type="hidden" id="ID" name="ID" runat="server" />
        <input type="hidden" id="LastRecordID" name="LastRecordID" />
        <input type="hidden" id="TemplateID" name="TemplateID"/>
    </form>
    <script type="text/javascript">
         //初始化数据
        $(function () {
            InitLoad();
        });
      
        //读取数据
        function InitLoad() {
            var ID = $.getUrlParam("ID");
            $("#ID").val(ID);
              var CommID = $.getUrlParam("CommID");
            $("#CommID").val(CommID);
              var CommNmae = $.getUrlParam("CommNmae");
            $("#CommNmae").textbox('setValue',CommNmae);

            var OpType = $.getUrlParam("OpType");
            $("#OpType").val(OpType);
            $(".audit").hide();

            if (OpType.toLowerCase() == "add") {
                AddOpType(); 
                return;
            } else if (OpType.toLowerCase() == "audit") {
               
                AuditOpType(ID);
            } else if (OpType.toLowerCase() == "detailed") {
                DetailedOpType(ID);
            }
            else {
                EditOpType(ID);
            }

         

        };
       
     
        //初始化 新增数据
        function AddOpType() {
            var CommID = $.getUrlParam("CommID");
            $("#CommID").val(CommID);
            var CommName = $.getUrlParam("CommName");
            $("#CommName").textbox("setValue", CommName);
            //禁用按钮
            AddProhibit();
        }
         //禁用按钮 新增数据
        function AddProhibit() {
            //新增时,禁用按钮
            //交班信息禁用
            $("#IsHandover").combobox('disable', true);
            $("#IsNormal").combobox('disable', true);
            $("#HandoverAbnormalReport").textbox('disable', true);
            $("#EndTime").datetimebox('disable', true);//结束时间
            //初始化结束时间
            $("#EndTime").datetimebox('setValue','');
        }
        //初始化 修改数据
        function EditOpType(ID) {
              $.tool.DataPostJson('Duty', 'GetDutyInformationRegistrationList', 'ID=' + ID + '&page=1&rows=1',
                    function Init() {
                    },
                  function callback(data) {
                      if (data != null && data != undefined && data != "" && data.rows.length>0) {
                            //1=接班，2=新建
                            if (data.rows[0].TaskSource == "1") {
                                  //任务来源
                                if (data.rows[0].TaskSource == "1") {
                                    $("#InfoSource").combobox('setValue', "1");
                                    $("#InfoSource").combobox('setText', "接班");
                                } else if (data.rows[0].TaskSource == "2") {
                                    $("#InfoSource").combobox('setValue', "2");
                                    $("#InfoSource").combobox('setText', "新建");
                                }
                                 //禁用任务来源按钮
                                $("#InfoSource").combobox('disable', true);//任务来源


                                //显示上班交班信息
                                $(".TaskOver").show();

                                GetLastDutyInfo("", data.rows[0].LastRecordID);
                                //上班LastRecordID
                                $("#LastRecordID").val(data.rows[0].LastRecordID);

                                //本班接班确认
                                if (data.rows[0].CheckRegister == "1")
                                    $('#CheckRegister').checkbox("check");
                                else
                                    $('#CheckRegister').checkbox("uncheck");
                                if (data.rows[0].CheckMaterial == "1")
                                    $('#CheckMaterial').checkbox("check");
                                else
                                    $('#CheckMaterial').checkbox("uncheck");

                                //接班异常报告
                                $("#TakeoverAbnormalReport").textbox('setValue',data.rows[0].TakeoverAbnormalReport);

                                 
                            } else {
                                //隐藏上班交班信息
                                $(".TaskOver").hide();
                            }
                            //值班基础信息
                            $("#CommID").val(data.rows[0].CommID);
                            $("#CommName").textbox('setValue', data.rows[0].CommName);
                            $("#RoleCode").textbox('setValue', data.rows[0].RoleCode);
                            $("#RoleCode").textbox('setText', data.rows[0].RoleName);
                            $("#DutyPoint").textbox('setValue', data.rows[0].DutyPoint);
                            if ($("#OpType").val().toLowerCase() != "add") {
                                $("#InfoSource").combobox('setValue', data.rows[0].TaskSource);
                            }
                            //本班值班信息 
                            $("#UserCode").textbox('setValue', data.rows[0].DutyUserCode);
                            $("#UserCode").textbox('setText', data.rows[0].DutyUserName);
                            $("#DutyDate").datebox('setValue', data.rows[0].DutyDate);
                            $("#DutyShifts").combobox('setValue', data.rows[0].DutyShifts);
                            $("#BeginTime").datetimebox('setValue', data.rows[0].BeginTime);

                            //本班交班信息 
                            $("#IsHandover").combobox('setValue', data.rows[0].IsHandover);
                            $("#IsNormal").combobox('setValue', data.rows[0].IsNormal);
                            $("#HandoverAbnormalReport").textbox('setValue', data.rows[0].HandoverAbnormalReport);
                            $("#EndTime").datetimebox('setValue', data.rows[0].EndTime);
                            //下班是否接班
                            if (data.rows[0].IsTakeover == "1")
                                $("#IsTakeover").checkbox({ checked: true });
                            else
                                $("#IsTakeover").checkbox({ checked: false });

                            //附件 tdFiles
                            var html = "";
                            html = "<a href=\"#\" onclick=\"SearchDutyFileInfo()\">上传附件</a>";
                            $("#tdFiles").html(html);

                            //修改时禁用按钮 
                            $("#InfoSource").combobox('disable', true);//任务来源
                            $("#DutyShifts").combobox('disable', true);//值班班次
                            $("#CommName").textbox('disable', true);//项目
                            $("#RoleCode").textbox('disable', true);//岗位
                            $("#DutyPoint").textbox('disable', true);//点位
                            $("#DutyDate").datebox('disable', true);//值班日期
                            $("#BeginTime").datetimebox('disable', true);//开始时间
                            //已交班
                            if (data.rows[0].IsHandover == "1") {
                                //上班交班异常确认,禁用
                                $("#CheckRegister").checkbox('disable', true);
                                $("#CheckMaterial").checkbox('disable', true);
                                $("#TakeoverAbnormalReport").textbox('disable', true);
                                //值班人禁用
                                $("#UserCode").textbox('disable', true);//值班人
                                //交班信息禁用
                                $("#IsHandover").combobox('disable', true);
                                $("#IsNormal").combobox('disable', true);
                                $("#HandoverAbnormalReport").textbox('disable', true);
                                $("#EndTime").datetimebox('disable', true);//结束时间
                            }
                            ////启用值班登记事项明细按钮
                            //$('#tab').tabs('enableTab', 1);
                            //$('#tab').tabs('enableTab', 2);
                            //$('#tab').tabs('enableTab', 3);

                            //隐藏保存按钮
                            if ($("#EndTime").datetimebox('getValue') != "") {
                                $("#btnSave").hide();
                            }

                            //审核信息
                            if ($("#OpType").val().toLowerCase() == "audit") {
                                if (data.rows[0].CheckUser != "") {
                                    $("#CheckUser").val(data.rows[0].CheckUser);
                                    $("#CheckUserName").textbox('setValue', data.rows[0].CheckUserName);
                                    $("#CheckTime").datetimebox('setValue', data.rows[0].CheckTime);
                                    $("#CheckRemark").textbox('setValue', data.rows[0].CheckRemark);
                                }
                                $(".audit").show();
                                if (data.rows[0].IsCheckName == "已审核") {
                                    $("#btnSave").hide();
                                    $("#CheckUserName").textbox('disable', true);
                                    $("#CheckTime").datetimebox('disable', true);
                                    $("#CheckRemark").textbox('disable', true);
                                } else {
                                    $("#btnSave").show();
                                }
                            } 
                        
                      }
                  },
                  function completeCallback() {
                  }, function errorCallback() {
                  });
        }

        //初始化 异常审核
        function AuditOpType(ID) {
            EditOpType(ID);
            $("#btnSave").val("审核");
            $(".audit").show();
        }
          //初始化 详情数据
        function DetailedOpType(ID) {
              $.tool.DataPostJson('Duty', 'GetDutyInformationRegistrationList', 'ID=' + ID + '&page=1&rows=1',
                    function Init() {
                    },
                  function callback(data) {
                      if (data != null && data != undefined && data != "" && data.rows.length>0) {
                            //1=接班，2=新建
                            if (data.rows[0].TaskSource == "1") {
                                  //任务来源
                                if (data.rows[0].TaskSource == "1") {
                                    $("#InfoSource").combobox('setValue', "1");
                                    $("#InfoSource").combobox('setText', "接班");
                                } else if (data.rows[0].TaskSource == "2") {
                                    $("#InfoSource").combobox('setValue', "2");
                                    $("#InfoSource").combobox('setText', "新建");
                                }
                                 //禁用任务来源按钮
                                $("#InfoSource").combobox('disable', true);//任务来源


                                //显示上班交班信息
                                $(".TaskOver").show();

                                GetLastDutyInfo("", data.rows[0].LastRecordID);
                                //上班LastRecordID
                                $("#LastRecordID").val(data.rows[0].LastRecordID);

                                //本班接班确认
                                if (data.rows[0].CheckRegister == "1")
                                    $('#CheckRegister').checkbox("check");
                                else
                                    $('#CheckRegister').checkbox("uncheck");
                                if (data.rows[0].CheckMaterial == "1")
                                    $('#CheckMaterial').checkbox("check");
                                else
                                    $('#CheckMaterial').checkbox("uncheck");

                                //接班异常报告
                                $("#TakeoverAbnormalReport").textbox(data.rows[0].TakeoverAbnormalReport);

                                 
                            } else {
                                //隐藏上班交班信息
                                $(".TaskOver").hide();
                            }
                            //值班基础信息
                            $("#CommID").val(data.rows[0].CommID);
                            $("#CommName").textbox('setValue', data.rows[0].CommName);
                            $("#RoleCode").textbox('setValue', data.rows[0].RoleCode);
                            $("#RoleCode").textbox('setText', data.rows[0].RoleName);
                            $("#DutyPoint").textbox('setValue', data.rows[0].DutyPoint);
                            if ($("#OpType").val().toLowerCase() != "add") {
                                $("#InfoSource").combobox('setValue', data.rows[0].TaskSource);
                            }
                            //本班值班信息 
                            $("#UserCode").textbox('setValue', data.rows[0].DutyUserCode);
                            $("#UserCode").textbox('setText', data.rows[0].DutyUserName);
                            $("#DutyDate").datebox('setValue', data.rows[0].DutyDate);
                            $("#DutyShifts").combobox('setValue', data.rows[0].DutyShifts);
                            $("#BeginTime").datetimebox('setValue', data.rows[0].BeginTime);

                            //本班交班信息 
                            $("#IsHandover").combobox('setValue', data.rows[0].IsHandover);
                            $("#IsNormal").combobox('setValue', data.rows[0].IsNormal);
                            $("#HandoverAbnormalReport").textbox('setValue', data.rows[0].HandoverAbnormalReport);
                            $("#EndTime").datetimebox('setValue', data.rows[0].EndTime);
                            //下班是否接班
                            if (data.rows[0].IsTakeover == "1")
                                $("#IsTakeover").checkbox({ checked: true });
                            else
                                $("#IsTakeover").checkbox({ checked: false });

                            //附件 tdFiles
                            var html = "";
                            html = "<a href=\"#\" onclick=\"SearchDutyFileInfo()\">上传附件</a>";
                            $("#tdFiles").html(html);

                            //修改时禁用按钮 
                            $("#InfoSource").combobox('disable', true);//任务来源
                            $("#DutyShifts").combobox('disable', true);//值班班次
                            $("#CommName").textbox('disable', true);//项目
                            $("#RoleCode").textbox('disable', true);//岗位
                            $("#DutyPoint").textbox('disable', true);//点位
                            $("#DutyDate").datebox('disable', true);//值班日期
                            $("#BeginTime").datetimebox('disable', true);//开始时间
                            //已交班
                            if (data.rows[0].IsHandover == "1") {
                                //上班交班异常确认,禁用
                                $("#CheckRegister").checkbox('disable', true);
                                $("#CheckMaterial").checkbox('disable', true);
                                $("#TakeoverAbnormalReport").textbox('disable', true);
                                //值班人禁用
                                $("#UserCode").textbox('disable', true);//值班人
                                //交班信息禁用
                                $("#IsHandover").combobox('disable', true);
                                $("#IsNormal").combobox('disable', true);
                                $("#HandoverAbnormalReport").textbox('disable', true);
                                $("#EndTime").datetimebox('disable', true);//结束时间
                            }
                            ////启用值班登记事项明细按钮
                            //$('#tab').tabs('enableTab', 1);
                            //$('#tab').tabs('enableTab', 2);
                            //$('#tab').tabs('enableTab', 3);

                            //隐藏保存按钮
                            if ($("#EndTime").datetimebox('getValue') != "") {
                                $("#btnSave").hide();
                            }

                            //审核信息
                            if ($("#OpType").val().toLowerCase() == "audit") {
                                if (data.rows[0].CheckUser != "") {
                                    $("#CheckUser").val(data.rows[0].CheckUser);
                                    $("#CheckUserName").textbox('setValue', data.rows[0].CheckUserName);
                                    $("#CheckTime").datetimebox('setValue', data.rows[0].CheckTime);
                                    $("#CheckRemark").textbox('setValue', data.rows[0].CheckRemark);
                                }
                                $(".audit").show();
                                if (data.rows[0].IsCheckName == "已审核") {
                                    $("#btnSave").hide();
                                    $("#CheckUserName").textbox('disable', true);
                                    $("#CheckTime").datetimebox('disable', true);
                                    $("#CheckRemark").textbox('disable', true);
                                } else {
                                    $("#btnSave").show();
                                }
                            } 
                           $("#btnSave").hide();
                           $("#btnClose").hide();
                          $("input,select,textarea").each(function () {
                              var key = $(this).attr("id");
                              if (key != "" && key != "__VIEWSTATE" && key != null) {

                                  if ($(this).hasClass("easyui-datebox") == true) {
                                       $(this).datebox('disable', true);
                                  }
                                  else if ($(this).hasClass("easyui-combotree") == true) {
                                      $(this).combotree('disable', true);
                                  } else if ($(this).hasClass("easyui-datetimebox") == true) {
                                      $(this).datetimebox('disable', true);
                                  } else if ($(this).hasClass("easyui-textbox") == true) {
                                      $(this).textbox('disable', true);
                                  }else if ($(this).hasClass("easyui-combobox") == true) {
                                      $(this).combobox('disable', true);
                                  }
                                 
                              }
                          });



                      }
                  },
                  function completeCallback() {
                  }, function errorCallback() {
                  });
        }


        //获取上次值班信息
        function GetLastDutyInfo(TemplateID, LastRecordID) {
            $.tool.DataPostJson('Duty', 'GetDutyInformationRegistrationList', 'ID=' + LastRecordID + '&ProjectTemplateID=' + TemplateID + '&IsHandover=1' + '&page=1&rows=1',
                function Init() { },
                function callback(data) {
                    if (data.rows.length > 0) {
                        console.log(data);
                        //上班RecordID
                        $("#LastRecordID").val(data.rows[0].ID);

                        //上班交班信息
                        var DutyUserName = data.rows[0].DutyUserName;
                        var url = "<a href=\"#\" onclick=\"SearchDutyUserInfo(" + data.rows[0].DutyUserCode + ")\">"+DutyUserName+"</a>";
                        
                        $("#lastRoleName").text(data.rows[0].RoleName);
                        $("#lastDutyPoint").text(data.rows[0].DutyPoint);
                        $("#lastDutyUserCode").html(url);//值班人详情
                        $("#lastDutyDate").text(data.rows[0].DutyDate);
                        $("#lastDutyShiftsName").text(data.rows[0].DutyShiftsName);
                        $("#lastBeginTime").text(data.rows[0].BeginTime);
                        $("#lastEndTime").text(data.rows[0].EndTime);
                        $("#lastHandoverAbnormalReport").text(data.rows[0].HandoverAbnormalReport);

                        if ($("#OpType").val().toLowerCase() == "add") {
                            $("#InfoSource").combobox({
                                value: '1',
                                data: [{ id: '1', text: '接班' }]
                            });
                        }

                    } else {
                        $(".TaskOver").hide();
                        $("#InfoSource").combobox({
                            value: '2',
                            data: [{ id: '2', text: '新建' }]
                        });
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        //保存基本信息
        function Save() {
            var urlParam = "";

            var LastRecordID = $("#LastRecordID").val();
            var ID = $("#ID").val();
            var OpType = $("#OpType").val();
            var ProjectTemplateID = $("#TemplateID").val();
            var CommID = $("#CommID").val();
            var RoleCode = $("#RoleCode").textbox('getValue');
            var DutyPoint = $("#DutyPoint").textbox('getText');
            var TaskSource = $("#InfoSource").combobox('getValue');
            var DutyUserCode = $("#UserCode").textbox('getValue');
            var DutyShifts = $("#DutyShifts").combobox('getValue');
            var DutyDate = $("#DutyDate").datebox('getValue');
            var IsHandover = $("#IsHandover").combobox('getValue');
            var IsNormal = $("#IsNormal").combobox('getValue');
            var EndTime = $("#EndTime").datetimebox('getValue');
            var BeginTime = $("#BeginTime").datetimebox('getValue');
            var HandoverAbnormalReport = $("#HandoverAbnormalReport").textbox('getValue');

            var CheckRegister = $("#CheckRegister").checkbox('options').checked == true ? 1 : 0;
            var CheckMaterial = $("#CheckMaterial").checkbox('options').checked == true ? 1 : 0;
            var TakeoverAbnormalReport = $("#TakeoverAbnormalReport").textbox('getValue');

            var CheckUser = $("#CheckUser").val();
            var CheckTime= $("#CheckTime").datetimebox('getValue');
            var CheckRemark= $("#CheckRemark").textbox('getValue');

            //任务来源,新建 1=接班,2=新建
            if (TaskSource == "1") {

                if (CheckRegister == 0 || CheckMaterial == 0) {
                    if (TakeoverAbnormalReport == "") {
                        HDialog.Info("本班确认有异常时,异常报告必填!");
                        return;
                    }
                } else {
                    TakeoverAbnormalReport = "";
                }
            }
            if (DutyUserCode == "") {
                HDialog.Info("值班人不能为空");
                return;
            }

            if (OpType.toLowerCase() == "add") {
                urlParam = $.param(
                    {
                        "ID": ID,"OpType": OpType, "ProjectTemplateID": ProjectTemplateID, "CommID": CommID, "LastRecordID": LastRecordID,
                        "RoleCode": RoleCode, "DutyPoint": DutyPoint,
                        "TaskSource": TaskSource, "DutyUserCode": DutyUserCode,
                        "DutyShifts": DutyShifts, "DutyDate": DutyDate,"BeginTime":BeginTime,
                        "CheckRegister": CheckRegister, "CheckMaterial": CheckMaterial, "TakeoverAbnormalReport": TakeoverAbnormalReport
                    }
                );
                SaveUp(urlParam, IsHandover, IsNormal, EndTime, HandoverAbnormalReport);
            } else if (OpType.toLowerCase() == "audit") {
                 urlParam = $.param(
                    {
                        "OpType": OpType, "ID": ID, "CheckUser": CheckUser, "CheckTime": CheckTime,"CheckRemark":CheckRemark
                    }
                );
                 SaveUp(urlParam, IsHandover, IsNormal, EndTime, HandoverAbnormalReport);
            }
            else {
                if (IsNormal == "0") {
                    if (HandoverAbnormalReport == "") {
                        HDialog.Info("交班是否正常为否时,交班异常报告必填");
                        return;
                    }
                }
                if (IsNormal != "") {
                    urlParam = $.param({
                        "ID": ID, "IsNormal": IsNormal
                    });
                    $.tool.DataPostJson('Duty', 'CheckHandoverPhotograph', urlParam,
                        function Init() {
                        },
                        function callback(data) {
                            if (!data.result) {
                                $.messager.alert("温馨提示", data.msg);
                                return false;
                            }
                            urlParam = $.param(
                                {
                                    "ID": ID, "DutyUserCode": DutyUserCode, "IsHandover": IsHandover,
                                    "IsNormal": IsNormal, "EndTime": EndTime,
                                    "HandoverAbnormalReport": HandoverAbnormalReport, "TaskSource": TaskSource,
                                    "OpType": OpType, "CheckRegister": CheckRegister, "CheckMaterial": CheckMaterial
                                    , "TakeoverAbnormalReport": TakeoverAbnormalReport
                                }
                            );
                            SaveUp(urlParam, IsHandover, IsNormal, EndTime, HandoverAbnormalReport);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }
        }

        function SaveUp(urlParam, IsHandover, IsNormal, EndTime, HandoverAbnormalReport) {
            $.tool.DataPostJson('Duty', 'SaveDutyInformationRegistration', urlParam,
                function Init() {
                },
                function callback(data) {
                    $.messager.alert("温馨提示", data.msg);
                    if (data.result) {
                        
                        if ($("#OpType").val().toLowerCase() == "audit") {
                            $("#CheckUserName").textbox('disable', true);
                            $("#CheckTime").datetimebox('disable', true);
                            $("#CheckRemark").textbox('disable', true);
                            $("#btnSave").attr("type","hidden");
                        } else {
                            $("#OpType").val("Edit");

                            var nowDate = new Date().Format("yyyy-MM-dd HH:mm:ss");
                            if (IsHandover == "1" && IsNormal != "") {

                                $("#IsHandover").combobox('setValue', IsHandover);
                                $("#IsNormal").combobox('setValue', IsNormal);
                                $("#EndTime").datetimebox('setValue', nowDate);
                                $("#HandoverAbnormalReport").textbox('setValue', HandoverAbnormalReport);

                                $("#IsHandover").combobox('disable', true);
                                $("#IsNormal").combobox('disable', true);
                                $("#HandoverAbnormalReport").textbox('disable', true);
                                $("#EndTime").datetimebox('disable', true);//结束时间

                            } else {
                                //交班信息 启用
                                $("#IsHandover").combobox({ disabled: false });
                                $("#IsNormal").combobox({ disabled: false });
                                $("#HandoverAbnormalReport").combobox({ disabled: false });
                                $("#BeginTime").datetimebox('setValue', nowDate);
                            }


                            $("#ID").val(data.data);

                            //禁用任务来源按钮
                            $("#CommName").textbox('disable', true);//项目名称   
                            $("#RoleCode").textbox('disable', true);//项目名称   
                            $("#DutyPoint").textbox('disable', true);//项目名称   
                            $("#InfoSource").combobox('disable', true);//任务来源   
                            $("#DutyDate").datebox('disable', true);//任务来源   
                            $("#BeginTime").datetimebox('disable', true);//任务来源   
                            $("#DutyShifts").combobox('disable', true);//任务来源   

                            //附件 tdFiles
                            var html = "";
                            html = "<a href=\"#\" onclick=\"SearchDutyFileInfo()\">上传附件</a>";
                            $("#tdFiles").html(html);
                        }
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

            //新建/接班切换
        function SelInfoSource(newValue, oldValue) {
            if (newValue == '1') {
                $(".TaskOver").show();
            } else {
                $(".TaskOver").hide();
            }
        }
       
        //选择岗位
        function SelRole() {
            var OpType = $("#OpType").val();
            if (OpType.toLowerCase == "add") {
                HDialog.Info("当前不可修改岗位");
                return false;
            }

            HDialog.Open('500', '450', '../DutyManage/SelProjectTemplate.aspx?CommId=' + $("#CommID").val(), '选择岗位', true, function callback(data) {
                if (isValueNull(data)) {
                    var str = JSON.parse(data);
                    $("#TemplateID").val(str.ID);
                    $("#RoleCode").textbox('setValue', str.RoleCode);
                    $("#RoleCode").textbox('setText', str.RoleName);
                    $("#DutyPoint").textbox('setText', str.DutyPoint);
                    GetLastDutyInfo(str.ID, "");
                }
            });
        }

        //选择值班人员
        function SelUser() {
            var RoleCode = $("#RoleCode").textbox('getValue');
            if (RoleCode == undefined || RoleCode == '') {
                HDialog.Info("请先选择岗位");
                return;
            }
            HDialog.Open('650', '600', '../DutyManage/SelUser.aspx?RoleCode=' + RoleCode, '选择值班人', false, function callback(_Data) {
                if (_Data) {
                    $("#UserCode").textbox('setValue', _Data.split(';')[1]);
                    $("#UserCode").textbox('setText', _Data.split(';')[0]);
                };
            })
        }

      
           //值班人详情
        function SearchDutyUserInfo(ID) {
            console.log(ID);
               var urlParam = $.param({ "OpType": "Detail", "ID": ID});
                var h = $(window).height()-100;
            var w = $(window).width();
            console.log(urlParam);
                HDialog.OpenWin(w, h, '../DutyManage/DutyInformationRegistrationDetail.aspx?' + urlParam, '值班详情', true, function callback(data) {
            });
        }
        //附件详情
        function SearchDutyFileInfo() {
            var RecordID = $("#ID").val();
            var OpType = $("#OpType").val();
            var IsHandover = $("#EndTime").datetimebox('getValue');
            HDialog.Open('1000', '450', '../DutyManage/DutyFile.aspx?RecordID=' + RecordID + '&IsHandover=' + IsHandover+'&OpType='+OpType, '附件详情', true, function callback(data) {
            });
        }
         //关闭页面
        function Close() {
            HDialog.Close();
        }
        //格式化时间
          Date.prototype.Format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份 
                "d+": this.getDate(), //日 
                "H+": this.getHours(), //小时 
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
    </script>
</body>
</html>

