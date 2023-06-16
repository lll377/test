<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultEdtManage.aspx.cs" Inherits="M_Main.HouseNew.ResultEdtManage" %>

<!DOCTYPE HTML >
<HTML>
	<HEAD>
		<title>ResultInsManage</title>
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
        <link href="../css/framedialog_eightcol.css" rel="stylesheet" />
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
       <script src="../jscript/Dialog.js" type="text/javascript"></script>
        <link href="../css/button.css" rel="stylesheet" />
        <script src="../jscript/DateFormat.js" type="text/javascript"></script>
        <script src="../jscript/format.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

         <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>


		<script language="javascript">
		<!--
			 
			function better_time(strDateStart,strDateEnd)
			{   
				var strSeparator = "-";   //日期分隔符   
				var strDateArrayStart;   
				var strDateArrayEnd;   
				var intDay = 9999;  
				if ((strDateStart != "")&&(strDateEnd != ""))
				{
					strDateArrayStart = strDateStart.split(strSeparator);   
					strDateArrayEnd  = strDateEnd.split(strSeparator);   
					var strDateS = new Date(strDateArrayStart[0] + "/" + strDateArrayStart[1] + "/" + strDateArrayStart[2]);   
					var strDateE = new Date(strDateArrayEnd[0] + "/" + strDateArrayEnd[1] + "/" + strDateArrayEnd[2]);   
					intDay = (strDateS-strDateE)/(1000*3600*24)
				} 
				return intDay   
			}

			function CheckData()
			{
				if(ResultInsManage.ListDate.value=="")
				{
				    HDialog.Info("请输入抄表日期,此项不能为空!");
					ResultInsManage.ListDate.focus();
					return false;
				}				
								
				//var iday = better_time(ResultInsManage.ListDate.value,ResultInsManage.MaxListDate.value)					
				//if ( parseInt(iday,10) <=0 )
				//{
				//	alert("抄表日期应大于最近抄表日期("+ResultInsManage.MaxListDate.value+")！");
				//	return false;
				//}
				
			/*	var iday = better_time(ResultInsManage.ThisDate.value,ResultInsManage.ListDate.value)					
				if ( parseInt(iday,10) <0 )
				{
					alert("抄表日期不能超过今日！");
					return false;
				}
					*/			
				return true;
			}
			
			
		//-->
		</script>
		<script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
	</HEAD>
	<body style="margin:0px;padding:0px">
		<form id="ResultInsManage" method="post" runat="server">
              <input id="BatchResult" name="BatchResult" type="hidden" runat="server" />
			<table  width="100%" cellSpacing="0" cellPadding="0">
									
                                    <tr>
                                        <td vAlign="top" width="100%">
                                            <div id="tbb">
                                                    <table style="FONT-SIZE: 12px" width="100%">
												
													        <tr>
														        <td align="left">房屋编号：<asp:label id="RoomSign" runat="server"></asp:label><INPUT id="RoomID" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="RoomID"
																        runat="server"/>&nbsp;&nbsp;客户名称：<SELECT id="OwnerCustID" name="OwnerCustID" runat="server">
																        <OPTION selected></OPTION>
															        </SELECT><INPUT id="CustID" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="CustID"
																        runat="server"/><INPUT id="OPType" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="OPType"
																        runat="server"/> <INPUT id="MaxListDate" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="MaxListDate"
																        runat="server"/><INPUT id="hiNum" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="hiNum"
																        runat="server"/> <INPUT id="ThisDate" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="ThisDate"
																        runat="server"/>&nbsp;&nbsp;抄表日期：<input  id="ListDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
																        readOnly  name="ListDate" runat="server" style="WIDTH: 100px; "/></td>
														        
														
													        </tr>
												
											        </table>
                                                 </div>
                                               <div style="width: 100%;" id="TableContainer"></div>
                                        </td>
                                    </tr>
                <tr>
                    <td style="height:32px">

                    </td>
                </tr>
                                    <tr>
                                        <td vAlign="top" width="100%" style="text-align:center">
                                             <INPUT class="button" id="btnSave"  onclick="javascript:if(CheckData()==false) {return false;}"
																	type="button" value="保存" name="btnFilter" runat="server"/>&nbsp;&nbsp; 
                                            <INPUT class="button" id="btnReturn"  type="button" value="关闭" name="btnReturn"
																	runat="server"/>
                                        </td>
                                    </tr>

				
			</table>
            
           
            <script type="text/javascript">
                function InitFunction() {
                    var h = $(window).height() - 80;
                 
                    $("#TableContainer").css("height",  h+"px");
                }
                InitFunction();
                var column = [[
                { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                { field: 'MeterTypeName', title: '表计类型', width: 50, align: 'left', sortable: true },
              
                {
                    field: 'StartDegree', title: '起数', width: 100, align: 'left', sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            min: 0,
                            precision: 2
                        }
                    }
                },
                {
                    field: 'EndDegree', title: '止数', width: 100, align: 'left', sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            min: 0,
                            precision: 2
                        }
                    }
                },
                { field: 'Ratio', title: '变比', width: 100, align: 'left', sortable: true },
                { field: 'Dosage', title: '用量', width: 100, align: 'left', sortable: true },
               
                {
                    field: 'OldStartDegree', title: '旧表起数', width: 100, align: 'left', sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            min: 0,
                            precision: 2
                        }
                    }
                },
                {
                    field: 'OldEndDegree', title: '旧表止数', width: 100, align: 'left', sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            min: 0,
                            precision: 2
                        }
                    }
                },
                {
                    field: 'ExtraDosage', title: '损耗', width: 100, align: 'left', sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            min: 0,
                            precision: 2
                        }
                    }
                }, 
                { field: 'Price', title: '单价', width: 100, align: 'left', sortable: true },
                { field: 'Amount', title: '金额', width: 100, align: 'left', sortable: true }
                ]];

                function LoadList(_Data) {


                    $("#TableContainer").datagrid({
                        data: _Data,
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
                        sortOrder: "asc",
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false,
                        sortOrder: "asc",
                        toolbar: '#tbb',
                        onLoadSuccess: function (data) {
                        }
                    });

                }
                function LoadData(page) {
                    $.tool.DataPost('Meter', 'CustomerMeterListEdit', "page=" + page + "&rows=" + top.ListPageSize + "&" + $('#ResultInsManage').serialize(),
                           function Init() {

                           },
                           function callback(_Data) {
                               var Data = eval("(" + _Data + ")"); //转换为json对象
                            
                               $('#hiNum').val(Data.total);
                               LoadList(Data);

                               var Rows = $("#TableContainer").datagrid('getRows');
                               for (var i = 0; i < Rows.length; i++) {
                                   $('#TableContainer').datagrid('beginEdit', i);
                                   if (i == 0) {
                                       var ed = $('#TableContainer').datagrid('getEditor', { index: i, field: 'EndDegree' });
                                       //$(ed.target).focus();
                                      

                                       $("#OwnerCustID").val(Rows[i].OwnerCustID);
                                   }
                               }


                              
                           },
                           function completeCallback() {
                           },
                           function errorCallback() {

                           });
                }

                LoadData(1);
                $('#btnSave').click(function () {
                    $('#TableContainer').datagrid('acceptChanges');

                    var rows = $("#TableContainer").datagrid("getData").rows;

                    $('#BatchResult').val(JSON.stringify(rows));


                    $.tool.DataPost('Meter', 'CustomerMeterUpdate', $('#ResultInsManage').serialize(),
                    function Init() {

                    },
                    function callback(_Data) {
                        var data = _Data.split('|');

                        HDialog.Info(data[1]);
                        if (data[0] == "true") {
                            HDialog.Close(1);
                        }
                      
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });

                });

                $('#btnReturn').click(function () {
                    HDialog.Close();
                });
                
            </script>
		</form>
	</body>
</HTML>

