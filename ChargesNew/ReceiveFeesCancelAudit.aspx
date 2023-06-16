<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiveFeesCancelAudit.aspx.cs" Inherits="M_Main.ChargesNew.ReceiveFeesCancelAudit" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	  <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
     <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script language="javascript" src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" src="../jscript/JSClient.js"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

   
   <style type="text/css">

     .button_sel
    {
	    font-size: 12px;
	    background-image: url(../images/Button_Select.jpg);
	    width: 25px;
	    cursor: pointer;
	    border-top-style: none;
	    background-repeat: no-repeat;
	    border-right-style: none;
	    border-left-style: none;
	    height: 20px;
	    background-color: transparent;
	    
	    border-bottom-style: none;
    }

    body {
	
    SCROLLBAR-FACE-COLOR: #f7f8fd;
        SCROLLBAR-HIGHLIGHT-COLOR: #f7f8fd; 
        SCROLLBAR-SHADOW-COLOR: #a2baea; 
        SCROLLBAR-3DLIGHT-COLOR: #f7f8fd; 
        SCROLLBAR-ARROW-COLOR: #a2baea; 
        SCROLLBAR-TRACK-COLOR: #ffffff; 
        BACKGROUND-REPEAT: repeat; 
        SCROLLBAR-DARKSHADOW-COLOR: #f7f8fd;
        SCROLLBAR-BASE-COLOR: #f7f8fd; 
        BACKGROUND-COLOR: #ffffff 
    }


   </style>

    <script language="javascript" type="text/javascript">
    <!--
        function btnClear_OnClick() {
            document.getElementById('CustID').value = "";
            document.getElementById('CustName').value = "";
            document.getElementById('hiCustName').value = "";

            document.getElementById('RoomID').value = "";
            document.getElementById('RoomSign').value = "";
            document.getElementById('hiRoomSign').value = "";

            document.getElementById('CostIDs').value = "";
            document.getElementById('CostNames').value = "";
            //document.getElementById('hiCostNames').value = "";
            //document.getElementById('CostNum').value = "";

          

        }

        function btnSelRoom_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                NewFeesDueCutSearch.RoomID.value = varObjects[0];
                NewFeesDueCutSearch.RoomSign.value = varObjects[2];
                NewFeesDueCutSearch.hiRoomSign.value = varObjects[2];

                NewFeesDueCutSearch.CustID.value = varObjects[1];
                NewFeesDueCutSearch.CustName.value = varObjects[3];
                NewFeesDueCutSearch.hiCustName.value = varObjects[3];
                //alert(varReturn);

                return true;
            }

            return false;
        }

        function btnSelCust_OnClick() {
            var varReturn;
            HDialog.Open(650, 430, "../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), false,
                function callback(_Data) {

                })
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                NewFeesDueCutSearch.CustID.value = varObjects[0];
                NewFeesDueCutSearch.CustName.value = varObjects[1];
                NewFeesDueCutSearch.hiCustName.value = varObjects[1];

                NewFeesDueCutSearch.RoomSign.value = "";
                NewFeesDueCutSearch.RoomID.value = "";
                NewFeesDueCutSearch.hiRoomSign.value = "";



                $.tool.DataGet('CustInfo', 'CustRoomSigns', $('#NewFeesDueCutSearch').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {

                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {

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

                                    var opt1 = new Option(RoomText, RoomID);
                                    document.getElementById('SelRoomID').options.add(opt1);

                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                return true;
            }

            return false;
        }


        function SelRoomID_OnChange() {
            NewFeesDueCutSearch.RoomID.value = NewFeesDueCutSearch.SelRoomID.options[NewFeesDueCutSearch.SelRoomID.selectedIndex].value;
            NewFeesDueCutSearch.RoomSign.value = NewFeesDueCutSearch.SelRoomID.options[NewFeesDueCutSearch.SelRoomID.selectedIndex].text;
            NewFeesDueCutSearch.hiRoomSign.value = NewFeesDueCutSearch.RoomSign.value;

        }

        function btnSelRooms_OnClick() {
            //*房号
            varReturn = showModalDlg("../dialog/MultiRoomDlg.aspx?Ram=" + Math.random(), "", 650, 400);
            //alert(varReturn);
            if (varReturn != "") {//**获得返回的参数信息

                var varObjects = varReturn.split("\t");

                NewFeesDueCutSearch.RoomIDs.value = varObjects[0];
                NewFeesDueCutSearch.RoomSigns.value = varObjects[1];
                NewFeesDueCutSearch.hiRoomSigns.value = varObjects[1];

                var arrRoomIDs = varObjects[0].split(',');

                NewFeesDueCutSearch.RoomNum.value = arrRoomIDs.length;

                return true;
            }

            return false;
        }

        function btnSelCarpark_OnClick() {
            var strCarparkIDs = NewFeesDueCutSearch.CarparkIDs.value;
            var strCarparkNames = escape(NewFeesDueCutSearch.hiCarparkNames.value);
            var varReturn;
            varReturn = showModalDlg("../dialog/MultiCarparkDlg.aspx" + "?CarparkIDs=" + strCarparkIDs + "&CarparkNames=" + strCarparkNames + "&Ram=" + Math.random(), "", 500, 400);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                NewFeesDueCutSearch.CarparkIDs.value = varObjects[0];
                NewFeesDueCutSearch.CarparkNames.value = varObjects[1];
                NewFeesDueCutSearch.hiCarparkNames.value = varObjects[1];

                var arrCarparkIDs = varObjects[0].split(',');

                NewFeesDueCutSearch.CarparkNum.value = arrCarparkIDs.length;

                return true;
            }

            return false;
        }

        function btnSelParks_OnClick() {

            //*车位
            varReturn = showModalDlg("../dialog/MultiParkDlg.aspx?Ram=" + Math.random(), "", 650, 400);
            //alert(varReturn);
            if (varReturn != "") {//**获得返回的参数信息

                var varObjects = varReturn.split("\t");

                NewFeesDueCutSearch.ParkIDs.value = varObjects[0];
                NewFeesDueCutSearch.ParkNames.value = varObjects[1];
                NewFeesDueCutSearch.hiParkNames.value = varObjects[1];

                var arrParkIDs = varObjects[0].split(',');

                NewFeesDueCutSearch.ParkNum.value = arrParkIDs.length;

                return true;
            }

            return false;
        }


        function btnSelCost_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/MultiCorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                NewFeesDueCutSearch.CostIDs.value = varObjects[0];
                NewFeesDueCutSearch.CostNames.value = varObjects[1];
                NewFeesDueCutSearch.hiCostNames.value = varObjects[1];

                var arrCostIDs = varObjects[0].split(',');

                NewFeesDueCutSearch.CostNum.value = arrCostIDs.length;

                return true;
            }

            return false;
        }

        function btnSelStan_OnClick() {
            var tmpCostIDs = escape(NewFeesDueCutSearch.CostIDs.value);

            if (tmpCostIDs == "") {
                alert("请选择费用项目,此项不能为空!");
                NewFeesDueCutSearch.btnSelCost.focus();
                return false;
            }

            var varReturn;
            varReturn = showModalDlg("../dialog/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random(), "", 650, 400);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                NewFeesDueCutSearch.StanIDs.value = varObjects[0];
                NewFeesDueCutSearch.StanNames.value = varObjects[1];
                NewFeesDueCutSearch.hiStanNames.value = varObjects[1];

                var arrStanIDs = varObjects[0].split(',');

                NewFeesDueCutSearch.StanNum.value = arrStanIDs.length;

                return true;
            }

            return false;
        }

        function btnSelRegions_OnClick() {
            //*组团区域
            varReturn = showModalDlg("../dialog/MultiRegionDlg.aspx?Ram=" + Math.random(), "", 650, 400);
            //alert(varReturn);
            if (varReturn != "") {//**获得返回的参数信息

                var varObjects = varReturn.split("\t");

                NewFeesDueCutSearch.RegionSNums.value = varObjects[0];
                NewFeesDueCutSearch.RegionNames.value = varObjects[1];
                NewFeesDueCutSearch.hiRegionNames.value = varObjects[1];

                var arrRegionSNums = varObjects[0].split(',');

                NewFeesDueCutSearch.RegionNum.value = arrRegionSNums.length;

                return true;
            }

            return false;
        }


        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }

		</script>
</head>
<body class="easyui-layout" scroll="no">
    <form id="NewFeesDueCutSearch" runat="server">
<input style=" WIDTH: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server"/>
<input style=" WIDTH: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server"/>
<input style=" WIDTH: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server"/>
<input style=" WIDTH: 8px" id="hiLoadFeesPaid" size="1" type="hidden" name="hiLoadFeesPaid" runat="server"/>
<input style=" WIDTH: 8px" id="hiLoadFeesPaidPrec" size="1" type="hidden" name="hiLoadFeesPaidPrec" runat="server"/>
<input style=" WIDTH: 8px" id="hiLoadFeesPaidLt" size="1" type="hidden" name="hiLoadFeesPaidLt" runat="server"/>

           <div title="实收费用" id = "ysfl" style='overflow:hidden'>
                       <div style="background:#F4F4F4;height:35px;vertical-align:middle">
                        
                        <table border = "0" style="font-size:12px;font-family:微软雅黑;">
                        <tr>
                                <td style="width:auto;" align="left" valign="middle">
                                时间从&nbsp;<input type="text" class="easyui-datetimebox" id="SetBeginDate"  runat="server" name="SetBeginDate"/>&nbsp;到&nbsp;<input type="text"  runat="server" class="easyui-datetimebox" id="SetEndDate" name="SetEndDate"/>
                              
                                </td>
                                <td ><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="setIsSQLData();">查询</a> 
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选条件</a> 
                                <a href="#" id='ssexcel' class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">实收Excel输出</a> 
                                <a href="#" id='ysexcel' class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel2();">预收Excel输出</a> 
             
                                <input style=" WIDTH: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
							                runat="server"><input style="HEIGHT: 21px; WIDTH: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
							                runat="server"><input style=" WIDTH: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
							                runat="server"><input style="HEIGHT: 21px; WIDTH: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
							                runat="server"><input style="HEIGHT: 21px; WIDTH: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server">
                                </td>
                        </tr>
                        </table>
                    </div>
       
                  <div id="tt2" class="easyui-tabs" style='overflow:hidden'  >
                    <div title="撤销实收费用明细" id = "ssmx" style='overflow:hidden'>
                          
                         <div style="width:100%;background-color:#ffffff;"  id="TableContainer"></div>
                    </div>
                    <div title="撤销预收费用明细" id = "ycmx" style='overflow:hidden'>
                           <div style="width:100%;background-color:#ffffff;"  id="TableContainerYsfy"></div>
                    </div>
                    </div>
                
      
            </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width:1024px;height:150px;padding:10px;">
                <table style="width:100%;font-size:12px;font-family:微软雅黑;">
                  
							<tr>
                                <td class="TdTitle">客户名称</td>
                                <td class="TdContentSearch">
                                    <input id="CustName" searcher="SelCust"
                                        name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false"/><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                            size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                                size="1" name="hiCustName" runat="server" /></td>
                                <td class="TdTitle">可选房号
                                </td>
                                <td class="TdContentSearch">
                                    <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                                        <option selected></option>
                                    </select>
                                </td>
                            </tr>
							<tr>
								<td class="TdTitle">房屋编号</td>
                                <td class="TdContentSearch">
                                    <input id="RoomSign" searcher="SelRoom"
                                        name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                            size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                                size="1" name="hiRoomSign" runat="server" /></td>
								<td class="TdTitle">费用项目</td>
					            <td class="TdContentSearch">
						            <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
							            name="CostNames" runat="server"></td>
							</tr>
       
                    <tr><td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>
                           
                    </td></tr>
                    </table>
	    </div>

  
    <input style=" WIDTH: 8px" id="CostIDs" class="easyui-validatebox"  size="1"
										type="hidden" name="CostIDs" runat="server"/>
    <input style=" WIDTH: 8px" id="StanIDs" class="easyui-validatebox"  size="1"
											type="hidden" name="StanIDs" runat="server"/>
    <input style=" WIDTH: 8px" id="hiStanNames" class="easyui-validatebox"  size="1"
											type="hidden" name="hiStanNames" runat="server"/>
    <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        function InitTableHeight() {
            var h = $(window).height()-63;
            $("#TableContainer").css("height", h + "px");
             $('#SelectRoomID').css("width", 150 + 'px');
            $("#TableContainerYsfy").css("height", h + "px");
        }

        InitTableHeight();

        var column = [[

                
                { field: 'ChargeDate', title: '收款时间', align: 'left', sortable: true, width: 100 },
                { field: 'BillsSign', title: '收据号码', align: 'left', sortable: true, width: 100 },
                { field: 'FeesDueDate', title: '费用日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    var str = row.FeesDueDate.ToCustomizeDate();
                    return str;
                }
                },
                { field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    var str = row.FeesStateDate.ToCustomizeDate();
                    return str;
                }
                },
                { field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    var str = row.FeesEndDate.ToCustomizeDate();
                    return str;
                }
                },
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 100 },
                { field: 'ChargeAmount', title: '收款金额', align: 'left', sortable: true, width: 100 },
                { field: 'LateFeeAmount', title: '合同违约金', align: 'left', sortable: true, width: 100 },
                { field: 'UserName', title: '收款人', align: 'left', sortable: true, width: 100 },
                { field: 'ReceMemo', title: '备注', align: 'left', sortable: true, width: 100 },
                { field: 'AuditDate', title: '撤销时间', align: 'left', sortable: true, width: 100 },
                { field: 'ReferReason', title: '撤销原因', align: 'left', sortable: true, width: 100 }
        ]];
            var frozenColumns = [[
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, fixed: true, width: 100 },
            { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, fixed: true, width: 100 },
            { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, fixed: true, width: 100 }

            ]];
        var column2 = [[
          
                { field: 'PrecDate', title: '预交收款时间', align: 'left', sortable: true, width: 100 },
                { field: 'BillsSign', title: '收据号码', align: 'left', sortable: true, width: 100 },
                { field: 'FeesDueDate', title: '费用日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    var str = row.FeesDueDate.ToCustomizeDate();
                    return str;
                }
                },
                { field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    var str = row.FeesStateDate.ToCustomizeDate();
                    return str;
                }
                },
                { field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    var str = row.FeesEndDate.ToCustomizeDate();
                    return str;
                }
                },
                { field: 'CostNames', title: '冲抵费用项目', align: 'left', sortable: true, width: 100 },
                { field: 'PrecAmount', title: '预交金额', align: 'left', sortable: true, width: 100 },
                { field: 'UserName', title: '收款人', align: 'left', sortable: true, width: 100 },
                { field: 'PrecMemo', title: '备注', align: 'left', sortable: true, width: 100 },                
                { field: 'AuditDate', title: '撤销时间', align: 'left', sortable: true, width: 100 },
                { field: 'ReferReason', title: '撤销原因', align: 'left', sortable: true, width: 100 }
         ]];
       

        function SearchDlg() {

            btnClear_OnClick();
            $('#SearchDlg').parent().appendTo($("form:first"))
            $('#SearchDlg').dialog('open');
        }


        function setIsSQLData() {
            //$("#sfmxsc").attr('enable', 'true');
            $('#ssexcel').linkbutton('enable');
            $('#ysexcel').linkbutton('enable');
            document.getElementById('hiIsSQLData').value = 1;


            var index = $('#tt2').tabs('getTabIndex', $('#tt2').tabs('getSelected'));
            //alert(index);
            switch (index) {
                case 0:

                    LoadList('数据加载中,请稍候...');
                    document.getElementById('hiLoadFeesPaid').value == 1;
                    document.getElementById('hiLoadFeesPaidPrec').value = 0;
                    break;
                case 1:
                    LoadList2('数据加载中,请稍候...');
                    document.getElementById('hiLoadFeesPaid').value == 0;
                    document.getElementById('hiLoadFeesPaidPrec').value = 1;
                    break;

            }
        }

        function LoadList(loadMsg) {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=FeesPaidSearch&Command=FeesDetailDel&' + $("#NewFeesDueCutSearch").serialize(),
                method: "post",
                loadMsg: loadMsg,
                pageSize: 15,
                pageList: [15, 30, 60],
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                frozenColumns:frozenColumns,
                nowarp:false,
                width: "100%",
                toolbar: '#tb',
                sortOrder: "asc",
                onBeforeLoad: beforeLoad1,
                rowStyler: function (index, row) {
                    if (row.StatType == 1) {

                        return 'color:red;';
                    }
                }
            });
        }

        var beforeLoad1 = function (param) {

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


        var beforeLoad2 = function (param) {

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
            var gridOpts = $('#TableContainerYsfy').datagrid('getPager').data("pagination").options;

            param.page = gridOpts.pageNumber;
            param.rows = gridOpts.pageSize;
        };

        function LoadList2(loadMsg) {
            $("#TableContainerYsfy").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=FeesPaidSearch&Command=PrecFeesDetailDel&' + $("#NewFeesDueCutSearch").serialize(),
                method: "post",
                loadMsg: loadMsg,
                pageSize: 15,
                pageList: [15, 30, 60],
                columns: column2,
                frozenColumns: frozenColumns,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                width: "100%",
                nowrap:false,
                toolbar: '#tb',
                onBeforeLoad: beforeLoad2,
                sortOrder: "asc",
                rowStyler: function (index, row) {
                    if (row.StatType == 1) {

                        return 'color:red;';
                    }
                }
            });
        }

        document.getElementById('hiIsSQLData').value = -1;

        $("#ssexcel").attr('disabled', 'disabled');
        $("#ysexcel").attr('disabled', 'disabled');


        LoadList("");
        document.getElementById('hiLoadFeesPaid').value = 1;
        $(window).resize(function () {
            $('#TableContainer').datagrid('resize')
        });
       
       
    </script>

     <script type="text/javascript">
         function ExcuteOnServer() {

             document.getElementById('hiIsSQLData').value = "";
             var index = $('#tt2').tabs('getTabIndex', $('#tt2').tabs('getSelected'));
             switch (index) {
                 case 0:
                     LoadList('数据加载中,请稍候...');
                     document.getElementById('hiLoadFeesPaid').value == 1;
                     document.getElementById('hiLoadFeesPaidPrec').value = 0;
                     btnClear_OnClick();
                     break;
                 case 1:
                     LoadList2('数据加载中,请稍候...');
                     document.getElementById('hiLoadFeesPaid').value == 0;
                     document.getElementById('hiLoadFeesPaidPrec').value = 1;
                     btnClear_OnClick();
                     break;

             }
         
          
           
             $('#SearchDlg').dialog('close');
         }

      
         function ToExcel() {

             window.location.href = "FeesDetailDelSearchPaidCre.aspx";
         }
         function ToExcel2() {

             window.location.href = "FeesDetailDelSearchPrecCre.aspx";

         }
        
         $('#tt2').tabs({
             border: false,
             onSelect: function (title, index) {

                 if (index == 0) {
                  
                     if (document.getElementById('hiLoadFeesPaid').value != "1") {
                         document.getElementById('hiLoadFeesPaid').value = 1;

                         LoadList();
                     }
                 }
                 if (index == 1) {
                     if (document.getElementById('hiLoadFeesPaidPrec').value != "1") {
                         document.getElementById('hiLoadFeesPaidPrec').value = 1;

                         LoadList2();
                     }

                 }
             }
         });

         function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 1000;
                var h = 500;

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
                                                    $('#CalcArea').val(buildArea);
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
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";


                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.BuildArea);
                });
         }


         function SelCost() {

				var w = 700;
				var h = 400;

				HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

					if (_Data != "") {//**获得返回 刷新
						var varObjects = _Data.split("\t");

						$('#CostIDs').val(varObjects[0]);
						$('#CostNames').searchbox('setValue', varObjects[1]);
					}
				});
			}


         
     </script>


    

    </form>
</body>
</html>


