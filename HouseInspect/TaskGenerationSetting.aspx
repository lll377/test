<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskGenerationSetting.aspx.cs" Inherits="M_Main.HouseInspect.TaskGenerationSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查验任务生成</title>
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
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
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

        /*  .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }*/

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
    <form id="frmForm" runat="server">
        <div class="Container">
            <input type="hidden" name="CommId" id="CommId" value="" />
            <table class="SearchTable">
                <tr>
                    <%--<td class="TdTitle">项目名称：</td>
                    <td class="TdContentSearch">
                        <input id="CommName" name="CommName" type="text" class="easyui-validatebox" onclick="SelItem();" style="width: 200px; border: 1px solid #cccccc;" data-options="required:true" readonly="readonly" />
                        <input type="hidden" name="CommId" id="CommId" value="" />
                    </td>--%>
                    <td class="TdTitle">查验岗位：</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" id="RoleName" name="RoleName" class="easyui-validatebox" onclick="SelRole()" style="width: 580px;height:20px; border: 1px solid #cccccc;" data-options="required:true" readonly="readonly" />
                        <input type="hidden" id="RoleCode" name="RoleCode" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">查验模板：</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea rows="1" id="TemplateName" name="TemplateName" class="easyui-validatebox" style="width: 580px; border: 1px solid #cccccc; height: 20px"
                            data-options="required:true" runat="server" onclick="SelTemplate();" readonly="readonly"></textarea>
                        <input type="hidden" name="TemplateId" id="TemplateId" value="" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">所属专业：</td>
                    <td class="TdContentSearch">
                        <input id="Profession" name="Profession" class="easyui-combobox" style="height:22px;" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',multiple:true" />
                    </td>
                    <td class="TdTitle">查验范围：</td>
                    <td class="TdContentSearch">
                        <select id="Range" name="Range" class="easyui-validatebox" style="border: 1px #cccccc solid;height:22px; width: 192px" disabled="disabled">
                            <option value="IN" selected="selected">户内</option>
                            <option value="OUT">公区</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间：</td>
                    <td class="TdContentSearch">
                        <input class="Control_IteminputNoStyle" id="BeginTime" name="BeginTime"
                            style="width: 200px; border: 1px solid #cccccc;height:20px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', minDate: new Date() })"
                            format="date" data-options="required:true" readonly="readonly" />
                    </td>
                    <td class="TdTitle">结束时间：</td>
                    <td class="TdContentSearch">
                        <input class="Control_IteminputNoStyle" id="EndTime" name="EndTime"
                            style="width: 190px; border: 1px solid #cccccc;height:20px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', minDate: new Date() })"
                            format="date" data-options="required:true" readonly="readonly" />
                    </td>
                </tr>
                <tr id="house">
                    <td class="TdTitle">查验房屋：</td>
                    <td class="TdContentSearch" colspan="3">
                        <div style="border: 1px solid #cccccc; width: 580px;">
                            <div style="width: 564px; height: 280px; background-color: #cccccc;" id="TableContainer">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr id="PublicArea">
                    <td class="TdTitle">查验公区：</td>
                    <td class="TdContent" colspan="3">
                        <div style="border: 1px solid #cccccc; width: 580px;">
                            <div style="width: 564px; height: 280px; background-color: #cccccc;" id="TablePublicArea">
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="生成" id="BtnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
        </div>

        <input id="HouseId" type="hidden" name="HouseId" value="" />
        <input id="OldTaskId" type="hidden" name="OldTaskId" value="" />
        <input id="TaskStandardId" type="hidden" name="TaskStandardId" value="" />
        <script type="text/javascript">

            //加载字典设置
            function LoadDictionaryMultiple() {
                var varObjects;
                $.tool.DataPost('CsHouseInspect', 'BindDictionary', 'DcTypeName=所属专业',
                    function Init() {
                    },
                    function callback(_Data) {
                        console.log(_Data)
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象

                        console.log(varObjects)
                        $("#Profession").find("option:gt(0)").remove();
                        $("#Profession").combobox({
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
            LoadDictionaryMultiple();

            //选择项目
            function SelItem() {
                HDialog.Open(410, 360, '../HouseInspect/SelComm.aspx', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommId").val(arrRet.attributes.InPopedom);
                    $("#CommName").val(arrRet.text);
                    $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });//清空选择的房屋
                    $('#TablePublicArea').datagrid('loadData', { total: 0, rows: [] });//清空选择的公区
                });
            }

            //选择岗位
            function SelRole() {
                //if ($("#CommId").val() == "") {
                //    HDialog.Info("请选择项目");
                //    return;
                //}
                HDialog.Open('650', '600', '../HouseInspect/RightFrameCommunityRightManage.aspx?DepCode=&CommId=' + $("#CommId").val(), '选择岗位', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        var strs = new Array();
                        strs = _Data.split(',');
                        var code = "";
                        var name = "";
                        var all = "";
                        for (var i = 0; i < strs.length; i++) {
                            all = strs[i].trim().split(/\s+/);
                            code = code + all[0] + ",";
                            name = name + all[1] + ",";
                        }
                        code = code.substring(0, code.length - 1);
                        name = name.substring(0, name.length - 1);
                        $("#RoleName").val(name);
                        $("#RoleCode").val(code);
                    };
                })
            }

            //选择模板
            function SelTemplate() {
                HDialog.Open('800', '600', '../HouseInspect/SelTemplateList.aspx', '选择查验模板', true, function callback(_Data) {
                    if (_Data != "") {
                        var varObjects = _Data.split('◆');
                        $("#TemplateId").val(varObjects[0]);
                        $('#TemplateName').val(varObjects[1]);
                        if (varObjects[2] == "公区") {
                            $("#Range").val("OUT");

                            $("#PublicArea").show();
                            $("#house").hide();
                        } else {
                            $("#Range").val("IN");
                            $("#house").show();
                            $("#PublicArea").hide();
                        }
                    }
                });
            }

            function AddHouse() {
                //if ($("#CommId").val() == "") {
                //    HDialog.Info("请选择项目");
                //    return;
                //}
                HDialog.Open('1000', '600', "../HouseInspect/SelRoom.aspx?CommId=" + $("#CommId").val() + "&Range=" + $("#Range").val(), '房屋选择', true, function callback(_Data) {
                    var obj = JSON.parse(_Data);
                    for (var i = 0; i < obj.length; i++) {
                        var _Data1 = $('#TableContainer').datagrid('getData');
                        var row_index = _Data1.rows.length;
                        var IsHave = 0;
                        for (var j = 0; j < row_index; j++) {
                            if (_Data1.rows[j].RoomID == obj[i].RoomID) {
                                IsHave = 1;
                            }
                        }
                        if (IsHave == 0) {
                            //新增
                            $('#TableContainer').datagrid('insertRow', {
                                index: row_index,
                                row: {
                                    RoomID: obj[i].RoomID,
                                    RoomSign: obj[i].RoomSign,
                                    RoomName: obj[i].RoomName,
                                }
                            });
                        }
                    }
                });
            }

            function AddPublicArea() {
                //if ($("#CommId").val() == "") {
                //    HDialog.Info("请选择项目");
                //    return;
                //}
                HDialog.Open('800', '500', "../HouseInspect/SelPublicArea.aspx?CommID=" + $("#CommId").val(), '公区选择', true, function callback(_Data) {
                    var obj = JSON.parse(_Data);
                    for (var i = 0; i < obj.length; i++) {
                        var _Data1 = $('#TablePublicArea').datagrid('getData');
                        var row_index = _Data1.rows.length;
                        var IsHave = 0;
                        for (var j = 0; j < row_index; j++) {
                            if (_Data1.rows[j].Id == obj[i].Id) {
                                IsHave = 1;
                            }
                        }
                        if (IsHave == 0) {
                            //新增
                            $('#TablePublicArea').datagrid('insertRow', {
                                index: row_index,
                                row: {
                                    Id: obj[i].Id,
                                    PublicAreaCode: obj[i].PublicAreaCode,
                                    PublicAreaName: obj[i].PublicAreaName,
                                    PublicAreaTypeName: obj[i].PublicAreaTypeName,
                                }
                            });
                        }
                    }
                });
            }

            var column = [[
                { field: 'RoomID', title: '房屋ID', width: 150, align: 'left', sortable: true, hidden: true },
                { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '<font style="font-weight:bold;color:red;" size=2>添加房屋</font>',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddHouse();
                    }
                }, '-',
                {
                    text: '<font style="font-weight:bold;color:red;" size=2>删除房屋</font>',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        var index = $("#TableContainer").datagrid("getRowIndex", row);
                        $('#TableContainer').datagrid('deleteRow', index);
                    }
                }
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    idField: "RoomID",
                    nowrap: true,
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    pagination: false,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    striped: true,
                    view: myview,
                    toolbar: toolbar,
                    remoteSort: false
                });
            }
            LoadList();

            var Publiccolumn = [[
                { field: 'Id', title: '公区Id', align: 'left', sortable: true, hidden: true },
                {
                    field: 'PublicAreaCode', title: '公区编号', width: 20, align: 'left', sortable: true
                },
                { field: 'PublicAreaName', title: '公区名称', width: 40, align: 'left', sortable: true },
                { field: 'PublicAreaTypeName', title: '公区类型', width: 40, align: 'left', sortable: true },
            ]];

            var Publictoolbar = [
                {
                    text: '<font style="font-weight:bold;color:red;" size=2>添加公区</font>',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddPublicArea();
                    }
                }, '-',
                {
                    text: '<font style="font-weight:bold;color:red;" size=2>删除公区</font>',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TablePublicArea").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        var index = $("#TablePublicArea").datagrid("getRowIndex", row);
                        $('#TablePublicArea').datagrid('deleteRow', index);
                    }
                }
            ];

            function PublicArea() {
                $("#TablePublicArea").datagrid({
                    idField: "RoomID",
                    nowrap: true,
                    columns: Publiccolumn,
                    fitColumns: true,
                    singleSelect: false,
                    pagination: false,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    striped: true,
                    view: myview,
                    toolbar: Publictoolbar,
                    remoteSort: false
                });
            }
            PublicArea();

            function load() {
                $("#house").show();
                $("#PublicArea").hide();
                $("#CommId").val(window.parent.$("#CommId").val())
            }
            load();
            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });

            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });

            function Close() {
                //parent.LayerDialog.Close();
                //parent.window.close();
                window.parent.LayerDialog.Close();
            }

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function Save() {
                //获取附加任务的信息
                var OldTaskId = $(window.parent.$("#TaskGenerationSettingAdditional")).contents().find("#TaskId").val();
                $("#OldTaskId").val(OldTaskId);
                var TaskStandardId = $(window.parent.$("#TaskGenerationSettingAdditional"))[0].contentWindow.GetRejectionRow();
                $("#TaskStandardId").val(TaskStandardId);

                if ($("#BeginTime").val() > $("#EndTime").val()) {
                    HDialog.Info("开始时间不能大于结束时间");
                    return;
                }
                var Range = $("#Range option:selected").val();
                if (Range == "IN") {
                    var _Data = $('#TableContainer').datagrid('getData');
                    var row_index = _Data.rows.length;
                    if (row_index == 0) {
                        HDialog.Info('请选择房屋');
                        return;
                    }
                    var HouseId = '';
                    for (var j = 0; j < row_index; j++) {
                        HouseId += "," + _Data.rows[j].RoomID;
                    }
                    HouseId = HouseId.substring(1, HouseId.length);
                    $("#HouseId").val(HouseId);
                }
                else if (Range == "OUT") {
                    var _Data = $('#TablePublicArea').datagrid('getData');
                    var row_index = _Data.rows.length;
                    if (row_index == 0) {
                        HDialog.Info('请选择公区');
                        return;
                    }
                    var HouseId = '';
                    for (var j = 0; j < row_index; j++) {
                        HouseId += "," + _Data.rows[j].Id;
                    }
                    HouseId = HouseId.substring(1, HouseId.length);
                    $("#HouseId").val(HouseId);
                }
                var url = "Range=" + Range + "&" + $('#frmForm').serialize();
                if ($("#Profession").combobox("getValues") == "") {
                    url = "Profession=''&Range=" + Range + "&" + $('#frmForm').serialize();
                }

                $.tool.DataPostChk('frmForm', 'CsHouseInspect', 'GenerationTask', url,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "0") {
                            HDialog.Info("生成0条数据，未发生错误，同一查验岗位、标准、房屋、模板、项目不会新增任务");
                        } else {
                            Close();
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
