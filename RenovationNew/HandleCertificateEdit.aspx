<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleCertificateEdit.aspx.cs" Inherits="M_Main.RenovationNew.HandleCertificateEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修办证</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }
    </style>
</head>
<body>
    <input type="hidden" name="RID" id="RID" />
    <form id="mainForm" runat="server">
        <input type="hidden" name="StartDate" id="StartDate" />
        <input type="hidden" name="EstimateEndDate" id="EstimateEndDate" />
        <div style="padding: 5px">
            <table class="bootstrap_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>装修许可证</span>
                    </td>
                    <td class="text">
                        <div id="LicenceNum"></div>
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>照片<br />
                            (点击图片上传照片)</span>
                    </td>
                    <td class="text">
                        <input type="hidden" id="Photo" name="Photo" value="../images/BuildHeadPrtrait.png" />
                        <div style="width: 100%; text-align: left">
                            <img id="HeadPrtraitImg" name="HeadPrtraitImg" src="../images/BuildHeadPrtrait.png" width="120px" height="160px" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>出入证编号</span></td>
                    <td class="text">
                        <input id="OutEnterCertificateNum" name="OutEnterCertificateNum" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>出入证名称</span></td>
                    <td class="text">
                        <input id="OutEnterCertificateName" name="OutEnterCertificateName" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>姓名</span></td>
                    <td class="text">
                        <input id="Name" name="Name" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>性别</span></td>
                    <td class="text">
                        <input class="easyui-radiobutton" name="Sex" data-options="value:'男',label:'男',labelWidth:18,labelAlign:'right',checked:true" />
                        <input class="easyui-radiobutton" name="Sex" data-options="value:'女',label:'女',labelWidth:40,labelAlign:'right'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>电话</span></td>
                    <td class="text">
                        <input id="Phone" name="Phone" class="easyui-textbox" data-options="tipPosition:'bottom',validType:['phoneAndMobile']" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>身份证</span></td>
                    <td class="text">
                        <input id="IDCard" name="IDCard" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>办证时间</span></td>
                    <td class="text">
                        <input id="HandleCertificateDate" name="HandleCertificateDate" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom'" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>证件期限</span></td>
                    <td class="text">
                        <input id="CertificateStartDate" name="CertificateStartDate" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom'" />&nbsp;- 
                        <input id="CertificateEndDate" name="CertificateEndDate" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom',validType:['dateFormat','dateCompare[\'#CertificateStartDate\',\'不能小于开始时间!\']']" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>经办人</span></td>
                    <td class="text">
                        <input id="HandlePerson" name="HandlePerson" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>证件状态</span></td>
                    <td class="text">
                        <input id="CertificateState" name="CertificateState" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',required:true,panelHeight:'auto',
                         valueField:'id',textField:'text',value:'正常',data: [{id: '正常',text: '正常'},{id: '挂失',text: '挂失'},{id: '作废',text: '作废'},{id: '收回',text: '收回'}]" />
                    </td>
                </tr>
            </table>
        </div>
        <%--   <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>--%>
        <div class="btnFixed">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" runat="server" />
            <input type="button" class="button" value="放弃" id="btnClose" onclick="Close();" />
        </div>

    </form>
    <input id="hidUploadType" name="hidUploadType" type="hidden" />
    <form id="uploadform" enctype='multipart/form-data' class="easyui-dialog" title="上传文件"
        data-options="closed: true,modal:true" style="width: 480px; height: 100px; padding: 10px;">
        <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td><span><a id="tip" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>选择附件:</span></td>
                <td>
                    <input id="uploadfile" name="uploadFile" class="easyui-filebox" data-options="required:true,width:'250px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:'80px'" onclick="UpdateFile();">保存</a>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">


        function InitControl() {
            $('#tip').tooltip({
                position: 'top',
                content: '<div><p>1、文件限制最大为2M。</p></div>',
            });

            $("#HeadPrtraitImg").click(function () {
                $('#uploadform').dialog('open');
            });

        }

        $(function () {
            InitPage();
            InitControl();
        });

        function InitPage() {
            var OpType = $.getUrlParam("OpType");;
            $("#OpType").val(OpType);
            $("#RID").val($.getUrlParam("RID"));
            var ID = $.getUrlParam("ID");
            if (isValueNull(ID)) {
                $("#ID").val(ID);
                InitData();
            } else {
                $("#LicenceNum").html($.getUrlParam("LicenceNum"));
            }
        }

        function InitData() {
            $.tool.DataPostJson('Renovation', 'GetModelHandleCertificate', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    data = data[0];
                    $('#mainForm').form('load', data);
                    $("#LicenceNum").html(data.LicenceNum);
                    $("#HeadPrtraitImg").attr("src", data.Photo);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function Save() {
            var CertificateStartDate = $('#CertificateStartDate').datebox("getValue");
            var StartDate = formatDate($('#StartDate').val(), "yyyy-MM-dd");
            if (new Date(CertificateStartDate) < new Date(StartDate)) {
                $.messager.alert('温馨提示', "办证期限开始日期不能小于装修开工时间日期(" + StartDate + ")!");
                return;
            }
            var CertificateEndDate = $('#CertificateEndDate').datebox("getValue");
            var EstimateEndDate = formatDate($('#EstimateEndDate').val(), "yyyy-MM-dd");

            if (new Date(CertificateEndDate) > new Date(EstimateEndDate)) {
                $.messager.alert('温馨提示', "办证期限结束日期不能大于预计完工时间日期(" + EstimateEndDate + ")!");
                return;
            }
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJson('Renovation', 'SaveHandleCertificate', $.JQForm.GetStrParam(),
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

        function Close() {
            HDialog.CloseWindow("", parent.window[parent.window.length - 1].name);
        }


        //上传
        function UpdateFile() {
            $("#uploadform").form('validate');
            var file = $("input[name='uploadFile']")[0].files[0];
            var maxsize = 2 * 1024 * 1024;
            var tipFileSize = 2;
            var imgType = file.type;
            //console.log(fileupload.files[0]);
            //if (controlID == "FileURL") {
            //    maxsize = 1024 * 1024;
            //    tipFileSize = 1;
            if (imgType != "image/bmp" && imgType != "image/jpeg" && imgType != "image/png" && imgType != "image/gif") {
                HDialog.Info("图片格式不正确!");
                return false;
            }
            if (file.size > parseInt(maxsize)) {
                HDialog.Info("不能上传超过" + tipFileSize + "M的照片！");
                return false;
            }

            $.messager.progress({ title: "温馨提示", msg: "正在上传..." });
            var options = {
                type: "POST",
                url: "../AjaxUploadFile.aspx?Cmd=ins&FileType=room&FileURL=",
                //data: "upfile=" + $("#uploadfile").val(),
                success: function (data, status) {
                    $.messager.progress('close');
                    var stringArray = data.split("|");
                    var FileName = stringArray[1];
                    var FileError = stringArray[2];
                    var FileURL = stringArray[3];
                    var FileServerName = stringArray[4];
                    if (stringArray[0] == "1") {
                        //stringArray[0]    成功状态(1为成功，0为失败)
                        //stringArray[1]    文件名
                        //stringArray[2]    消息提示
                        //stringArray[3]    文件路径
                        $("#Photo").val(FileURL);
                        $("#HeadPrtraitImg").attr("src", FileURL);
                        //UploadCallBack(FileURL, FileName);
                        $("#uploadForm").form('clear');
                        $("#uploadform").dialog('close');

                    }
                    else {
                        $.messager.alert('错误', FileError, 'error');
                    }

                },
                error: function (data, status, e) {
                    $.messager.alert('错误', e.toString(), 'error');
                    $.messager.progress('close');
                }
            };
            $('#uploadform').ajaxSubmit(options);
            return false; //.NET按钮控件取消提交
        }

        ////上传文件相关绑定
        //function UploadCallBack(url, Name) {
        //    $("#FileCode").val(Name);
        //    $("#FileUrl").val(url);
        //    $.tool.DataPostJson('Renovation', 'SaveAttachedFile', $.JQForm.GetStrParam(),
        //        function Init() {
        //        },
        //        function callback(data) {
        //            if (data.result) {
        //                $('#mainForm').form('clear');
        //                InitDataGrid();
        //            } else { $.messager.alert('温馨提示', data.msg); }
        //        },
        //        function completeCallback() {

        //        }, function errorCallback() {

        //        });
        //}

        //上传附件文件信息删除
        function DeleteFile(filename) {
            var postFileName = encodeURI(filename);
            $.ajax
                ({
                    type: "POST",
                    url: "../AjaxUploadFile.aspx?Cmd=del&FileType=room&FileURL=" + postFileName,
                    data: "",
                    success: function (data, status) {
                        //alert(data);
                        var stringArray = data.split("|");
                        var FileName = stringArray[1];
                        var FileError = stringArray[2];
                        if (stringArray[0] == "1") {
                            //stringArray[0]    成功状态(1为成功，0为失败)
                            //stringArray[1]    文件名
                            //stringArray[2]    消息提示
                            //stringArray[3]    文件路径
                            //HDialog.Info('删除成功');
                        }
                        else {
                            //HDialog.Info(FileError);
                        }

                    },
                    error: function (data, status, e) {
                        //alert("上传失败:" + e.toString());
                    }
                });
            return false; //.NET按钮控件取消提交
        }
    </script>
</body>
</html>
