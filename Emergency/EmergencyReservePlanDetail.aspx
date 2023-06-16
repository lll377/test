<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyReservePlanDetail.aspx.cs" Inherits="M_Main.Emergency.EmergencyReservePlanDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急预案登记详情页面</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            width: 180px;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
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

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }
    </style>
</head>
<body style="overflow: auto; margin: 0px; padding: 0px;">
    <form id="frmFrom" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CommName" name="CommName" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </td>
                    <td class="TdTitle">应急类型:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EmergencyTypeName" name="EmergencyTypeName" runat="server" data-options="required:true" class="easyui-validatebox"
                            onclick="SelEmergencyType()" readonly />
                        <input type="hidden" id="EmergencyTypeID" name="EmergencyTypeID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">应急等级:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EmergencyLevelNames" name="EmergencyLevelNames" runat="server" class="easyui-validatebox"
                            onclick="SelEmergencyLevelByType()" readonly />
                        <input type="hidden" id="EmergencyLevelID" name="EmergencyLevelID" runat="server" />
                    </td>
                    <td class="TdTitle">生效时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TakeEffectTime" name="TakeEffectTime" class="easyui-datetimebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">有效时限:</td>
                    <td class="TdContentSearch">
                        <select id="EffectiveTimeLimit" name="EffectiveTimeLimit" class="easyui-combobox" style="width: 80px;" data-options="editable:false,panelHeight:'auto'">
                            <option value=""></option>
                            <option value="3">3个月</option>
                            <option value="6">6个月</option>
                            <option value="12">12个月</option>
                            <option value="24">24个月</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">备注:</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea type="text" id="Remark" name="Remark" maxlength="1400" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">编制人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="OrganizationUserName" name="OrganizationUserName" onclick="SelUser()" readonly runat="server" data-options="required:true" class="easyui-validatebox" />
                        <input type="hidden" id="OrganizationUserCode" name="OrganizationUserCode" runat="server" />
                    </td>
                    <td class="TdTitle">编制时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="OrganizationTime" name="OrganizationTime" class="easyui-datetimebox" runat="server" data-options="required:true,editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">审核人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AuditUserName" name="AuditUserName" readonly runat="server" class="easyui-validatebox TdContentSearchDisable" />
                    </td>
                    <td class="TdTitle">审核时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AuditTime" name="AuditTime" readonly class="easyui-validatebox TdContentSearchDisable" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">审核状态:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AuditStatus" name="AuditStatus" runat="server" readonly value="未审核" class="easyui-validatebox TdContentSearchDisable" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
            </table>
        </div>
    </form>

    <fieldset class="frame-fieldset" style="border: 1px solid #cccccc;">
        <legend class="frame-legend">应急预案文档</legend>
        <div id="mainTableContainer">
            <form id="fileForm">
                <a id="tip" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                <input type="hidden" name="FileType" id="FileType" />
                <input type="hidden" name="FilePath" id="FilePath" />
                <input type="hidden" name="FileCode" id="FileCode" />
                <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="width:'210px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                <input id="FileName" name="FileName" class="easyui-textbox" data-options="width:'250px',prompt:'文件名称'" />
                <a href="#" onclick="SaveFile()" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80">上传</a>
                <table id="TableContainer" style="width: 100%; height: 190px;"></table>
            </form>
        </div>
    </fieldset>

    <div style="text-align: center; width: 100%; padding: 5px 0;">
        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
        <input type="button" class="button" value="放弃返回" id="BtnReturn" onclick="btnClose();" />
    </div>

    <input type="hidden" id="ID" name="ID" runat="server" />
    <input type="hidden" id="OpType" name="OpType" runat="server" />
    <input type="hidden" id="Flag" name="Flag" value="0" runat="server" />
    <input type="hidden" id="Type" name="Type" value="应急预案" runat="server" />
    <script language="javascript" type="text/javascript">
        function btnClose() {
            HDialog.Close("");
        }

        //选择应急类别 只选择类别
        function SelEmergencyType() {
            HDialog.OpenWin("600", "400", '../Emergency/Dialog/EmergencyType.aspx', "选择应急类型", false, function callback(_Data) {
                if (_Data != "") {
                    var data = $.parseJSON(_Data);
                    $('#EmergencyTypeName').val(data.text);
                    $('#EmergencyTypeID').val(data.id);
                    $('#EmergencyLevelNames').val("");
                    $('#EmergencyLevelID').val("");
                }
            });
        }
        //根据应急类别 多选（可以不选）应急等级
        function SelEmergencyLevelByType() {
            if ($('#EmergencyTypeName').val() == "" || $('#EmergencyTypeID').val() == "") {
                HDialog.Info("请先选择应急类型");
                return;
            }
            HDialog.OpenWin("600", "400", '../Emergency/SelEmergencyLevel.aspx?IsSingle=0&TypeID=' + $('#EmergencyTypeID').val(), "选择应急类型", false, function callback(_Data) {
                if (_Data != "") {
                    var obj = _Data.split('|');
                    $('#EmergencyLevelNames').val(obj[1]);
                    $('#EmergencyLevelID').val(obj[0]);
                }
            });
        }

        function SelUser() {
            HDialog.OpenWin('1024', '450', '../Emergency/Dialog/User.aspx?CommID=' + $('#CommID').val(), '选择编制人', false, function callback(data) {
                if (data != "") {
                    data = $.parseJSON(data);
                    $("#OrganizationUserCode").val(data.UserCode);
                    $("#OrganizationUserName").val(data.UserName);
                }
            });
        }
        //加载页面数据
        function LoadBaseData() {


            if ($("#OpType").val() == 'edit') {
                $.tool.DataGet('Emergency', 'GetEmergencyReservePlanByID', "ID=" + $('#ID').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            $.JQForm._Data = _Data;
                            $.JQForm.FillForm();
                            //加载easyui控件加载不出来的值


                            //判断是否是已审核
                            if (varObjects[0].AuditStatus == "已审核" || $('#Flag').val() == "1") {
                                $("#frmFrom input[type='text'],#fileForm input[type='text']").prop("disabled", "true");
                                $('#frmFrom textarea').attr("disabled", "disabled");
                                $('#uploadFile').filebox('disable')
                                $('#frmFrom .easyui-linkbutton,#fileForm .easyui-linkbutton').linkbutton('disable');
                                $('#frmFrom .easyui-datetimebox').datetimebox({ disabled: true });
                                $('#frmFrom .easyui-combobox').combobox({ disabled: true });
                                $('#BtnSave').css("display", "none");
                                $('#EmergencyTypeName,#OrganizationUserName').validatebox({ "required": false });
                            }
                            $('#frmFrom').form('validate');

                            //生效时间
                            if (varObjects[0].TakeEffectTime != "") {
                                $('#TakeEffectTime').datetimebox("setValue", formatDate(varObjects[0].TakeEffectTime, 'yyyy-MM-dd HH:mm:ss'));
                            }
                            //编制时间
                            if (varObjects[0].OrganizationTime != "") {
                                $('#OrganizationTime').datetimebox("setValue", formatDate(varObjects[0].OrganizationTime, 'yyyy-MM-dd HH:mm:ss'));
                            }
                            //审核时间
                            if (varObjects[0].AuditTime != "") {
                                $('#AuditTime').val(formatDate(varObjects[0].AuditTime, 'yyyy-MM-dd HH:mm:ss'));
                            }
                            //有效时限
                            if (varObjects[0].EffectiveTimeLimit != "") {
                                $('#EffectiveTimeLimit').combobox("setValue", varObjects[0].EffectiveTimeLimit);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //加载附件
            LoadFile();
        }
        //保存
        function Save() {
            if ($('#frmFrom').form("validate")) {
                $.tool.DataPostJson('Emergency', 'SaveEmergencyReservePlan', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            HDialog.Info("保存成功");
                            HDialog.Close("true");
                        } else {
                            HDialog.Info(data.msg);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }
        var column = [[
            {
                field: 'FileCode', title: '附件编号', width: 100, align: 'left', sortable: false, formatter: function (value, row, index) {
                    var arr = value.split('.');
                    return arr[0];
                }
            },
            {
                field: 'FileName', title: '附件名称', width: 160, align: 'left', sortable: false, formatter: function (value, row, index) {
                    value = GetAHtml(row.FilePath, value);
                    return value;
                }
            },
            { field: 'FileType', title: '附件类型', width: 40, align: 'center', sortable: false },
            { field: 'AddTime', title: '添加日期', width: 60, align: 'center', sortable: false },
            {
                field: 'Opt', title: '操作', width: 40, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return "<a href=\"javascript:DelFile('" + row.ID + "')\" >删除</a>";
                }
            }
        ]];
        function GetAHtml(url, fileName) {
            var html = "";
            if (url && url != "") {
                var arr = url.split('/');
                var name = arr[arr.length - 1];
                arr = name.split('.');
                var IdNew = arr[arr.length - 2];
                html = "<a target=\"_blank\" id=\"11831617369\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + fileName + "</a>";
            }
            return html;
        }

        //上传附件
        function SaveFile() {
            var file = $("input[name='uploadFile']")[0].files[0];
            if (file) {
                if ($("#FileName").textbox("getValue") == "") {
                    HDialog.Info("请输入附件名称");
                    return;
                }
                var maxsize = 2 * 1024 * 1024;
                var tipFileSize = 2;
                var fileType = file.type;

                if (file.size > parseInt(maxsize)) {
                    HDialog.Info("不能上传超过" + tipFileSize + "M的附件！");
                    return false;
                }

                $.tool.pageLoadInfo("上传中，请等待");
                var options = {
                    type: "POST",
                    url: "../AjaxUploadFile.aspx?Cmd=ins&FileType=Emergency&FileURL=",
                    //data: "upfile=" + $("#uploadfile").val(),
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
                $('#fileForm').ajaxSubmit(options);
                return false;//.NET按钮控件取消提交
            } else {
                HDialog.Info("请选择附件");
            }
        }

        //上传文件相关绑定
        function UploadCallBack(url, Name) {
            var parameterStr = {
                FileCode: Name,
                FilePath: url,
                Type: '应急预案',
                KeyID: $('#ID').val(),
                FileType: $("#FileType").val(),
                FileName: $("#FileName").textbox("getValue")
            };
            $.dataPostJson('Emergency_File', 'Save', parameterStr, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $('#uploadFile').filebox('clear');
                        $('#FileName').textbox('clear');
                        $("#TableContainer").datagrid("reload");
                    } else { $.messager.alert('温馨提示', data.msg); }
                },
                function completeCallback() {

                }, function errorCallback() {

                });
        }

        //删除附件
        function DelFile(idList) {
            if ($('#AuditStatus').val() == "已审核" || $('#Flag').val() == "1") {
                return;
            }
            $.messager.confirm('温馨提示', '确定删除?', function (r) {
                if (r) {
                    $.dataPostJson('Emergency_File', 'Del', { "idList": idList }, true, false,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                $("#TableContainer").datagrid("reload");
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        //加载附件
        function LoadFile() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.Type_Name = "应急预案";
                    param.KeyID = $('#ID').val();
                    param = $.getDataGridParam("Emergency_File", "GetList", param);

                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {

                }
            });
        }

        $(function () {
            $('#tip').tooltip({
                position: 'top',
                content: '<div><p>1、文件限制最大为2M。</p></div>',
            });
            $('#uploadFile').filebox({
                onChange: function (newValue, oldValue) {
                    if (newValue != "") {
                        var s = newValue.lastIndexOf("\\");
                        var e = newValue.lastIndexOf(".");
                        var fileName = newValue.substring(s + 1, e);//文件名不带后缀
                        var fileType = newValue.substring(e + 1, newValue.length);//文件后缀
                        $("#FileType").val(fileType);
                        $("#FileName").textbox("setValue", fileName);
                    }
                }
            });

            LoadBaseData();
        });
    </script>

</body>
</html>
