<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LettersInfo.aspx.cs" Inherits="M_Main.HouseInfoManage.LettersInfo" %>

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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <input type="hidden" id="OrganCode" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 187px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td>函件类型：
                    </td>
                    <td>
                        <select name="LetterType" id="LetterType" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'auto'" runat="server" style="width: 143px">
                        </select>
                    </td>
                    <td>发函机构：
                    </td>
                    <td>
                        <input id="LetterMechanism" name="LetterMechanism" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td>收函人：
                    </td>
                    <td>
                        <input id="LetterCollector" name="LetterCollector" runat="server" class="easyui-textbox" />
                    </td>
                    <td>函号：
                    </td>
                    <td>
                        <input id="LetterNo" name="LetterNo" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td>发函时间：
                    </td>
                    <td>
                        <input id="LetterTimeBegin" name="LetterTimeBegin" runat="server" class="Wdate" onclick="WdatePicker()" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至
                    </td>
                    <td colspan="2">
                        <input id="LetterTimeEnd" name="LetterTimeEnd" runat="server" class="Wdate" onclick="WdatePicker()" />
                    </td>
                </tr>
                <tr>
                    <td>承办人：
                    </td>
                    <td>
                        <input id="Undertaker" name="Undertaker" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script>
    var w = $(window).width();
    var h = $(window).height();

    $(function () {
        $("#TableContainer").css("height", h  + "px");
        $("#CommIds").val($("#CommIds").val().replace('?v=4.0', ''));
        LoadList();
    });

    function CancelParm() {
        $("#LetterType").combobox('setValue', '');
        $("#LetterMechanism").textbox('setValue', '');
        $("#LetterCollector").textbox('setValue', '');
        $("#LetterNo").textbox('setValue', '');
        $("#Undertaker").textbox('setValue', '');
        $("#LetterTimeBegin").val("");
        $("#LetterTimeEnd").val("");
    }

    var toolbar = "";
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    var types = getUrlParam("types");
    if (types == "1") {
        toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var Params = "";
                    ViewDetail("新增函件信息", 'insert', Params);
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择删除项！');
                        return;
                    }
                    DeleteHouseHold(row.LettersID);
                }
            }, '-',
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.location.href = '../InformationManage/LettersInfoCreExcel.aspx';
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }];
    } else {
        toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.location.href = '../InformationManage/LettersInfoCreExcel.aspx';
                }
            }
        ];
    }

    var column = [[
        { field: 'ck', checkbox: true },
        {
            field: 'LetterType', title: '函件类型', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var Params = "";
                var str = row.LetterType;
                Params = "LettersID=" + row.LettersID;
                if (types == "1") {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改信息','Edit','" + Params + "');\">" + row.LetterType + "</a>";
                }
                return str;
            }
        },
        { field: 'LettersID', title: 'LettersID', hidden: true },
        { field: 'OrganName', title: '区域名称', width: 100, align: 'left', sortable: true },
        { field: 'AreaNumber', title: '物业区域编号', sortable: true },
        { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
        { field: 'ProjectNumber', title: '物业项目编号', sortable: true },
        //{ field: 'NCSystemNumber', title: 'NC编码', sortable: true },
        { field: 'DevelopmentSubject', title: '项目开发主体', sortable: true },
        { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
        { field: 'LetterMechanism', title: '发函机构', width: 100, align: 'left', sortable: true },
        { field: 'SentPeople', title: '发函人/单位', width: 100, align: 'left', sortable: true },
        { field: 'LetterCollector', title: '收函人', width: 100, align: 'left', sortable: true },

        { field: 'LetterAddress', title: '收函地址', width: 100, align: 'left', sortable: true },
        { field: 'LetterReason', title: '发函缘由', width: 100, align: 'left', sortable: true },
        { field: 'LetterTime', title: '发函时间', width: 170, align: 'left', sortable: true },
        { field: 'LetterNo', title: '函号', width: 100, align: 'left', sortable: true },
        { field: 'Contents', title: '函件简要内容与要求', width: 170, align: 'left', sortable: true },
        { field: 'Amounts', title: '金额', width: 100, align: 'left', sortable: true },
        { field: 'Undertaker', title: '承办人', width: 100, align: 'left', sortable: true },
        { field: 'LetterResult', title: '函件结果', width: 100, align: 'left', sortable: true },
        {
            field: 'Operator', title: '操作记录', width: 170, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                return row.Operator + "于" + formatDate(row.OperatingTime, "yyyy-MM-dd") + "更改";
            }
        }
    ]];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            toolbar: toolbar,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            showFooter: true,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("LettersInfo", "GetList", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //显示详细
    function ViewDetail(title, OpType, Params) {
        HDialog.Open(w - 500, h - 170, '../InformationManage/LettersInfoManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
            if (_Data == "1") {
                LoadList();
            }
        });
    }

    //删除
    function DeleteHouseHold(LettersID) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('LettersInfo', 'deletes', 'LettersID=' + LettersID,
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "true") {
                            HDialog.Info('删除成功');
                        }
                        else { HDialog.Info('删除失败'); }
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }
</script>
