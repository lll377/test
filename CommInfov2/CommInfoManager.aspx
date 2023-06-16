<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommInfoManager.aspx.cs" Inherits="M_Main.CommInfov2.CommInfoManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_Fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>
    <style>
        .div-container {
            margin-top: 10px;
            margin-right: 10px;
            float: left;
            position: relative;
            width: 120px;
            height: 120px;
        }

        .div-containner-border {
            border: 2px solid gray;
        }

        .abscenter {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -54px;
            margin-top: -15px;
        }

        .xximg {
            border: 1px solid #cccccc;
            width: 120px;
            height: 120px;
        }
    </style>
</head>
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server" style="overflow: auto">
        <input id="InfoID" type="hidden" name="InfoID" runat="server" />
        <input id="OpType" type="hidden" name="OpType" runat="server" />
        <input id="CommID" type="hidden" name="CommID" runat="server" />

        <table class="DialogTable" border="0">
            <tr id="InfoTypeV">
                <td class="DialogTdTitle">资讯类型</td>
                <td>
                    <label>
                        <input type="radio" name="InfoType" value="qqts" runat="server" style="margin-left: -1px;" checked="true" />亲情提示</label>
                    <label>
                        <input type="radio" name="InfoType" value="dtzx" runat="server" style="margin-left: 20px;" />社区资讯</label>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">标题</td>
                <td class="DialogTdContent_4Col" colspan="3">
                    <input id="Heading" runat="server" name="Heading" type="text" class="easyui-validatebox" data-options="required:true" style="width: 82%; border: 1px #cccccc solid;" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">开始时间</td>
                <td class="DialogTdContent_4Col">
                    <input id="IssueDate" runat="server" name="IssueDate" type="text" class="easyui-datetimebox" data-options="required:true" />
                </td>
                <td class="DialogTdTitle">资讯来源</td>
                <td class="DialogTdContent_4Col">
                    <input id="InfoSource" runat="server" name="InfoSource" type="text" class="easyui-validatebox" data-options="required:false" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">是否重要公告</td>
                <td class="DialogTdContent_4Col">
                    <label>
                        <input type="radio" name="IsEmphasisInform" value="0" runat="server" style="margin-left: -1px;" checked="true" />否　　
                    </label>
                    <label>
                        <input type="radio" name="IsEmphasisInform" value="1" runat="server" style="margin-left: -20px;" />是   
                    </label>
                </td>
                <td class="DialogTdTitle">有效时间</td>
                <td class="DialogTdContent_4Col">
                    <input id="ShowEndDate" runat="server" name="ShowEndDate" type="text" class="easyui-datetimebox" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">公告摘要</td>
                <td class="DialogTdContent_4Col" colspan="3">
                    <input id="InformAbstract" runat="server" name="InformAbstract" type="text" class="easyui-validatebox" data-options="required:true" style="width: 82%; border: 1px #cccccc solid;" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">公告范围项目</td>
                <td class="DialogTdContent_4Col">
                    <input type="text" data-options="editable:false" id="InformCommNameList" onclick="SelCommInfo();" style="width: 48%;" name="InformCommNameList" runat="server" />
                    <input id="InformCommIDList" type="hidden" name="InformCommIDList" runat="server" />
                </td>
                <td class="DialogTdTitle">公告范围楼栋</td>
                <td class="DialogTdContent_4Col">
                    <input type="text" data-options="editable:false" id="InformBuildNameList" onclick="SelBuild();" style="width: 48%;" name="InformBuildNameList" runat="server" />
                    <input id="InformBuildIDList" type="hidden" name="InformBuildIDList" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">信息内容</td>
                <td class="DialogTdContent_4Col" colspan="3">
                    <script id="editor" type="text/plain" style="width: 97%;"></script>
                    <input id="InfoContent" type="hidden" name="InfoContent" runat="server">
                </td>

            </tr>
            <tr id="Content3">
                <td class="DialogTdTitle">微信推送信息</td>
                <td class="DialogTdContent_4Col" colspan="3">
                    <textarea id="PushInfo" type="hidden" name="PushInfo" runat="server" style="height: 50px; width: 98%;"></textarea>
                </td>
            </tr>
            <tr id="Content1">
                <td class="DialogTdTitle">推送级别</td>
                <td class="DialogTdContent_4Col" colspan="2">
                    <input id="Level" name="Level" type="text" class="easyui-numberbox" value="0" data-options="min:0,max:99,precision:0" />
                    <span style="color: red;">温馨提示:级别范围0-99,0最后推送,99最先推送</span>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">推送消息</td>
                <td class="DialogTdContent_4Col">
                    <label>
                        <input id="IsPushYes" runat="server" name="IsPush" type="radio" checked="true" value="1" class="easyui-radio" data-options="required:false" />是(需开启App推送功能)</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <label>
                        <input id="IsPushNo" runat="server" name="IsPush" type="radio" value="0" class="easyui-radio" data-options="required:false" />否</label>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="width: 80px;">附图
                </td>
                <td class="DialogTdContent_4Col" colspan="3" id="imageContainer" runat="server">
                    <div class="div-container div-containner-border" style="float: left; position: relative">
                        <input id="add" type="button" class="button abscenter" value="添加">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 28px;"></td>
            </tr>
            <tr style="bottom: 0; position: fixed; width: 540px; height: 35px; line-height: 35px; background-color: #f5f5f5; margin-left: -2px; padding-left: 354px; padding-bottom: 5px;">
                <td colspan="4" style="text-align: center;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <input type="hidden" id="ImageUrl" name="ImageUrl" runat="server" />
        <input type="hidden" id="CanEdit" name="CanEdit" value="1" runat="server" />
        <input id="UpFile" type="file" runat="server" name="UpFile" style="width: 1px; visibility: hidden" accept="image/*" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $("#add").click(function (e) {
                if ($("#imageContainer").children(".div-container").length == 6) {
                    HDialog.Info("最多只能上传5张图片，请删除多余的图片后再试");
                    return;
                }
                $("#UpFile").click();
            });

            $("#BtnSave").click(function () {
                if ($("#InformCommIDList").val().length == 0) {
                    HDialog.Info("请选择公告范围项目!");
                    return;
                }
                if ($("#IssueDate").datetimebox('getValue') > '' && $("#ShowEndDate").datetimebox('getValue') > '' && $("#IssueDate").datetimebox('getValue') > $("#ShowEndDate").datetimebox('getValue')) {
                    HDialog.Info("开始时间不能大于有效时间");
                    return;
                }

                var InfoContent = UE.getEditor('editor').getContent();
                $("#InfoContent").val(InfoContent);

                $.tool.DataPostChk('frmForm', 'CommInfo', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            HDialog.Close('1');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            function SelCommInfo() {
                var w = $(window).width() * 0.7;
                HDialog.Open('900', '580', '../DialogNew/SelComm.aspx?IsCheck=1&isCommID=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#InformCommIDList").val(arrRet.id);
                    $("#InformCommNameList").val(arrRet.name);
                    //$('#InformCommNameList').searchbox('setValue', arrRet.name);
                });
            }

            function SelBuild() {
                var InformCommIDList = $('#InformCommIDList').val();
                Cache.SetData("InformCommIDLists", InformCommIDList);
                HDialog.Open('700', '400', "../DialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var BuildIDList = "";
                        var BuildNames = "";
                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];
                                BuildIDList = BuildIDList + "," + varObjects[i].split(',')[2];
                                BuildNames = BuildNames + "," + varObjects[i].split(',')[1] + '(' + varObjects[i].split(',')[3] + ')';
                            }
                        }
                        $('#InformBuildIDList').val(BuildIDList.substring(1, BuildIDList.length));
                        $('#InformBuildNameList').val(BuildNames.substring(1, BuildNames.length));
                        //$('#InformBuildNameList').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                    }
                });
            }

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

            var ue = UE.getEditor('editor');

            $(document).ready(function () {
                var content = $('#InfoContent').val();
                ue.ready(function () {
                    var h = $(window).height();
                    ue.setHeight(200);
                    ue.setContent(content);
                });
                if ($("#CanEdit").val() == "0") {
                    $("#BtnSave").css('display', 'none');
                    $("#Heading").attr("disabled", true);
                    $("#InfoSource").attr("disabled", true);
                    $("#InformAbstract").attr("disabled", true);
                    $("#InformCommNameList").attr("disabled", true);
                    $("#InformBuildNameList").attr("disabled", true);
                    $("#InfoContent").attr("disabled", true);
                }
                $(function () {
                    $("#IssueDate").datetimebox('calendar').calendar({
                        validator: function (date) {
                            var now = new Date();
                            var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                            return d1 <= date;
                        }
                    });
                    $("#ShowEndDate").datetimebox('calendar').calendar({
                        validator: function (date) {
                            var now = new Date();
                            var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                            return d1 <= date;
                        }
                    });
                })
            });

            $("#add").click(function (e) {
                $("#UpFile").click();
            });

            $("#UpFile").change(function (e) {
                UpLoadFile();
            });
            function getFileName(o) {
                var pos = o.lastIndexOf("\\");
                return o.substring(pos + 1);
            }
            function UpLoadFile() {
                var file = $("#UpFile").val();
                var fileName = getFileName(file);

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

                        if (addr.length > 200) {
                            HDialog.Info('上传失败啦,重新试试吧');
                        } else {
                            insertImage(addr);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                        HDialog.Info('上传失败啦,重新试试吧');
                    }
                });
            }

            function insertImage(addr) {
                var imageUrl = $("#ImageUrl").val();
                if (imageUrl != "") {
                    imageUrl = imageUrl + "," + addr;
                } else {
                    imageUrl = addr;
                }
                $("#ImageUrl").val(imageUrl);

                var html = "<div class=\"div-container\"><img class=\"xximg\" src=\"" + addr + "\">"
                html += "<input onclick=\"delImage(this)\" type=\"button\" class=\"button abscenter\" value=\"删除\"></div>";
                $("#imageContainer").prepend(html);
            }

            function delImage(obj) {
                $(obj).parent().remove();
                var $imgs = $("#imageContainer").find("img");
                var imageUrlArr = [];
                for (var i = 0; i < $imgs.length; i++) {
                    imageUrlArr.push($imgs.eq(i).attr("src"));
                }
                $("#ImageUrl").val(imageUrlArr.join(","));
            }
        </script>
    </form>
</body>
</html>
