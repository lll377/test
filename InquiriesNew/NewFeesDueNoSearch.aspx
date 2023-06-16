<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesDueNoSearch.aspx.cs" Inherits="M_Main.InquiriesNew.NewFeesDueNoSearch" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
   
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script> 
</head>
<body  scroll="no">
    <form id="NewFeesDueNoSearch" runat="server">
         <input id="hiIsSQLData" type="hidden" name="hiIsSQLData" runat="server" />

        <div style="width:100%;background-color:#cccccc;"  id="TableContainer"></div>

         <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 800px; height: 150px; padding: 10px;">
            <table class="DialogTable" id="SearchTable">
                <tr>
                    <td class="TdTitle">时间</td>
                    <td class="TdContentSearch">
                        <select id="FeeYear" name="FeeYear" runat="server">
                            <option selected></option>
                        </select>年
                        <select id="FeeMonth" name="FeeMonth" runat="server">
                            <option selected></option>
                        </select>月</td>
                    <td class="TdTitle">费用类型</td>
                    <td class="TdContentSearch">
                        <select name="CostTypes" id="CostTypes" class="easyui-combobox" paneimaxheight="100px" data-options="editable:false,panelHeight:&#39;135px&#39;,multiple:true," style="width:200px;">
	                        <option value=""></option>
                            <option value="1">物管类</option>
	                        <option value="2">车位类</option>
	                        <option value="3">水费</option>
	                        <option value="4">电费</option>
                        </select></td>
                </tr>               
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">统计</a></td>
                </tr>
            </table>
        </div>

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
    
    <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        function InitTableHeight() {
            var h = $(window).height();
            //var h1 = h - 37;
            $("#TableContainer").css("height", h + "px");
            
        }

        InitTableHeight();
       
        var column = [
               [
                    { colspan: 2, title: '物管类费用', align: 'left', sortable: true},
                    { colspan: 2, title: '车位类费用', align: 'left', sortable: true},
                    { colspan: 2, title: '水费', align: 'left', sortable: true },
                    { colspan: 2, title: '电费', align: 'left', sortable: true }
               ], [
                    { field: 'IsStan1', title: '绑定标准', align: 'left', sortable: true, width: 100 },
                    { field: 'IsFees1', title: '生成费用', align: 'left', sortable: true, width: 100 },
                    { field: 'IsStan2', title: '绑定标准', align: 'left', sortable: true, width: 100 },
                    { field: 'IsFees2', title: '生成费用', align: 'left', sortable: true, width: 100 },
                    { field: 'IsStan3', title: '绑定标准', align: 'left', sortable: true, width: 100 },
                    { field: 'IsFees3', title: '生成费用', align: 'left', sortable: true, width: 100 },
                    { field: 'IsStan4', title: '绑定标准', align: 'left', sortable: true, width: 100 },
                    { field: 'IsFees4', title: '生成费用', align: 'left', sortable: true, width: 100 }
               ]

        ];
        var frozenColumns = [[
                { field: 'RoomSign',  title: '房屋编号', align: 'left', sortable: true,width:350}
        ]];

        var Headcolumn = [[
                { colspan: 2, title: '物管类费用', align: 'left', sortable: true},
                { colspan: 2, title: '车位类费用', align: 'left', sortable: true},
                { colspan: 2, title: '水费', align: 'left', sortable: true },
                { colspan: 2, title: '电费', align: 'left', sortable: true }
        ], [
                { field: 'IsStan1', title: '绑定标准', align: 'left', sortable: true, width: 100 },
                { field: 'IsFees1', title: '生成费用', align: 'left', sortable: true, width: 100 },
                { field: 'IsStan2', title: '绑定标准', align: 'left', sortable: true, width: 100 },
                { field: 'IsFees2', title: '生成费用', align: 'left', sortable: true, width: 100 },
                { field: 'IsStan3', title: '绑定标准', align: 'left', sortable: true, width: 100 },
                { field: 'IsFees3', title: '生成费用', align: 'left', sortable: true, width: 100 },
                { field: 'IsStan4', title: '绑定标准', align: 'left', sortable: true, width: 100 },
                { field: 'IsFees4', title: '生成费用', align: 'left', sortable: true, width: 100 }
                    
        ]];

        var ExcelCol = [{ field: 'RoomSign',  title: '房屋编号', align: 'left', sortable: true,width:350},
            { field: 'IsStan1', title: '绑定标准', align: 'left', sortable: true, width: 100 },
            { field: 'IsFees1', title: '生成费用', align: 'left', sortable: true, width: 100 },

            { field: 'IsStan2', title: '绑定标准', align: 'left', sortable: true, width: 100 },
            { field: 'IsFees2', title: '生成费用', align: 'left', sortable: true, width: 100 },

            { field: 'IsStan3', title: '绑定标准', align: 'left', sortable: true, width: 100 },
            { field: 'IsFees3', title: '生成费用', align: 'left', sortable: true, width: 100 },

            { field: 'IsStan4', title: '绑定标准', align: 'left', sortable: true, width: 100 },
            { field: 'IsFees4', title: '生成费用', align: 'left', sortable: true, width: 100 }
        ];

        function SearchDlg() {
            btnClear_OnClick();
            $('#SearchDlg').parent().appendTo($("form:first"))
            $('#SearchDlg').dialog('open');
        }

        var beforeLoad = function (param) {


            if (document.getElementById('hiIsSQLData').value != "-1") {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
                $('#divtime').html("正在查询中,请等待，耗时: 0秒");
            }

            $("select").each(function () {

                var key = $(this).attr("id");
                if (key != "") {
                    if (!param[key]) {
                        param[key] = $(this).val();
                    }
                }
            });

            $("input").each(function () {

                var key = $(this).attr("id");
                if (key != "") {
                    if (!param[key]) {
                        param[key] = $(this).val();
                    }
                }
            });
            var gridOpts = $('#TableContainer').datagrid('getPager').data("pagination").options;

            param.page = gridOpts.pageNumber;
            param.rows = gridOpts.pageSize;
        };

        var intervalProcess;


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
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成查询');
                        }
                        else {
                            //Export('未生成应收费用查询Excel', $('#TableContainer'));
                            window.location.href = "../InquiriesNew/NewFeesDueNoSearchCre.aspx";
                        }
                    }
                }
        ];
        
    </script>

     <script type="text/javascript">
         var ProgressInterval;

         function ExcuteOnServer() {
             document.getElementById('hiIsSQLData').value = "1";
            
             $("#SearchDlg").dialog("close");
             //启动任务
             StartTask();
             //展示进度
             ShowProgress();
             //获取执行情况进度
             ProgressInterval = setInterval("TakeProgress()", 1000);

           
             //$('#SearchDlg').dialog('close');
             btnClear_OnClick();
         }

         function StartTask() {
             //启动一个任务
             $.tool.DataPostNoLoading('FeesDueNoSearch', 'StartTask', $('#NewFeesDueNoSearch').serialize(),
                 function Init() {
                 },
                 function callback(_Data) {
                  },
                 function completeCallback() {
                 },
                 function errorCallback() {
                 });
         }

         function LoadList() {

             $("#TableContainer").datagrid({
                 url: '/HM/M_Main/HC/DataPostControl.aspx',
                 method: "post",
                 title: '',
                 nowrap: false,
                 pageSize: 500,
                 pageList: [500, 1000, 2000],
                 columns: column,
                 frozenColumns: frozenColumns,
                 fitColumns: false,
                 remoteSort: false,
                 pagination: true,
                 width: "100%",
                 toolbar: toolbar,
                 sortOrder: "asc",
                 singleSelect: true,
                 selectOnCheck: false,
                 checkOnSelect: false,
                 rownumbers: true,
                 border: false,
                 sortOrder: "asc",
                 onBeforeLoad: function (param) {
                     param = $.JQForm.GetParam("FeesDueNoSearch", "LoadData", "TableContainer", param);
                 }
             });

         }

         LoadList();

         //获取进度
         function TakeProgress() {
             $.tool.DataPostNoLoading('FeesDueNoSearch', 'TakeProgress', $('#NewFeesDueNoSearch').serialize(),
                 function Init() {
                 },
                 function callback(_Data) {
                     var Obj = JSON.parse(_Data);
                     if (_Data == '[]') {

                         LoadList();
                         CloseProgress();
                     }
                     else {
                         SetProgress(Obj);

                         if (Obj[0].Curr == '100') {
                             $('#hiIsSQLData').val('1');
                             LoadList();
                             CloseProgress();
                         }
                         else {
                         }
                     }
                 },
                 function completeCallback() {
                 },
                 function errorCallback() {
                 });
         }

         //显示进度
         function ShowProgress() {
             var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
             var ht = parseInt($(window).scrollTop());
             $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
             $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
         }
         //关闭进度
         function CloseProgress() {
             clearInterval(ProgressInterval);
             $(".datagrid-mask").hide();
             $(".datagrid-mask-msg").hide();
         }
         //设置进度
         function SetProgress(Obj) {
             var i = parseInt(Obj[0].Curr); 
             $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
             $('#DivMsg').html(Obj[0].MessageInfo);
         }         
         
         function btnClear_OnClick() {
             
         }

    
    </script>

    </form>
</body>
</html>
