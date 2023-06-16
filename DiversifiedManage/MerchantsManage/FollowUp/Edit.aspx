<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.FollowUp.Edit" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>客商跟进</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        
    </style>
</head>
<body>
    <input type="hidden" id="OpType" name="OpType" />
    <form id="mainForm" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客商跟进信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">序号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true,tipPosition:'bottom',value:'0'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                <div class="col-sm-5 col-xs-5">
                    <input type="hidden" id="MerchantsID" name="MerchantsID" />
                    <input id="MerchantsName" name="MerchantsName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelMerchants();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#MerchantsID').val('');
                            }}] " />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">跟进阶段</label>
                <div class="col-sm-5 col-xs-5">
                    <input type="hidden" id="FollowUpStageID" name="FollowUpStageID" />
                    <input id="FollowUpStageName" name="FollowUpStageName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary('跟进阶段');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#FollowUpStageID').val('');
                            }}] " />
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">跟进时间</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="FollowUpTime" name="FollowUpTime" class="easyui-datebox" data-options="required:true,tipPosition:'bottom',editable:false,
                            icons:[{
                                iconCls:'icon-clear',
                                handler: function(e){
                                $(e.data.target).textbox('clear');
                                }
                            }]" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">客户对接人</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ConnectPeople" name="ConnectPeople" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">对接人职位</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ConnectPost" name="ConnectPost" class="easyui-textbox" data-options="required:false,tipPosition:'bottom'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">对接人电话</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ConnectPhone" name="ConnectPhone" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">跟进内容</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="Content" name="Content" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',multiline:true,width:'100%',height:'100px'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">后续建议</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="Propose" name="Propose" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',multiline:true,width:'100%',height:'100px'" />
                </div>
            </div>
        </fieldset>
        <div class="form-group">
            <div class="col-sm-12 col-xs-12 control-btn">
                <input type="hidden" name="ID" id="ID" runat="server" />
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function SelDictionary(type) {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": type }), '选择' + type, true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#FollowUpStageID").val(data.ID);
                    $("#FollowUpStageName").textbox('setValue', data.Name);
                }
            });
        }
        function SelMerchants() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Merchants.aspx?' + $.param({ "IsCheckbox": "否" }), '选择客商', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#MerchantsID").val(data.ID);
                    $("#MerchantsName").textbox('setValue', data.MerchantsName);
                    $("#ConnectPeople").textbox('setValue', data.ChargePeople);
                    $("#ConnectPhone").textbox('setValue', data.ChargePeoplePhoneNo);
                }
            });
        }

        $(function () {
            InitPage();
        });

        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            $("#OpType").val(OpType);
            InitControl();
            if (OpType == "Edit") {
                $("#ID").val(ID);
                InitData();
            } else {
                $("#FollowUpTime").datebox('setValue', $.dateFormat(new Date()));
            }
        }

        function InitControl() {

        }
        function InitData() {
            $.dataPostJson('DivfManage_MerchantsFollowUp', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.dataPostJson('DivfManage_MerchantsFollowUp', 'Save', $.getParam(), true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $('#mainForm').form('clear');
                            Close();
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }
        function Close() {
            LayerDialog.Close();
        }
    </script>
</body>
</html>
