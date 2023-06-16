<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAlgorithmFeesDebtCut2Search.aspx.cs" Inherits="M_Main.Inquiries.NewAlgorithmFeesDebtCut2Search" %>


<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
     <title></title>
	<script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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
<body style="overflow-y:hidden">
    <form id="NewFeesDueCutSearch" runat="server">
    <input id="hiRoomSigns" type="hidden" name="hiRoomSigns" runat="server"/>
    <input id="RoomIDs"  type="hidden" name="RoomIDs" runat="server"/>
    <input id="hiRegionNames" type="hidden" name="hiRegionNames" runat="server"/>
    <input id="CustID" type="hidden" name="CustID" runat="server"/>
    <input id="hiCustName" type="hidden" name="hiCustName" runat="server"/>
    <input id="RoomID" type="hidden" name="RoomID" runat="server"/>
    <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server"/>
                 
    <input id="RoomStates"  type="hidden" name="RoomStates" runat="server" />
    <input id="hiRoomStateNames" type="hidden" name="hiRoomStateNames" runat="server" />
    <input id="RoomStateNum" type="hidden" name="RoomStateNum" runat="server" />

    <input id="CarparkIDs" type="hidden" name="CarparkIDs" runat="server"/>
    <input id="hiCarparkNames" type="hidden" name="hiCarparkNames" runat="server"/>
    <input id="hiParkNames" type="hidden" name="hiParkNames" runat="server"/>
    <input id="ParkIDs" type="hidden" name="ParkIDs" runat="server"/>
    <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server"/>
    <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server"/>
    <input id="hiCommID" type="hidden" name="hiCommID" runat="server"/>
    <input id="hiLoginUserCode" type="hidden" name="hiLoginUserCode" runat="server"/>
    <input id="hiIsSQLData" type="hidden" name="hiIsSQLData" runat="server"/>
    <input id="PageIndex" type="hidden" name="PageIndex" runat="server"/>
    <input id="PrintParms" type="hidden" name="PrintParms" runat="server"/>
    <input id="CostGeneType" type="hidden" name="CostGeneType" runat="server"/>
    <input id="OptCode" type="hidden" name="OptCode" runat="server"/>
    <input id="Flag" type="hidden" name="Flag" runat="server"/>
    <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server"/>
    <input id="Hidden1" type="hidden" name="CostIDs" runat="server"/>
    <input id="Hidden2" type="hidden" name="StanIDs" runat="server"/>
    <input id="Hidden3" type="hidden" name="hiStanNames" runat="server"/>
    <input id="StaticType" type="hidden" name="StaticType" runat="server" /> 
<div style="width:100%;background-color:#ffffff;"  id="TableContainer"></div>

<div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 350px;">
                   
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
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" style="width:90%" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server"></td>
                    <td class="TdTitle">欠费账龄</td>
                    <td class="TdContentSearch"> <select id="YearMonthDate" style="width:90%" class="easyui-combobox" name="YearMonthDate" runat="server">
                            <option value="0" selected>全部</option>
                            <option value="1">欠费1个月</option>
                            <option value="2">欠费2-3月</option>
                            <option value="4">欠费4-6月</option>
                            <option value="7">欠费7-12月</option>
                            <option value="12">欠费1年以上</option>
                            <option value="24">欠费2年以上</option>
                            <option value="36">欠费3年以上</option>
                        </select></td>
                </tr>   
                <tr>                    
                     <td class="TdTitle">是否挂账</td>
                    <td class="TdContentSearch">
                        <select id="IsProperty" class="easyui-combobox" name="IsProperty" runat="server">
                            <option selected></option>
                        </select></td>
                 </tr>               
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>
                    </td>
                </tr>
            </table>
           </div>
    
   
    <div id="tb">
       <table border = "0" style="font-size:12px;font-family:微软雅黑;">
        <tr>
             <td style="width:auto;" align="left">收款截止时间&nbsp;<input type="text" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" id="CutEndDate"  runat="server" name="CutEndDate"/>&nbsp;
             费用时间类型&nbsp;<select id="FeesDateType" name = "FeesDateType" runat="server">										
										<option Value="1" selected>费用日期</option>
										<option Value="2">应收日期</option>
									</select>&nbsp;&nbsp;费用时间从&nbsp;<input type="text" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" id="EditBeginDate"  runat="server" name="EditBeginDate"/>&nbsp;到&nbsp;<input type="text"  runat="server" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" id="EditEndDate" name="EditEndDate"/>
                </td>
             <td >&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="setIsSQLData();">生成欠费</a> 
             <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选条件</a> 
             <a href="#" id="scExcel" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">按客户汇总输出</a> 

             
           
             </td>
             </tr>
             <tr>
             
        </tr>
       </table>
    </div>

      <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px'>
            <div id='dprocessbar' data-options="value:0" class='easyui-progressbar' style='width: 300px; margin-top: 10px;'></div>
            <div id='divtime' style='width: 300px; text-align: center'></div>
            <div id='DivProcName' style='width: 300px; text-align: center;'></div>
        </div>

    <input style=" WIDTH: 8px" id="CostIDs" class="easyui-validatebox"  size="1"
										type="hidden" name="CostIDs" runat="server"/>
    <input style=" WIDTH: 8px" id="StanIDs" class="easyui-validatebox"  size="1"
											type="hidden" name="StanIDs" runat="server"/>
    <input style=" WIDTH: 8px" id="hiStanNames" class="easyui-validatebox"  size="1"
											type="hidden" name="hiStanNames" runat="server"/>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script  type="text/javascript">

        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");

            $("#scExcel").attr('disabled', 'disabled');
        }

        InitTableHeight();
        var NewCol = [[

           
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
                { field: 'StateName', title: '房屋状态', align: 'left', sortable: true, width: 100 },
                { field: 'MobilePhone', title: '联系电话', align: 'left', sortable: true, width: 100 }
                
        ]];

        var frozenColumns = [[
                { field: '客户名称', title: '客户名称', align: 'left', sortable: true, width: 100 },
                { field: '房屋编号', title: '房屋编号', align: 'left', sortable: true, width: 100 },
                { field: '组团区域', title: '组团区域', align: 'left', sortable: true, width: 100 }
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

            $('#SearchDlg').parent().appendTo($("form:first"))
            $('#SearchDlg').dialog('open');
        }
        var intervalProcess;

        function setIsSQLData() {
            document.getElementById('hiIsSQLData').value = 1;
            Static();
        }



        function Static() {
            var FeesBeginDate = $('#EditBeginDate').val();
            var FeesEndDate = $('#EditEndDate').val();
            var d1 = new Date(FeesBeginDate.replace('-', '/').replace('-', '/'));
            var d2 = new Date(FeesEndDate.replace('-', '/').replace('-', '/'));
            var title = '确认生成' + FeesBeginDate + '至' + FeesEndDate + '的欠费';
            var DataCount = (d2.getFullYear() - d1.getFullYear() + 1) + 3;

            $('#StaticType').val('begin');
            $.messager.confirm('提示', title, function (r) {
                if (r) {

                    //第一次统计生成统计表
                    $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch2', $('#NewFeesDueCutSearch').serialize() + "&k=0&DataCount=" + DataCount,
                         function Init() {

                             var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                             var ht = parseInt($(window).scrollTop());
                             $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                             $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
                             $('#divtime').html("正在生成欠费,请等待");
                             var value = $('#dprocessbar').progressbar('getValue');
                             $('#dprocessbar').progressbar('setValue', 0);
                         },
                         function callback(_Data) {
                           
                             var BeginData = _Data;
                             if (BeginData.split('|')[0] == 'true') {
                                 StaticChild(1, DataCount, '');
                             }
                         },
                         function completeCallback() {
                         },
                         function errorCallback() {
                             return false;
                         });

                }
            });

        }

        function StaticChild(k, DataCount, StartDate) {
            if (DataCount - 3 > 1) {
                if (k <= DataCount - 3) {
                    k++;
                    var FeesBeginDate = StartDate;
                    if (StartDate == '') {
                        FeesBeginDate = $('#EditBeginDate').val();
                    }

                    var d1 = new Date(FeesBeginDate.replace('-', '/').replace('-', '/'));
                    var Year = d1.getFullYear();
                    var Month = d1.getMonth() + 1;
                    var Day = d1.getDate();

                    var BD = Year + '/' + Month + '/' + Day;
                    var ED = Year + '/' + 12 + '/' + 31;

                    var ND = Year + 1 + '/1/1';
                    var bd1 = new Date($('#EditEndDate').val().replace('-', '/').replace('-', '/'));
                    var bd2 = new Date(ND);
                    if (bd2 > bd1) {
                        ED = $('#EditEndDate').val();
                    }
                    $('#StaticType').val('process');
                    $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch2', $('#NewFeesDueCutSearch').serialize() + "&k=" + k + "&DataCount=" + DataCount + "&BD=" + BD + "&ED=" + ED,
                            function Init() {
                                $('#divtime').html("正在生成" + Year + "年欠费,请等待");
                                var process = Math.round(k / (DataCount) * 100);
                                $('#dprocessbar').progressbar('setValue', process);
                            },
                            function callback(_Data) {

                                var Data = _Data;

                                if (Data.split('|')[0] == 'true') {
                                    StaticChild(k, DataCount, ND);
                                }
                                else {
                                    return false;
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                                return false;
                            });

                }
                else {

                    StaticEnd(k, DataCount);
                }
            }
            else {



                var BD = $('#EditBeginDate').val();
                var ED = $('#EditEndDate').val();
                $('#StaticType').val('process');
                $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch2', $('#NewFeesDueCutSearch').serialize() + "&k=" + k + "&DataCount=" + DataCount + "&BD=" + BD + "&ED=" + ED,
                        function Init() {
                            $('#divtime').html("正在生成欠费,请等待");
                            var process = Math.round(k / (DataCount) * 100);
                            $('#dprocessbar').progressbar('setValue', process);
                        },
                        function callback(_Data) {

                            var Data = _Data;

                            if (Data.split('|')[0] == 'true') {
                                var process = Math.round(Data.split('|')[1] / (DataCount) * 100);
                                $('#dprocessbar').progressbar('setValue', process);
                                StaticEnd(k, DataCount);
                            }
                            else {
                                return false;
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                            return false;
                        });



            }
        }

        function StaticEnd(k, DataCount) {
            $('#StaticType').val('end');
            $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch2', $('#NewFeesDueCutSearch').serialize() + "&k=" + k + "&DataCount=" + DataCount,
                       function Init() {
                           $('#divtime').html("正在生成汇总欠费信息,请等待");
                           var process = Math.round(k / (DataCount) * 100);
                           $('#dprocessbar').progressbar('setValue', process);
                       },
                       function callback(_Data) {

                           var Data = _Data;

                           if (Data.split('|')[0] == 'true') {
                              
                               StaticSummary(Data.split('|')[1], DataCount);
                           }
                           else {
                               return false;
                           }
                       },
                       function completeCallback() {
                       },
                       function errorCallback() {
                           return false;
                       });
        }
       
        function StaticSummary(k, DataCount) {
            $('#StaticType').val('summary');
            $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch2', $('#NewFeesDueCutSearch').serialize() + "&k=" + k + "&DataCount=" + DataCount,
                function Init() {
                    $('#divtime').html("正在生成客户欠费汇总信息,请等待");
                    var process = Math.round(k / (DataCount) * 100);
                    $('#dprocessbar').progressbar('setValue', process);
                },
                function callback(_Data) {

                    var Data = _Data;

                    if (Data.split('|')[0] == 'true') {
                        $('#scExcel').linkbutton('enable');
                        LoadList(1, 50);
                     
                    }
                    else {
                        return false;
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                    return false;
                });
        }

        function LoadList(page, rows) {
            $('#StaticType').val('result');
            $.tool.DataPostNoLoading('NewFeesDebtSearch', 'FeesDebtSearch2', "page=" + page + "&rows=" + rows + "&" + $('#NewFeesDueCutSearch').serialize(),
                function Init() {
                    $('#divtime').html("正在生成客户欠费汇总信息,请等待");
                    var process = 99 /  100;
                    //$('#dprocessbar').progressbar('setValue', process);
                },
                function callback(_Data) {

                    var Data = _Data;
                    var Data = eval("(" + _Data + ")"); //转换为json对象
                    SetEasyUiColumn(Data);
                    LoadListBindingColumn(Data, rows);
                   
                },
                function completeCallback() {
                },
                function errorCallback() {
                    return false;
                });
        }

       
        function SetEasyUiColumn(_Data) {
            var col = "";
            var obj = "";
            if (_Data.rows.length > 0) {
                obj = _Data.rows[0];
                var i = 0;
                for (var attr in obj) {
                    i = i + 1;
                    if (attr != "客户名称" && attr != "房屋编号" && attr != "组团区域") {
                        col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\', align: \'left\', sortable: true,width:150}";
                    }

                }
               
                col = col.substr(1, col.length);
                col = "[[" + col + "]]";
                NewCol = eval(col);
            }
           
        }

      

        function LoadListBindingColumn(_Data, rows) {
           
            $("#TableContainer").datagrid({
                data:_Data,
                method: "get",
                title: '按客户汇总查询',
                loadMsg: '',
                pageSize: rows,
                pageList: [50, 100, 200],
                columns: NewCol,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                frozenColumns: frozenColumns,
                remoteSort: false,
                singleSelect: true,
                width: "100%",
                toolbar: '#tb',
                sortOrder: "asc",
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                rownumbers: true,
                border: false,
                rowStyler: function (index, row) {
                    if (row.StatType == 1) {
                        return 'color:red;';
                    }
                },
                onLoadSuccess: function () {
                  

                    var pg = $("#TableContainer").datagrid("getPager");
                    if (pg) {
                        $(pg).pagination({
                            onBeforeRefresh: function () {

                            },
                            onRefresh: function (pageNumber, pageSize) {

                            },
                            onChangePageSize: function () {
                            },
                            onSelectPage: function (Pn, Ps) {

                                document.getElementById('hiIsSQLData').value = 1;
                                LoadList(Pn, Ps);
                                $('#TableContainer').datagrid('options').pageNumber = Pn;
                                $('#TableContainer').datagrid('options').pageSize = Ps;
                            }
                        });
                    }

                    var process = 100;
                    $('#dprocessbar').progressbar('setValue', process);

                    $(".datagrid-mask").css({ display: "none" });
                    $(".datagrid-mask-msg").css({ display: "none" });
                    $('#dprocessbar').progressbar('setValue', 0);

                },
                onLoadError: function () {
                   
                    var process = 100;
                    $('#dprocessbar').progressbar('setValue', process);

                    $(".datagrid-mask").css({ display: "none" });
                    $(".datagrid-mask-msg").css({ display: "none" });
                    $('#dprocessbar').progressbar('setValue', 0);

                    alert('按费用明细生成失败！在操作完成之前超时时间已过或服务器未响应。!');
                }
            });
          
        }

        document.getElementById('hiIsSQLData').value = -1;
        LoadList(1, 50);
      
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




                      $.tool.DataGet2('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
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
                  });

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


              function SelRoomState()
              {

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
              function ExcuteOnServer() {

                  $('#SearchDlg').dialog('close');
                  if ($('#StaticType').val() != '') {
                      $.messager.confirm('提示', '是否重新生成欠费', function (r) {
                          if (r) {

                              Static();
                          }
                          else {

                              $('#hiIsSQLData').val("1");

                              GetFlag();

                              $('#scExcel').linkbutton('enable');
                              LoadList(1, 50);
                              $('#SearchDlg').dialog('close');

                          }
                      });
                  }
                  else {
                      setIsSQLData();
                  }

                  //ABC,AC,AB,BC,A,B,C

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
                  var strCostIDs = $('#CostIDs').val();

                  location.href = "NewFeesDebtCutSearchSecCre.aspx?Flag=" + strFlag + "&CostIDs=" + strCostIDs;
              }

    </script>
    </form>
</body>
</html>