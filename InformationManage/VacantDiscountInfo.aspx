<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VacantDiscountInfo.aspx.cs" Inherits="M_Main.InformationManage.VacantDiscountInfo" %>

<!DOCTYPE html>
<html>
<head>
    <title>房产空置优惠信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 160px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td>房产空置房优惠标准
                    </td>
                    <td>
                        <input id="VacantDiscountStandard" style="width: 136px" size="17" name="VacantDiscountStandard" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script>
        var w = $(window).width();
        var h = $(window).height();
        $(function () {
            $("#TableContainer").css("height", h * 0.942 + "px");
            $("#CommIds").val($("#CommIds").val().replace('?v=4.0',''));
            LoadList();
        })

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
                        Insert("新增房产空置房优惠信息", 'insert', "");
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
                        Delete(row.VacantDiscountID);
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
                        window.location.href = '../InformationManage/VacantDiscountInfoToExcel.aspx';
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
                        window.location.href = '../InformationManage/VacantDiscountInfoToExcel.aspx';
                    }
                }];
        }

        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'VacantDiscountID', title: 'VacantDiscountID', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'PropertyArea', title: '物业区域', sortable: true },
            { field: 'AreaNumber', title: '物业区域编号', sortable: true },
            { field: 'PropertyProject', title: '物业项目', sortable: true },
            { field: 'ProjectNumber', title: '物业项目编号', sortable: true },
            //{ field: 'NCSystemNumber', title: 'NC编码', sortable: true },
            { field: 'DevelopmentSubject', title: '项目开发主体', sortable: true },
            {
                field: 'VacantDiscountStandard', title: '房产空置房优惠标准', width: 150, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var Params = "";
                    var str = row.VacantDiscountStandard;
                    Params = "VacantDiscountInfoID=" + row.VacantDiscountID;
                    if (types == "1") {
                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"Insert('修改信息','Edit','" + Params + "');\">" + row.VacantDiscountStandard + "%" + "</a>";
                    }
                    else {
                        str = row.VacantDiscountStandard + "%";
                    }
                    return str;
                }
            },
            {
                field: 'IsVacancyRate', title: '是否与空置率挂钩', width: 150, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = "是";
                    if (row.IsVacancyRate == 0) {
                        str = "否";
                    }
                    return str;
                }
            },
            {
                field: 'DiscountEffectDate', title: '优惠生效日期', width: 150, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.DiscountEffectDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'DiscountEndDate', title: '优惠结束日期', width: 150, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.DiscountEndDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'DiscountSignDate', title: '优惠签订日期', width: 150, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.DiscountSignDate, "yyyy-MM-dd");
                    return str;
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
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("VacantDiscountInfo", "GetList", "TableContainer", param);
                }
            });
            $("#SearchDlg").dialog("close");
        }

        //显示详细
        function Insert(title, OpType, Params) {
            w = (top.$(window).width() / 7) * 4;
            h = (parent.$(window).height() / 5) * 3;
            HDialog.Open(w, h, '../InformationManage/VacantDiscountInfoManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
                if (_Data == "1") {
                    LoadList();
                }
            });
        }

        //删除
        function Delete(VacantDiscountID) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    $.tool.DataGet('VacantDiscountInfo', 'deletes', 'VacantDiscountID=' + VacantDiscountID,
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

        //清空查询条件
        function CancelParm() {
            $("#VacantDiscountStandard").val("");
        }

    </script>

</body>
</html>


