<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Merchants.PotentialCustomers.FollowUp.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-招商管理-商机管理-商机跟进编辑页面</title>
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
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客户跟进信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">客户名称</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="CustName" name="CustName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:true,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCust();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                        $(e.data.target).textbox('clear');
                                        $('#PotentialCustomersID').val('');
                                    }}]" />
                    <input type="hidden" id="PotentialCustomersID" name="PotentialCustomersID" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">跟进阶段</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="FollowUpStageName" name="FollowUpStageName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelFollowUpStage();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#FollowUpStageID').val('');
                                    }}] " />
                    <input type="hidden" id="FollowUpStageID" name="FollowUpStageID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">跟进时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="FollowUpTime" name="FollowUpTime" class="easyui-datetimebox"
                        data-options="required:true,tipPosition:'bottom',width:'100%',editable:false" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">客户对接人</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="CustMeetPeople" name="CustMeetPeople" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">对接人职位</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="CustMeetPeoplePosition" name="CustMeetPeoplePosition" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">对接人电话</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="CustMeetPeopleTel" name="CustMeetPeopleTel" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">跟进内容</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="FollowUpContent" name="FollowUpContent" class="easyui-textbox"
                        data-options="required:true,tipPosition:'bottom',width:'100%',height:'50px',multiline:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">后续建议</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="FollowUpSuggest" name="FollowUpSuggest" class="easyui-textbox"
                        data-options="required:true,tipPosition:'bottom',width:'100%',height:'50px',multiline:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">跟进人</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="FollowUpUserName" name="FollowUpUserName" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                    <input type="hidden" id="FollowUpUserCode" name="FollowUpUserCode" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">备注</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="Remark" name="Remark" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false" />
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
            $('#mainForm').css("height", h - 65 + "px");
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
                $('#CustName').textbox({ disabled: true });
                InitData();
            } else {
                /* 新增的时候如果存在潜在客户ID 就是通过我的客户列表过来的数据  不允许修改客户 */
                //潜在客户ID
                if (!!param.PotentialCustomersID) {
                    $('#CustName').textbox({ disabled: true });
                    $("#PotentialCustomersID").val(param.PotentialCustomersID);
                }
                //潜在客户名称
                if (!!param.CustName) {
                    $("#CustName").textbox("setValue", param.CustName);
                }
                //联系人
                if (!!param.ConnectPeople) {
                    $("#CustMeetPeople").textbox("setValue", param.ConnectPeople);
                }
                //联系电话
                if (!!param.ConnectPeopleTel) {
                    $("#CustMeetPeopleTel").textbox("setValue", param.ConnectPeopleTel);
                }
            }
        }

        //选择正式客户
        function SelCust() {
            LayerDialog.OpenWin('600', '400', '/HM/M_Main/Renting/Dialog/MinePotentialCustomerSelect.aspx', "选择我的客户", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#PotentialCustomersID").val(data.ID);
                    $("#CustName").textbox("setValue", data.CustName);
                    $("#CustMeetPeople").textbox("setValue", data.ConnectPeople);
                    $("#CustMeetPeopleTel").textbox("setValue", data.ConnectPeopleTel);
                }
            });
        }

        //选择 跟进阶段
        function SelFollowUpStage() {
            var param = {
                IsMultiple: "否",
                Type: "跟进阶段"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择跟进阶段", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#FollowUpStageID").val(data[0].ID);
                    $("#FollowUpStageName").textbox("setValue", data[0].Name);
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
            formData.append('DicName', "FollowUp");
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
            $.dataPostJson("Renting_PotentialCustomers_FollowUp", 'GetModel', $.getParam(), true, false,
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
                            $('.easyui-filebox').filebox({ disabled: true });
                            $('.easyui-datetimebox').datetimebox({ disabled: true });
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
                $.dataPostJson("Renting_PotentialCustomers_FollowUp", 'Save', param, true, false,
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
