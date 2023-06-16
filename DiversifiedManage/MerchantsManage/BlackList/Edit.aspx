<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.BlackList.Edit" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>黑名单</title>
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
    <input type="hidden" id="Sort" name="Sort" value="0" />
    <input type="hidden" id="OpType" name="OpType" />
    <form id="mainForm" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">办理信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">办理类别</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="Type" class="control-content">加入黑名单</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">办理时间</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="AddTime" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">经办人</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="AddUserId" class="control-content" runat="server"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                <div class="col-sm-11 col-xs-11">
                    <input type="hidden" id="MerchantsID" name="MerchantsID" />
                    <input id="MerchantsName" name="MerchantsName" class="easyui-textbox" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">办理原因</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="Reason" name="Reason" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',multiline:true,width:'100%',height:'100px'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">备注</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="Remark" name="Remark" class="easyui-textbox" data-options="tipPosition:'bottom',multiline:true,width:'100%',height:'100px'" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12 col-xs-12 control-btn">
                    <input type="hidden" name="ID" id="ID" runat="server" />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
                </div>
            </div>
        </fieldset>
    </form>
    <%--<div style="height: 30px"></div>
    <div class="btn_fixed">
        <input type="hidden" name="ID" id="ID" runat="server" />
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
        <button type="button" class="btn btn-sm btn-success" id="btnSave" style="width: 100px" onclick="Save();">
            <span class="glyphicon glyphicon-ok"></span>&emsp;保&nbsp;存
        </button>
        <button type="button" class="btn btn-sm btn-danger" id="btnClose" style="width: 100px" onclick="Close();">
            <span class="glyphicon glyphicon-off"></span>&emsp;关&nbsp;闭
        </button>
    </div>--%>
    <script type="text/javascript">
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
            $("#AddTime").html($.dateFormat(new Date()));
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            var MerchantsID = $.getUrlParam("MerchantsID");
            var MerchantsName = $.getUrlParam("MerchantsName");
            $("#OpType").val(OpType);
            InitControl();
            var param = {};
            if (OpType == "Remove") {
                $("#Type").html("移除黑名单");
                $("#ID").val(ID);
                $("#MerchantsID").val(MerchantsID);
                param = {
                    prompt: '请单击右侧\'放大镜\'按钮进行操作!',
                    editable: false,
                    disabled: true,
                    tipPosition: 'bottom',
                    required: true,
                    multiline: true,
                    height: 130,
                    value: MerchantsName,
                    width: '100%'
                };
                $("#Reason").textbox({ height: 50 });
                $("#Remark").textbox({ height: 50 });
            } else {
                param = {
                    prompt: '请单击右侧\'放大镜\'按钮进行操作!',
                    editable: false,
                    tipPosition: 'bottom',
                    required: true,
                    multiline: false,
                    width: '100%',
                    buttonText: '', buttonIcon: 'icon-search', onClickButton: function () { SelMerchants(); },
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).textbox('clear');
                            $('#MerchantsID').val('');
                        }
                    }]
                }
            }
            $("#MerchantsName").textbox(param);
        }

        function InitControl() {


        }
        function Save() {
            if ($('#mainForm').form("validate")) {
                var param = $.getParam();
                param.Type = $("#Type").html();
                $.dataPostJson('DivfManage_BlackList', 'Save', param, true, false,
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
