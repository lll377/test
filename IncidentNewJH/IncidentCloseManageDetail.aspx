<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentCloseManageDetail.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentCloseManageDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事关闭详细页面</title>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-x: hidden;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header {
            border-color: #cccccc;
            padding: 0px;
            margin: 0px;
        }

        .tabs-container .panel-body {
            border-color: #cccccc;
            padding: 0px;
            margin: 0px;
        }

        .panel-body {
            padding: 0px;
            margin: 0px;
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

        .tab-content {
            height: 100%;
        }

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }

        .DialogTable {
            font-size: 12px;
            font-family: 'Microsoft YaHei UI';
            table-layout: fixed;
        }

            .DialogTable .DialogTdTitle {
                height: 25px;
                width: 100px;
                text-align: center;
            }

            .DialogTable .DialogTdContent {
                height: 25px;
                width: 180px;
                text-align: left;
            }

        .messager-body {
            padding: 15px;
        }

        .datagrid-mask-msg {
            height: auto;
        }

        .datagrid-ftable tr td {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <form id="RenoCustAuditManage" method="post" runat="server">

        <input id="UserCode" type="hidden" size="1" name="UserCode" runat="server" />
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server" />
        <input id="IID" type="hidden" size="1" name="IID" runat="server" />
        <input id="IncidentID" type="hidden" size="1" name="IncidentID" runat="server" />
        <input type="hidden" id="State" name="State" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="RoomSign" name="RoomSign" runat="server" />
        <input type="hidden" id="FeesRoleCodes_Order" name="FeesRoleCodes_Order" runat="server" />
        <input type="hidden" id="FeesRoleCodes" name="FeesRoleCodes" runat="server" />
        <input type="hidden" id="hiIncidentID" name="hiIncidentID" runat="server" />
        <!-- 按钮工具栏 -->
        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
        </div>
        <table id="Header_TableMain" class="DialogTable">
            <tr>
                <td class="DialogTdTitle">项目名称</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="CommName" type="text" name="CommName" style="width: 240px;" runat="server" disabled>
                </td>
                <td class="DialogTdTitle">报事编号</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" type="text" id="IncidentNum" style="color: blue; text-decoration: underline; width: 240px; cursor: pointer; border-bottom: none;"
                        onclick="ViewIncidentAccept()" name="IncidentNum" runat="server" readonly />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">发起人</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="UserName" type="text" maxlength="50" style="width: 240px;" name="UserName" runat="server" disabled></td>
                <td class="DialogTdTitle">发起时间</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="WorkStartDate" type="text" maxlength="50" style="width: 240px;" name="WorkStartDate" runat="server" disabled></td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="color: red;">标题</td>
                <td class="DialogTdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" id="Title" name="Title" data-options="required:true" maxlength="500" style="width: 91%;" runat="server" /></td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="color: red;">非正常关闭原因</td>
                <td class="DialogTdContent" colspan="3">
                    <textarea type="text" class="easyui-validatebox" id="CloseReason" name="CloseReason" data-options="required:true" style="width: 91%;" maxlength="1400" runat="server"></textarea>
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
        </table>
    </form>
    <script type="text/javascript">

        $("#BtnClose").click(function (e) {
            HDialog.Close('');
        });

        var IsSubmitFlag = true;
        $("input[type='submit']").click(function (e) {
            if (IsSubmitFlag == false) {
                HDialog.Info("30秒内不要重复点击");
                return false;
            }
            if (ClientClick()) {
                //IsSubmitFlag = false;
                //setTimeout('IsSubmitFlag=true', 30000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    return true;
                }
                else {
                    return false;
                }
            } else {
                return false;
            }
        });

        function ClientClick() {
            if ( hiOPType.value == "insert")
            {
                if ($("#ImageContent").find("div").length == 0)
                {
                    HDialog.Info("非正常关闭申请操作，需上传图片!");
                    return false;
                  }
                var rows = $('#TableContainer').datagrid('getRows');
                if (rows.length <= 0)
                {
                    HDialog.Info("非正常关闭申请操作，需上传附件!");
                    return false;
                }
               
            }
            return true;
        }

        $(document).ready(function () {
            //加载图片
            $.ajax({
                type: "POST",
                url: "/HM/M_Main/IncidentNewJH/IncidentCloseManageDetail.aspx?Method=GetFiles&IncidentID=" + hiIncidentID.value + "&OPType=" + hiOPType.value,
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
            LoadList();
            //审核人不可以上传
            if (hiOPType.value == "edit")
            {
                //$('#UpImage').hide();
                //$('#UpFile').hide();
            }

        });


        //查看报事详情
        function ViewIncidentAccept() {
            $.tool.DataGet('IncidentAcceptNew_Search', 'IncidentSearch', "IncidentID=" + $('#IncidentID').val() + "&page=1&rows=1",
                                     function Init() {
                                     },
                                     function callback(_Data) {
                                         if (_Data != "") {
                                             var Obj = JSON.parse(_Data);
                                             if (Obj.rows.length > 0) {
                                                 Cache.SetData("IncidentInfos", JSON.stringify(Obj.rows[0]));
                                                 var content = '../IncidentNewJH/IncidentControlManage.aspx?IncidentID=' + $('#IncidentID').val();
                                                 HDialog.Open('1200', '600', content, '报事查询详细记录', true, function callback(_Data) {
                                                     Cache.SetData("IncidentInfos", '');
                                                 });
                                             }
                                         }
                                     },
                                     function completeCallback() {
                                     },
                                     function errorCallback() {
                                     });

        }
        /*****图片开始***/
        function UploadImage() {
            HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + hiIncidentID.value + "&FileDescr=非正常关闭图片", '上传图片', false, function callback(_Data) {
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
            sb += "   <label style=\"font-size:8px;top: -5px;position: relative;\">" + fileName.substring(0, 5) + "(非正常关闭)</label>";
            sb += " </div>";
            return sb;
        };
        //查看图片
        function ImageBlclick(fAdjunctCode) {
            HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + fAdjunctCode + "&IncidentID=" + hiIncidentID.value + "&ImageType=非正常关闭图片", '查看图片', false, function callback(_Data) {
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
                    if (row.AdjunctName == '非正常关闭文件')
                    {
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
                    param = GetParamNoPageKey("IncidentProcessingNew", "GetIncidentFiles", "TableContainer", param, hiIncidentID.value, '非正常关闭文件');
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
    
        //上传文件
        function UploadFile() {
            HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + hiIncidentID.value + "&FileDescr=非正常关闭文件", '上传文件', false, function callback(_Data) {
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
</body>
</html>
