<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentProcessingFinish.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentProcessingFinish" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style>
        .TdTitle {
            width: 10%;
        }

        input:disabled, textarea:disabled {
            border: 1px solid #DDD;
            background-color: #F5F5F5;
            color: #ACA899;
        }

        .textbox .textbox-text {
            padding: 0;
        }

        .noBorder input[type="text"] {
            border: none;
        }

        .auto-style1 {
            height: 22px;
            width: 10%;
            text-align: center;
        }

        .auto-style2 {
            height: 22px;
            width: 35%;
            text-align: left;
        }
    </style>
</head>
<body style="overflow-y: scroll;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="IncidentID" name="IncidentID" runat="server" />
        <input type="hidden" id="IncidentMan" name="IncidentMan" runat="server" />
        <input type="hidden" id="IncidentNum" name="IncidentNum" runat="server" />
        <input type="hidden" id="CustID" name="CustID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" />
        <input type="hidden" id="RoomID" name="RoomID" runat="server" />
        <input type="hidden" id="CustName" name="CustName" runat="server" />
        <input type="hidden" id="CoordinateNum" name="CoordinateNum" runat="server" />
        <input type="hidden" id="RoomSign" name="RoomSign" runat="server" />
        <input type="hidden" id="IncidentDate" name="IncidentDate" runat="server" />
        <input type="hidden" id="DealLimit" name="DealLimit" runat="server" />
        <input type="hidden" id="IncidentPlace" name="IncidentPlace" runat="server" />
        <input type="hidden" id="Isdelete" name="Isdelete" runat="server" />
        <input type="hidden" id="InfoId" name="InfoId" value="" runat="server" />
        <input type="hidden" id="Flag" name="Flag" value="" runat="server" />
        <input type="hidden" id="DealManUserCode" name="DealManUserCode" value="" runat="server" />
        <input type="hidden" id="FinishManUserCode" name="FinishManUserCode" value="" runat="server" />
        <table class="DialogTable" align="center" style="width: 100%">

            <tr id="huwai">
                <td class="TdTitle">公区名称：
                </td>
                <td class="TdContent">
                    <input id="RegionalPlace" type="text" value="" disabled />
                </td>
                <td class="TdTitle">设备：
                </td>
                <td class="TdContent noBorder">
                    <input type="text" class="easyui-searchbox" style="width: 76%; border: 0;" id="EquipmentName" name="EquipmentName" searcher="SelTaskEqName" />
                    <input id="EqId" type="hidden" value="" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">原因细类：
                </td>
                <td class="TdContent noBorder">
                    <input type="text" class="easyui-searchbox easyui-validatebox" data-options="required:true,editable:false" style="width: 76%; border: 0;" id="FineTypeName" name="FineTypeName" searcher="SelFineTypeName" />
                    <input id="FineTypeID" type="hidden" name="FineTypeID" />
                    <input id="FineTypeCode" type="hidden" name="FineTypeCode" />
                </td>
                <td class="TdTitle">额定工时：
                </td>
                <td class="TdContent">
                    <input id="RatedWorkHour" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">绩效系数：
                </td>
                <td class="TdContent">
                    <input id="KPIRatio" type="text" value="" disabled />
                </td>
                <td class="TdTitle">完成数量：
                </td>
                <td class="TdContent">
                    <input id="RatedWorkHourNumber" type="text" value="1" disabled />
                </td>
            </tr>

            <tr>
                <td class="auto-style1">处理情况：
                </td>
                <td class="auto-style2" colspan="5">
                    <textarea id="DealSituation" class="easyui-validatebox" data-options="required:true" style="width: 89%;"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:Label ID="yuqi" runat="server">逾期原因：</asp:Label>
                </td>
                <%--<td class="TdContentnoBorder">--%>
                <td class="auto-style2" colspan="5">
                    <%--               <select id="OverdueReason" class="easyui-combobox" runat="server" style="width: 76%; border: 0;">
                        <option value=""></option>
                    </select>--%>
                    <textarea id="OverdueReason" class="easyui-validatebox" data-options="required:true" style="width: 89%;"></textarea>

                </td>
                <%--<td class="TdTitle">签字：
                </td>
                <td class="TdContent">
                    <input id="" type="text" value="" />
                </td> --%>
            </tr>
            <tr id="shoufei">

                <td class="TdTitle">是否收费：
                </td>
                <td class="TdContent">
                    <input value="1" name="IsFees" type="radio" id="IsFees1" />是
                                                    <input value="0" name="IsFees" type="radio" id="IsFees2" />否
                                                    <input name="hiIsFees" type="hidden" id="hiIsFees" />
                    <input type="button" class="button" value="费用输入" id="btnFees" style="width: 80px; height: 25px" />
                </td>
                <td class="TdTitle">收费金额：
                </td>
                <td class="TdContent">
                    <input id="DueAmount" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">完成时间：
                </td>
                <td class="TdContent">
                    <%--<input id="MainEndDate" type="text" value="" runat="server" disabled />--%>
                    <input id="MainEndDate" name="MainEndDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate" runat="server" />
                </td>
                <td class="TdTitle">完成操作人：
                </td>
                <td class="TdContent">
                    <input id="FinishMan" type="text" value="" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle" id="imageTitle">照片<a id="UpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage()">(上传)</a> ：
                </td>
                <td id="ImageContent" class="TdContent" colspan="3"></td>

            </tr>
            <tr>
                <td class="TdTitle">附件<a id="UpFile" style="color: #688aed; cursor: pointer;" onclick="UploadFile()">(上传)</a>：
                </td>
                <td class="TdContent" colspan="3">
                    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                    </div>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="6" class="DialogTdSubmit" style="text-align: center">
                    <input type="button" class="button" value="保存" id="btnsave" />
                    <input type="button" class="button" value="放弃返回" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <div style="height: 300px;">
            <iframe id="IncidentFrame" style="width: 100%; height: 100%; border: none;" class="Frm"></iframe>
        </div>
        <script type="text/javascript">  
            //选择设备
            function SelTaskEqName() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/EquipmentChoiceDlg.aspx', '选择设备', false, function callback(_Data) {
                    if (_Data != '') {
                        var data = JSON.parse(_Data);
                        $('#EqId').val(data.Id);
                        $('#EquipmentName').searchbox('setValue', data.EquipmentName);
                    }
                });
            }

            //报事细类
            function SelFineTypeName() {

                HDialog.Open('800', '500', '../DialogNew/NewCorpIncidentTypeFineDlg.aspx?TypeCode=' + obj.BigCorpTypeCode + '&IsCheck=1&IsEdit=true&IsClosed=1&CommID=' + obj.CommID, '选择报事细类', false,
                    function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#FineTypeID").val(arrRet.id);
                        $("#FineTypeCode").val(arrRet.code);
                        $("#FineTypeName").searchbox("setValue", arrRet.TypeName);
                        $("#RatedWorkHour").val(arrRet.RatedWorkHour1);
                        $("#KPIRatio").val(arrRet.KPIRatio1);
                        if ($("#IncidentPlace").val() == '户内') {
                            $("#DealLimit").val(arrRet.DealLimit);
                        } else {
                            $("#DealLimit").val(arrRet.DealLimit2);
                        }

                    });
            }
            //放弃返回
            $("#BtnReturn").click(function () {
                HDialog.Close();
            });
            //输入费用
            $("#btnFees").click(function () {
                HDialog.Open('900', '450', "../ChargesNew/FeesSporadicManage.aspx?CustID=" + $('#CustID').val() + "&CustName=" + $('#CustName').val() + "&RoomID=" + $('#RoomID').val() + "&RoomSign=" + $('#RoomSign').val() + "&IncidentID=" + $('#IncidentID').val() + "&CoordinateNum=" + $('#CoordinateNum').val() + "&IncidentDate=" + $('#IncidentDate').val() + "&IncidentNum=" + $("#IncidentNum").val(), '新增费用', false, function callback(_Data) {
                    if (_Data != "") {
                        //加载基本信息
                        $.tool.DataGet('IncidentProcessingNew', 'GetIncidentInfo', "IncidentID=" + obj.IncidentID,
                            function Init() {
                            },
                            function callback(_Data) {
                                _Data = JSON.parse(_Data);
                                if (_Data.total > 0) {
                                    obj = _Data.rows[0];
                                    $('#DueAmount').val(obj.DueAmount);
                                    if (parseFloat(obj.DueAmount) > 0) {
                                        $('#IsFees1').attr("checked", "checked");
                                        $("#hiIsFees").val(1);
                                    }
                                    else {
                                        $("#hiIsFees").val(0);
                                        $('#IsFees2').attr("checked", "checked");
                                    }
                                    $('#IncidentFrame').attr('src', '../IncidentNewJH/ProcessingManageFooter.aspx?IncidentID=' + IncidentID.value + "&OpType=BSCL");
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }

                });
            });
            //保存
            $("#btnsave").click(function () {
                //设备Id
                var eqId = $("#EqId").val();
                //报事细类
                var fineTypeID = $("#FineTypeID").val();
                //报事细类
                var fineTypeCode = $("#FineTypeCode").val();
                if (!fineTypeCode) {
                    HDialog.Info("请选择原因细类");
                    return;
                }
                if ($("#MainEndDate").val() == "" || $("#MainEndDate").val() == undefined) {
                    HDialog.Info("请选择完成日期");
                    return;
                }

                if ($("#FinishMan").val() == "" || $("#FinishMan").val() == undefined) {
                    HDialog.Info("请输入完成操作人");
                    return;
                }

                //处理情况
                var dealSituation = $('#DealSituation').val();
                if (!dealSituation) {
                    HDialog.Info("请输入处理情况");
                    return;
                }
                if (dealSituation.length > 500) {
                    HDialog.Info("处理情况不能大于500个字");
                    return;
                }
                //逾期原因
                var overdueReason = $('#OverdueReason').val(); //$('#OverdueReason').combobox('getText');
                if (obj.IsBeoverdue == "是") {
                    if (!overdueReason) {
                        HDialog.Info('已逾期必须输入逾期原因');
                        return;
                    }
                }
                var isdelete = $("#Isdelete").val();
                if (Isdelete == "1") {
                    HDialog.Info("已删除的报事不能完成!");
                }

                if ($('#DealManUserCode').val() != $('#FinishManUserCode').val()) {
                    HDialog.Info("你没有完成权限!");
                    return false;
                }

                //收费金额
                var dueAmount = $('#DueAmount').val();
                if ($('#IsFees1').is(':checked') && dueAmount == '') {
                    HDialog.Info("收费工单，请输入费用!");
                    return false;
                }
                //额定工时
                var ratedWorkHour = $('#RatedWorkHour').val();
                //绩效系数
                var kPIRatio = $('#KPIRatio').val();
                //完成数量
                var ratedWorkHourNumber = $('#RatedWorkHourNumber').val();

                if ($("#Flag").val() == 'BL') {
                    //报事处理
                    $.tool.DataGet('IncidentProcessingNew', 'IncidentFinish', "IncidentID=" + $('#IncidentID').val() + "&EqId=" + eqId +
                        "&FineTypeID=" + fineTypeID + "&FineTypeCode=" + fineTypeCode + "&DealSituation=" + escape(dealSituation) +
                        "&OverdueReason=" + overdueReason + "&DueAmount=" + dueAmount + "&RatedWorkHour=" + ratedWorkHour +
                        "&KPIRatio=" + kPIRatio + "&RatedWorkHourNumber=" + ratedWorkHourNumber + "&DealLimit=" + $("#DealLimit").val()
                        + "&CommID=" + $('#CommID').val() + "&IncidentMan=" + $("#IncidentMan").val() + "&IncidentNum=" + $("#IncidentNum").val()
                        + "&InfoId=" + $("#InfoId").val() + '&IsFrees=' + $('input[name="IsFees"]:checked').val()
                        + "&Flag=BL" + "&MainEndDate=" + $("#MainEndDate").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == 'true') {
                                HDialog.Info('保存成功');
                                HDialog.Close('1');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    //报事处理
                    $.tool.DataGet('IncidentProcessingNew', 'IncidentFinish', "IncidentID=" + $('#IncidentID').val() + "&EqId=" + eqId +
                        "&FineTypeID=" + fineTypeID + "&FineTypeCode=" + fineTypeCode + "&DealSituation=" + escape(dealSituation) +
                        "&OverdueReason=" + overdueReason + "&DueAmount=" + dueAmount + "&RatedWorkHour=" + ratedWorkHour +
                        "&KPIRatio=" + kPIRatio + "&RatedWorkHourNumber=" + ratedWorkHourNumber + "&DealLimit=" + $("#DealLimit").val()
                        + "&CommID=" + $('#CommID').val() + "&IncidentMan=" + $("#IncidentMan").val() + "&IncidentNum=" + $("#IncidentNum").val()
                        + "&InfoId=" + $("#InfoId").val() + '&IsFrees=' + $('input[name="IsFees"]:checked').val() + "&Flag=''",
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == 'true') {
                                HDialog.Info('保存成功');
                                HDialog.Close('1');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            });
            var obj = '';
            //初始化
            function InitFunction() {
                //初始化页面                 
                var row = Cache.GetData("IncidentDeals");
                obj = JSON.parse(row);

                //加载基本信息
                $.tool.DataGet('IncidentProcessingNew', 'GetIncidentInfo', "IncidentID=" + obj.IncidentID + "&CommID=" + obj.CommID,
                    function Init() {
                    },
                    function callback(_Data) {
                        _Data = JSON.parse(_Data);
                        if (_Data.total > 0) {
                            obj = _Data.rows[0];
                            $("#IncidentPlace").val(obj.IncidentPlace);
                            $('#IncidentID').val(obj.IncidentID);
                            $('#CommID').val(obj.CommID);
                            if (obj.IncidentPlace == '户内') {
                                $('#huwai').hide();
                            }
                            if (obj.IncidentPlace == '公区') {
                                $('#shoufei').hide();
                            }
                            $('#CustName').val(obj.CustName);
                            $('#RoomSign').val(obj.RoomSign);
                            $('#RegionalPlace').val(obj.RegionalPlace);
                            $('#CustID').val(obj.CustID);
                            $('#RoomID').val(obj.RoomID);
                            $('#IncidentDate').val(obj.IncidentDate);
                            $('#CoordinateNum').val(obj.CoordinateNum);
                            $('#DueAmount').val(obj.DueAmount);
                            $('#Isdelete').val(obj.Isdelete);

                            $('#EqId').val(obj.EqID);
                            $('#EquipmentName').searchbox("setValue", obj.EquipmentName);
                            //if (parseFloat(obj.DueAmount) > 0) {
                            //    $('#IsFrees').attr("checked", "checked");
                            //}
                            //else {
                            //    $('#IsFrees1').attr("checked", "checked");
                            //}
                            //逾期原因                    
                            if (obj.IsBeoverdue == "是") {
                                //$('#OverdueReason').combobox('setText', obj.OverdueReason);
                                $('#OverdueReason').val(obj.OverdueReason);
                            }
                            if (obj.IsBeoverdue == "否") {
                                $("#yuqi").hide();
                                //$("#OverdueReason").next(".combo").hide();
                                $("#OverdueReason").hide();
                            }
                            $('#IncidentNum').val(obj.IncidentNum);

                            $("#hiIsFees").val(obj.IsFee);
                            if (obj.IsFee == '1') {
                                $("input[name='IsFees']").attr("disabled", "true");
                                $('#IsFees1').attr('checked', 'checked');
                            } else {
                                $('#IsFees2').attr('checked', 'checked');
                                $('#btnFees').hide();
                            }
                            $('#DealManUserCode').val(obj.DealManCode);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                //加载受理、跟进图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentProcessingFinish.aspx?Method=GetFiles&IncidentID=" + IncidentID.value,
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {

                    },
                    success: function (data) {
                        if (data) {
                            $('#imageTitle').css('height', '120px');
                            $('#ImageContent').append(data);
                        }
                    }
                });
                //加载附件
                LoadList();
            }
            $(function () {
                InitFunction();
                $('#IncidentFrame').attr('src', '../IncidentNewJH/ProcessingManageFooter.aspx?IncidentID=' + IncidentID.value + "&OpType=BSCL");
            });

            $("input[name='IsFees']").change(function () {
                if ($('#IsFees1').is(':checked')) {
                    $('#btnFees').show();
                } else {
                    $('#btnFees').hide();
                }
            });

            /* ****图片开始*****/
            //查看图片
            function ImageBlclick(fAdjunctCode) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + fAdjunctCode + "&IncidentID=" + IncidentID.value, '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }
            //查看app上传的图片
            function ImageAppBlclick(imgPath) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + imgPath + "&IncidentID=" + IncidentID.value, '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }
            function UploadImage() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + IncidentID.value + "&FileDescr=处理图片", '上传图片', false, function callback(_Data) {
                    if (_Data) {
                        $('#ImageContent').append(CreateSmImg(_Data));
                        $('#imageTitle').css('height', '120px');
                    }
                });
            }
            function CreateSmImg(srcs) {
                var sindex = srcs.lastIndexOf('\\') + 1;
                var eindex = srcs.lastIndexOf('.');
                var fileName = srcs.substring(sindex, eindex);
                var sb = "";
                sb += "<div class=\"addpicdiv\" style=\"width: 71px; height: 71px; float: left; margin-right: 15px; position: relative;text-align:center;\" ondblclick=\"ImageBlclick('" + fileName + "')\">";
                sb += "<img src=\"" + srcs + "\" style=\"width: 71px; height: 71px;\" />";
                sb += "  <div style=\"position: absolute; width: 18px; height: 18px; border-radius: 18px; font-size: 13px; background-color: #e0a70b; color: white; text-align: center; vertical-align: middle; top: -5px; left: 60px; cursor: pointer\" onclick=\"closeImage(this,'" + fileName + "')\">";
                sb += "  ×";
                sb += "   </div>";
                sb += "   <label style=\"font-size:8px;top: -5px;position: relative;\">" + fileName.substring(0, 8) + "(处理)</label>";
                sb += " </div>";
                return sb;
            }
            //通用 删除图片或附件
            function closeImage(obj, AdjunctCode) {
                //删除图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentProcessingFinish.aspx?Method=DeleteFile&IncidentID=" + IncidentID.value + "&FileName=" + AdjunctCode,
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {
                        alert('出错');
                    },
                    success: function (data) {
                        $(obj).parent().remove();
                        var imageContent = $.trim($('#ImageContent').html());
                        if (!imageContent) {
                            $('#imageTitle').css('height', '10px')
                        }
                    }
                });
            }
            /* ****图片结束*****/
            /* ****附件开始*****/
            var column = [[
                { field: 'IncidentID', title: '报事ID', width: 100, align: 'left', sortable: true },
                {
                    field: 'AdjunctCode', title: '上传日期', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 8);
                    }
                },
                {
                    field: 'AdjunctName', title: '文件分类', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 2);
                    }
                },
                { field: 'FileSize', title: '文件尺寸', width: 120, align: 'left', sortable: true },
                {
                    field: 'DeleteOp', title: '删除', width: 100, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (row.AdjunctName == '处理文件') {
                            str = "<a class=\"HrefStyle\"  href='###' onclick=\"PostRequest('DeleteFile', '" + row.AdjunctCode + "');\">删除</a>";
                        }
                        return str;
                    }
                },
                {
                    field: 'UpLoadOp', title: '下载', width: 100, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" target='_black'  href='" + row.FilPath + "' >下载</a>";
                        //var str = "<a class=\"HrefStyle\"  href='###' onclick=\"doLoadFile('" + row.AdjunctCode + "');\">下载</a>";
                        return str;
                    }
                }
            ]];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: true,
                    columns: column,
                    fitColumns: false,
                    rownumbers: true,
                    pagination: false,
                    border: false,
                    remoteSort: false,
                    width: "100%",
                    onBeforeLoad: function (param) {
                        param = GetParamNoPageKey("IncidentProcessingNew", "GetIncidentFiles", "TableContainer", param, IncidentID.value);
                    }
                });
            }
            function GetParamNoPageKey(Class, Command, GridContainer, Param, incidentID) {
                Param.Method = "DataPost";
                Param.Class = Class;
                Param.Command = Command;
                Param.IncidentID = incidentID;
                return Param;
            };
            //上传文件
            function UploadFile() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + IncidentID.value + "&FileDescr=处理文件", '上传文件', false, function callback(_Data) {
                    if (_Data) {
                        LoadList();
                    }
                });
            }
            //删除文件
            function PostRequest(method, adjunctCode) {
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentProcessingFinish.aspx?Method=" + method + "&IncidentID=" + IncidentID.value + "&FileName=" + adjunctCode,
                    async: true,
                    cache: false,
                    error: function (request) {
                        alert('出错');
                    },
                    success: function (data) {
                        if (method == 'DeleteFile') {
                            LoadList();
                        }
                    }
                });
            }
            function doLoadFile(adjunctCode) {
                var url = "/HM/M_Main/IncidentNewJH/IncidentProcessingFinish.aspx?Method=DoLoadFiles&IncidentID=" + IncidentID.value + "&FileName=" + adjunctCode
                jQuery('<form action="' + url + '" method="post"></form>').appendTo('body').submit().remove();
            };
         /* ****附件结束*****/
        </script>


    </form>
</body>
</html>
