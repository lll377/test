<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyEventReportDetail.aspx.cs" Inherits="M_Main.Emergency.EmergencyEventReportDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急事件报告详情</title>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        body, html, form {
            padding: 0px;
            margin: 0px;
            overflow: hidden;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 94%;
            height: 40px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }


        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 10%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
            margin-bottom: 1px;
            overflow: hidden;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                border-bottom: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input id="OpType" type="hidden" name="OpType" runat="server">
        <input id="ID" type="hidden" name="ID" runat="server">
        <input id="DetailResult" type="hidden" name="DetailResult" runat="server">
        <input id="Flag" type="hidden" name="Flag" value="0" runat="server">
        <input type="hidden" id="AuditStatus" name="AuditStatus" value="未启动" runat="server" />
        <!-- 按钮工具栏 -->
        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
            <input id="BtnPrint" type="button" value="打印" style="display: none;" runat="server" />
        </div>
        <div class="Content" style="overflow: auto;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CommName" name="CommName" data-options="required:true" runat="server" onclick="SelComm()" readonly class="easyui-validatebox" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                        <input type="hidden" id="hidCommID" name="hidCommID" runat="server" />
                    </td>
                    <td class="TdTitle">应急类型:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EmergencyTypeName" name="EmergencyTypeName" runat="server" data-options="required:true" class="easyui-validatebox"
                            onclick="SelEmergencyTypeAndLevel()" readonly />
                        <input type="hidden" id="EmergencyTypeID" name="EmergencyTypeID" runat="server" />
                    </td>
                    <td class="TdTitle">应急等级:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EmergencyLevelName" name="EmergencyLevelName" runat="server" class="easyui-validatebox" readonly />
                        <input type="hidden" id="EmergencyLevelID" name="EmergencyLevelID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">事件主题:</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" id="EventTheme" name="EventTheme" maxlength="1000" style="width: 89%;" runat="server" data-options="required:true" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">事发时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EventTime" name="EventTime" class="easyui-datetimebox" runat="server" data-options="required:true,editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">事发地点:</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" id="EventAddress" name="EventAddress" maxlength="500" style="width: 89%;" runat="server" data-options="required:true" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">报警时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PoliceTime" name="PoliceTime" class="easyui-datetimebox" runat="server" data-options="required:true,editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报警人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PolicePeople" name="PolicePeople" maxlength="50" runat="server" data-options="required:true" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">接警时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AlarmTime" name="AlarmTime" class="easyui-datetimebox" runat="server" data-options="required:true,editable:false" />
                    </td>
                    <td class="TdTitle">伤/亡人数:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AlarmPeople" name="AlarmPeople" maxlength="50" runat="server" data-options="required:true" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">到场时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AttendanceTime" name="AttendanceTime" class="easyui-datetimebox" runat="server" data-options="required:true,editable:false" />
                    </td>
                    <td class="TdTitle">处理人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="HandlePeople" name="HandlePeople" maxlength="50" runat="server" data-options="required:true" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">其他现场人员:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="OtherHandlePeople" name="OtherHandlePeople" maxlength="500" runat="server" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">处理状态:</td>
                    <td class="TdContentSearch">
                        <select id="DealState" name="DealState" class="easyui-combobox" runat="server" data-options="editable:false,panelHeight:'auto'">
                            <option value="未处理">未处理</option>
                            <option value="处理中">处理中</option>
                            <option value="已处理">已处理</option>
                        </select>
                    </td>
                    <td class="TdTitle">状态变更人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="DealUserName" name="DealUserName" readonly runat="server" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">状态变更时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="DealTime" name="DealTime" readonly runat="server" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">事发经过:</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea type="text" id="EventAfter" name="EventAfter" maxlength="1400" data-options="required:true" runat="server" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">采取措施:</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea type="text" id="TakeSteps" name="TakeSteps" maxlength="1400" runat="server" class="easyui-validatebox"></textarea>
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">已经造成或<br />
                        可能造成的损失:</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea type="text" id="EventLoss" name="EventLoss" maxlength="1400" runat="server" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">公司可能存在的<br />
                        责任及风险:</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea type="text" id="EventRisk" name="EventRisk" maxlength="1400" runat="server" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">后期跟进处理的<br />
                        意见和建议:</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea type="text" id="EventProposal" name="EventProposal" maxlength="1400" runat="server" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">现场图片:</td>
                    <td class="TdContentSearch" colspan="5">
                        <input id="uploadFile" name="uploadFile" class="easyui-filebox" />
                        <a href="javascript:void(0)" class="easyui-linkbutton" id="Upload" data-options="iconCls:'icon-save'" onclick="UploadImg();">上传</a>
                        <div id="ImgDiv" runat="server" style="min-height: 120px; width: 100%;"></div>
                    </td>
                </tr>
            </table>
            <!-- 流程内容 -->
            <div id="OAFlow" style="height: auto; margin: 0px auto;">
                <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height() - $('.TopHead').height();
            var w = $(window).width();
            $(".Content").css({ "height": h + "px" });
        }
        //上传图片 并验证类型和大小
        function UploadImg() {
            var file = $("input[name='uploadFile']")[0].files[0];
            if (file) {
                var imgType = file.type;
                if (imgType != "image/bmp" && imgType != "image/jpeg" && imgType != "image/png" && imgType != "image/gif") {
                    HDialog.Info("图片格式不正确!");
                    return false;
                }
                if (file.size > parseInt(2097152)) {
                    HDialog.Info("不能上传超过2M的图片！");
                    return false;
                }
                $.tool.pageLoadInfo("上传中，请等待");
                var options = {
                    type: "POST",
                    url: "../AjaxUploadFile.aspx?Cmd=ins&FileType=Emergency&FileURL=",
                    //data: "upfile=" + $('#uploadFile').val(),
                    success: function (data, status) {
                        $.tool.pageUnLoading();
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
                            UploadCallBack(FileURL, FileName);
                        }
                        else {
                            HDialog.Info(FileError);
                        }
                    },
                    error: function (data, status, e) {
                        HDialog.Info(e.toString());
                        $.tool.pageUnLoading();
                    }
                };
                $('#frmForm').ajaxSubmit(options);
                return false; //.NET按钮控件取消提交
            } else {
                HDialog.Info("请选择图片");
            }
        }

        //上传保存数据库
        function UploadCallBack(FileURL, FileName) {

            var s = FileName.lastIndexOf("\\");
            var e = FileName.lastIndexOf(".");
            var fileName = FileName.substring(s + 1, e);//文件名不带后缀
            var fileType = FileName.substring(e + 1, FileName.length);//文件后缀

            var parameterStr = {
                FileCode: FileName,
                FilePath: FileURL,
                Type: '应急事件报告',
                KeyID: $('#ID').val(),
                FileType: fileType,
                FileName: fileName
            };
            $.dataPostJson('Emergency_File', 'Save', parameterStr, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $('#ImgDiv').append('<div style="position: relative;margin:5px;float: left;" id=\'' + data.data + '\' ><img style="width:100px;height:100px;cursor:pointer" src="' + FileURL + '" onclick="DownloadImg(this)" ><div style="position: absolute; width: 18px; height: 18px; border-radius: 18px; background-color: #e0a70b; color: white; text-align: center; vertical-align: middle; top: -5px; left: 86px; cursor: pointer" onclick="CloseImgFunc(\'' + data.data + '\')">X</div></div>');
                        //保存完成后清空值
                        $('#uploadFile').filebox('setValue', '');

                    } else { $.messager.alert('温馨提示', data.msg); }
                },
                function completeCallback() {

                }, function errorCallback() {

                });
        }
        //删除图片
        function CloseImgFunc(IDStr) {
            //控制不能删除的情况
            if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                return;
            }
            var parameterStr = {
                idList: IDStr
            }
            $.dataPostJson('Emergency_File', 'Del', parameterStr, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        HDialog.Info("删除成功");
                        $('#' + IDStr).remove();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {

                }, function errorCallback() {

                });

        }

        //加载图片
        function LoadImgFunc() {
            var parameterStr = {
                KeyID: $('#ID').val(),
                Type: '应急事件报告'
            }
            $.dataPostJson('Emergency_File', 'GetListDataTable', parameterStr, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                            $.each(data, function (i, Item) {
                                $('#ImgDiv').append('<div style="position: relative;margin:5px;float: left;" id=\'' + Item.ID + '\' ><img style="width:100px;height:100px;cursor:pointer" src="' + Item.FilePath + '" onclick="DownloadImg(this)" ></div>');
                            });
                        } else {
                            $.each(data, function (i, Item) {
                                $('#ImgDiv').append('<div style="position: relative;margin:5px;float: left;" id=\'' + Item.ID + '\' ><img style="width:100px;height:100px;cursor:pointer" src="' + Item.FilePath + '" onclick="DownloadImg(this)" ><div style="position: absolute; width: 18px; height: 18px; border-radius: 18px; background-color: #e0a70b; color: white; text-align: center; vertical-align: middle; top: -5px; left: 86px; cursor: pointer" onclick="CloseImgFunc(\'' + Item.ID + '\')">X</div></div>');
                            });
                        }
                    }
                },
                function completeCallback() {

                }, function errorCallback() {

                });
        }
        //下载图片
        function DownloadImg(obj) {
            window.open($(obj).attr("src"), '_blank', '');
        }

        //选择项目
        function SelComm() {
            if ($('#hidCommID').val() == "") {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../Emergency/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }
        }
        //选择 应急类型/等级
        function SelEmergencyTypeAndLevel() {
            HDialog.OpenWin("600", "520", '../Emergency/SelEmergencyTypeAndLevel.aspx?IsSingle=1', "应急类型/等级选择", false, function callback(_Data) {
                if (_Data != "") {
                    var obj = _Data.split('|');
                    //应急类型
                    if (obj[0].toString() != "") {
                        var TypeList = obj[0].toString().split(',');
                        $('#EmergencyTypeName').val(TypeList[1]);
                        $('#EmergencyTypeID').val(TypeList[0]);
                    }
                    //应急等级
                    if (obj[1].toString() != "") {
                        var LevelList = obj[1].toString().split(',');
                        $('#EmergencyLevelName').val(LevelList[1]);
                        $('#EmergencyLevelID').val(LevelList[0]);
                    } else {
                        $('#EmergencyLevelName').val("");
                        $('#EmergencyLevelID').val("");
                    }
                }
            });
        }
        //页面数据验证
        function ClientClick() {
            return true;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //预算计划审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            //判断必须要有应急类型
            if ($('#EmergencyTypeID').val() == "") {
                HDialog.Info("请选择应急类型");
                return;
            }
            var FlowId = "";
            var ErrorMessage = "";
            //同步调用 获取当前页面能选择那些流程
            $.tool.DataPostJsonAsync('Emergency', 'GetEmergencyWorkFlow', "EmergencyTypeID=" + $('#EmergencyTypeID').val() + "&EmergencyLevelID=" + $('#EmergencyLevelID').val(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data.result) {
                        FlowId = _Data.data;
                    } else {
                        ErrorMessage = _Data.msg;
                    }
                },
                function _completeCallBack() {
                },
                function errorCallback() {
                });

            if (ErrorMessage != "") {
                HDialog.Info(ErrorMessage);
                return;
            }
            if (FlowId == "") {
                HDialog.Info("请设置对应应急类别/等级的审核流程");
                return;
            }
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId" + FlowId + "&Filter=1301&biaoshi=1&random=" + Math.random();
            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                if (_Data != '') {
                    var obj = JSON.parse(_Data);
                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                }
            });
        }

        $(function () {
            //初始化页面高度
            InitTableHeight();

            $('#uploadFile').filebox({
                width: '250px',
                buttonText: '选择图片',
                prompt: '请选择一张图片...',
                accept: 'image/jpg,image/gif,image/jpeg,image/png,image/bmp'
            });

            //加载图片
            LoadImgFunc();
            //判断状态 是否是需要禁用控件
            if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                $('textarea').attr("disabled", "disabled");
                $('#uploadFile').filebox('disable')
                $('#Upload').linkbutton('disable');
            }

            if ($('#Flag').val() == "1") {
                $("input[type='text']").prop("disabled", "true");
                $("SELECT").prop("disabled", "true");
                $("BUTTON").prop("disabled", "true");
                $('textarea').attr("disabled", "disabled");
                $('#uploadFile').filebox('disable')
                $('#Upload').linkbutton('disable');
            }

            //注册点击事件
            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });

            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                $.tool.pageLoading();
                //保存和送审的时候才验证
                if ($(this).attr("id") != "BtnSaveStartWorkFlow" && $(this).attr("id") != "BtnSave") {
                    $.tool.pageUnLoading();
                    return true;
                }
                //关闭编辑状态
                //endEditing();
                if (IsSubmitFlag == false) {
                    HDialog.Info("5秒内不要重复点击");
                    $.tool.pageUnLoading();
                    return false;
                }
                IsSubmitFlag = false;
                setTimeout(function () {
                    IsSubmitFlag = true
                }, 5000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (ClientClick()) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "" && $(this).attr("id") == "BtnSaveStartWorkFlow") {
                            HDialog.Info("请选择审批流程");
                            $.tool.pageUnLoading();
                            return false;
                        }
                        return true;
                    } else {
                        $.tool.pageUnLoading();
                        return false;
                    }
                }
                else {
                    $.tool.pageUnLoading();
                    return false;
                }
            });
        })
    </script>
</body>
</html>
