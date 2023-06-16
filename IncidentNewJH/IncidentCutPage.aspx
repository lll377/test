<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentCutPage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentCutPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style>
        .TdTitle {
            width: 15%;
        }

        td {
            padding-bottom: 8px;
        }

        textarea {
            resize: none;
            border: 1px solid #ccc;
            height: 75px;
        }

        input:disabled {
            border: 0px;
            background-color: #fff;
            color: #ACA899;
        }
    </style>
</head>
<body style="overflow-y: scroll; padding: 5px 20px 20px 20px;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="hiIncidentID" name="hiIncidentID" runat="server" />
        <input type="hidden" id="hiCloseType" name="hiCloseType" runat="server" />
        <input type="hidden" id="InfoId" name="InfoId" value="" runat="server" />
        <input type="hidden" id="hiNoNormalCloseReasons" name="hiNoNormalCloseReasons" runat="server" />
        <table class="DialogTable" style="width: 100%;">
            <tr id="CutContextTitle">
                <td class="TdTitle">关闭情况：
                </td>
                <td class="TdContent" colspan="3">
                    <textarea id="CutContext" class="easyui-validatebox" data-options="required:true" style="width: 100%;" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">关闭类型：
                </td>
                <td class="TdContent">
                    <select id="CloseType" class="easyui-combobox" data-options="required:true,panelHeight:'auto',onSelect:SelWarningType,editable:false" runat="server" style="width: 100px;">
                        <option value="0">正常关闭</option>
                        <option value="1">非正常关闭</option>
                    </select>
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent">
                    <%--  <select id="NoNormalCloseReasons" class="easyui-combobox" runat="server" style="min-width: 120px; max-width: 180px;">
                        <option value=""></option> 非正常关闭原因：
                    </select>--%>
                </td>
            </tr>
            <tr id="ReasonsTitle">
                <td class="TdTitle">非关原因：
                </td>
                <td class="TdContent" colspan="3">
                    <textarea id="NoNormalCloseReasons" class="easyui-validatebox" data-options="required:true" style="width: 100%;" runat="server"></textarea>
                </td>
            </tr>
            <tr style="display: none;">
                <td class="TdTitle">是否关闭：
                </td>
                <td class="TdContent">
                    <input type="radio" id="IsClosed" name="IsClosed" value="1" checked /><label for="IsClosed">是</label>
                    <input type="radio" id="IsClosed1" name="IsClosed" value="0" /><label for="IsClosed1">否</label>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">关闭时间：
                </td>
                <td class="TdContent">
                    <input id="CloseDate" type="text" style="border: none;" disabled runat="server" />
                </td>
                <td class="TdTitle">关闭人：
                </td>
                <td class="TdContent">
                    <input id="CloseMan" type="text" style="border: none;" disabled runat="server" />
                </td>

            </tr>
            <tr>
                <td class="TdTitle" id="imageTitle">照片<a id="UpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage()">(上传)</a>
                </td>
                <td id="ImageContent" class="TdContent" colspan="3"></td>
            </tr>
            <tr>
                <td class="TdTitle">附件<a id="UpFile" style="color: #688aed; cursor: pointer;" onclick="UploadFile()">(上传)</a>
                </td>
                <td class="TdContent" colspan="3">
                    <div style="background-color: #cccccc;" id="TableContainer">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="6" class="DialogTdSubmit" style="text-align: center">
                    <input class="button" type="button" id="btnSave" value="确认关闭" onclick="btnNewSave();" style="margin: 12px 35px 0 0;" />
                    <input type="button" class="button" value="放弃返回" id="BtnReturn" style="margin: 12px 0 0 15px;" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            function SelWarningType(record) {
                if (record.value == '1') {
                    $("#btnSave").val("申请关闭");
                    $("#btnSave").text("申请关闭");
                } else { $("#btnSave").val("确认关闭"); $("#btnSave").text("确认关闭"); }
            }


            function btnFileUp_Onclick() {
                if (frmForm.btnFile.value == "") {
                    HDialog.Info("请选择要上传的本地文件!");
                    return false;
                }
                UpladFile();
                return true;
            }
            //是否完成
            $("input[name='IsClosed']").click(function () {
                var id = $(this).attr("id");
                if (id == "IsClosed") {
                    isCosed = '1'
                }
                else {
                    isCosed = '0'
                }
            })
            var isCosed = '1';
            function btnNewSave() {
                var incidentID = $('#hiIncidentID').val();
                var val = $('#CloseType').combobox('getValue');//关闭类型
                var closeReasons = $('#NoNormalCloseReasons').val(); //$('#NoNormalCloseReasons').combobox('getText');//非正常关闭原因
                //数据验证
                $.tool.DataGet('IncidentControl', 'GetIsCloseIncident', "IncidentID=" + incidentID,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (parseInt(_Data) > 0) {
                            HDialog.Info('操作失败,当前报事单正在进行非正常关闭审核操作！');
                            HDialog.Close(1);
                        }
                        else {
                            if (val == '1') {
                                CloseManageDetail(incidentID);
                            }
                            else {
                                //验证
                                var content = $('#CutContext').val();
                                if (!content) {
                                    HDialog.Info("请输入关闭原因");
                                    return;
                                }
                                if (content.length > 500) {
                                    HDialog.Info("关闭原因最多只能输入500个字");
                                    return;
                                }
                                //关闭报事
                                $.tool.DataGet('IncidentControl', 'CloseIncident', "IncidentID=" + incidentID + "&CutContext=" + escape(content) + "&CloseType=" + val + "&IsCosed=" + isCosed + "&CloseReasons=" + escape(closeReasons) + "&InfoId=" + $('#InfoId').val(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == 'true') {
                                            if (val == "1") {
                                                HDialog.Info('保存成功');
                                            } else {
                                                HDialog.Info('保存成功!');
                                            }

                                            HDialog.Close(1);
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });



            }

            function CloseManageDetail(incidentID) {
                HDialog.Open('800', '550', '../IncidentNewJH/IncidentCloseManageDetail.aspx?IncidentID=' + incidentID + '&OPType=insert', '非正常关闭申请', false, function callback(_Data) {
                    if (_Data) {
                        if (_Data == "1") {
                            HDialog.Close(1);
                        } else { HDialog.Info(_Data); }

                    }
                });
            }

            $("#BtnReturn").click(function () {
                HDialog.Close();
            });

            $(document).ready(function () {
                $("#CloseType").combobox({
                    onChange: function (n, o) {
                        var val = $(this).combobox('getValue');
                        if (val == '1') {//非正常关闭原因                        
                            // $('#NoNormalCloseReasons').next(".combo").show();
                            //$('#ReasonsTitle').show();
                            $('#ReasonsTitle').hide();
                            $('#CutContextTitle').hide();
                        }
                        else {
                            //  $('#NoNormalCloseReasons').next(".combo").hide();
                            $('#ReasonsTitle').hide();
                            $('#CutContextTitle').show();
                        }
                    }
                });
                var closeType1 = hiCloseType.value;
                var noNormalCloseReasons1 = hiNoNormalCloseReasons.value;
                if (closeType1 == "1") {//非正常关闭                 
                    $('#CloseType').combobox('setText', '非正常关闭');
                    $('#CloseType').combobox('setValue', '1');
                    $('#NoNormalCloseReasons').combobox('setText', noNormalCloseReasons1);
                }
                else {
                    $('#NoNormalCloseReasons').next(".combo").hide();
                    $('#ReasonsTitle').hide();
                }

                //加载图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentCutPage.aspx?Method=GetFiles&IncidentID=" + hiIncidentID.value,
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
            });
            /*****图片开始***/
            function UploadImage() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + hiIncidentID.value + "&FileDescr=关闭图片", '上传图片', false, function callback(_Data) {
                    if (_Data) {
                        $('#ImageContent').append(CreateSmImg(_Data));
                        $('#imageTitle').css('height', '120px');
                    }
                });
            };
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
                sb += "   <label style=\"font-size:8px;top: -5px;position: relative;\">" + fileName.substring(0, 8) + "(关闭)</label>";
                sb += " </div>";
                return sb;
            };
            //查看图片
            function ImageBlclick(fAdjunctCode) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + fAdjunctCode + "&IncidentID=" + hiIncidentID.value + "&ImageType=关闭图片", '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }
            function closeImage(obj, AdjunctCode) {
                //删除图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentCutPage.aspx?Method=DeleteFile&IncidentID=" + hiIncidentID.value + "&FileName=" + AdjunctCode,
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
            /*****图片结束***/
            /* ****附件开始*****/
            var column = [[
                { field: 'IncidentID', title: '报事ID', width: 160, align: 'left', sortable: true },
                {
                    field: 'AdjunctCode', title: '上传日期', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 8);
                    }
                },
                {
                    field: 'AdjunctName', title: '文件分类', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 2);
                    }
                },
                { field: 'FileSize', title: '文件尺寸', width: 80, align: 'left', sortable: true },
                {
                    field: 'DeleteOp', title: '删除', width: 80, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (row.AdjunctName == '关闭文件') {
                            str = "<a class=\"HrefStyle\"  href='###' onclick=\"PostRequest('DeleteFile', '" + row.AdjunctCode + "');\">删除</a>";
                        }
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
                    fitColumns: true,
                    rownumbers: false,
                    pagination: false,
                    border: false,
                    remoteSort: false,
                    width: "100%",
                    onBeforeLoad: function (param) {
                        param = GetParamNoPageKey("IncidentProcessingNew", "GetIncidentFiles", "TableContainer", param, hiIncidentID.value, '关闭文件');
                    }
                });
            }
            function GetParamNoPageKey(Class, Command, GridContainer, Param, incidentID, imageType) {
                Param.Method = "DataPost";
                Param.Class = Class;
                Param.Command = Command;
                Param.IncidentID = incidentID;
                Param.ImageType = imageType;
                return Param;
            };
            LoadList();
            //上传文件
            function UploadFile() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + hiIncidentID.value + "&FileDescr=关闭文件", '上传文件', false, function callback(_Data) {
                    if (_Data) {
                        LoadList();
                    }
                });
            }
            //删除文件
            function PostRequest(method, adjunctCode) {
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentWrittenDeal.aspx?Method=" + method + "&IncidentID=" + hiIncidentID.value + "&FileName=" + adjunctCode,
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
            /* ****附件结束*****/
        </script>
    </form>
</body>
</html>
