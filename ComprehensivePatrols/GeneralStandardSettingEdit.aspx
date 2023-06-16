<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneralStandardSettingEdit.aspx.cs" Inherits="M_Main.ComprehensivePatrols.GeneralStandardSettingEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>通用标准设置新增</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
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
            width: 96.2%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 42px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
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
            width: 8%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">序号:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true" />
                    </td>
                    <td class="TdTitle">任务类型:</td>
                    <td class="TdContentSearch">
                        <select id="TaskType" name="TaskType" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,onSelect:TaskTypeSelect,onUnselect:TaskTypeSelect">
                        </select>
                    </td>
                    <td class="TdTitle">通用点位:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PointName" name="PointName" maxlength="25" readonly class="easyui-validatebox" data-options="required:true" onclick="SelPoint();" />
                        <input type="hidden" name="SysPointId" id="SysPointId" value="" />
                    </td>
                    <td class="TdTitle">通用对象:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ObjName" name="ObjName" maxlength="25" readonly class="easyui-validatebox" data-options="required:true" onclick="SelObj();" />
                        <input type="hidden" name="SysObjId" id="SysObjId" value="" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">标准代码:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Code" name="Code" maxlength="25" class="easyui-validatebox" data-options="required:true" />
                    </td>
                    <td class="TdTitle">所属专业:</td>
                    <td class="TdContentSearch">
                        <select id="Professional" name="Professional" runat="server" class="easyui-combobox" data-options="required:true,panelHeight: 'auto',editable:false ">
                        </select>
                    </td>
                    <td class="TdTitle">所属类别:</td>
                    <td class="TdContentSearch">
                        <select id="DType" name="DType" runat="server" class="easyui-combobox" data-options="required:true,panelHeight: 'auto',editable:false ">
                        </select>
                    </td>
                    <td class="TdTitle">所占分值:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Score" name="Score" maxlength="25" class="easyui-numberbox" data-options="min:0,precision:2" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">最高风险等级:</td>
                    <td class="TdContentSearch">
                        <select id="MaximumRiskLevel" name="MaximumRiskLevel" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'">
                        </select>
                    </td>
                    <td class="TdTitle">适用项目类型:</td>
                    <td class="TdContentSearch">
                        <select id="CommType" name="CommType" runat="server" class="easyui-combobox" data-options="multiple:true, editable:false,panelHeight: 'auto',required:true">
                        </select>
                    </td>
                    <td class="TdTitle">是否启用:</td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="IsUse" name="IsUse" class="easyui-combobox" data-options="panelHeight:'auto',width:'60',editable:false">
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">标准内容:</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="CheckStandard" name="CheckStandard" data-options="required:true" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">方法指引:</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="CheckWay" name="CheckWay"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">支撑文件:</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="CheckFiles" name="CheckFiles"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">备注:</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="Remark" name="Remark"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">图片示例:</td>
                    <td colspan="7" class="TdContentSearch">
                        <iframe src="../UploadFileName.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">文件列表:</td>
                    <td colspan="7" class="TdContentSearch">
                        <div id="ListImg" runat="server"></div>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">相关附件:</td>
                    <td colspan="7" class="TdContentSearch">
                        <iframe src="../UploadFileNameCP.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">文件列表:</td>
                    <td colspan="7" class="TdContentSearch">
                        <div id="ListFile" runat="server"></div>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="btnClose_Click();" />
        </div>

        <input type="hidden" id="SysStandId" name="SysStandId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="SamplePic" name="SamplePic" />
        <input type="hidden" id="Files" name="Files" />
        <input type="hidden" id="SamplePicName" name="SamplePicName" />
        <input type="hidden" id="FilesName" name="FilesName" />
        <input type="hidden" id="SamplePicList" name="SamplePicList" />
        <input type="hidden" id="FilesList" name="FilesList" />
        <input type="hidden" id="HidCode" name="HidCode" />
        <script type="text/javascript">

            function TaskTypeSelect() {
                $("#SysPointId").val("");
                $('#PointName').val("");
                $("#SysObjId").val("");
                $('#ObjName').val("");
            }

            //选择通用点位
            function SelPoint() {
                if ($('#TaskType').combobox("getValue") == "") {
                    HDialog.Info("请先选择任务类型");
                    return;
                }
                HDialog.OpenWin('600', '450', '../ComprehensivePatrols/DialogNewSysPoint.aspx?TaskType=' + $('#TaskType').combobox("getValue"), '选择通用点位', false, function callback(_Data) {
                    if (_Data != "") {
                        var varObjects = _Data.split('|');
                        //判断是否是选择了，如果是选择了并且值不等于原来的值的时候就需要清空点位下的通用对象
                        if (varObjects[0] != $("#SysPointId").val()) {
                            $("#SysObjId").val("");
                            $('#ObjName').val("");
                        }
                        $("#SysPointId").val(varObjects[0]);
                        $('#PointName').val(varObjects[1]);
                    }
                });
            }
            //选择通用点位下对象
            function SelObj() {
                if ($("#SysPointId").val() != null && $("#SysPointId").val() != "" && $("#SysPointId").val() != undefined) {
                    HDialog.OpenWin('600', '450', '../ComprehensivePatrols/DialogNewSysObj.aspx?SysPointId=' + $("#SysPointId").val() + '&TaskType=' + $('#TaskType').combobox("getValue"), '选择通用对象', false, function callback(_Data) {
                        if (_Data != "") {
                            var varObjects = _Data.split(',');
                            $("#SysObjId").val(varObjects[0]);
                            $('#ObjName').val(varObjects[1]);
                        }
                    });
                } else {
                    HDialog.Info("请先选择通用点位");
                }
            }

            //上传文件相关js
            function UploadCallBack(addr, Name) {
                if (addr != "" && Name != "") {
                    $("#SamplePic").val($("#SamplePic").val() + "," + addr);
                    $("#SamplePicName").val($("#SamplePicName").val() + "," + Name);
                    var Id = Getid();
                    var v = "<span><a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class='List' url=\"" + addr + "\">" + Name + "</a><span  style='cursor:pointer' onclick=\"Delete(this,'" + addr + "','" + Name + "');\">&nbsp;删除&nbsp;</span></span>"
                    $("#ListImg").append(v);
                    GetAttach();
                }
            }

            function Delete(obj, addr, name) {
                //$(obj).prev().remove();
                $(obj).parent().remove();
                var str = $("#SamplePic").val().replace(',' + addr, '');
                $("#SamplePic").val(str);
                //删除文件名称
                var strName = $("#SamplePicName").val().replace(',' + name, '');
                $("#SamplePicName").val(strName);
                //alert(obj);
                GetAttach();
            }

            function GetAttach() {
                var v = $("#ListImg").html();
                re = /\"/g;
                var mi = v.replace(re, "'");
                $("#SamplePicList").val(mi);
            }

            function SpecialView() {
                var v = $("#SamplePicList").val();
                $("#ListImg").html(v)
            }

            //上传文件相关js
            function UploadCallBackCP(addr, Name) {
                if (addr != "" && Name != "") {
                    $("#Files").val($("#Files").val() + "," + addr);
                    $("#FilesName").val($("#FilesName").val() + "," + Name);
                    var Id = Getid();
                    var v = "<span><a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class='List' url=\"" + addr + "\">" + Name + "</a><span  style='cursor:pointer' onclick=\"DeleteCP(this,'" + addr + "','" + Name + "');\">&nbsp;删除&nbsp;</span></span>"
                    $("#ListFile").append(v);
                    GetAttachCP();
                }
            }

            function DeleteCP(obj, addr, Name) {
                $(obj).parent().remove();
                //$(obj).remove();
                var str = $("#Files").val().replace(',' + addr, '');
                $("#Files").val(str);

                var strName = $("#FilesName").val().replace(',' + Name, '');
                $("#FilesName").val(strName);
                GetAttachCP();
            }

            function GetAttachCP() {
                var v = $("#ListFile").html();
                re = /\"/g;
                var mi = v.replace(re, "'");
                $("#FilesList").val(mi);
            }

            function SpecialViewCP() {
                var v = $("#FilesList").val();
                $("#ListFile").html(v)
            }

            function Getid() {
                d = new Date();
                var s = "";
                s += d.getYear();
                s += (d.getMonth() + 1);
                s += d.getDate();
                s += d.getHours();
                s += d.getMinutes();
                s += (d.getSeconds());
                return s;
            }

            function btnClose_Click() {
                HDialog.Close("");
            }
            function Load() {
                if ($("#OpType").val() == 'Edit') {
                    $.tool.DataGet('CpComPatrols', 'SelGeneralStandardSettingEdit', "SysStandId=" + $('#SysStandId').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            $.JQForm._Data = _Data;
                            $.JQForm.FillForm();
                            //加载 easyui加载不出来的字段值
                            $('#Sort').numberbox('setValue', varObjects[0].Sort);
                            $('#Score').numberbox('setValue', varObjects[0].Score);
                            $('#Sort').numberbox('disable', false);
                            $("#HidCode").val($("#Code").val());
                            if (varObjects[0].IsUse == "是") {
                                $('#IsUse').combobox("setValues", "1");
                            } else {
                                $('#IsUse').combobox("setValues", "0");
                            }
                            $("#frmForm").form('validate');

                            var CopySamplePicName = $("#SamplePicName").val();
                            var CopySamplePic = $("#SamplePic").val();
                            var CopyFilesName = $("#FilesName").val();
                            var CopyFiles = $("#Files").val();
                            //绑定下拉框
                            $('#TaskType').combobox("setValues", varObjects[0].TaskType);
                            if (varObjects[0].MaximumRiskLevel != null&& varObjects[0].MaximumRiskLevel != "") {
                                $('#MaximumRiskLevel').combobox("setValues", varObjects[0].MaximumRiskLevel);
                            }
                            $('#CommType').combobox("setValues", varObjects[0].CommType);
                            $('#Professional').combobox("setValue", varObjects[0].Professional);
                            $('#DType').combobox("setValue", varObjects[0].DType);

                            //清空原值
                            $("#SamplePicName").val('');
                            $("#SamplePic").val('');
                            $("#FilesName").val('');
                            $("#Files").val('');

                            if (CopySamplePicName != null && CopySamplePicName != '') {
                                var SamplePicName = CopySamplePicName.split(',');
                                var SamplePic = CopySamplePic.split(',');
                                if (SamplePic.length > 0 && SamplePicName.length > 0 && (SamplePic.length = SamplePicName.length)) {
                                    if (SamplePicName.length > 0) {
                                        for (var i = 0; i < SamplePicName.length; i++) {
                                            UploadCallBack(SamplePic[i], SamplePicName[i]);
                                        }
                                    }
                                }
                            }
                            if (CopyFilesName != null && CopyFilesName != '') {
                                var FilesName = CopyFilesName.split(',');
                                var Files = CopyFiles.split(',');
                                if (FilesName.length > 0 && Files.length > 0 && (FilesName.length = Files.length)) {
                                    if (FilesName.length > 0) {
                                        for (var i = 0; i < FilesName.length; i++) {
                                            UploadCallBackCP(Files[i], FilesName[i]);
                                        }
                                    }
                                }
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                } else {
                    $.tool.DataGet('CpComPatrols', 'GetMaxSort', "Type=SysStandard&ID=",
                                                      function Init() {
                                                      },
                                                      function callback(_Data) {
                                                          if (_Data != "") {
                                                              $("#Sort").numberbox("setValue", _Data);
                                                          }
                                                      },
                                                      function completeCallback() {
                                                      },
                                                      function errorCallback() {
                                                      });
                }
            }
            function Save() {
                $("#SamplePic").val($("#SamplePic").val().substr(1, $("#SamplePic").val().length - 1));
                $("#Files").val($("#Files").val().substr(1, $("#Files").val().length - 1));
                $("#SamplePicName").val($("#SamplePicName").val().substr(1, $("#SamplePicName").val().length - 1));
                $("#FilesName").val($("#FilesName").val().substr(1, $("#FilesName").val().length - 1));
                $.tool.DataPostChk('frmForm', 'CpComPatrols', 'SaveGeneralStandardSettingEdit', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            switch (_Data) {
                                case "1":
                                    HDialog.Info("保存成功！");
                                    HDialog.Close("1");
                                    break;
                                case "-1":
                                    HDialog.Info("标准代码不能重复！");
                                    break;
                                case "-2":
                                    HDialog.Info("序号不能重复！");
                                    break;
                                default:
                                    HDialog.Info("错误请重试！");
                                    break;
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }
            //页面初始化
            $(function () {
                //先清空select 
                $('.easyui-combobox').combobox('clear');
                $('#IsUse').combobox('setValue', "1");

                Load();
            });
        </script>
    </form>
</body>
</html>

