<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PicEdit.aspx.cs" Inherits="M_Main.Renting.Programming.RentControlTable.PicEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>规划管理-租控表图形 平面图编辑页面</title>
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
            <legend class="frame-legend">平面图信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">平面图名称</label>
                <div class="col-sm-10 col-xs-10">
                    <input type="text" id="PlanarGraphName" name="PlanarGraphName" runat="server" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">备注</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Remark" name="Remark" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="padding-left: 10px">
                    <input type="hidden" name="PlanarGraphUrl" id="PlanarGraphUrl" />
                    <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="required:false,width:'200px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                    <a href="javascript:void(0)" onclick="SaveFile()" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80">上传</a>
                    <div id="ImgDiv" runat="server" style="min-height: 120px; width: 100%;"></div>
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
            $('#uploadFile').filebox({
                width: '250px',
                buttonText: '选择图片',
                prompt: '请选择一张图片...',
                accept: 'image/jpg,image/gif,image/jpeg,image/png,image/bmp'
            });
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
                InitData();
            } else {

            }
        }


        //上传附件
        function SaveFile() {
            var file = $("input[name='uploadFile']")[0].files[0];
            if (!file) {
                $.messager.alert('温馨提示', '请选择文件!');
            }
            var imgType = file.type;
            if (imgType != "image/bmp" && imgType != "image/jpeg" && imgType != "image/png" && imgType != "image/gif") {
                HDialog.Info("图片格式不正确!");
                return false;
            }

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
            formData.append('DicName', "Renting_RentControlTable");
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
                        var jsonData = { "FullPath": data.data };
                        $('#PlanarGraphUrl').val(data.data);
                        AppendFile(jsonData);
                        $("#uploadFile").filebox('clear');
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
            $('#ImgDiv').html('<div style="position: relative;margin:5px;float: left;"><img style="width:100px;height:100px;cursor:pointer" src="' + arr.FullPath + '" onclick="DownloadImg(this)" ></div>');
            //保存完成后清空值
            $('#uploadFile').filebox('setValue', '');
        }

        //下载图片
        function DownloadImg(obj) {
            window.open($(obj).attr("src"), '_blank', '');
        }

        //初始化页面数据
        function InitData() {
            $.dataPostJson("Renting_RentControlTable", 'GetPicModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#mainForm').form('load', data);
                        //加载附件
                        var jsonData = { "FullPath": data.PlanarGraphUrl };
                        AppendFile(jsonData);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        //保存页面数据
        function Save() {
            if ($('#mainForm').form("validate")) {
                //判断是否已经上传了图片  
                if ($('#PlanarGraphUrl').val() == "") {
                    $.messager.alert('温馨提示', "请上传平面图图片！");
                    return;
                }
                $.dataPostJson("Renting_RentControlTable", 'SavePic', $.getParam(), true, false,
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
