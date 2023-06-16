<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Merchants.PotentialCustomers.OrganRegister.Edit" %>

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
                    <input id="CustName" name="CustName" class="easyui-textbox" data-options="prompt:'请输入客户名称!',editable:true,tipPosition:'bottom',required:true,multiline:false,width:'100%'" />
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
            <div class="form-group Add">
                <label class="col-sm-2 col-xs-2 control-label">发送项目</label>
                <div class="col-sm-10 col-xs-10">
                    <input type="text" id="CommNames" name="CommName" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'99%',required:false,prompt:'不选择发送项目，默认发送到当前区域下所有项目',editable:false,height:'50px',multiline:true, buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelSendComm();},
                           icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#CommIDs').val('');
                                    }}]" />
                    <input type="hidden" id="CommIDs" name="CommIDs" runat="server" />
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
                        <a href="javascript:void(0)" onclick="SaveFile()" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80">上传</a>
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

    <script type="text/javascript">
        $(function () {
            //设置高度
            let h = $(window).height();
            let w = $(window).width();
            $('#mainForm').css("height", h - 65 - $('.tabs-header').height() + "px");
            InitPage();
        });


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
                $('.Add').hide();
                InitData();
            } else {
                //初始化 单位/个人客户 为单位
                $('#UnitType').combobox("setValue", "单位");
            }
        }

        //选择发送项目 
        function SelSendComm() {
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Dialog/CommSelect.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var id = "", text = "";
                    $.each(data, function (i, item) {
                        id += "," + item.CommID;
                        text += "," + item.CommName;
                    });
                    id = id.substr(1);
                    text = text.substr(1);
                    $("#CommIDs").val(id);
                    $("#CommNames").textbox('setValue', text);
                }
            });
        }

        //选择客户类别
        function SelCustType() {
            var param = {
                IsMultiple: "否"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/CustomerTypeSelect_Organ.aspx?' + $.param(param), "选择客户类别", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#CustTypeID").val(data[0].DictionaryCode);
                    $("#CustTypeName").textbox("setValue", data[0].DictionaryName);
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
            formData.append('DicName', "Renting_PotentialCustomers_Organ");
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
            $.dataPostJson("Renting_PotentialCustomers_Organ", 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#mainForm').form('load', data);
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


        //保存页面数据
        function Save() {
            if ($('#mainForm').form("validate")) {
                var fileData = [];
                $('a[filename]').each(function (i, item) {
                    fileData.push({ "FileName": $(this).attr("filename"), "FileSize": $(this).attr("filesize"), "FullPath": $(this).attr("href"), "FileRemark": $(this).attr("fileremark") });
                });
                let param = $.getParam();
                param.FileData = JSON.stringify(fileData);
                $.dataPostJson("Renting_PotentialCustomers_Organ", 'Save', param, true, false,
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
