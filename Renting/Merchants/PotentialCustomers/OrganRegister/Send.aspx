<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send.aspx.cs" Inherits="M_Main.Renting.Merchants.PotentialCustomers.OrganRegister.Send" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-公司客商发放</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <style type="text/css">
        .control-label {
            text-align: center;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="ID" name="ID" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',border:false" style="overflow: hidden;">
            <form id="mainForm" class="form-horizontal" role="form">
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">基础信息</legend>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">客户类别</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="CustTypeName" name="CustTypeName" runat="server" disabled="disabled" class="easyui-textbox"
                                data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                        </div>
                        <label class="col-sm-2 col-xs-2 control-label">客户名称</label>
                        <div class="col-sm-4 col-xs-4">
                            <input type="text" id="CustName" name="CustName" runat="server" class="easyui-textbox"
                                data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        <div id="layout_center" data-options="region:'center',border:false" style="overflow: hidden;">
            <div id="TableContainer" style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: #cccccc;"></div>
        </div>
        <div data-options="region:'south',border:false" style="overflow: hidden; height: 60px;">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            InitPage();
        });

        function InitPage() {
            let param = $.getUrlParam();
            if (!!param.ID) {
                $("#ID").val(param.ID);
            }
            if (!!param.CustTypeName) {
                $("#CustTypeName").textbox("setValue", param.CustTypeName);
            }
            if (!!param.CustName) {
                $("#CustName").textbox("setValue", param.CustName);
            }

            InitDataGrid();
        }

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Dialog/CommSelect.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
                        if (data) {
                            data = $.parseJSON(data);
                            var Rows = $("#TableContainer").datagrid("getRows");
                            var guid = new GUID();
                            $.each(data, function (i, item) {
                                var ItemNode = Rows.filter(function (e) {
                                    return e.SendCommID == item.CommID;
                                });
                                if (ItemNode == null || ItemNode.length == 0) {
                                    //添加一行数据
                                    $('#TableContainer').datagrid('appendRow', {
                                        ID: guid.newGUID(),
                                        PotentialCustomers_OrganID: $('#ID').val(),
                                        SendCommID: item.CommID,
                                        SendCommName: item.CommName
                                    });
                                }
                            });
                        }
                    });
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var SelectRow = $("#TableContainer").datagrid("getSelected");
                    if (SelectRow) {
                        var RowIndex = $("#TableContainer").datagrid("getRowIndex", SelectRow);
                        $("#TableContainer").datagrid("deleteRow", RowIndex);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }
        ];
        var column = [[
            { field: 'SendCommName', title: '发放项目', width: 80, align: 'center' }
        ]];
        //加载列表
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: false,
                width: "100%",
                toolbar: toolbar,
                onBeforeLoad: function (param) {
                    param.PotentialCustomers_OrganID = $('#ID').val();
                    param = $.getDataGridParam("Renting_PotentialCustomers_Organ", "GetSendList", param);
                },
                onLoadSuccess: function (data) {
                }
            });
        }

        //保存
        function Save() {
            if ($('#mainForm').form("validate")) {
                var Rows = $("#TableContainer").datagrid("getRows");

                var CommIDs = "";
                for (var i = 0; i < Rows.length; i++) {
                    CommIDs = CommIDs + Rows[i]["SendCommID"] + ",";
                }
                if (CommIDs.endsWith(',')) {
                    CommIDs = CommIDs.substring(0, CommIDs.length - 1);
                }
                var param = {
                    ID: $('#ID').val(),
                    CommIDstr: CommIDs
                }
                $.dataPostJson('Renting_PotentialCustomers_Organ', 'SaveSend', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("保存");
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }
        //关闭
        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
