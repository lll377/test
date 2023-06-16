<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditingInputPreCostsDetailBrowse.aspx.cs" Inherits="M_Main.ChargesNew.AuditingInputPreCostsDetailBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
   <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />

</head>
<body>
    <form id="frmForm" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input id="AuditID" type="hidden" size="1" name="AuditID" runat="server">
        <input id="IsAuditing" type="hidden" size="1" name="IsAuditing" runat="server">
        <input id="CreYear" type="hidden" size="1" name="CreYear" runat="server">
        <input id="CreMonth" type="hidden" size="1" name="CreMonth" runat="server">
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server" />
        <input id="TotalDays" name="TotalDays" type="hidden" runat="server" />
        <input id="FeesRoleCodes" name="FeesRoleCodes" type="hidden"  runat="server"/>
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="javascript:void(0)" onclick=" JavaScript:ExcuteOnServer(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td id="ivrTdShtg">
                        <a href="javascript:void(0)" onclick="AuditingFee(1);" class="l-btn l-btn-small l-btn-plain" group="" id="shtg" name="shtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text" id="sshtg" name="sshtg">审核通过</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td id="ivrTdShbtg">
                        <a href="javascript:void(0)" onclick="AuditingFee(2);" class="l-btn l-btn-small l-btn-plain" group="" id="shbtg" name="shbtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">审核不通过</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="ToExcel();" class="l-btn l-btn-small l-btn-plain" group="" id="excel" name="excel"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">Excel输出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><span id="lbAudit" style="color: red"></span></td>
                </tr>
            </table>
        </div>

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">
            <table class="DialogTable" style="line-height: 25px;">

                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust" name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />
                        <input class="button_sel" style="display: none;" id="btnSelCust" onclick="javascript: if (btnSelCust_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelCust" runat="server" />
                        <input id="CustID" type="hidden" name="CustID" runat="server" />
                        <input id="hiCustName" type="hidden" name="hiCustName" runat="server" />
                    </td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostName" name="CostName" class="easyui-searchbox" searcher="SelCost" data-options="editable:false" runat="server" />
                        <input class="button_sel" id="btnSelCost" style="display: none;" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                            type="button" value="" name="btnSelCost" runat="server" />
                        <input id="hiCostName" type="hidden" size="1" name="hiCostName" runat="server" />
                        <input id="CostID" type="hidden" size="1" name="CostID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server">
                        <input class="button_sel" style="display: none;" id="btnSelRoom" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelRoom" runat="server">
                        <input id="RoomID" type="hidden" name="RoomID" runat="server">
                        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server"></td>
                    <td class="TdTitle">楼 宇</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BuildSNum" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
                <tr class="SchTable" style="display: none;">
                    <td align="center" colspan="4">
                        <input class="button" id="btnFilter" type="button" value="查询" name="btnFilter" runat="server">
                        <input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();"
                            type="button" value="清空" name="btnClear">
                        <input id="hiSearchData" type="hidden" size="1" name="hiSearchData" runat="server">
                        <input id="hiSearchSql" type="hidden" size="1" name="hiSearchSql"
                            runat="server">
                        <input class="button_four" id="btnFilterMore" style="display: none" onclick="btnFilterMore_OnClick();"
                            type="button" value="综合查询" name="btnFilterMore" runat="server">
                        <input id="TableSign" type="hidden" size="1" name="TableSign" runat="server">
                        <input class="button_Four" id="btnOk" type="button" value="审核通过" name="btnOk" runat="server">
                        <input class="button_Four" id="btnNo" type="button" value="审核不通过"
                            name="btnNo" runat="server">&nbsp;&nbsp;
                    <input class="button_Four" id="btnExcel" type="button" value="Excel输出" name="btnExcel" runat="server">
                        <input class="button_four" id="btnPrint" type="button" value="打    印"
                            name="btnPrint" runat="server">
                        <input class="button_four" id="btnReturn" type="button" value="放弃返回"
                            name="btnFilter" runat="server">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>


<script type="text/javascript">

    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

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
        var ly = getQueryVariable("FromIndex");
        if (ly == "t") {
            $("#FromIndex").val("t");
        }
    }
    InitFrom();

    $(function () {

        if (GetQueryString("ivrShowType") == "1") {
            $("#sshtg").html("审核通过");
            $('body').pagewalkthrough({
                name: 'introduction3',
                steps: [
                    {
                        wrapper: '#ivrTdShtg',
                        popup: {
                            content: '如果通过审核则点击“审核通过”按钮',
                            type: 'tooltip',
                            position: 'right'
                        }
                    },
                    {
                        wrapper: '#ivrTdShbtg',
                        popup: {
                            content: '如果不通过审核则点击“审核不通过”按钮',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function () {
                            HDialog.Close("1");
                        }
                    }
                ]
                ,
                buttons: {
                    jpwNext: {
                        i18n: "下一步 &rarr;"
                    },
                    jpwFinish: {
                        i18n: "结束指引 &#10004;",
                    },
                    jpwPrevious: {
                        i18n: "&larr; 上一步"
                    },
                    jpwClose: {
                        i18n: "关闭",
                    }
                }
            })

            $('body').pagewalkthrough('show');
        }

    })

    $(function () {
        LoadList();
       
    })

    function InitFunction() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
        $('#lbAudit').html("审核状态:未审核");

        if ($('#TotalDays').val() != "0") {


            $('#shtg').css("cursor", "default");

            $('#shtg').attr('href', '#');     //修改<a>的 href属性值为 #  这样状态栏不会显示链接地址  

            $('#shtg').click(function (event) {
                HDialog.Info("已超时限");

            });


            $('#sshtg').html("已超时限");
        }
        if ($('#IsAuditing').val() != "0") {

            $('#shtg').css("cursor", "default");

            $('#shtg').attr('href', '#');     //修改<a>的 href属性值为 #  这样状态栏不会显示链接地址  

            $('#shtg').click(function (event) {
                HDialog.Info("费用已审核");

            });



            $('#shbtg').css("cursor", "default");

            $('#shbtg').attr('href', '#');     //修改<a>的 href属性值为 #  这样状态栏不会显示链接地址  

            $('#shbtg').click(function (event) {
                HDialog.Info("费用已审核");


            });

            //$('#shtg').attr("disabled", "disabled");
            //$('#shbtg').attr("disabled", "disabled");
            if ($('#IsAuditing').val() == "1")
            { $('#lbAudit').html("审核状态:已通过"); }
            if ($('#IsAuditing').val() == "2")
            { $('#lbAudit').html("审核状态:未通过"); }

        }

    }

    InitFunction();

    function SelCost() {

        var conent = "../dialogNew/CorpCommCostDlg.aspx" + "?Ram=" + Math.random();



        HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {


            if (_Data != "") {//**获得返回 刷新


                var data = JSON.parse(_Data);
                $('#CostName').searchbox("setValue", data.CostName);
                $('#CostID').val(data.CostID);
                $('#hiCostName').val(data.CostName);

            }
        });

    }



    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


        var w = 800;
        var h = 400;

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#hiCustName').val(data.CustName);
            $('#CustID').val(data.CustID);
            $('#hiCustName').val(data.CustName);
        });
    }

    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";


        var w = $(window).width();
        var h = $(window).height();

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            
            $('#hiCustName').val(data.CustName);
           
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });

    }

    var column = [[
        { field: '客户类别', title: '客户类别', align: 'left', sortable: true, width: 120 },
        { field: '客户名称', title: '客户名称', align: 'left', sortable: true, width: 150 },
        { field: '楼宇名称', title: '楼宇名称', align: 'left', sortable: true, width: 100 },
        { field: '房屋编号', title: '房屋编号', align: 'left', sortable: true, width: 120 },
        { field: '车位编号', title: '车位编号', align: 'left', sortable: true, width: 120 },
        {
            field: '预交日期', title: '预交日期', align: 'left', sortable: true, width: 150, formatter: function (value, row, index) {
                var str = formatDate(row.预交日期, "yyyy-MM-dd");
                return str;
            }
        },
        { field: '费用序号', title: '费用序号', align: 'left', sortable: true, width: 100 },
        { field: '费用名称', title: '费用名称', align: 'left', sortable: true, width: 100 },
        { field: '预交金额', title: '预交金额', align: 'left', sortable: true, width: 100 },
        { field: '备注', title: '备注', align: 'left', sortable: true, width: 100 },

    ]];


    function ExcuteOnServer() {
        $('#SearchDlg').parent().appendTo($("form:first"))
        $('#SearchDlg').dialog('open');
    }
    function AuditingFee(IsAuditing) {

        var Title = "确认审核通过预交费用";
        if (IsAuditing == "2") {
            Title = "确认审核不通过预交费用";
        }
        HDialog.Prompt(Title, function () {
            $.tool.DataPostChk('frmForm', 'AuditManage', 'AuditingInputPreCosts', $('#frmForm').serialize() + "&iIsAuditing=" + IsAuditing,
               function Init() {
               },
               function callback(_Data) {
                   var r = _Data.split('|');

                   if (r[0] == "true") {
                       if (IsAuditing == "1")
                       { $('#lbAudit').html("审核状态:已通过"); }
                       if (IsAuditing == "2")
                       { $('#lbAudit').html("审核状态:未通过"); }
                   }


               },
               function completeCallback() {
               },
               function errorCallback() {
               });

        })

    }
    function ToExcel() {
        window.location.href = '../ChargesNew/AuditingInputPreCostsDetaiCreExcel.aspx';
    }

    function LoadList() {


        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: '#divtt',
            view: myview,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            sortOrder: "asc",
            showFooter: true,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("AuditManage", "AuditingInputPreCostsDetaiList", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.test == 'footer') {
                    return 'background-color:#F4F4F4;border:none;'; // return inline style
                }

            },
            onLoadSuccess: function (data) {
                $.tool.DataPostNoLoading('AuditManage', "AuditingInputPreCostsDetaiListSum", $('#frmForm').serialize(),
                       function Init() {
                           //加载页脚
                           $('#TableContainer').datagrid('reloadFooter', [
                                       {
                                           test: 'footer',
                                           客户类别: "<span style='color:red'>累计合计</span>",
                                           预交金额: "<span style='color:red'>0</span>"
                                       }
                           ]);
                       },
                       function callback(_Data) {

                           //加载页脚
                           $('#TableContainer').datagrid('reloadFooter', [
                                       {
                                           test: 'footer',
                                           客户类别: "<span style='color:red'>累计合计</span>",
                                           预交金额: "<span style='color:red'>" + _Data + "</span>"
                                       }
                           ]);
                       });
            }
        });
        $("#SearchDlg").dialog("close");

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#CostName').searchbox("setValue", '');
        $('#CostID').val('');
    }

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

</script>
