<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewHousingStatusAudit.aspx.cs" Inherits="M_Main.HouseNew.NewHousingStatusAudit" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js"></script>
    <%--<script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>--%>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        input, select, textarea {
            border: 1px #cccccc solid;
            padding: 4px;
            width: 160px;
            padding-top: 3px;
            padding-bottom: 3px;
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;
        }

        .TableForm {
            width: 100%;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .TableForm tr td.TdTitle {
                color: #666;
                padding: 4px;
                width: 10%;
                text-align: right;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
                background: #F8F8F8;
            }

            .TableForm tr td.TdContentSearch {
                padding: 5px;
                width: 15%;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }
              .TableForm tr td.TdContentSearch img {
                    width: 200px;
                    height: 200px;
                }

            .TableForm tr td select {
                width: 170px;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="AllData" name="AllData" type="hidden" runat="server" /> 
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" />  
             <input id="FeesRoleCodes" name="FeesRoleCodes" type="hidden" runat="server" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 250px;">
            <table class="TableForm">

                <tr>
                    <td class="TdTitle">楼宇名称</td>
                    <td class="TdContentSearch">
                        <select id="BuildSNum" runat="server"></select></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" />
                    </td>
                    <td class="TdTitle">变更人</td>
                    <td class="TdContentSearch">
                        <input id="UserName"  name="UserName" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">变更前交房状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server"></select></td>
                    <td class="TdTitle">变更后交房状态</td>
                    <td class="TdContentSearch">
                        <select id="NewRoomState" name="NewRoomState" runat="server"></select></td>
                </tr>
                <tr>
                    <td class="TdTitle">是否审核</td>
                    <td class="TdContentSearch">
                        <select id="IsOption" name="IsOption" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }

            function InitFrom() {
                var com = getQueryVariable("FromIndex");
                if (com != "") {
                    $("#FromIndex").val(com);
                } 
            }
            InitFrom();

            var column = [[

            { field: 'ck', checkbox: true },

            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
            { field: 'CustName', title: '当前业主', width: 180, align: 'left', sortable: true },
            { field: 'StateName', title: '变更前交房状态', width: 180, align: 'left', sortable: true },
            { field: 'NewStateName', title: '变更后交房状态', width: 180, align: 'left', sortable: true },
            { field: 'UserName', title: '变更人', width: 100, align: 'left', sortable: true },
            { field: 'ChangeDate', title: '变更日期', width: 180, align: 'left', sortable: true },
            { field: 'ChangeMemo', title: '备注', width: 180, align: 'left', sortable: true }, 
            { field: 'FeesRoleNamesNew', title: '审核流程', width: 361, align: 'left', sortable: true },
            {
                field: 'IID', title: '审核状态', width: 130, align: 'left', sortable: true, formatter: function (value, row, index) {
              
                    var IsAudit = row.IsAuditing;
                    var IsOption = row.IsOption;
                    if (IsAudit == 1 && IsOption == 1) {

                        values = "<font color='Green'>已通过</font>";


                    }
                    else if (IsAudit == 0 && IsOption == 1) {


                        values = "<font color='red'>未通过</font>";

                    }
                    else {


                        values = "<font color='Blue'>未审核</font>";
                    }
                    return values;
                }
            }
 

            ]];

            var toolbar = [
                 {
                     text: '筛选',
                     iconCls: 'icon-search',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');

                     }
                 }, '-',
                    {
                        text: '确认审核',
                        iconCls: 'icon-add',
                        handler: function () {
                            var rows = $('#TableContainer').datagrid('getChecked');
                            if (rows == "") {
                                HDialog.Info('请选择要审核房屋状态的房屋!');
                            }
                            else {
                                if ($('#IsOption').val() == "1") {
                                    HDialog.Info('请选择要审核房屋状态的房屋!');
                                }
                                else {
                                  
                                    var SelData = JSON.stringify(rows); 
                                    $('#AllData').val(SelData);
                                    var jsonSelData = JSON.parse(SelData);
                                    var strjson = "";
                                    for (var i = 0; i < jsonSelData.length; i++) { 
                                        if (i == 0) {
                                            strjson = jsonSelData[i].FeesRoleCodes;
                                        } else { 
                                            strjson = strjson + jsonSelData[i].FeesRoleCodes + "#";
                                        }
                                      
                                    }

                                    $('#FeesRoleCodes').val(strjson);
                                    
                                    HDialog.MessageBox("确认审核", "审核通过", "审核不通过", function () {
                                        $.tool.DataPostChk('frmForm', 'AuditManage', 'HousingStatusAudit', $('#frmForm').serialize() + "&IsAuditing=1",
                                           function Init() {
                                           },
                                           function callback(_Data) {
                                               var r = _Data.split('|');

                                               if (r[0] == "true") {
                                                   LoadList();
                                               }
                                               HDialog.Info(r[1]);

                                           },
                                           function completeCallback() {
                                           },
                                           function errorCallback() {
                                           });

                                    }, function () {
                                        $.tool.DataPostChk('frmForm', 'AuditManage', 'HousingStatusAudit', $('#frmForm').serialize() + "&IsAuditing=0",
                                         function Init() {
                                         },
                                         function callback(_Data) {
                                             var r = _Data.split('|');

                                             if (r[0] == "true") {
                                                 LoadList();
                                             }
                                             HDialog.Info(r[1]);

                                         },
                                         function completeCallback() {
                                         },
                                         function errorCallback() {
                                         });

                                    });

                                }

                            }

                        }
                    }
            ];

            function SelRoom() {
                $('#RoomSign').searchbox("setValue", '');

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);

                });

            }



            function LoadList() {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                // fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("AuditManage", "HousingStatusAuditList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                        if (data.rows.length > 0) {
                            for (var i = 0; i < data.rows.length; i++) {
                                if (data.rows[i].IsOption == "1") {
                                    $("input[type='checkbox']")[i + 1].disabled = true;

                                }
                            }
                        }

                    },
                    onCheckAll: function (rows) {
                        $("input[type='checkbox']").each(function (index, el) {
                            if (el.disabled) {
                                $(el).removeAttr("checked");
                            }
                        });
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>
