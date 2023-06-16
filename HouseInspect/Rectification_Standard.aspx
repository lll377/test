<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rectification_Standard.aspx.cs" Inherits="M_Main.HouseInspect.Rectification_Standard" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>按查验标准查看</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="FrmForm" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1300px; height: 270px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                   <%-- <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="CommName" name="CommName" runat="server" onclick="SelComm();" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="CommID" name="CommID" type="hidden" runat="server" />
                    </td>--%>
                     <td class="TdTitle">所属专业</td>
                    <td class="TdContent">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                        </select>
                    </td>
                    <td class="TdTitle">标准代码
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="StandardCode" name="StandardCode" runat="server" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">任务编号
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="TaskNo" name="TaskNo" runat="server" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="RoomSign" name="RoomSign" runat="server" onclick="RoomSeach();" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="RoomID" name="RoomID" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">责任单位
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="DutyUnitID" name="DutyUnitID" runat="server" onclick="SelDutyUnit();" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="DutyUnitName" name="DutyUnitName" type="hidden" runat="server" />
                    </td>
                    <td class="TdTitle">整改单位
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="RectificationUnitName" name="RectificationUnitName" runat="server" onclick="SelRectificationUnit();" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="RectificationUnitID" name="RectificationUnitID" type="hidden" runat="server" />
                    </td>
                    <td class="TdTitle">重要程度</td>
                    <td class="TdContent">
                        <select id="Importance" name="Importance" onchange="FrequencyChange(this)" isdctype='true' dctype="重要程度" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                        </select>
                    </td>
                    <td class="TdTitle">查验对象
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="ObjectName" name="ObjectName" runat="server" onclick="SelObject();" readonly="readonly" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="ObjectId" name="ObjectId" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">查验批次</td>
                    <td class="TdContent">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                        </select>
                    </td>
                    <td class="TdTitle">问题类型</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="ProblemTypeName" name="ProblemTypeName" runat="server" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">是否完成</td>
                    <td class="TdContent">
                        <select id="IsInspect" name="IsInspect" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                            <option value="" selected></option>
                            <option value="1">完成</option>
                            <option value="0">未完成</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否验收</td>
                    <td class="TdContent">
                        <select id="IsCheck" name="IsCheck" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                            <option value="" selected></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                   
                </tr>

                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">返工次数从</td>
                    <td class="TdContent">
                        <input id="ReworkTimesStart" name="ReworkTimesStart" type="tel" style="width: 95%; border: 1px solid #cccccc;" onkeyup="javascript:CheckInputIntFloat(this);" onchange="javascript:CheckInputIntFloat(this);" onblur="javascript:CheckInputIntFloat(this);" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="ReworkTimesEnd" name="ReworkTimesEnd" type="tel" style="width: 95%; border: 1px solid #cccccc;" onkeyup="javascript:CheckInputIntFloat(this);" onchange="javascript:CheckInputIntFloat(this);" onblur="javascript:CheckInputIntFloat(this);" />
                    </td>
                    <td class="TdTitle">计划完成时间从</td>
                    <td class="TdContent">
                        <input id="PollingCompleteDateStart" name="PollingCompleteDateStart"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="PollingCompleteDateEnd" name="PollingCompleteDateEnd"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">实际完成时间从</td>
                    <td class="TdContent">
                        <input id="RealCompleteDateStart" name="RealCompleteDateStart"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="RealCompleteDateEnd" name="RealCompleteDateEnd"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">验收合格时间从</td>
                    <td class="TdContent">
                        <input id="CheckDateStart" name="CheckDateStart"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="CheckDateEnd" name="CheckDateEnd"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>

                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">是否返工</td>
                    <td class="TdContent">
                        <select id="IsRework" name="IsRework" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                            <option value="" selected></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否合格</td>
                    <td class="TdContent">
                        <select id="StandardIsQualified" name="StandardIsQualified" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                            <option value="" selected></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td></td>

                </tr>
                <tr>
                    <td align="center" colspan="8">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="PollingDateDlg" class="easyui-dialog" title="录入整改计划" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 380px; height: 150px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                    <td class="TdTitle">计划完成时间</td>
                    <td class="TdContent">
                        <input id="PollingCompleteDate" name="PollingCompleteDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="button" class="button" value="确定" id="BtnSavePollingDate" onclick="SetPollingDate();" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="CompleteDlg" class="easyui-dialog" title="录入整改结果" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 380px; height: 200px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                    <td class="TdTitle">整改完成时间</td>
                    <td class="TdContent">
                        <input id="RealCompleteDate" name="RealCompleteDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">完成说明</td>
                    <td class="TdContent">
                        <textarea id="CompleteRemark" name="CompleteRemark" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 95%;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="button" class="button" value="确定" id="BtnSaveComplete" onclick="SetComplete();" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="AllSelectDlg" class="easyui-dialog" title="全选操作" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 320px; height: 100px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                    <td align="center" colspan="2">
                        <input type="button" class="button" value="录入整改计划" id="PollingDateAll" onclick="SetPollingDateAll();" />
                        <input type="button" class="button" value="录入整改结果" id="CompleteAll" onclick="SetCompleteAll();" />
                    </td>
                </tr>
            </table>
        </div>
        <input id="RowCommID" name="RowCommID" type="hidden" runat="server" />
        <div id="UnitDlg" class="easyui-dialog" title="修改责任/整改单位" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 380px; height: 150px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                    <td class="TdTitle">责任单位</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="DutyUnitNameUpdate" name="DutyUnitNameUpdate" runat="server" onclick="SelDutyUnitUpdate();" readonly="readonly" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="DutyUnitIDUpdate" name="DutyUnitIDUpdate" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">整改单位</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="RectificationUnitNameUpdate" name="RectificationUnitNameUpdate" runat="server" onclick="SelRectificationUnitUpdate();" readonly="readonly" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="RectificationUnitIDUpdate" name="RectificationUnitIDUpdate" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="button" class="button" value="确定" id="BtnSaveUnit" onclick="SetUnit();" />
                        <input type="button" class="button" value="清空" id="BtnClearUnit" onclick="ClearUnit();" />
                    </td>
                </tr>
            </table>
        </div>

        <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="commTree" data-options="region:'west',border:true,width:300,title:'项目'">
                <ul id="treeOrgan" class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,lines:true"></ul>
            </div>
            <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
                <div style="width: 100%;" id="TableContainer">
                </div>
            </div>
        </div>
        <input id="HiCommID" type="hidden" name="HiCommID" runat="server" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            var isAll = false;
            function CheckInputIntFloat(oInput) {
                if ('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/, '')) {
                    oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? '' : oInput.value.match(/\d{1,}\.{0,1}\d{0,}/);
                }
            }

            function btnClear() {
                $("#CommID").val("");
                $("#CommName").val("");
                $("#StandardCode").val("");
                $("#TaskNo").val("");
                $("#RoomSign").val("");
                $("#RoomID").val("");
                $("#DutyUnitID").val("");
                $("#DutyUnitName").val("");
                $("#RectificationUnitID").val("");
                $("#RectificationUnitName").val("");
                $("#Importance").val("");
                $("#ObjectId").val("");
                $("#ObjectName").val("");
                $("#Batch").val("");
                $("#ProblemTypeName").val("");
                $("#IsInspect").val("");
                $("#Profession").val("");
                $("#ReworkTimesStart").val("");
                $("#ReworkTimesEnd").val("");
                $("#PollingCompleteDateStart").val("");
                $("#PollingCompleteDateEnd").val("");
                $("#RealCompleteDateStart").val("");
                $("#RealCompleteDateEnd").val("");
                $("#CheckDateStart").val("");
                $("#CheckDateEnd").val("");
                $("#IsRework").val("");
                $("#StandardIsQualified").val("");
                $("#IsCheck").val("");
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h);
                $("#layout").css("height", h + "px");
                $("#layout_center").css("height", h + "px");
            }
            InitTableHeight();

            //选择项目
            function SelComm() {
                HDialog.Open(410, 360, '../HouseInspect/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            //选择房屋
            function RoomSeach() {
                HDialog.Open('650', '600', '../HouseInspect/RoomDlg.aspx?Type=0', '选择房屋', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        //|901室,17627800000001|902室,17627800000002|903室,17627800000003
                        LoadRoleCol(_Data);
                    };
                })
            };

            function LoadRoleCol(obj) {
                var strs = new Array();
                strs = obj.split('|');
                var code = "";
                var name = "";
                var all = "";

                for (var i = 0; i < strs.length; i++) {
                    all = strs[i].trim().split(',');
                    name = name + all[0] + ",";
                    code = code + all[1] + ",";
                }
                code = code.substring(0, code.length - 1);
                name = name.substring(0, name.length - 1);
                $("#RoomSign").val(name);
                $("#RoomID").val(code);
            };

            //查询选择责任单位
            function SelDutyUnit() {
                HDialog.Open(410, 360, '../HouseInspect/SelResponsibleUnit.aspx?Type=0', "选择责任单位", false, function callback(_Data) {
                    var UnitId = "";
                    var UnitName = "";
                    var arrRet = _Data.split("|");
                    var arrRet1;
                    for (var i = 1; i < arrRet.length; i++) {
                        arrRet1 = arrRet[i].split(",");
                        if (arrRet != "") {
                            UnitId += arrRet1[2] + ",";
                            UnitName += arrRet1[1] + ",";
                        }
                    }
                    UnitId = UnitId.substring(0, UnitId.length - 1);
                    UnitName = UnitName.substring(0, UnitName.length - 1);

                    $("#DutyUnitID").val(UnitId);
                    $("#DutyUnitName").val(UnitName);
                });
            };
            //查询选择整改单位
            function SelRectificationUnit() {
                HDialog.Open(410, 360, '../HouseInspect/SelResponsibleUnit.aspx?Type=1', "选择整改单位", false, function callback(_Data) {
                    console.log(_Data);
                    var UnitId = "";
                    var UnitName = "";
                    var arrRet = _Data.split("|");
                    var arrRet1;
                    for (var i = 1; i < arrRet.length; i++) {
                        arrRet1 = arrRet[i].split(",");
                        if (arrRet != "") {
                            UnitId += arrRet1[1] + ",";
                            UnitName += arrRet1[2] + ",";
                        }
                    }
                    UnitId = UnitId.substring(0, UnitId.length - 1);
                    UnitName = UnitName.substring(0, UnitName.length - 1);

                    $("#RectificationUnitID").val(UnitId);
                    $("#RectificationUnitName").val(UnitName);
                });
            };

            //修改选择责任单位
            function SelDutyUnitUpdate() {
                debugger;
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('700', '500', '../HouseInspect/ChoseUnit.aspx?CommID=' + $('#RowCommID').val() + "&type=ZR", '选择责任单位', false, function callback(_Data) {
                    var rows = JSON.parse(_Data);
                    $("#DutyUnitIDUpdate").val(rows.ResponsibleUnitFile);
                    $("#DutyUnitNameUpdate").val(rows.UnitName);
                });
            };
            //修改选择整改单位
            function SelRectificationUnitUpdate() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('700', '500', '../HouseInspect/ChoseUnit.aspx?CommID=' + $('#RowCommID').val() + "&type=ZG", '选择整改单位', false, function callback(_Data) {
                    var rows = JSON.parse(_Data);
                    $("#RectificationUnitIDUpdate").val(rows.ResponsibleUnitFile);
                    $("#RectificationUnitNameUpdate").val(rows.UnitName);
                });
            };
            //清空修改责任/整改单位
            function ClearUnit() {
                $("#DutyUnitIDUpdate").val('');
                $("#DutyUnitNameUpdate").val('');
                $("#RectificationUnitIDUpdate").val('');
                $("#RectificationUnitNameUpdate").val('');
            }

            //选择查验对象
            function SelObject() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(600, 450, '../HouseInspect/SelObject.aspx', '选择查验对象', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#ObjectId").val(arrRet.id);
                    $("#ObjectName").val(arrRet.name);
                });
            }

            //问题图片
            function PicDetail(Id, CommId) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(600, 450, '../HouseInspect/FileList.aspx?PkId=' + Id + "&HiCommID=" + CommId, '问题图片', false, function callback(_Data) {
                });
            }

            //全选录入整改计划
            function SetPollingDateAll() {
                isAll = true;
                $('#AllSelectDlg').dialog('close');
                $('#PollingDateDlg').parent().appendTo($("form:first"))
                $('#PollingDateDlg').dialog('open');
            }

            //全选录入整改结果
            function SetCompleteAll() {
                isAll = true;
                $('#AllSelectDlg').dialog('close');
                $('#CompleteDlg').parent().appendTo($("form:first"))
                $('#CompleteDlg').dialog('open');
            }

            //录入整改计划
            function SetPollingDate() {
                if ($("#PollingCompleteDate").val() == '') {
                    HDialog.Info('请选择计划完成时间');
                    return;
                }
                //是否是全选
                if (isAll) {
                    $.tool.DataPostChk('FrmForm', 'CsHouseInspect', 'SetPollingDateAll', 'PollingCompleteDate=' + $("#PollingCompleteDate").val() + GetParamet(),
                        function Init() {
                        },
                        function callback(_Data) {
                            HDialog.Info('录入成功');
                            $("#PollingDateDlg").dialog("close");
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    var rows = $('#TableContainer').datagrid("getChecked");
                    var ids = '';
                    for (var i = 0; i < rows.length; i++) {
                        ids += ',' + rows[i].TaskHouseStandardId;
                    }
                    ids = ids.substr(1, ids.length);
                    $.tool.DataPostChk('FrmForm', 'CsHouseInspect', 'SetPollingDate', 'ids=' + ids + '&PollingCompleteDate='
                        + $("#PollingCompleteDate").val() + "&HiCommID=" + $("#HiCommID").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            HDialog.Info('录入成功');
                            $("#PollingDateDlg").dialog("close");
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            //录入整改结果
            function SetComplete() {
                if ($("#RealCompleteDate").val() == '') {
                    HDialog.Info('请选择实际完成时间');
                    return;
                }
                //是否是全选
                if (isAll) {
                    $.tool.DataPostChk('FrmForm', 'CsHouseInspect', 'SetCompleteAll', 'RealCompleteDate=' + $("#RealCompleteDate").val() +
                        '&CompleteRemark=' + $("#CompleteRemark").val() + GetParamet(),
                        function Init() {
                        },
                        function callback(_Data) {
                            HDialog.Info('录入成功');
                            $("#CompleteDlg").dialog("close");
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    var rows = $('#TableContainer').datagrid("getChecked");
                    var ids = '';
                    for (var i = 0; i < rows.length; i++) {
                        ids += ',' + rows[i].TaskHouseStandardId;
                    }
                    ids = ids.substr(1, ids.length);
                    $.tool.DataPostChk('FrmForm', 'CsHouseInspect', 'SetComplete', 'ids=' + ids + '&RealCompleteDate=' + $("#RealCompleteDate").val()
                        + '&CompleteRemark=' + $("#CompleteRemark").val() + "&HiCommID=" + $("#HiCommID").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            HDialog.Info('录入成功');
                            $('#CompleteDlg').dialog('close');
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            //修改责任/整改单位
            function SetUnit() {
                if ($("#DutyUnitIDUpdate").val() == '' || $("#RectificationUnitIDUpdate").val() == '') {
                    HDialog.Info('责任/整改单位至少选择一个才可修改');
                    return;
                }
                var rows = $('#TableContainer').datagrid("getChecked");
                var ids = '';
                for (var i = 0; i < rows.length; i++) {
                    ids += ',' + rows[i].TaskHouseStandardId;
                }
                ids = ids.substr(1, ids.length);
                $.tool.DataPostChk('FrmForm', 'CsHouseInspect', 'SetUnit', 'ids=' + ids + '&DutyUnitIDUpdate=' + $("#DutyUnitIDUpdate").val() +
                    '&RectificationUnitIDUpdate=' + $("#RectificationUnitIDUpdate").val() + '&HiCommID=' + $("#HiCommID").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info('修改成功');
                        $('#UnitDlg').dialog('close');
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', width: '120px', align: 'left', sortable: true },
                { field: 'BatchName', title: '查验批次', width: 80, align: 'left', sortable: true },
                { field: 'TaskNo', title: '任务编号', width: 150, align: 'left', sortable: true },
                { field: 'HouseCode', title: '房屋/公区编号', width: 120, align: 'left', sortable: true },
                { field: 'pname', title: '查验房间', width: 120, align: 'left', sortable: true },
                {
                    field: 'IsInspect', title: '是否完成', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsInspect == "1") {
                            str = "完成";
                        } else {
                            str = "未完成";
                        }
                        return str;
                    }
                },
                { field: 'ObjectName', title: '查验对象', width: 80, align: 'left', sortable: true },
                { field: 'StandardCode', title: '标准代码', width: 80, align: 'left', sortable: true },
                { field: 'Content', title: '标准内容', width: 220, align: 'left', sortable: true },
                { field: 'ProfessionName', title: '所属专业', width: 80, align: 'left', sortable: true },
                { field: 'ImportanceName', title: '重要程度', width: 80, align: 'left', sortable: true },
                {
                    field: 'StandardIsQualified', title: '是否合格', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsInspect == "1") {
                            if (row.StandardIsQualified == "0") {
                                str = "不合格";
                            } else if (row.StandardIsQualified == "1") {
                                str = "合格";
                            } else {
                                str = "";
                            }
                        } else {
                            str = "";
                        }
                        return str;
                    }
                },
                { field: 'ProblemType', title: '问题类型', width: 80, align: 'left', sortable: true, hidden: true },
                { field: 'ProblemTypeName', title: '问题类型', width: 80, align: 'left', sortable: true },
                { field: 'UnqualifiedType', title: '问题级别', width: 80, align: 'left', sortable: true, hidden: true },
                { field: 'ProblemLevelName', title: '问题级别', width: 80, align: 'left', sortable: true },
                { field: 'TimeLimit', title: '整改时限（天）', width: 80, align: 'left', sortable: true },
                { field: 'ProblemContent', title: '问题描述', width: 220, align: 'left', sortable: true },
                {
                    field: 'imgurl', title: '问题图片', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"PicDetail('" + row.TaskHouseStandardId + "','" + row.CommId +"')\">查看</a>";
                        return str;
                    }
                },
                { field: 'DutyUnitName', title: '责任单位', width: 120, align: 'left', sortable: true },
                { field: 'RectificationUnitName', title: '整改单位', width: 120, align: 'left', sortable: true },
                { field: 'PollingCompleteDate', title: '计划完成时间', width: 120, align: 'left', sortable: true },
                { field: 'RealCompleteDate', title: '实际完成时间', width: 120, align: 'left', sortable: true },
                { field: 'CompleteRemark', title: '完成说明', width: 120, align: 'left', sortable: true },
                { field: 'CheckDate', title: '验收合格时间', width: 120, align: 'left', sortable: true },
                { field: 'CheckPName', title: '验收人', width: 80, align: 'left', sortable: true },
                {
                    field: 'IsRework', title: '是否返工', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsInspect == "1" && row.StandardIsQualified == "0") {
                            if (row.IsRework == "0") {
                                str = "未返工";
                            } else if (row.IsRework == "1") {
                                str = "返工";
                            } else {
                                str = "";
                            }
                        } else {
                            str = "";
                        }
                        return str;
                    }
                },
                { field: 'ReworkTimes', title: '返工次数', width: 80, align: 'center', sortable: true },
                //{ field: 'RoomName', title: '是否转入报事', width: 120, align: 'left', sortable: true },
                //{ field: 'RoomName', title: '报事编号', width: 120, align: 'left', sortable: true }
            ]];

            //导出
            function ExcelPrint() {
                var url = '../HouseInspect/Excel.aspx?ExcelName=按查验标准查看' + '&random=' + Math.random() + GetParamet();
                window.open(url);
            }

            function GetParamet() {
                var str = "&HiCommID=" + $("#HiCommID").val();
                str += "&Batch=" + $("#Batch").val();
                str += "&TaskNo=" + $("#TaskNo").val();
                str += "&IsInspect=" + $("#IsInspect").val();
                str += "&RoomID=" + $("#RoomID").val();
                str += "&ObjectId=" + $("#ObjectId").val();
                str += "&StandardCode=" + $("#StandardCode").val();
                str += "&Profession=" + $("#Profession").val();
                str += "&Importance=" + $("#Importance").val();
                str += "&ProblemTypeName=" + $("#ProblemTypeName").val();
                str += "&DutyUnitID=" + $("#DutyUnitID").val();
                str += "&RectificationUnitID=" + $("#RectificationUnitID").val();
                str += "&PollingCompleteDateStart=" + $("#PollingCompleteDateStart").val();
                str += "&PollingCompleteDateEnd=" + $("#PollingCompleteDateEnd").val();
                str += "&RealCompleteDateStart=" + $("#RealCompleteDateStart").val();
                str += "&RealCompleteDateEnd=" + $("#RealCompleteDateEnd").val();
                str += "&CheckDateStart=" + $("#CheckDateStart").val();
                str += "&CheckDateEnd=" + $("#CheckDateEnd").val();
                str += "&IsRework=" + $("#IsRework").val();
                str += "&ReworkTimesStart=" + $("#ReworkTimesStart").val();
                str += "&ReworkTimesEnd=" + $("#ReworkTimesEnd").val();
                str += "&StandardIsQualified=" + $("#StandardIsQualified").val();
                str += "&IsCheck=" + $("#IsCheck").val();
                return encodeURI(str);
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, "-",
                {
                    text: '全选',
                    iconCls: 'icon-save',
                    handler: function () {
                        var canSet;//是否可以全选录入
                        $.ajax({
                            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=CheckTaskHouseStandard' + GetParamet(),
                            type: 'POST',
                            dataType: 'text',
                            cache: false,
                            async: false,
                            success: function (_Data) {
                                if (_Data > "") {
                                    HDialog.Info(_Data);
                                    canSet = false;
                                } else {
                                    canSet = true;
                                }
                            },
                            complete: function (XMLHttpRequest, textStatus, errorThrown) {

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                HDialog.Info("数据读取错误");
                                bool = false;
                            }
                        });
                        if (canSet) {
                            $('#AllSelectDlg').parent().appendTo($("form:first"))
                            $('#AllSelectDlg').dialog('open');
                        }
                    }
                }, "-",
                {
                    text: '修改责任/整改单位',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid("getChecked");
                        if (rows.length == 0) {
                            HDialog.Info('请勾选至少一行数据');
                            return false;
                        }
                        var CommID = "";//CommID
                        var OneCommID = false;//是否全部为同一项目
                        for (var i = 0; i < rows.length; i++) {
                            if (CommID == "") {
                                CommID = rows[i].CommId;
                            } else if (CommID != rows[i].CommID) {
                                OneCommID = true;
                            }
                        }
                        if (OneCommID) {
                            HDialog.Info('选中项包含多个项目的数据，无法修改责任/整改单位');
                            return false;
                        }
                       
                        $('#RowCommID').val(CommID);
                        $('#UnitDlg').parent().appendTo($("form:first"))
                        $('#UnitDlg').dialog('open');
                    }
                }, "-",
                {
                    text: '录入整改计划',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid("getChecked");
                        if (rows.length == 0) {
                            HDialog.Info('请勾选至少一行数据');
                            return false;
                        }
                        var QualifiedAll = false;//是否全部为不合格数据
                        var InspectAll = false;//是否全部为完成
                        var CheckedAll = false;//是否全部未验收
                        for (var i = 0; i < rows.length; i++) {
                            if (rows[i].IsInspect == "0") {
                                InspectAll = true;
                            }
                            if (rows[i].StandardIsQualified == "1") {
                                QualifiedAll = true;
                            }
                            if (rows[i].CheckDate != "") {
                                CheckedAll = true;
                            }
                        }
                        if (InspectAll) {
                            HDialog.Info('选中项包含未完成数据，无法录入整改计划');
                            return false;
                        }
                        if (QualifiedAll) {
                            HDialog.Info('选中项包含合格数据，无法录入整改计划');
                            return false;
                        }
                        if (CheckedAll) {
                            HDialog.Info('选中项包含已验收数据，无法录入整改计划');
                            return false;
                        }
                        isAll = false;
                        $('#PollingDateDlg').parent().appendTo($("form:first"))
                        $('#PollingDateDlg').dialog('open');
                    }
                }, "-",
                {
                    text: '录入整改结果',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid("getChecked");
                        if (rows.length == 0) {
                            HDialog.Info('请勾选至少一行数据');
                            return false;
                        }
                        var QualifiedAll = false;//是否全部为不合格数据
                        var InspectAll = false;//是否全部为完成
                        var CheckedAll = false;//是否全部未验收
                        for (var i = 0; i < rows.length; i++) {
                            if (rows[i].IsInspect == "0") {
                                InspectAll = true;
                            }
                            if (rows[i].StandardIsQualified == "1") {
                                QualifiedAll = true;
                            }
                            if (rows[i].CheckDate != "") {
                                CheckedAll = true;
                            }
                        }
                        if (InspectAll) {
                            HDialog.Info('选中项包含未完成数据，无法录入整改结果');
                            return false;
                        }
                        if (QualifiedAll) {
                            HDialog.Info('选中项包含合格数据，无法录入整改结果');
                            return false;
                        }
                        if (CheckedAll) {
                            HDialog.Info('选中项包含已验收数据，无法录入整改结果');
                            return false;
                        }
                        isAll = false;
                        $('#CompleteDlg').parent().appendTo($("form:first"))
                        $('#CompleteDlg').dialog('open');
                    }
                }
                //, "-",
                // {
                //     text: '转入报事',
                //     iconCls: 'icon-search',
                //     handler: function () {

                //     }
                //}
                , "-",
                {
                    text: 'EXCEL导出',
                    iconCls: 'icon-save',
                    handler: function () {
                        if ($("#HiCommID").val().length<=0) {
                            HDialog.Info('请选择左边项目！');
                            return false;
                        }
                        ExcelPrint();
                    }
                }
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsHouseInspect", "Rectification_Standard", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
                $("#PollingDateDlg").dialog("close");
                $('#CompleteDlg').dialog('close');
                $('#AllSelectDlg').dialog('close');
            }
            LoadList();



        </script>
         <script>
             function LoadOrganTree() {
                 $("#treeOrgan").tree({
                     url: '/HM/M_Main/HC/DataPostControl.aspx',
                     method: "post",
                     treeField: 'text',
                     idField: 'id',
                     lines: true,
                     border: false,
                     loadMsg: '加载中,请稍侯...',
                     onLoadSuccess: function (node, data) {
                         //LoadList();
                         //默认选中第一个节点
                         if (data.length > 0) {
                             var commid = GetQueryString('CommID');
                             var node = $('#treeOrgan').tree('find', data[0].id);
                             var firstnode = null;
                             if (commid == '' && commid == '0') {
                                 firstnode = SelectFirsLeafNode(node);
                             }
                             else {
                                 var str = JSON.stringify(data);
                                 str = str.substr(0, str.indexOf(commid));
                                 str = str.substr(str.lastIndexOf("OrganCode") + 12, 30);
                                 str = str.substr(0, str.indexOf('\"'));
                                 firstnode = $('#treeOrgan').tree('find', str);

                             }
                             if (firstnode) {
                                 $('#treeOrgan').tree('select', firstnode.target);
                             } else {
                                 //LoadList();
                             }
                         }
                     },
                     onBeforeSelect: function (node) {
                         if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                             return false;
                         }
                     },
                     onBeforeLoad: function (row, param) {
                         localStorage.removeItem('CpCommId');
                         param.Method = "DataPost";
                         //param.Class = "CsHouseInspect";
                         param.Class = "CpComPatrols";
                         param.Command = "DepMenuList";
                         //控制用户权限
                         param.SelRoleCode = $("#LoginRoleCode").val();

                     },
                     onSelect: function (row) {
                         $("#HiCommID").val(row.attributes.CommID);
                         LoadList();
                     }
                 });
             }


             //递归 获取第一个子节点
             function SelectFirsLeafNode(FirstNode) {
                 var ItemFirstNode = null;
                 function dd(node) {
                     if (!$('#treeOrgan').tree("isLeaf", node.target)) {
                         var Children = $('#treeOrgan').tree("getChildren", node.target);
                         dd(Children[0]);
                     } else {
                         ItemFirstNode = node;
                     }
                 }
                 var i = 9999;
                 while (1 < i) {
                     if (ItemFirstNode == null) {
                         dd(FirstNode);
                     } else {
                         break;
                     }
                     i = i - 1;
                 }
                 return ItemFirstNode;
             }

             $(".tabs-container li").click(function () {
                 var refpage = $(this).attr("refpage");
                 var refsel = $(this).attr("refsel");
                 if (refsel == 0) {
                     var SelecteTreeNode = $('#treeOrgan').tree("getSelected");
                     if (SelecteTreeNode != null) {
                         localStorage.setItem("CpCommId", SelecteTreeNode.attributes.CommID);
                         $("#" + refpage).attr("src", refpage + ".aspx?CommID=" + SelecteTreeNode.attributes.CommID);
                         $(this).attr("refsel", "1");
                     }
                 }
             });
             LoadOrganTree();
         </script>
    </form>
</body>
</html>
