<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesDebtCut1Search.aspx.cs" EnableEventValidation="false" EnableSessionState="ReadOnly" ViewStateEncryptionMode="Never" EnableViewStateMac="false" EnableViewState="false" Inherits="M_Main.Inquiries.NewFeesDebtCut1Search" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>

    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
          
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>   

    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />    	
</head>
<body scroll="no">
    <form id="NewFeesDueCutSearch" runat="server">
       <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />

        <input id="hiRoomSigns" type="hidden" name="hiRoomSigns" runat="server" />
        <input id="RoomIDs" type="hidden" name="RoomIDs" runat="server" />

        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
        <input id="hiRegionNames" type="hidden" name="hiRegionNames" runat="server" />
        
        <input id="CustID" type="hidden" name="CustID" runat="server" />
        <input id="hiCustName" type="hidden" name="hiCustName" runat="server" />
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" />
                     
        <input id="RoomStates"  type="hidden" name="RoomStates" runat="server" />
        <input id="hiRoomStateNames" type="hidden" name="hiRoomStateNames" runat="server" />
        <input id="RoomStateNum" type="hidden" name="RoomStateNum" runat="server" />

        <input id="CarparkIDs" type="hidden" name="CarparkIDs" runat="server" />
        <input id="hiCarparkNames" type="hidden" name="hiCarparkNames" runat="server" />
        
        <input id="ParkIDs" type="hidden" name="ParkIDs" runat="server" />
        <input id="hiParkNames" type="hidden" name="hiParkNames" runat="server" />

        <input id="Hidden1" type="hidden" name="CostIDs" runat="server" />
        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" />
                
        <input id="Hidden2" type="hidden" name="StanIDs" runat="server" />
        <input id="Hidden3" type="hidden" name="hiStanNames" runat="server" />

        <input id="hiCommID" type="hidden" name="hiCommID" runat="server"/>
        <input id="hiLoginUserCode" type="hidden" name="hiLoginUserCode" runat="server"/>
        <input id="hiIsSQLData" type="hidden" name="hiIsSQLData" runat="server"/>
        <div style="width:100%;background-color:#ffffff;"  id="TableContainer"></div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 330px; padding: 10px;">
             <table class="DialogTable">
                  <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" style="width:90%" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" /></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" style="width:90%" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            name="RegionNames" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" style="width:90%" class="easyui-combobox" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" style="width:90%" class="easyui-combobox" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" style="width:90%" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                         <select id="SelectRoomID" style="width:90%" class="easyui-combobox" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" style="width:90%" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />                       
                    </td>
                     <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch"><input id="RoomStateNames" style="width:90%" class="easyui-searchbox" searcher="SelRoomState"
                            name="RoomStateNames" runat="server" />
                        </td>   
                </tr>
                <tr>
                    <td class="TdTitle">查询范围</td>
                    <td class="TdContentSearch">
                        <select id="SearchRange" style="width:90%" class="easyui-combobox" name="SearchRange" runat="server">
                            <option value="0" selected>全部客户</option>
                            <option value="1">银行代收客户</option>
                            <option value="2">非银行代收客户</option>
                        </select></td>
                    <td class="TdTitle">代收银行</td>
                    <td class="TdContentSearch">
                        <select id="BankName" style="width:90%" class="easyui-combobox" name="BankName" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" style="width:90%" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark"
                            name="CarparkNames" runat="server">                        
                    </td>
                    <td class="TdTitle">车位</td>
                    <td class="TdContentSearch">
                        <input id="ParkNames" style="width:90%" class="easyui-searchbox" data-options="editable:false" searcher="SelPark"
                            name="ParkNames" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" style="width:90%" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server"></td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContentSearch">
                        <input id="StanNames" style="width:90%" class="easyui-searchbox" data-options="editable:false" searcher="SelStan"
                            name="StanNames" runat="server">
                    </td>
                </tr>
                  <!--
                <tr>
                     <td class="TdTitle">欠费时间</td>
                    <td class="TdContentSearch"><select id="CompSymbol1" class="easyui-combobox" name="CompSymbol1" runat="server">
                                    <option selected></option>
                                </select><input style="width: 70%;" id="Comp_Month" class="easyui-textbox" onkeypress="CheckNumeric();"
                                    name="Comp_Month" runat="server">月</td>
                     <td class="TdTitle">欠费金额</td>
                    <td class="TdContentSearch"> <select id="CompSymbol2" class="easyui-combobox" name="CompSymbol2" runat="server">
                                    <option selected></option>
                                </select><input style="width: 70%;" id="Comp_Amount" class="easyui-textbox" onkeypress="CheckNumeric();"
                                    name="Comp_Amount" runat="server">元</td>
                </tr>
                      -->
                <tr>

                    <td class="TdTitle">是否垫付</td>
                    <td class="TdContentSearch">
                        <select id="IsProperty" class="easyui-combobox" name="IsProperty" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>       
                <tr><td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>                           
                    </td>
                </tr>
                </table>
        </div>

        <div id="tb">
           <table border = "0" style="font-size:12px;font-family:微软雅黑;">
        <tr>
             <td style="width:auto;" align="left">收款截止时间&nbsp;<input type="text" class="easyui-datebox" id="FeesStopEndDate"  runat="server" name="FeesStopEndDate"/>&nbsp;
             时间类型&nbsp;<select id="FeesDateType" name = "FeesDateType" runat="server">										
										<option Value="1" selected>费用日期</option>
										<option Value="2">应收日期</option>
									</select>&nbsp;
             费用时间<SELECT id="nYear" name="nYear" runat="server">
										<OPTION selected></OPTION>
									</SELECT><INPUT style="WIDTH: 24px; HEIGHT: 21px" id="hiYear" type="hidden" name="hiYear" runat="server"></td>
             <td ><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Static();">生成欠费</a> 
             <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选条件</a> 
             <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">Excel导出</a> 

             
             <input style="HEIGHT: 22px; WIDTH: 32px" id="PageIndex" type="hidden" name="PageIndex"
							runat="server"/><input style="HEIGHT: 21px; WIDTH: 24px" id="PrintParms" type="hidden" name="PrintParms"
							runat="server"/><input style="HEIGHT: 22px; WIDTH: 24px" id="CostGeneType" type="hidden" name="CostGeneType"
							runat="server"/><input style="HEIGHT: 21px; WIDTH: 24px" id="OptCode" type="hidden" name="OptCode"
							runat="server"/><input style="HEIGHT: 21px; WIDTH: 24px" id="Flag" type="hidden" name="Flag" runat="server"/>
             </td>
        </tr>
       </table>
        </div>
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px'>
            <div id='dprocessbar' data-options="value:0" class='easyui-progressbar' style='width: 300px; margin-top: 10px;'></div>
            <div id='divtime' style='width: 300px; text-align: center'></div>
            <div id='DivProcName' style='width: 300px; text-align: center;'></div>
        </div>

        <input style="width: 8px" id="CostIDs" class="easyui-validatebox" size="1"
            type="hidden" name="CostIDs" runat="server" />
        <input style="width: 8px" id="StanIDs" class="easyui-validatebox" size="1"
            type="hidden" name="StanIDs" runat="server" />
        <input style="width: 8px" id="hiStanNames" class="easyui-validatebox" size="1"
            type="hidden" name="hiStanNames" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script  type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();

            var column = [[


                { field: 'StateName', title: '房屋状态', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'BuildName', title: '楼宇名称', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'RegionName', title: '组团区域', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MobilePhone', title: '联系电话', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'BefAmount', title: '前期欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount1', title: '1月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount1', title: '1月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount1', title: '1月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount1', title: '1月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount1', title: '1月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount2', title: '2月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount2', title: '2月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount2', title: '2月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount2', title: '2月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount2', title: '2月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount3', title: '3月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount3', title: '3月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount3', title: '3月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount3', title: '3月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount3', title: '3月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount4', title: '4月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount4', title: '4月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount4', title: '4月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount4', title: '4月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount4', title: '4月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount5', title: '5月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount5', title: '5月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount5', title: '5月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount5', title: '5月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount5', title: '5月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount6', title: '6月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount6', title: '6月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount6', title: '6月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount6', title: '6月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount6', title: '6月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount7', title: '7月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount7', title: '7月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount7', title: '7月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount7', title: '7月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount7', title: '7月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount8', title: '8月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount8', title: '8月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount8', title: '8月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount8', title: '8月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount8', title: '8月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount9', title: '9月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount9', title: '9月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount9', title: '9月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount9', title: '9月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount9', title: '9月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount10', title: '10月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount10', title: '10月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount10', title: '10月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount10', title: '10月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount10', title: '10月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount11', title: '11月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount11', title: '11月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount11', title: '11月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount11', title: '11月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount11', title: '11月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'DueAmount12', title: '12月应收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'WaivAmount12', title: '12月减免', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PaidAmount12', title: '12月已收', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'PrecAmount12', title: '12月冲抵', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'MonAmount12', title: '12月欠费', align: 'left', sortable: true, fixed: true, width: 100 },

                { field: 'ThisAmount', title: '本期欠费', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'TotalAmount', title: '合计欠费', align: 'left', sortable: true, fixed: true, width: 100 }
            ]];

            var frozenColumns = [[
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, fixed: true, width: 100 },
                { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, fixed: true, width: 100 }
            ]];
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function SearchDlg() {

                btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }


            function setIsSQLData() {
                document.getElementById('hiIsSQLData').value = 1;
            }
            function Static()
            {
                setIsSQLData();
                LoadList();
            }
            var beforeLoad = function (param) {

                if (document.getElementById('hiIsSQLData').value != "-1")
                {
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

            function LoadList() {

                if (document.getElementById('hiIsSQLData').value != "-1")
                {

                }

                var ss = $("#NewFeesDueCutSearch").serialize();
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=FeesDebtSearch&Command=FeesDebtSearch6&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "post",
                    title: '按欠费期间查询',
                    loadMsg: '加载中',
                    pageSize: 50,
                    pageList: [50, 100, 200],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    nowrap: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    nowarp: false,
                    toolbar: '#tb',
                    sortOrder: "asc",
                    onAfter: function (target)
                    {
                       
                    },
                    onBeforeLoad: beforeLoad,
                    onLoadSuccess: function (data) {

                    },
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {

                            return 'color:red;';
                        }
                    }
                });

            }

            function ResPorcessbar() {

                $(".datagrid-mask").css({ display: "none" });
                $(".datagrid-mask-msg").css({ display: "none" });

                var value = $('#dprocessbar').progressbar('getValue');
                if (value > 99) {

                    value = 0;
                    $('#dprocessbar').progressbar('setValue', value);
                    window.clearInterval(intervalProcess);
                }

            }

            function GetProcess() {


                $.tool.DataGet2("ExecutionProgress", "Process", $("#NewFeesDueCutSearch").serialize(),
                    function Init() { },
                    function callback(_Data) {
                        var varObjects = eval("(" + _Data + ")"); //转换为json对象
                        if (varObjects.rows.length > 0) {
                            var obj = varObjects.rows[0];
                            if (obj.Process < 100) {
                                var value = $('#dprocessbar').progressbar('getValue');
                                $('#dprocessbar').progressbar('setValue', obj.Process);

                                $('#divtime').html("正在查询中,请等待，耗时: " + obj.Times + "秒");
                                $('#DivProcName').html("" + obj.RunProcName + "");

                            }
                            else {
                                window.clearInterval(intervalProcess);
                            }
                        }
                    },
                    function _completeCallBack() {
                    },
                    function errorCallback() {
                        window.clearInterval(intervalProcess);
                    });
            }


            document.getElementById('hiIsSQLData').value = -1;
            LoadList();

            $(window).resize(function () {
                $('#TableContainer').datagrid('resize')
            });

        </script>
     <script type="text/javascript">

         function SelBuild() {

             HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {

                 if (_Data != "") {//**获得返回 刷新
                     var varObjects = _Data.split("|");
                     var BuildSNums = "";
                     var BuildNames = "";
                     $('#BuildSNums').val(BuildSNums);
                     $('#BuildNames').searchbox('setValue', BuildNames);

                     for (var i = 0; i < varObjects.length; i++) {
                         if (varObjects[i].indexOf(",") > 0) {
                             var d1 = varObjects[i].split(",")[0];
                             var d2 = varObjects[i].split(",")[1];

                             BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                             BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                         }

                     }
                     $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                     $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                 }
             });

         }

         function SelRegion() {

             HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx", '组团选择', false, function callback(_Data) {

                 if (_Data != "") {//**获得返回 刷新
                     var varObjects = _Data.split("|");
                     var RegionSNums = "";
                     var RegionNames = "";

                     $('#RegionSNums').val(RegionSNums);
                     $('#RegionNames').searchbox('setValue', RegionNames);
                     $('#hiRegionNames').val(RegionNames);

                     for (var i = 0; i < varObjects.length; i++) {
                         if (varObjects[i].indexOf(",") > 0) {

                             RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                             RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                         }

                     }
                     $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                     $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));

                     $('#hiRegionNames').val(RegionNames);

                 }
             });

         }
         function SelCarpark() {

             HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx", '车位区域选择', false, function callback(_Data) {


                 if (_Data != "") {//**获得返回 刷新
                     var varObjects = _Data.split("|");

                     var CarparkIDs = "";
                     var CarparkNames = "";
                     $('#CarparkIDs').val(CarparkIDs);
                     $('#CarparkNames').searchbox('setValue', CarparkNames);

                     for (var i = 0; i < varObjects.length; i++) {
                         if (varObjects[i].indexOf(",") > 0) {
                             var d1 = varObjects[i].split(",")[0];
                             var d2 = varObjects[i].split(",")[1];

                             CarparkIDs = CarparkIDs + "," + varObjects[i].split(',')[0];
                             CarparkNames = CarparkNames + "," + varObjects[i].split(',')[1];
                         }

                     }
                     $('#CarparkIDs').val(CarparkIDs.substring(1, CarparkIDs.length));
                     $('#CarparkNames').searchbox('setValue', CarparkNames.substring(1, CarparkNames.length));

                 }
             });

         }

         function SelPark() {

             HDialog.Open('700', '400', "../dialogNew/MultiParkDlg.aspx", '车位选择', false, function callback(_Data) {

                 if (_Data != "") {//**获得返回 刷新                        

                     var data = _Data.split('|');
                     if (data.length > 0) {
                         var ParkIDs = "";
                         var ParkNames = "";

                         for (var i = 0; i < data.length; i++) {
                             if (data[i] != "") {
                                 var obj = JSON.parse(data[i]);
                                 if (obj.ParkID != 0) {
                                     ParkIDs = ParkIDs + "," + obj.ParkID;
                                     ParkNames = ParkNames + ',' + obj.ParkName;
                                 }
                             }
                         }

                         $('#ParkIDs').val(ParkIDs.substring(1, ParkIDs.length));
                         $('#ParkNames').searchbox('setValue', ParkNames.substring(1, ParkNames.length));
                     }
                 }
             });

         }

         function SelCost() {

             HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                 if (_Data != "") {//**获得返回 刷新
                     var varObjects = _Data.split("\t");

                     $('#CostIDs').val(varObjects[0]);
                     $('#CostNames').searchbox('setValue', varObjects[1]);

                 }
             });

             return false;
         }

         function SelCust() {

             $('#CustName').searchbox("setValue", '');
             $('#CustID').val('');
             $('#RoomSign').searchbox("setValue", '');
             $('#RoomID').val('');
             $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

             var w = $(window).width();
             var h = $(window).height();

             var conent = "../DialogNew/CustDlg.aspx";

             HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                 var data = JSON.parse(_Data);
                 $('#CustName').searchbox("setValue", data.CustName);
                 $('#CustID').val(data.CustID);

                 $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                     function Init() {
                     },
                     function callback(_Data) {

                         varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                         if (varObjects.length > 0) {

                             var RoomData = [];
                             for (var i = 0; i < varObjects.length; i++) {

                                 var vIsDelLive = varObjects[i].IsDelLive;
                                 var strTmp = "";

                                 if (vIsDelLive == 1) {
                                     strTmp = "(历史)";
                                 }
                                 var RoomID = varObjects[i].RoomID;
                                 var RoomSign = varObjects[i].RoomSign;
                                 var Buildarea = varObjects[i].BuildArea;

                                 var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                 RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                             }

                             $('#SelectRoomID').combobox({
                                 data: RoomData,
                                 valueField: 'RoomID',
                                 textField: 'RoomText',
                                 onChange: function (n, o) {


                                     var data = $('#SelectRoomID').combobox('getData');
                                     if (data.length > 0) {
                                         for (var i = 0; i < data.length; i++) {
                                             if (n == data[i].RoomID) {

                                                 $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                 var buildArea = data[i].RoomID.split("|")[1];
                                                 $('#BuildArea').val(buildArea);
                                                 $('#RoomID').val(data[i].RoomID.split("|")[0]);

                                                 break;
                                             }
                                         }
                                     }
                                 }
                             });
                         }
                     },
                     function completeCallback() {
                     },
                     function errorCallback() {
                     });

             });
         }

         function SelRoom() {
             $('#CustName').searchbox("setValue", '');
             $('#CustID').val('');
             $('#RoomSign').searchbox("setValue", '');
             $('#RoomID').val('');
             $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

             var conent = "../DialogNew/RoomDlg.aspx";

             var w = $(window).width();
             var h = $(window).height();

             HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                 var data = JSON.parse(_Data);
                 $('#RoomSign').searchbox("setValue", data.RoomSign);
                 $('#CustName').searchbox("setValue", data.CustName);
                 $('#CustID').val(data.CustID);
                 $('#RoomID').val(data.RoomID);

                 //$('#BuildArea').val(data.BuildArea);
                 //$('#CalcArea').val(data.BuildArea);
             });

         }

         function SelStan() {
             var tmpCostIDs = $('#CostIDs').val();

             if (tmpCostIDs == "") {
                 HDialog.Info("请选择费用项目,此项不能为空!");
                 NewFeesDueSecCutSearch.btnSelCost.focus();
                 return false;
             }

             var w = 700;
             var h = 400;

             HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random(), '收费标准选择', false, function callback(_Data) {

                 if (_Data != "") {//**获得返回 刷新
                     var varObjects = _Data.split("\t");

                     $('#StanIDs').val(varObjects[0]);
                     $('#StanNames').searchbox('setValue', varObjects[1]);

                     var varObjects = _Data.split("|");
                     var StanIDs = "";
                     var StanNames = "";

                     $('#StanIDs').val(StanIDs);
                     $('#StanNames').searchbox('setValue', StanNames);

                     for (var i = 0; i < varObjects.length; i++) {
                         if (varObjects[i].indexOf(",") > 0) {
                             var d1 = varObjects[i].split(",")[0];
                             var d2 = varObjects[i].split(",")[1];

                             StanIDs = StanIDs + "," + varObjects[i].split(',')[0];
                             StanNames = StanNames + "," + varObjects[i].split(',')[1];
                         }

                     }
                     $('#StanIDs').val(StanIDs.substring(1, StanIDs.length));
                     $('#StanNames').searchbox('setValue', StanNames.substring(1, StanNames.length));

                 }
             });

             return false;
         }

         function SelRooms() {
             var varReturn;

             var w = $(window).width();;
             var h = $(window).height();;

             HDialog.Open(w, h, "../dialogNew/MultiRoomDlg.aspx", '房屋多选', false, function callback(_Data) {


                 if (_Data != "") {//**获得返回 刷新

                     var data = _Data;// SelAll + "◆" + SelRoomSigns + "◆" + SelRoomIDs;
                     var SelAll = data.split('◆')[0];
                     var SelRoomSigns = data.split('◆')[1];
                     var SelRoomIDs = data.split('◆')[2];

                     if (SelAll == "1") {
                         $('#RoomSigns').searchbox('setValue', '全部');
                     }
                     else {
                         $('#RoomSigns').searchbox('setValue', SelRoomSigns);;
                     }

                     $('#SelRoomSigns').val(SelRoomSigns);
                     $('#SelRoomIDs').val(SelRoomIDs);
                     $('#RoomIDs').val(SelRoomIDs);

                     $('#SelAll').val(SelAll);

                     return true;
                 }
             });

             return false;
         }


         function SelRoomState() {

             var strRoomStates = "";

             HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random(), '房屋状态选择', false, function (_data) {
                 var varReturn = _data;

                 if (varReturn != "") {//**获得返回 刷新
                     var varObjects = varReturn.split("\t");

                     $('#RoomStates').val(varObjects[0]);
                     $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                     $('#hiRoomStateNames').val(varObjects[0]);
                     var arrRoomStateSNums = varObjects[0].split(',');
                     $('#RoomStateNum').val(arrRoomStateSNums.length);
                 }

             });
         }

         function btnClear_OnClick() {

             $('#BuildSNums').val('');
             $('#BuildNames').searchbox('setValue', '');
             $('#RegionSNums').val('');
             $('#RegionNames').searchbox('setValue', '');
             $('#hiRegionNames').val('');

             $('#CustTypeID').val('');
             $('#ChargeTypeID').val('');

             $('#CustName').searchbox("setValue", '');
             $('#CustID').val('');
             $('#RoomSign').searchbox("setValue", '');
             $('#RoomID').val('');
             $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

             //$('#RoomState').val('');
             $('#SearchRange').val('');
             $('#BankName').val('');

             $('#CarparkIDs').val('');
             $('#CarparkNames').searchbox('setValue', '');

             $('#ParkIDs').val('');
             $('#ParkNames').searchbox('setValue', '');

             $('#CostIDs').val('');
             $('#CostNames').searchbox('setValue', '');

             $('#StanIDs').val('');
             $('#StanNames').searchbox('setValue', '');

             $('#CompSymbol1').val('');
             $('#Comp_Month').val('');
             $('#CompSymbol2').val('');
             $('#Comp_Amount').val('');

             $('#RoomStates').val('');
             $('#RoomStateNames').searchbox('setValue', '');
             $('#hiRoomStateNames').val('');
             $('#RoomStateNum').val('');

             $('#IsPrec').val('');
             $('#IsProperty').val('');

         }

         function ExcuteOnServer() {
             $('#hiIsSQLData').val("1");
             GetFlag();
             LoadList();
             $('#SearchDlg').dialog('close');
         }

         function GetFlag() {

             var strFlag = "";
             var strCostIDs = $('#CostIDs').val();
             var strRoomIDs = $('#RoomIDs').val();
             var strParkIDs = $('#ParkIDs').val();

             if (strCostIDs != "") {
                 strFlag = strFlag + "A";
             }
             if (strRoomIDs != "") {
                 strFlag = strFlag + "B";
             }
             if (strParkIDs != "") {
                 strFlag = strFlag + "C";
             }
             $('#Flag').val(strFlag);

         }
         function ToExcel() {

             GetFlag();
             var strFlag = $('#Flag').val();

             window.location.href = "FeesDebtCutSearchFstCre.aspx?Flag=" + strFlag;
         }
    </script>
    </form >
</body >
</html >
