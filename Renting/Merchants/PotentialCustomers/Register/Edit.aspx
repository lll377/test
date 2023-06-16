<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Merchants.PotentialCustomers.Register.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-招商管理-商机管理-商机登记编辑页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <style type="text/css">
        .tabs-header {
            background-color: white;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
        <div id="tab0" data-issel="true" title="客户基本信息" style="overflow: auto;">
            <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">潜在客户信息</legend>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">客户类别</label>
                        <div class="col-sm-4 col-xs-4">
                            <input id="CustTypeName" name="CustTypeName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCustType();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#CustTypeID').val('');
                                    }}] " />
                            <input type="hidden" id="CustTypeID" name="CustTypeID" runat="server" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">单位/个人客户</label>
                        <div class="col-sm-4 col-xs-4">
                            <input id="UnitType" name="UnitType" class="easyui-combobox"
                                data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',multiple:false,
                                    valueField:'id',textField:'text',data: [
                                    {id: '个人',text: '个人'},
                                    {id: '单位',text: '单位'}],onChange:UnitTypeChange"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">客户名称</label>
                        <div class="col-sm-4 col-xs-4">
                            <input id="CustName" name="CustName" class="easyui-textbox" data-options="prompt:'可输入、可选正式客户!',editable:true,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCust();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                        $(e.data.target).textbox('clear');
                                        $('#CustID').val('');
                                    }}]" />
                            <input type="hidden" id="CustID" name="CustID" runat="server" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">证件名称</label>
                        <div class="col-sm-4 col-xs-4">
                            <input id="PaperName" name="PaperName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelPaperName();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#PaperNameID').val('');
                                    }}] " />
                            <input type="hidden" id="PaperNameID" name="PaperNameID" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">证件号码</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="PaperCode" name="PaperCode" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:true" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">联系地址</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="Address" name="Address" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">法定代表人</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="LegalRepr" name="LegalRepr" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">法定代表人电话</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="LegalReprTel" name="LegalReprTel" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">联系人</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="ConnectPeople" name="ConnectPeople" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:true" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">联系人电话</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="ConnectPeopleTel" name="ConnectPeopleTel" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">邮政编码</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="PostCode" name="PostCode" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:false" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">电子邮箱</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="EMail" name="EMail" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:false" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">客户经营业态</label>
                        <div class="col-sm-4 col-xs-4">
                            <input id="TradeStateName" name="TradeStateName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelTradeState();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#TradeStateID').val('');
                                    }}] " />
                            <input type="hidden" id="TradeStateID" name="TradeStateID" runat="server" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">客户经营范围</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="BusinessScope" name="BusinessScope" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:false" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">客户经营品牌</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="BusinessBrand" name="BusinessBrand" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:false" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">客户经营级别</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="BusinessLevel" name="BusinessLevel" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',width:'100%',required:false" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">备注</label>
                        <div class="col-sm-10 col-xs-10">
                            <input id="Remark" name="Remark" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">潜在客户分派</legend>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">跟进人</label>
                        <div class="col-sm-4 col-xs-4">
                            <input id="FollowUpUserName" name="FollowUpUserName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelFollowUpUser();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#FollowUpUserCode').val('');
                                    }}] " />
                            <input type="hidden" id="FollowUpUserCode" name="FollowUpUserCode" runat="server" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">分派人</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="AssignUserName" name="AssignUserName" class="easyui-textbox"
                                data-options="tipPosition:'bottom',width:'100%',disabled:true,prompt:'分派后自动生成'" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">分派时间</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="AssignTime" name="AssignTime" class="easyui-textbox"
                                data-options="tipPosition:'bottom',width:'100%',disabled:true,prompt:'分派后自动生成'" runat="server" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">分派备注</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="AssignRemark" name="AssignRemark" class="easyui-textbox"
                                data-options="tipPosition:'bottom',width:'100%'" runat="server" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">附件信息</legend>
                    <div class="form-group">
                        <div class="col-sm-12 col-xs-12" style="padding-left: 10px">
                            <div id="fileForm">
                                <input type="hidden" name="FileType" id="FileType" />
                                <input type="hidden" name="FilePath" id="FilePath" />
                                <input type="hidden" name="FileCode" id="FileCode" />
                                <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="required:false,width:'200px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                                <input id="FileRemark" name="FileRemark" class="easyui-textbox" data-options="required:false,width:'250px',prompt:'文件备注(选填)',icons:[{
                                                    iconCls:'icon-clear',
                                                    handler: function(e){
                                                    $(e.data.target).textbox('clear');
                                                    }}] " />
                                <a href="javascript:void(0)" id="FileUpload" onclick="SaveFile()" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80">上传</a>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 col-xs-12" style="padding: 0; padding-left: 10px">
                            <ul class="ul_annex_list" id="list_file"></ul>
                        </div>
                    </div>
                </fieldset>
            </form>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                    <a href="javascript:void(0)" id="PageCloseBtn" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
                </div>
            </div>
        </div>
        <div id="tab1" data-issel="false" title="客户分派信息" style="overflow: hidden;">
            <div style="width: 100%; background-color: #cccccc;" id="TableContainerAssign"></div>
        </div>
        <div id="tab2" data-issel="false" title="客户跟进信息" style="overflow: hidden;">
            <div style="width: 100%; background-color: #cccccc;" id="TableContainerFollowUp"></div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //设置高度
            let h = $(window).height();
            let w = $(window).width();
            $('#tab').css("height", h + 'px');
            $('#tab0,#tab1,#tab1').css("height", h - $('.tabs-header').height() + 'px');
            $('#mainForm').css("height", h - 65 - $('.tabs-header').height() + "px");
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            InitPage();
        });

        //主页面切换
        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //客户分派信息
                    setTimeout(function () {
                        LoadAssignGrid();
                    }, 300);
                } else if (index == 2) {
                    //客户跟进信息
                    setTimeout(function () {
                        LoadFollowUpGrid();
                    }, 300);
                }
            }
        }
        function InitPage() {
            let param = $.getUrlParam();
            if (!!param.ID) {
                $("#ID").val(param.ID);
            }
            if (!!param.OpType) {
                $("#OpType").val(param.OpType);
            }
            let OpType = $("#OpType").val();
            if (OpType == "edit" || OpType == "Detail") {
                InitData();
            } else {
                //初始化 单位/个人客户 为个人
                $('#UnitType').combobox("setValue", "个人");
            }

        }

        //选择客户类别
        function SelCustType() {
            var param = {
                IsMultiple: "否"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/CustomerTypeSelect.aspx?' + $.param(param), "选择客户类别", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#CustTypeID").val(data[0].CustTypeID);
                    $("#CustTypeName").textbox("setValue", data[0].CustTypeName);
                }
            });
        }

        //切换单位还是个人客户
        function UnitTypeChange(record) {
            if (record == "个人") {
                $('#LegalRepr').textbox({ disabled: true, value: '' });
                $('#LegalReprTel').textbox({ disabled: true, value: '' });
            } else {
                $('#LegalRepr').textbox({ disabled: false });
                $('#LegalReprTel').textbox({ disabled: false });
            }
        }
        //选择正式客户
        function SelCust() {
            if ($('#OpType').val() == "edit") {
                $.messager.alert('温馨提示', '修改时不允许选择客户!');
                return;
            }
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DialogNew/CustDlg.aspx', "选择正式客户", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $('#CustName').textbox("setValue", data.CustName);//客户名称
                    $("#CustID").val(data.CustID);//客户ID
                    //默认加载正式客户信息
                    $("#CustTypeID").val(data.CustTypeID); //客户类别ID
                    $("#CustTypeName").textbox("setValue", data.CustTypeName); //客户类别名称
                    //单位/个人客户
                    if (data.IsUnit == "0") {
                        $('#UnitType').combobox("setValue", "个人");
                    } else if (data.IsUnit == "1") {
                        $('#UnitType').combobox("setValue", "单位");
                        //加载法定代表人
                        $('#LegalRepr').textbox("setValue", data.LegalRepr);
                        //法定代表人联系电话
                        $('#LegalReprTel').textbox("setValue", data.LegalReprTel);
                    }
                    //$('#PaperName').textbox("setValue", data.PaperName)//证件名称
                    $('#PaperCode').textbox("setValue", data.PaperCode);//证件号码
                    $('#Address').textbox("setValue", data.Address);//联系地址
                    $('#ConnectPeople').textbox("setValue", data.Recipient);//联系人
                    $('#ConnectPeopleTel').textbox("setValue", data.MobilePhone);//联系人电话
                    $('#PostCode').textbox("setValue", data.PostCode);//邮政编码
                    $('#EMail').textbox("setValue", data.EMail);//电子邮箱
                }
            });
        }

        //选择证件名称
        function SelPaperName() {
            var param = {
                IsMultiple: "否"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/PaperNameSelect.aspx?' + $.param(param), "选择证件名称", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#PaperNameID").val(data[0].DictionaryCode);
                    $("#PaperName").textbox("setValue", data[0].DictionaryName);
                }
            });
        }

        //选择客户经营业态
        function SelTradeState() {
            var param = {
                IsMultiple: "否",
                Type: "经营业态"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择经营业态", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#TradeStateID").val(data[0].ID);
                    $("#TradeStateName").textbox("setValue", data[0].Name);
                }
            });
        }

        //选择跟进人
        function SelFollowUpUser() {
            LayerDialog.OpenWin('640', '400', '/HM/M_Main/Renting/Dialog/DepartAndUserSelect.aspx', "选择跟进人", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $('#FollowUpUserCode').val(data.UserCode);
                    $('#FollowUpUserName').textbox("setValue", data.UserName);
                }
            });
        }

        //上传附件
        function SaveFile() {
            var file = $("input[name='uploadFile']")[0].files[0];
            if (!file) {
                $.messager.alert('温馨提示', '请选择文件!');
            }
            var FileRemark = $("#FileRemark").textbox('getValue');
            var maxsize = 200 * 1024 * 1024;
            var tipFileSize = 200;
            var fileType = file.type;
            var fileSize = file.size;
            var fileName = file.name;

            if (fileSize > parseInt(maxsize)) {
                $.messager.alert('温馨提示', "不能上传超过" + tipFileSize + "M的附件！", 'error');
                return false;
            }
            var lastIndex = fileName.lastIndexOf(".");
            var suffix = fileName.substr(lastIndex + 1);//后缀

            var formData = new FormData();
            formData.append('file', file);
            formData.append('CorpId', "6008");
            formData.append('ExtName', suffix);
            formData.append('DicName', "Renting_PotentialCustomers");
            $.ajax({
                url: "/HM/M_Main/FileTransferred/FileTransferred.ashx",
                type: 'post',
                cache: false,
                processData: false,
                contentType: false,
                dataType: "json",
                async: false,
                data: formData,
                beforeSend: function (xhr) { $.messager.progress({ title: "温馨提示", msg: "正在上传...", interval: 3000 }); },
                success: function (data, status) {
                    if (data.result) {
                        var lastIndex = data.data.lastIndexOf("/");
                        var fileName = data.data.substr(lastIndex + 1);//后缀
                        var jsonData = [{ "FullPath": data.data, "FileName": fileName, "FileSize": fileSize, "FileRemark": FileRemark }];
                        AppendFile(jsonData);
                        $("#uploadFile").filebox('clear');
                        $("#FileRemark").textbox('clear');
                    } else {
                        $.messager.alert('错误', "服务器发生错误!", 'error');
                    }
                    $.messager.progress('close');
                },
                error: function (data) {
                    $.messager.alert('错误', "服务器发生错误!", 'error');
                    $.messager.progress('close');
                }
            });
            return false;
        }

        function AppendFile(arr) {
            if (!!arr) {
                var html = "", FileSize = '';
                $.each(arr, function (i, item) {
                    FileSize = Number((parseFloat(item.FileSize) / 1024).toString()).toFixed(2);
                    html += "<li><a href=\"" + item.FullPath + "\" target=\"_blank\" filename=\"" + item.FileName + "\" filesize=\"" + item.FileSize + "\" fileremark=\"" + item.FileRemark + "\" title=\"<div><p style='text-align:center'>(点击下载文件)</p><p>文&nbsp;&nbsp;件&nbsp;&nbsp;名:" + item.FileName + "</p><p>文件大小:" + FileSize + "KB</p><p>文件备注:" + item.FileRemark + "</p></div>\" class=\"easyui-tooltip\" />" + item.FileName + "</a><a class=\"btn_del\"  onclick=\"javascript:$(this).parent().remove();\"href=\"javascript:void(0);\"title=\"删除附件\"class=\"btn_del\"></a></li>";
                });
                $("#list_file").append(html);
                $(".easyui-tooltip").tooltip();
            }
        }

        //初始化页面数据
        function InitData() {
            $.dataPostJson("Renting_PotentialCustomers", 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        //加载附件
                        GetListDataTableFileAnnex(data.ID);
                        //如果是查看状态 禁用页面所有控件
                        if ($("#OpType").val() == "Detail") {
                            $('.easyui-textbox').textbox({ disabled: true });
                            $('.easyui-combobox').combobox({ disabled: true, value: data.UnitType });
                            $('.easyui-filebox').filebox({ disabled: true });
                            $('.easyui-linkbutton').linkbutton({ disabled: true });
                            $('#PageCloseBtn').linkbutton({ disabled: false });
                            $("a").remove(".btn_del");
                        }
                        //如果是公司发放的客商 只允许修改分派人
                        if (data.PotentialCustomers_OrganID != "") {
                            $('.easyui-textbox').textbox({ disabled: true });
                            $('.easyui-numberbox').textbox({ disabled: true });
                            $('.easyui-combobox').combobox({ disabled: true });
                            $('.easyui-filebox').filebox({ disabled: true });
                            $("a").remove(".btn_del");
                            $('#FileUpload').linkbutton({ disabled: true });
                            $('#FollowUpUserName').textbox({ disabled: false });
                            $('#AssignRemark').textbox({ disabled: false });
                        }
                        $('#mainForm').form('load', data);
                        if (data.PotentialCustomers_OrganID != "") {
                            $('#LegalRepr').textbox({ disabled: true });
                            $('#LegalReprTel').textbox({ disabled: true });
                        }
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function GetListDataTableFileAnnex(AttachedID) {
            var param = $.getUrlParam();
            param.AttachedID = AttachedID;
            $.dataPostJson('Renting_FileAnnex', 'GetListDataTable', param, true, false,
                function Init() {
                },
                function callback(data) {
                    AppendFile(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }


        /* 客户分派信息 */
        var ColumnAssign = [[
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center' },
            { field: 'CustName', title: '客户名称', width: 200, align: 'center' },
            { field: 'PaperCode', title: '证件号码', width: 140, align: 'center' },
            { field: 'LegalRepr', title: '法定代表人', width: 160, align: 'center' },
            { field: 'LegalReprTel', title: '法定代表人电话', width: 140, align: 'center' },
            { field: 'ConnectPeople', title: '联系人', width: 120, align: 'center' },
            { field: 'ConnectPeopleTel', title: '联系人电话', width: 100, align: 'center' },
            { field: 'TradeStateName', title: '客户经营业态', width: 100, align: 'center' },
            { field: 'BusinessBrand', title: '客户经营品牌', width: 140, align: 'center' },
            { field: 'BusinessLevel', title: '客户经营级别', width: 140, align: 'center' },
            { field: 'FollowUpUserName', title: '跟进人', width: 100, align: 'center' },
            { field: 'AssignUserName', title: '分派人', width: 100, align: 'center' },
            {
                field: 'AssignTime', title: '分派时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AssignRemark', title: '分派备注', width: 200, align: 'center' }
        ]];
        function LoadAssignGrid() {
            $("#TableContainerAssign").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: ColumnAssign,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: [],
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.PotentialCustomersID = $('#ID').val();
                    param = $.getDataGridParam("Renting_PotentialCustomers", "GetCustomerAssignList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
        }

        /* 客户跟进信息 */
        var ColumnFollowUp = [[
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center' },
            { field: 'CustName', title: '客户名称', width: 200, align: 'center' },
            { field: 'FollowUpStageName', title: '跟进阶段', width: 140, align: 'center' },
            {
                field: 'FollowUpTime', title: '跟进时间', width: 160, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'CustMeetPeople', title: '客户对接人', width: 100, align: 'center' },
            { field: 'CustMeetPeoplePosition', title: '对接人职位', width: 100, align: 'center' },
            { field: 'CustMeetPeopleTel', title: '对接人电话', width: 120, align: 'center' },
            { field: 'FollowUpUserName', title: '跟进人', width: 200, align: 'center' }
        ]];
        function LoadFollowUpGrid() {
            $("#TableContainerFollowUp").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: ColumnFollowUp,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: [],
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.PotentialCustomersID = $('#ID').val();
                    param = $.getDataGridParam("Renting_PotentialCustomers", "GetCustomerFollowUpList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
        }

        //保存页面数据
        function Save() {
            if ($('#mainForm').form("validate")) {
                var fileData = [];
                $('a[filename]').each(function (i, item) {
                    fileData.push({ "FileName": $(this).attr("filename"), "FileSize": $(this).attr("filesize"), "FullPath": $(this).attr("href"), "FileRemark": $(this).attr("fileremark") });
                });
                let param = $.getParam();
                param.FileData = JSON.stringify(fileData);
                $.dataPostJson("Renting_PotentialCustomers", 'Save', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("true");
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }

        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
