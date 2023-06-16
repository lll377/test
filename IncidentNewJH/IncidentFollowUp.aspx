<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentFollowUp.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentFollowUp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>口派关闭</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style>
        input:disabled {
            border: 0px;
            background-color: #fff;
            color: #ACA899;
        }

        .textbox .textbox-text {
            padding: 0;
        }

        .TdContent input[type="text"] {
            border: none;
        }

        .panel {
            overflow: visible;
        }
    </style>
</head>
<body style="overflow: scroll;">
    <form id="from1" runat="server">
        <input type="hidden" id="hiIncidentID" name="hiIncidentID" runat="server" />
        <%--是否逾期--%>
        <input type="hidden" id="Achieve" name="Achieve" runat="server" />
        <input type="hidden" id="GjType" name="GjType" runat="server" />
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td class="TdTitle">跟进情况</td>
                <td class="TdContent" colspan="3">
                    <textarea id="ForwardReasons" style="height: 78px; width: 96%" class="easyui-validatebox" data-options="required:true" name="ForwardReasons"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">跟进类型</td>
                <td class="TdContent">
                    <select id="ForwardType" class="easyui-combobox" runat="server" disabled style="min-width: 180px; max-width: 180px;">
                        <option value="处理中跟进">处理中跟进</option>
                        <option value="已完成跟进">已完成跟进</option>
                    </select>&nbsp;
                </td>
                <td class="TdTitle"><asp:Label ID="yuqi" runat="server">逾期原因</asp:Label></td>
                <td class="TdContent">
                    <select id="OverdueReason" class="easyui-combobox" runat="server" style="min-width: 180px; max-width: 180px;" >
                        <option value=""></option>
                    </select>&nbsp;                
                </td>
            </tr>
            <tr>
                <td class="TdTitle">跟进时间</td>
                <td class="TdContent">
                    <input id="ForwardDateTime" name="ForwardDateTime" runat="server" value="" disabled style="border: none;" />
                </td>
                <td class="TdTitle">跟进人 </td>
                <td class="TdContent">
                    <input id="ForwardUser" name="ForwardUser" runat="server" value="" disabled style="border: none;" />
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
                <td style="text-align: center; padding-top: 10px;" colspan="4">
                    <input class="button" type="button" value="保存" onclick="btnNewSave()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnReturn" />
                </td>
            </tr>
        </table>
    </form>
    <script>
        function btnNewSave() {
            //验证
            var content = $('#ForwardReasons').val();
            if (!content) {
                HDialog.Info("请输入跟进情况");
                return;
            }
            if (content.lenght > 1000) {
                HDialog.Info("跟进情况不能大于1000个字");
                return;
            }

            var forwardType = $('#ForwardType').combobox('getText');//跟进类型
            if (!forwardType) {
                HDialog.Info('请选择跟进类型');
                return;
            }
            var overdueReason = $('#OverdueReason').combobox('getText');//逾期原因

            //if ($('#Achieve').val() == '是' && overdueReason == "") {
            //    HDialog.Info('已逾期必须输入逾期原因');
            //    return;
            //}
            var incidentID = $('#hiIncidentID').val();
            //报事跟进
            $.tool.DataGet('IncidentProcessingNew', 'IncidentForward', "IncidentID=" + incidentID + "&ForwardReasons=" +
                escape(content) + "&ForwardType=" + forwardType + "&OverdueReason=" + overdueReason,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == 'true') {
                        HDialog.Info('跟进成功');
                        HDialog.Close(1);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        $("#btnReturn").click(function () {
            HDialog.Close();
        });
        function UploadImage() {
            HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + hiIncidentID.value + "&FileDescr=跟进图片", '上传图片', false, function callback(_Data) {
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
            sb += "<div class=\"addpicdiv\" style=\"width: 71px; height: 71px; float: left; margin-right: 15px; position: relative;text-align:center;\" ondblclick=\"ImageBlclick('" + localStorage.fAdjunctCode + "')\">";
            sb += "<img src=\"" + srcs + "\" style=\"width: 71px; height: 71px;\" />";
            sb += "  <div style=\"position: absolute; width: 18px; height: 18px; border-radius: 18px; font-size: 13px; background-color: #e0a70b; color: white; text-align: center; vertical-align: middle; top: -5px; left: 60px; cursor: pointer\" onclick=\"closeImage(this,'" + localStorage.fAdjunctCode + "')\">";
            sb += "  ×";
            sb += "   </div>";
            sb += "   <label style=\"font-size:8px;\">" + fileName.substring(0, 8) + "(跟进)</label>";
            sb += " </div>";
            return sb;
        };
        //查看图片
        function ImageBlclick(fAdjunctCode) {
            HDialog.Open('888', '666', "../IncidentNewJH/ViewIncidentImage.aspx?FileName=" + fAdjunctCode + "&IncidentID=" + hiIncidentID.value + "&ImageType=跟进图片", '查看图片', false, function callback(_Data) {
                if (_Data == 1) {
                }
            });
        }
        function closeImage(obj, AdjunctCode) {
            //删除图片
            $.ajax({
                type: "POST",
                url: "/HM/M_Main/IncidentNewJH/IncidentFollowUp.aspx?Method=DeleteFile&IncidentID=" + hiIncidentID.value + "&FileName=" + AdjunctCode,
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
                        $('#imageTitle').css('height', '10px');
                    }
                }
            });
        }

        $(function () {
            $("#yuqi").hide();
            $("#OverdueReason").next(".combo").hide();
            if ($("#GjType").val() == "deal") {
                $('#ForwardType').combobox('setText', "处理中跟进");
            }
            if ($("#GjType").val() == "complete") {
                $('#ForwardType').combobox('setText', "已完成跟进");
            }
            //加载跟进图片
            $.ajax({
                type: "POST",
                url: "/HM/M_Main/IncidentNewJH/IncidentFollowUp.aspx?Method=GetFiles&IncidentID=" + hiIncidentID.value,
                async: true,
                cache: false,
                dataType: 'text',
                contentType: false,
                processData: false,
                error: function (request) {

                },
                success: function (data) {
                    if (data) {
                        $('#imageTitle').css('height', '120px')
                        $('#ImageContent').append(data);
                    }
                }
            });
        })
        /* ****附件开始*****/
        var column = [[
            { field: 'IncidentID', title: '报事ID', width: 180, align: 'left', sortable: true },
            {
                field: 'AdjunctCode', title: '上传日期', width: 100, align: 'left', sortable: true,
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
                    if (row.AdjunctName == '跟进文件') {
                        str = "<a class=\"HrefStyle\"  href='###' onclick=\"PostRequest('DeleteFile', '" + row.AdjunctCode + "');\">删除</a>";
                    }
                    return str;
                }
            },
            {
                field: 'UpLoadOp', title: '下载', width: 80, align: 'center', sortable: false,
                formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" target='_blank' href='" + row.FilPath+"'>下载</a>";
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
                width: "96%",
                onBeforeLoad: function (param) {
                    param = GetParamNoPageKey("IncidentProcessingNew", "GetIncidentFiles", "TableContainer", param, hiIncidentID.value, '跟进文件');
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
        //加载附件
        LoadList();
        //上传文件
        function UploadFile() {
            HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + hiIncidentID.value + "&FileDescr=跟进文件", '上传文件', false, function callback(_Data) {
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
        };
        function doLoadFile(adjunctCode) {
            var url = "/HM/M_Main/IncidentNewJH/IncidentWrittenDeal.aspx?Method=DoLoadFiles&IncidentID=" + hiIncidentID.value + "&FileName=" + adjunctCode
            jQuery('<form action="' + url + '" method="post"></form>').appendTo('body').submit().remove();
        };
         /* ****附件结束*****/
    </script>
</body>
</html>
