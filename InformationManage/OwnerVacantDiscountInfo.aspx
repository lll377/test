<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OwnerVacantDiscountInfo.aspx.cs" Inherits="M_Main.InformationManage.OwnerVacantDiscountInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>业主空置优惠信息</title>
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
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 160px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td>业主空置房收取比例：</td>
                    <td>
                        <input id="CollectProportion" name="CollectProportion" runat="server" />
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

    <script type="text/javascript">
        var w = $(window).width();
        var h = $(window).height();
        $(function () {
            $("#TableContainer").css("height", h  + "px");
            $("#CommIds").val($("#CommIds").val().replace('?v=4.0',''));
            LoadList();
        })
        //工具栏
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
                        ViewDetail("新增业主空置房优惠信息", 'insert', "");
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
                        DeleteOwnerVacantDiscount(row.OwnerVacantDiscountID);
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
                        window.location.href = '../InformationManage/OwnerVacantDiscountInfoToExcel.aspx';
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
                        window.location.href = '../InformationManage/OwnerVacantDiscountInfoToExcel.aspx';
                    }
                }];
        }

        //列表列
        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'OwnerVacantDiscountID', title: 'OwnerVacantDiscountID', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'PropertyArea', title: '物业区域', sortable: true },
            { field: 'AreaNumber', title: '物业区域编号', sortable: true },
            { field: 'PropertyProject', title: '物业项目', sortable: true },
            { field: 'ProjectNumber', title: '物业项目编号', sortable: true },
            //{ field: 'NCSystemNumber', title: 'NC编码', sortable: true },
            { field: 'DevelopmentSubject', title: '项目开发主体', sortable: true },
            {
                field: 'CollectProportion', title: '业主空置房收取比例', width: 200, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var Params = "";
                    var str = row.CollectProportion;
                    Params = "OwnerVacantDiscountID=" + row.OwnerVacantDiscountID;
                    if (types == "1") {
                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改信息','Edit','" + Params + "');\">" + row.CollectProportion + "</a>";
                    }
                    return str;
                }
            }
        ]];

        //加载数据列表
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
                    param = $.JQForm.GetParam("OwnerVacantDiscountInfo", "GetList", "TableContainer", param);
                }
            });
            $("#SearchDlg").dialog("close");
        }

        //清空查询条件
        function CancelParm() {
            $("#CollectProportion").val("");
        }

        //显示详细
        function ViewDetail(title, OpType, Params) {
            HDialog.Open(w - 300, 220, '../InformationManage/OwnerVacantDiscountInfoManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
                if (_Data != "false" && _Data != "") {
                    LoadList();
                }
            });
        }

        //删除
        function DeleteOwnerVacantDiscount(OwnerVacantDiscountID) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    $.tool.DataGet('OwnerVacantDiscountInfo', 'deletes', 'OwnerVacantDiscountID=' + OwnerVacantDiscountID,
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

</body>
</html>



