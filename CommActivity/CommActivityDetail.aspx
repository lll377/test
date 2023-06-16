<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommActivityDetail.aspx.cs" Inherits="M_Main.CommActivity.CommActivityDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>获取社区活动详情</title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        .TdTitle {
            width: 10%;
            text-align: right;
        }

        .DialogTable tr td {
            height: 25px;
            line-height: 25px;
        }

        .TdContentSearch {
            width: 16%;
            text-align: left;
        }

        .img-item {
            display: inline-block;
            width: 100px;
            height: 120px;
            position: relative;
            margin-right: 8px;
        }

            .img-item img {
                border: 1px solid #cccccc;
                width: 100%;
                height: 100%;
                margin-right: 5px;
            }

            .img-item .img-del {
                position: absolute;
                width: 100%;
                height: 25px;
                line-height: 25px;
                background-color: rgba(0,0,0,.5);
                bottom: 0;
                left: 0;
                color: #fff;
                text-align: center;
                font-size: 13px;
                cursor: pointer
            }
    </style>
</head>
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server">
        <input id="ActivitiesId" type="hidden" name="ActivitiesId" value="" runat="server" />
        <input id="OptType" type="hidden" name="OptType" runat="server" />
        <input id="CustId" type="hidden" name="CustId" runat="server" />
        <input id="RoomId" type="hidden" name="RoomId" runat="server" />
        <input id="ActivitiesImages" type="hidden" name="ActivitiesImages" runat="server">
        <input id="ActivitiesCount" type="hidden" name="ActivitiesCount" runat="server">
        <input id="ActivitiesPlan" type="hidden" name="ActivitiesPlan" runat="server">

        <table class="DialogTable" style="margin: 10px auto 80px auto; width: 88%">
            <tr>
                <td class="TdTitle">活动类别：</td>
                <td class="TdContentSearch">
                    <select id="ActivitiesCategory" class="easyui-combobox" name="ActivitiesCategory" data-options="editable:false" style="cursor: pointer" runat="server"></select>
                </td>
                <td class="TdTitle">活动主题：</td>
                <td class="TdContentSearch">
                    <input id="ActivitiesTheme" class="easyui-textbox" type="text" name="ActivitiesTheme" runat="server" />
                </td>
                <td class="TdTitle">活动开始时间：</td>
                <td class="TdContentSearch">
                    <input id="ActivitiesStartDate" name="ActivitiesStartDate" type="text" class="easyui-datebox" value="" runat="server" />
                </td>
                <td class="TdTitle">活动结束时间：</td>
                <td class="TdContentSearch">
                    <input id="ActivitiesEndDate" name="ActivitiesEndDate" type="text" class="easyui-datebox" value="" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">发起人：</td>
                <td class="TdContentSearch">
                    <input id="CustName" class="easyui-searchbox" type="text" name="CustName" data-options="searcher:SelSponsor, prompt:'请选择发起人', editable:false" runat="server" />
                </td>
                <td class="TdTitle">可选房号：</td>
                <td class="TdContentSearch">
                    <select id="ComboRoom" class="easyui-combobox" style="width: 80%; cursor: pointer;" name="ComboRoom" data-options="editable:false" panelheight='auto'></select>
                </td>
                <td class="TdTitle">房屋编号：</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" class="easyui-searchbox" type="text" name="RoomSign" data-options="searcher:SelRoom, prompt:'请选择房号', editable:false" runat="server" />
                </td>
                <td class="TdTitle">联系电话：</td>
                <td class="TdContentSearch">
                    <input id="LinkPhone" class="easyui-textbox" type="text" name="LinkPhone" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">是否收费：</td>
                <td class="TdContentSearch">
                    <select id="IsCharge" class="easyui-combobox" style="width: 66px;" name="IsCharge" runat="server" data-options="editable:false" panelheight='auto'></select>
                </td>
                <td class="TdTitle">收费标准(人/元)：</td>
                <td class="TdContentSearch">
                    <input id="ChargeStan" class="easyui-numberbox" type="text" name="ChargeStan" data-options="min:0,precision:2" runat="server" />
                </td>
                <td class="TdTitle">是否线上报名：</td>
                <td class="TdContentSearch">
                    <select id="IsOnlineRegistr" class="easyui-combobox" style="width: 66px;" name="IsOnlineRegistr" runat="server" data-options="editable:false" panelheight='auto'></select>
                </td>
                <td class="TdTitle">报名截止时间：</td>
                <td class="TdContentSearch">
                    <input id="OnlineRegistrEndDate" name="OnlineRegistrEndDate" type="text" class="easyui-datebox" value="" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">活动人数限制：</td>
                <td class="TdContentSearch">
                    <input id="ActivitiesLimit" class="easyui-numberbox" type="text" name="ActivitiesLimit" data-options="min:0,precision:0" runat="server" />
                </td>
                <td class="TdTitle">每户人数限制：</td>
                <td class="TdContentSearch">
                    <input id="EveryLimit" class="easyui-numberbox" type="text" name="EveryLimit" data-options="min:0,precision:0" runat="server" />
                </td>
                <td class="TdTitle">是否审核通过：</td>
                <td class="TdContentSearch">
                    <select id="IsApproved" class="easyui-combobox" style="width: 66px;" name="IsApproved" runat="server" data-options="editable:false" panelheight='auto'></select>
                </td>
                <td class="TdTitle">是否关闭显示：</td>
                <td class="TdContentSearch">
                    <select id="IsCloseDisplay" class="easyui-combobox" style="width: 66px;" name="IsCloseDisplay" runat="server" data-options="editable:false" panelheight='auto'></select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">活动图片</td>
                <td class="DialogTdContent_2Col" colspan="7" style="padding: 10px 0; position: relative;">
                    <input id="UpFile" type="file" runat="server" name="UpFile" style="width: 1px; visibility: hidden" accept="image/*" />
                    <div id="FileList" style="float: left;"></div>
                    <div id="BtnUpFile" style="border: 1px solid #cccccc; width: 100px; height: 120px; text-align: center; float: left;">
                        <img id="ImgSrc" src="../images/newfile.png" style="margin-top: 33px;" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">活动内容：</td>
                <td class="TdContentSearch" colspan="7" style="width: 95%">
                    <script id="ActivitiesCountEditor" type="text/plain" style="width: 100%; height: 250px;"></script>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">活动安排：</td>
                <td class="TdContentSearch" colspan="7" style="width: 95%">
                    <script id="ActivitiesPlanEditor" type="text/plain" style="width: 100%; height: 250px;"></script>
                </td>
            </tr>
        </table>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 60px; background-color: #f5f5f5; margin-right: 45px; z-index: 9999999;">
            <a id="save" href="javascript:void(0);" class="easyui-linkbutton" style="margin-right: 15px;" data-options="iconCls:'icon-save'" onclick="Save();">保存</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="CloseDlg();">关闭</a>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                var optType = $("#OptType").val();
                //初始化活动内容富文本框
                var ue1 = UE.getEditor('ActivitiesCountEditor', { autoFloatEnabled: false });
                ue1.ready(function () {
                    ue1.execCommand('insertHtml', $('#ActivitiesCount').val());
                    if (optType == 'View') {
                        ue1.setDisabled();
                    }
                });

                //初始化活动安排富文本框
                var ue2 = UE.getEditor('ActivitiesPlanEditor', { autoFloatEnabled: false });
                ue2.ready(function () {
                    ue2.execCommand('insertHtml', $('#ActivitiesPlan').val());
                    if (optType == 'View') {
                        ue2.setDisabled();
                    }
                });

                if (optType != 'View') {
                    $("#BtnUpFile").bind('click', function (e) {
                        $("#UpFile").click();
                    });

                    $("#UpFile").bind('change', function (e) {
                        UpLoadFile();
                    });
                }

                $("#IsCharge").combobox({
                    onChange: function (newValue, oldValue) {
                        if (newValue == 1) {
                            $('#ChargeStan').numberbox('enable');
                        } else {
                            $('#ChargeStan').numberbox('disable');
                        }
                    }
                });

                $("#IsOnlineRegistr").combobox({
                    onChange: function (newValue, oldValue) {
                        if (newValue == 1) {
                            $('#OnlineRegistrEndDate').datebox({ disabled: false });
                            $('#ActivitiesLimit').numberbox('enable');
                            $('#EveryLimit').numberbox('enable');
                        } else {
                            $('#OnlineRegistrEndDate').datebox({ disabled: true });
                            $('#ActivitiesLimit').numberbox('disable');
                            $('#EveryLimit').numberbox('disable');
                        }
                    }
                });

                LoadImages();
                Init();
            });

            function Init() {
                var optType = $("#OptType").val();
                if (optType == 'View') {
                    $("#save").remove();
                } else {
                    var isCharge = $("#IsCharge").combo('getValue');
                    var isOnlineRegistr = $("#IsOnlineRegistr").combo('getValue');
                    if (isCharge == 1) {
                        $('#ChargeStan').numberbox('enable');
                    } else {
                        $('#ChargeStan').numberbox('disable');
                    }
                    if (isOnlineRegistr == 1) {
                        $('#OnlineRegistrEndDate').datebox({ disabled: false });
                        $('#EveryLimit').numberbox('enable');
                        $('#ChargeStan').numberbox('enable');
                    } else {
                        $('#OnlineRegistrEndDate').datebox({ disabled: true });
                        $('#ActivitiesLimit').numberbox('disable');
                        $('#EveryLimit').numberbox('disable');
                    }
                }
            }

            function CloseDlg() {
                HDialog.Close('');
            }

            //加载已有图片
            function LoadImages() {
                //加载已有的图片列表
                var activitiesImages = $("#ActivitiesImages").val();
                if (activitiesImages != "") {
                    var imgs = activitiesImages.split(',');
                    var strHtml = '';
                    for (var i = 0; i < imgs.length; i++) {
                        strHtml += `
                            <div class="img-item">
                                <img src="`+ imgs[i] + `">
                                <div class="img-del" onclick="DeleteImage(this)">删除</div>
                            </div>
                        `;
                    }
                    $("#FileList").html(strHtml);
                }
            }

            //上传图片
            function UpLoadFile() {
                var file = $("#UpFile").val();
                var fileName = file.substring(file.lastIndexOf("\\") + 1);

                var fd = new FormData();
                fd.append("UpFileData", $("#UpFile")[0].files[0]);
                fd.append("file", fileName);

                $.tool.pageLoadInfo("上传中，请等待");
                $.ajax({
                    url: "../UpLoad/UpFile.aspx",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
                    success: function (addr) {
                        $.tool.pageUnLoading();
                        $("#HeadImg").val(addr);
                        if (addr.length > 200) {
                            HDialog.Info('上传失败啦,重新试试吧');
                            return;
                        }
                        else {
                            var strHtml = '';
                            strHtml += `
                                <div class="img-item">
                                    <img src="`+ addr + `">
                                    <div class="img-del" onclick="DeleteImage(this)">删除</div>
                                </div>
                            `;
                            $("#FileList").append(strHtml);
                            var activitiesImages = $("#ActivitiesImages").val();
                            activitiesImages += ',' + addr;
                            $("#ActivitiesImages").val(activitiesImages)
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                        HDialog.Info('上传失败啦,重新试试吧');
                    }
                });
            }

            //选择客户
            function SelSponsor() {
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open($(window).width(), $(window).height(), conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustId').val(data.CustID);
                    $("#LinkPhone").textbox("setValue", data.MobilePhone);

                    $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {
                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";
                                    if (vIsDelLive == 1) {
                                        strTmp = "(历史)";
                                    }
                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign + strTmp;

                                    RoomData.push({ "RoomSign": RoomSign, "RoomID": RoomID });
                                }

                                $('#ComboRoom').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomSign',
                                    onChange: function (n, o) {
                                        var data = $('#ComboRoom').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {
                                                    $('#RoomSign').searchbox('setValue', data[i].RoomSign);
                                                    $('#RoomId').val(data[i].RoomID);
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            //删除图片
            function DeleteImage(obj) {
                var imgSrc = $(obj).parent().find('img').attr('src');
                var activitiesImages = $("#ActivitiesImages").val();
                var imgs = activitiesImages.split(',');
                var result = '';
                for (var i = 0; i < imgs.length; i++) {
                    if (imgs[i] != imgSrc) {
                        result += imgs[i];
                        if ((i + 1) < imgs.length) {
                            result += ',';
                        }
                    }
                }
                $("#ActivitiesImages").val(result);
                $(obj).parent().remove();
            }

            //选择房屋
            function SelRoom() {
                $('#ComboRoom').combobox({ data: [], valueField: 'RoomID', textField: 'RoomSign' });

                var conent = "../DialogNew/RoomDlg.aspx";
                HDialog.Open($(window).width(), $(window).height(), conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $("#LinkPhone").textbox("setValue", data.MobilePhone);
                    $('#CustId').val(data.CustID);
                    $('#RoomId').val(data.RoomID);
                });
            }

            //保存
            function Save() {
                if ($("#ActivitiesCategory").combo('getValue') == '') {
                    HDialog.Info('请选择活动类别！');
                    return false;
                }
                if ($("#ActivitiesTheme").textbox('getValue') == '') {
                    HDialog.Info('活动主题不能为空！');
                    return false;
                }
                if ($("#ActivitiesStartDate").datebox('getValue') == '') {
                    HDialog.Info('请选择活动开始时间！');
                    return false;
                }
                if ($("#ActivitiesEndDate").datebox('getValue') == '') {
                    HDialog.Info('请选择活动结束时间！');
                    return false;
                }
                var activitiesCount = UE.getEditor('ActivitiesCountEditor').getContent();
                var activitiesPlan = UE.getEditor('ActivitiesPlanEditor').getContent();
                $("#ActivitiesCount").val(activitiesCount);
                $("#ActivitiesPlan").val(activitiesPlan);
                if (activitiesCount == '') {
                    HDialog.Info('活动内容不能为空！');
                    return false;
                }
                //if (activitiesPlan == '') {
                //    HDialog.Info('活动安排不能为空！');
                //    return false;
                //}
                if ($("#CustId").val() == '') {
                    HDialog.Info('请选择发起人！');
                    return false;
                }
                if ($("#LinkPhone").textbox('getValue') == '') {
                    HDialog.Info('联系电话不能为空！');
                    return false;
                }
                var isCharge = $("#IsCharge").combo('getValue');
                var isOnlineRegistr = $("#IsOnlineRegistr").combo('getValue');
                var chargeStan = $("#ChargeStan").numberbox('getValue');
                if (isCharge == 1 && (chargeStan == '' || chargeStan == 0)) {
                    HDialog.Info('收费标准不能为空且必须大于0！');
                    return false;
                }
                if (isOnlineRegistr == 1 && $("#OnlineRegistrEndDate").datebox('getValue') == '') {
                    HDialog.Info('报名截止日期不能为空！');
                    return false;
                }

                var optType = $("#OptType").val();
                var CommandName = '';
                if (optType == 'Add') {
                    CommandName = 'AddCommActivity';
                }
                else if (optType == 'Edit') {
                    CommandName = 'UpdateCommActivity';
                }
                $.tool.DataPostChk('frmForm', 'CommActivityNew', CommandName, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var result = JSON.parse(_Data);
                        HDialog.Info(result.Message);
                        if (result.Code == 200 && result.IsSuccess) {
                            HDialog.Close('1');
                        }
                        if (result.Code == 500) {
                            console.log(result.ErrorMessage);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        </script>
    </form>
</body>
</html>
