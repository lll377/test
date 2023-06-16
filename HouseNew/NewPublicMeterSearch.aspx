<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPublicMeterSearch.aspx.cs" Inherits="M_Main.HouseNew.NewPublicMeterSearch" %>


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
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
    function Win_OnLoad()
			{				
				var strPrintParms = getObject("PrintParms").value;
				if(strPrintParms!="")
				{					
					showOperatWin(strPrintParms);
					
					getObject("PrintParms").value="";					
				}
    }
    </script>
</head>
<body onload="Win_OnLoad()">
    <form id="frmForm" runat="server">
        <input id="PrintParms" style="height: 21px; width: 24px" type="hidden" size="1" name="PrintParms"
            runat="server" />
       
        <div class="SearchContainer" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 300px;">
            <table style="width: 100%;">
                <tr>
                    <td class="TdTitle">抄表时间从</td>
                    <td colspan="3">
                        <input id="StartDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                            readonly name="StartDate" runat="server" style="width: 100px;" />到<input id="EndDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                readonly name="EndDate" runat="server" style="width: 100px;" />
                    </td>


                </tr>
                <tr>
                    <td class="TdTitle">表计名称</td>
                    <td class="TdContentSearch">
                        <input class="Control_ItemInput" id="MeterName" name="MeterName" runat="server" />
                    </td>
                    <td class="TdTitle">表计类型
                    </td>
                    <td class="TdContentSearch">
                        <select id="MeterType" runat="server" style="width: 150px"></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">安装位置</td>
                    <td class="TdContentSearch">
                        <input class="Control_ItemInput" id="Location" name="Location" runat="server" /></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">用量</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol1" name="CompSymbol1" runat="server">
                            <option selected></option>
                        </select>&nbsp;<input id="Comp_Dosage" onkeypress="CheckNumeric();"
                            name="Comp_Dosage" runat="server" /></td>
                    <td class="TdTitle">金额</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol2" name="CompSymbol2" runat="server">
                            <option selected></option>
                        </select>&nbsp;<input id="Comp_Amount" onkeypress="CheckNumeric();"
                            name="Comp_Amount" runat="server" /></td>
                </tr>

                <tr>
                    <td align="center" colspan="4">
                        <input type="hidden" name="IsSearch" id="IsSearch" runat="server" />
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">确定筛选</a>

                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
              
            }
            InitFunction();

            function Search() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
           

           
            var column = [[
                  { field: 'RestID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'Location', title: '安装位置', width: 100, align: 'left', sortable: true },
                { field: 'MeterSign', title: '表计编号', width: 100, align: 'left', sortable: true },
                { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                { field: 'MeterTypeName', title: '表计类型', width: 100, align: 'left', sortable: true },
                {
                    field: 'ListDate', title: '抄表日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ListDate, "yyyy-MM-dd");
                        return str;
                    }
                },

                { field: 'StartDegree', title: '起数', width: 100, align: 'left', sortable: true },
                { field: 'EndDegree', title: '止数', width: 100, align: 'left', sortable: true },
                { field: 'Ratio', title: '变比', width: 100, align: 'left', sortable: true },
                { field: 'Dosage', title: '用量', width: 100, align: 'left', sortable: true },
                { field: 'OldDosage', title: '旧表用量', width: 100, align: 'left', sortable: true },
                { field: 'ExtraDosage', title: '损耗', width: 100, align: 'left', sortable: true },
                { field: 'TotalDosage', title: '合计用量', width: 100, align: 'left', sortable: true },
                { field: 'Price', title: '单价', width: 100, align: 'left', sortable: true },
                { field: 'Amount', title: '金额', width: 100, align: 'left', sortable: true }



                
            ]];

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
                        text: 'Excel输出',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {

                            window.open('../House/PublicMeterSearchCre.aspx');
                        }
                    }
            ];
            function LoadData()
            {
                LoadList();
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
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    showFooter: true,
                    view: myview,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("Meter", "GetPublicMeterResultList", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.RestID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }

                    },
                    onLoadSuccess: function (data) {


                        $.tool.DataPostNoLoading('Meter', "PublicMeterResultSum", $('#frmForm').serialize(),
                    function Init() {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        RestID: 'footer',
                                        Location: "<span style='color:red'>累计合计</span>",
                                        Dosage: "<span style='color:red'>0</span>",
                                        OldDosage: "<span style='color:red'>0</span>",
                                        ExtraDosage: "<span style='color:red'>0</span>",
                                        TotalDosage: "<span style='color:red'>0</span>",
                                        Amount: "<span style='color:red'>0</span>"

                                    }
                        ]);
                    },
                    function callback(_Data) {
                            
                        var data = _Data.split('|');
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        RestID: 'footer',
                                        Location: "<span style='color:red'>累计合计</span>",
                                        Dosage: "<span style='color:red'>" + data[0] + "</span>",
                                        OldDosage: "<span style='color:red'>" + data[1] + "</span>",
                                        ExtraDosage: "<span style='color:red'>" + data[2] + "</span>",
                                        TotalDosage: "<span style='color:red'>" + data[3] + "</span>",
                                        Amount: "<span style='color:red'>" + data[4] + "</span>"

                                    }
                        ]);
                    },
                    function completeCallback() {

                    },
                    function errorCallback() {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        RestID: 'footer',
                                        Location: "<span style='color:red'>累计合计</span>",
                                        Dosage: "<span style='color:red'>0</span>",
                                        OldDosage: "<span style='color:red'>0</span>",
                                        ExtraDosage: "<span style='color:red'>0</span>",
                                        TotalDosage: "<span style='color:red'>0</span>",
                                        Amount: "<span style='color:red'>0</span>"

                                    }
                        ]);
                    });

                }
                });
                $("#SearchDlg").dialog("close");
            }
           
            LoadData();

           

        </script>
    </form>
</body>
</html>

