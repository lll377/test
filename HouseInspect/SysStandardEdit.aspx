<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysStandardEdit.aspx.cs" Inherits="M_Main.HouseInspect.SysStandardEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑标准</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            margin-bottom: 53px;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            /*width: 180px;*/
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 120px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: auto;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>


</head>
<body>
    <form id="frmFormStandard" runat="server">
        <div class="Container">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">序号</td>
                    <td class="TdContentSearch">
                        <input id="Sort" name="Sort" class="easyui-validatebox" data-options="required:true" 
                            onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
                            onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
                            style="border: 1px #cccccc solid; width: 200px;height:22px;" />
                    </td>
                    <td class="TdTitle">标准代码：</td>
                    <td class="TdContentSearch">
                        <input id="StandardCode" name="StandardCode" type="text" class="easyui-validatebox"
                            style="border: 1px #cccccc solid; width: 200px;height:22px;" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">标准内容：</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="Content" name="Content" class="easyui-validatebox" data-options="required:true" style="border: 1px #cccccc solid; width: 97%;"></textarea>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">允许偏差：</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="PermissibleDeviation" name="PermissibleDeviation" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 97%;"></textarea>
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">查验方法：</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="InspectMethod" name="InspectMethod" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 97%;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">适用查验范围：</td>
                    <td class="TdContentSearch">
                        <input id="InspectionRange" name="InspectionRange" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',multiple:true,valueField: 'label',
		textField: 'value',data:[{label: '户内',value: '户内'},{label: '公区',value: '公区'}],required:true,width:200"
                            onchange="ISInspectionRange();" />
                    </td>
                    <td class="TdTitle">适用房间类型：</td>
                    <td class="TdContentSearch">
                        <input id="RoomType" name="RoomType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',multiple:true,required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">适用公区类型：</td>
                    <td class="TdContentSearch">
                        <input id="PublicAreaType" name="PublicAreaType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',multiple:true,required:true" />
                    </td>
                    <td class="TdTitle">所属专业：</td>
                    <td class="TdContentSearch">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业"
                            class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px" data-options="required:true">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">重要程度：</td>
                    <td class="TdContentSearch">
                        <select id="Importance" name="Importance" style="border: 1px #cccccc solid; width: 200px" isdctype='true' dctype="重要程度">
                        </select>
                    </td>
                    <td class="TdTitle">适用产品形态：</td>
                    <td class="TdContentSearch">
                        <select id="Form" runat="server" clientidmode="Static" name="Form" data-options=" required:true,multiple: true,editable:false " class="easyui-combobox" style="width: 200px; height: 23px;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">适用装修属性：</td>
                    <td class="TdContentSearch">
                        <select id="Decoration" runat="server" clientidmode="Static" name="Decoration" data-options=" required:true,multiple: true,editable:false " class="easyui-combobox" style="width: 200px; height: 23px;">
                        </select>
                    </td>
                    <td class="TdTitle">适用查验批次：</td>
                    <td class="TdContentSearch">
                        <select id="Batch" runat="server" clientidmode="Static" name="Batch" data-options=" required:true,multiple: true,editable:false " class="easyui-combobox" style="width: 200px; height: 23px;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否启用：</td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="IsEnabled" name="IsEnabled" style="border: 1px #cccccc solid; width: 200px" data-options="required:true">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否 </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">备注：</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="Remark" name="Remark" class="easyui-validatebox"
                            style="border: 1px #cccccc solid; width: 97%;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">附件:</td>
                    <td class="TdContentSearch" colspan="3">
                        <iframe src="./UploadFileHI.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">附件列表:</td>
                    <td class="TdContentSearch" colspan="3">
                        <span id="ListFile" runat="server" class="Content" />
                    </td>
                </tr>

            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;"
            id="BtnLi">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="BtnSave" onclick="Save();">保存</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" id="BtnClose" onclick="Close();">放弃</a>
        </div>

        <input type="hidden" id="ObjectId" name="ObjectId" />
        <input type="hidden" id="StandardId" name="StandardId" />
        <input type="hidden" id="Files" name="Files" />
        <input type="hidden" id="FilesName" name="FilesName" />
        <input type="hidden" id="OpType" name="OpType" />
        <script type="text/javascript">
            function Load() {
                $("#ObjectId").val(GetQueryString('ObjectId'));
                $("#StandardId").val(GetQueryString('StandardId'));
                $("#OpType").val(GetQueryString('OpType'));
                if (GetQueryString('OpType') == 'edit') {
                    $.tool.DataGet('CsHouseInspect', 'GetStandardList', 'StandardId=' + $("#StandardId").val() + '&page=1&rows=5&Type=Edit',
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            $("#Sort").val(varObjects.rows[0].Sort);
                            $("#StandardCode").val(varObjects.rows[0].StandardCode);
                            $("#Content").val(varObjects.rows[0].Content);
                            $("#InspectMethod").val(varObjects.rows[0].InspectMethod);
                            $("#PermissibleDeviation").val(varObjects.rows[0].PermissibleDeviation);
                            $("#Profession").val(varObjects.rows[0].Profession);
                            $("#Importance").val(varObjects.rows[0].Importance);
                            $("#IsEnabled").val(varObjects.rows[0].IsEnabled);
                            $("#Files").val(varObjects.rows[0].Files);
                            $("#FilesName").val(varObjects.rows[0].FilesName);
                            $("#Remark").val(varObjects.rows[0].Remark);
                            $("#ObjectId").val(varObjects.rows[0].ObjectId);
                            $('#Form').combobox('setValues', varObjects.rows[0].Form.split(','));
                            $('#Batch').combobox('setValues', varObjects.rows[0].Batch.split(','));
                            $('#Decoration').combobox('setValues', varObjects.rows[0].Decoration.split(','));

                            if (varObjects.rows[0].InspectionRange != "") {
                                $('#InspectionRange').combobox('setValues', varObjects.rows[0].InspectionRange.split(','));
                            }
                            if (varObjects.rows[0].RoomTypeid != "") {
                                $('#RoomType').combobox('setValues', varObjects.rows[0].RoomTypeid.split(','));
                            }
                            if (varObjects.rows[0].PublicAreaTypeid != "") {
                                $('#PublicAreaType').combobox('setValues', varObjects.rows[0].PublicAreaTypeid.split(','));
                            }
                            var CopyFilesName = $("#FilesName").val();
                            var CopyFiles = $("#Files").val();

                            //清空原值
                            $("#FilesName").val('');
                            $("#Files").val('');

                            if (CopyFilesName != null && CopyFilesName != '') {
                                var FilesName = CopyFilesName.split(',');
                                var Files = CopyFiles.split(',');
                                if (FilesName.length > 0 && Files.length > 0 && (FilesName.length = Files.length)) {
                                    if (FilesName.length > 0) {
                                        for (var i = 0; i < FilesName.length; i++) {
                                            UploadCallBackHI(Files[i], FilesName[i]);
                                        }
                                    }
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
                else if (GetQueryString('OpType') == 'insert') {
                    $.tool.DataGet('CsHouseInspect', 'GetMaxSort', "Type=HouseInspectStandard&ObjId=" + $("#ObjectId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $("#Sort").val(_Data);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    $.tool.DataGet('CsHouseInspect', 'GetStandardList', 'StandardId=' + $("#StandardId").val() + '&page=1&rows=5&Type=Edit',
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            $("#Sort").val(varObjects.rows[0].Sort);
                            $("#StandardCode").val(varObjects.rows[0].StandardCode);
                            $("#Content").val(varObjects.rows[0].Content);
                            $("#InspectMethod").val(varObjects.rows[0].InspectMethod);
                            $("#PermissibleDeviation").val(varObjects.rows[0].PermissibleDeviation);
                            $("#Profession").val(varObjects.rows[0].Profession);
                            $("#Importance").val(varObjects.rows[0].Importance);
                            $("#IsEnabled").val(varObjects.rows[0].IsEnabled);
                            $("#Files").val(varObjects.rows[0].Files);
                            $("#FilesName").val(varObjects.rows[0].FilesName);
                            $("#Remark").val(varObjects.rows[0].Remark);
                            $("#ObjectId").val(varObjects.rows[0].ObjectId);
                            $('#Form').combobox('setValues', varObjects.rows[0].Form.split(','));
                            $('#Batch').combobox('setValues', varObjects.rows[0].Batch.split(','));
                            $('#Decoration').combobox('setValues', varObjects.rows[0].Decoration.split(','));

                            if (varObjects.rows[0].InspectionRange != "") {
                                $('#InspectionRange').combobox('setValues', varObjects.rows[0].InspectionRange.split(','));
                            }
                            if (varObjects.rows[0].RoomTypeid != "") {
                                $('#RoomType').combobox('setValues', varObjects.rows[0].RoomTypeid.split(','));
                            }
                            if (varObjects.rows[0].PublicAreaTypeid != "") {
                                $('#PublicAreaType').combobox('setValues', varObjects.rows[0].PublicAreaTypeid.split(','));
                            }

                            $('#BtnLi').hide();
                            var CopyFilesName = $("#FilesName").val();
                            var CopyFiles = $("#Files").val();

                            //清空原值
                            $("#FilesName").val('');
                            $("#Files").val('');

                            if (CopyFilesName != null && CopyFilesName != '') {
                                var FilesName = CopyFilesName.split(',');
                                var Files = CopyFiles.split(',');
                                if (FilesName.length > 0 && Files.length > 0 && (FilesName.length = Files.length)) {
                                    if (FilesName.length > 0) {
                                        for (var i = 0; i < FilesName.length; i++) {
                                            UploadCallBackHI(Files[i], FilesName[i]);
                                        }
                                    }
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }
            //文件上传
            //上传文件相关js
            function UploadCallBackHI(addr, Name) {
                if (addr != "" && Name != "") {
                    $("#Files").val($("#Files").val() + "," + addr);
                    $("#FilesName").val($("#FilesName").val() + "," + Name);
                    var Id = Getid();
                    var v = "<span><a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class='List' url=\"" + addr + "\">" + Name + "</a><span  style='cursor:pointer' onclick=\"DeleteHI(this,'" + addr + "','" + Name + "');\">&nbsp;删除&nbsp;</span></span>"
                    $("#ListFile").append(v);
                    GetAttachHI();
                }
            }

            function DeleteHI(obj, addr, Name) {
                $(obj).parent().remove();
                //$(obj).remove();
                var str = $("#Files").val().replace(',' + addr, '');
                $("#Files").val(str);

                var strName = $("#FilesName").val().replace(',' + Name, '');
                $("#FilesName").val(strName);
                GetAttachHI();
            }

            function GetAttachHI() {
                var v = $("#ListFile").html();
                re = /\"/g;
                var mi = v.replace(re, "'");
                $("#FilesList").val(mi);
            }

            function SpecialViewHI() {
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

            function Close() {
                HDialog.Close();
            }

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function Save() {
                GetAttachHI();
                $("#Files").val($("#Files").val().substr(1, $("#Files").val().length - 1));
                $("#FilesName").val($("#FilesName").val().substr(1, $("#FilesName").val().length - 1));

                var data = $('#frmFormStandard').serialize();
                if ($("#RoomType").combobox("getValues") == "") {
                    data = "RoomType=''&" + $('#frmFormStandard').serialize();
                }
                if ($("#PublicAreaType").combobox("getValues") == "") {
                    data = "PublicAreaType=''&" + $('#frmFormStandard').serialize();
                }

                $.tool.DataPostChk('frmFormStandard', 'CsHouseInspect', 'SaveStandard', data,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Close("true");
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function ISInspectionRange() {
                var InspectionRange = $("#InspectionRange").combobox('getValues')

                if (InspectionRange.indexOf("户内") != -1 && InspectionRange.indexOf("公区") == -1) {

                    //$("#PublicAreaType").combobox({ required: false });
                    //$("#RoomType").combobox({ required: true });
                    $("#RoomType").combobox('enableValidation');
                    $("#PublicAreaType").combobox('disableValidation');

                    $('#PublicAreaType').combobox('disable');
                    $('#RoomType').combobox('enable');

                }
                if (InspectionRange.indexOf("公区") != -1 && InspectionRange.indexOf("户内") == -1) {

                    //$("#RoomType").combobox({ required: false });
                    //$("#PublicAreaType").combobox({ required: true });
                    $("#PublicAreaType").combobox('enableValidation');
                    $("#RoomType").combobox('disableValidation');

                    $('#RoomType').combobox('disable');
                    $('#PublicAreaType').combobox('enable');

                }
                if (InspectionRange.indexOf("公区") != -1 && InspectionRange.indexOf("户内") != -1) {

                    //$("#RoomType").combobox({ required: true });
                    //$("#PublicAreaType").combobox({ required: true });
                    $("#PublicAreaType").combobox('enableValidation');
                    $("#RoomType").combobox('enableValidation');

                    $('#RoomType').combobox('enable');
                    $('#PublicAreaType').combobox('enable');

                }

            }


            $(document).ready(function () {
                LoadDictionaryMultiple("PublicAreaType", "公区类型");
                LoadDictionaryMultiple("RoomType", "房间类型");
                Load();

                $("#InspectionRange").combobox({
                    onChange: function () {
                        ISInspectionRange();
                    }
                })
            });
            //加载字典设置
            function LoadDictionaryMultiple(id, DcTypeName) {
                var varObjects;
                $.tool.DataPost('CsHouseInspect', 'BindDictionary', 'DcTypeName=' + DcTypeName,
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象

                        $("#" + id).find("option:gt(0)").remove();
                        $("#" + id).combobox({
                            width: 200,
                            valueField: "Id",
                            textField: "Name",
                            data: varObjects,
                            filter: function (q, row) {
                                var opts = $(this).combobox('options');
                                return row[opts.textField].indexOf(q) >= 1;
                            }
                        });
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }



        </script>

    </form>
</body>
</html>
