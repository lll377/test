<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommunityLitigationInfo.aspx.cs" Inherits="M_Main.InformationManage.CommunityLitigationInfo" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 200px; padding: 10px;">
            <input type="hidden" id="CommId" runat="server" />
            <input type="hidden" id="RoomId" runat="server" />
            <input type="hidden" id="OrganCode" runat="server" />
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">受理机构</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AcceptingAgency" name="AcceptingAgency" style="width: 150px" runat="server" />
                    </td>
                    <td class="TdTitle">房屋选择</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RoomSign" name="RoomSign" runat="server" placeholder="输入或者双击选择" data-options="required:true" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">被告
                    </td>
                    <td class="TdContentSearch">
                        <input id="Defendant" style="width: 150px" size="17" name="Defendant" />
                    </td>
                    <td class="TdTitle">原告
                    </td>
                    <td>
                        <input id="Plaintiff" style="width: 150px" size="17" name="Plaintiff" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">案件进度</td>
                    <td class="TdContentSearch" >
                        <select name="CaseProgress" id="CaseProgress" class="sel_css" runat="server" style="width: 150px">
                        </select>
                    </td>
                    <td class="TdTitle">案号
                    </td>
                    <td>
                        <input id="CaseNo" style="width: 150px" size="17" name="Plaintiff" />
                    </td>
                </tr>
                <tr><td colspan="4">&nbsp;</td></tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
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
        $("#CommId").val($("#CommId").val().replace('?v=4.0', ''));
        LoadList();
    })

    var toolbar = "";
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    var types =getUrlParam("types");
    if (types== "1") {
        toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var Params = "CommId=" + $("#CommId").val();
                    ViewDetail("新增诉讼信息", 'insert', Params);
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
                    DeleteHouseHold(row.LitigationID);
                }
            }, '-',

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
                    window.location.href = '../InformationManage/LitigationInfoToExcel.aspx';
                }
            }];
    }
    else {
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
                    window.location.href = '../InformationManage/LitigationInfoToExcel.aspx';
                }
            }];
    }

    var column = [[
        { field: 'ck', checkbox: true },
        { field: 'OrganName', title: '区域名称', width: 100, align: 'left', sortable: true },
        { field: 'AreaNumber', title: '物业区域编号', sortable: true },
        { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
        { field: 'ProjectNumber', title: '物业项目编号', sortable: true },
        //{ field: 'NCSystemNumber', title: 'NC编码', sortable: true },
        { field: 'DevelopmentSubject', title: '项目开发主体', sortable: true },
        { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
        {
            field: 'Plaintiff', title: '原告', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var Params = "";
                var str = row.Plaintiff;
                    Params = "LitigationID=" + row.LitigationID;
                if (types=="1"){
                     str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改信息','Edit','" + Params + "');\">" + row.Plaintiff + "</a>";
                }
                return str;
            }
        },
        { field: 'LitigationID', title: 'LitigationID', hidden: true },
        { field: 'Defendant', title: '被告', width: 100, align: 'left', sortable: true },
        { field: 'AcceptingAgency', title: '受理机构', width: 100, align: 'left', sortable: true },
        { field: 'ActionCause', title: '案由', width: 100, align: 'left', sortable: true },

        { field: 'FilingTime', title: '立案时间', width: 100, align: 'left', sortable: true },
        { field: 'CaseNo', title: '案号', width: 100, align: 'left', sortable: true },
        { field: 'LitigationRequest', title: '诉讼请求', width: 100, align: 'left', sortable: true },
        { field: 'TheSubject', title: '标的', width: 100, align: 'left', sortable: true },
        { field: 'Undertaker', title: '承办人', width: 100, align: 'left', sortable: true },
        { field: 'ClosingTime', title: '结案时间', width: 100, align: 'left', sortable: true },
        { field: 'LawsuitResult', title: '诉讼结果', width: 100, align: 'left', sortable: true },
        { field: 'Remarks', title: '诉讼结果备注', width: 100, align: 'left', sortable: true },
        { field: 'CaseProgress', title: '案件进度', width: 100, align: 'left', sortable: true },
        {
            field: 'Operator', title: '操作记录', width: 100, align: 'left', sortable: true,
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
                param = $.JQForm.GetParam("LitigationInfo", "GetCommunityList", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
        $('#RoomSign').val("");
        $('#RoomId').val("");
        $('#CustName').val("");
    }

    $('#RoomSign').dblclick(function (e) {
       
        var conent = "../DialogNew/RoomDlg.aspx" + "?CommID=" + CommId;
        HDialog.Open('1000', '600', conent, '房屋选择', true, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').val(data.RoomSign);
            $('#RoomId').val(data.RoomID);
            $('#CustName').val("");
            $("#BtnSearch").click();
        });
    })


    //显示详细
    function ViewDetail(title, OpType, Params) {
        HDialog.Open(w - 500, h+37, '../InformationManage/CommunityLitigationInfoManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
            if (_Data == "1") {
                LoadList();
            }
        });
    }

    //删除
    function DeleteHouseHold(LitigationID) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('LitigationInfo', 'deletes', 'LitigationID=' + LitigationID,
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
