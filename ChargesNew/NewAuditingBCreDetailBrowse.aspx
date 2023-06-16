<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAuditingBCreDetailBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewAuditingBCreDetailBrowse" %>


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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="AuditID" style="width: 32px; height: 22px" type="hidden" size="1" name="AuditID"
            runat="server" /><input id="IsAuditing" style="width: 32px; height: 22px" type="hidden" size="1" name="IsAuditing"
                runat="server" />
        <input id="AuditCounts" style="width: 32px; height: 22px" type="hidden" size="1" name="AuditCounts"
                runat="server" />
        <input id="CreYear" style="width: 32px; height: 22px" type="hidden" size="1" name="CreYear"
                    runat="server" /><input id="CreMonth" style="width: 32px; height: 22px" type="hidden" size="1" name="CreMonth"
                        runat="server" />
        <input id="TotalDays" name="TotalDays" type="hidden" runat="server" />

		<div class="datagrid-mask_1" style="position:absolute;height: 100%; width: 100%;display:none;background-color:#f5f5f5;z-index: 99998;opacity:0.2;"></div>
        <div class="datagrid-mask-msg_1" style='position:absolute;font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 99999;display:none;background-color:#ffffff;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 180px; border: 1px solid #cccccc; margin-top: 10px;margin:0px auto;margin-top:10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>


        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="javascript:void(0)" onclick=" JavaScript:ExcuteOnServer(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="AuditingFee(1);" class="l-btn l-btn-small l-btn-plain" group="" id="shtg" name="shtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text" id="sshtg" name="sshtg">审核通过</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="AuditingFee(2);" class="l-btn l-btn-small l-btn-plain" group="" id="shbtg" name="shbtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">审核不通过</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
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
		
       
        <div id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 300px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContent">
                        <select id="BuildSNum" runat="server" autopostback="True"></select></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContent">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContent">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" />

                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelRoomID" onchange="javascript:SelRoomID_OnChange();" name="SelRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                        <input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" />

                    </td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostName"
                            name="CostName" class="easyui-searchbox" searcher="SelCost" data-options="editable:false" runat="server"><input id="hiCostName" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiCostName" runat="server"><input id="CostID" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="CostID" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">金额有无变化</td>
                    <td class="TdContent">
                        <select id="IsTake" name="IsTake" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">异常提示</td>
                    <td class="TdContentSearch">
                        <select id="FeesHint" name="FeesHint" runat="server">
                            <option selected></option>
                            <option value="无此费项">无此费项</option>
                            <option value="无上笔费用">无上笔费用</option>
                            <option value="有删除收费标准设置">有删除收费标准设置</option>
                            <option value="有撤销费用">有撤销费用</option>
                            <option value="有新增收费标准设置">有新增收费标准设置</option>
                            <option value="状态有变化">状态有变化</option>
                            <option value="面积有变化">面积有变化</option>
                            <option value="与上笔金额相同">与上笔金额相同</option>

                        </select>
                    </td>
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
                
                if ($('#TotalDays').val() != "0") {
                    $('#shtg').css("cursor", "default");
                    $('#shtg').attr('href', '#');     //修改<a>的 href属性值为 #  这样状态栏不会显示链接地址  
                    $('#shtg').click(function (event) {
                        HDialog.Info("已超时限");
                    });
                    $('#sshtg').html("已超时限");
                }

                if ($('#IsAuditing').val() != "0") {
                    if ($('#IsAuditing').val() == "1")
                    {
                        $('#lbAudit').html("未审数量:" + $('#AuditCounts').val());
                    }
                    if ($('#IsAuditing').val() == "2")
                    {
                        $('#lbAudit').html("审核状态:未通过");
                    }
                }

               
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


            function SelCost() {

                var vCommID = $('#CommID').val();
                var tmpCostGeneType = $('#CostGeneType').val();
                var conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&Ram=" + Math.random();

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
                var w = 700;
                var h = 400;

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
                                                    //$('#BuildArea').val(buildArea);
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

                    //$('#BuildArea').val(data.BuildArea);
                    //$('#CalcArea').val(data.BuildArea);
                });

            }

            var column = [[

                {
                    field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"viewDetail('费用审核明细','" + row.IID + "');\">" + row.CustName + "</a>";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '房屋编号', width: 140, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 140, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 140, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 140, align: 'left', sortable: true },
                { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'StanFormulaName', title: '计算方式', width: 160, align: 'left', sortable: true },
                { field: 'CalcAmount', title: '计算数量', width: 100, align: 'left', sortable: true },
                { field: 'CalcStan', title: '计算标准', width: 100, align: 'left', sortable: true },
                { field: 'DueAmount', title: '金额', width: 100, align: 'left', sortable: true },
                { field: 'OldDueAmount', title: '原金额', width: 100, align: 'left', sortable: true },
                { field: 'TakeWiseName', title: '处理方式', width: 100, align: 'left', sortable: true },
                { field: 'FeesHint', title: '异常提示', width: 200, align: 'left', sortable: true },
                { field: 'FeesIsAdd', title: '是否入账成功', width: 200, align: 'left', sortable: true }
            ]];

            function viewDetail(title, iid) {
                var conent = '../ChargesNew/NewAuditingBCreDetailManage.aspx?IID=' + iid;
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, conent, title, true, function callback(_Data) {

                });
            }

            function ExcuteOnServer() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
            
            function ToExcel() {
				window.location.href = 'AuditingBCreDetailCreExcel.aspx';
            }

			function LoadList() {
				 
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: '#divtt',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
						param = $.JQForm.GetParam("AuditManage", "AuditingFeeDetailList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

						$("#SearchDlg").dialog("close");
                    }
                });

                AuditingFeeCounts();

			}

            LoadList();

            //未审数量
            function AuditingFeeCounts() {
                $.tool.DataPostChk('frmForm', 'AuditManage', 'AuditingFeeCounts', $('#frmForm').serialize(),
                   function Init() {
                   },
                   function callback(_Data) {
                       var r = _Data;
                       $('#lbAudit').html("未审数量:" + r);
                   },
                   function completeCallback() {
                   },
                   function errorCallback() {
                   });
            }
            

            function AuditingFee(IsAuditing) {

                var Title = "确认审核通过入账费用";
                if (IsAuditing == "2") {
                    Title = "确认审核不通过入账费用";
                }
                HDialog.Prompt(Title, function () {

                    DealData(IsAuditing);

                    //$.tool.DataPostChk('frmForm', 'AuditManage', 'AuditingFee', $('#frmForm').serialize() + "&iIsAuditing=" + IsAuditing,
                    //   function Init() {
                    //   },
                    //   function callback(_Data) {
                    //       var r = _Data.split('|');

                    //       if (r[0] == "true") {

                    //           if (IsAuditing == "1") {
                    //               $('#lbAudit').html("未审数量:" + r[2]);
                    //           }
                    //           if (IsAuditing == "2") {
                    //               $('#lbAudit').html("审核状态:未通过");
                    //           }
                    //       }

                    //       LoadList();

                    //   },
                    //   function completeCallback() {
                    //   },
                    //   function errorCallback() {
                    //   });

                })

            }

            var ProgressInterval;

            function DealData(IsAuditing) {

                //启动任务
                StartTask(IsAuditing);
                //展示进度
				ShowProgress();
                //获取执行情况进度
                 ProgressInterval = setInterval("TakeProgress()", 1000);
            }


            function StartTask(IsAuditing) {
                //启动一个任务
                $.tool.DataPostNoLoading('AuditingFee', 'StartTask', $('#frmForm').serialize() + "&iIsAuditing=" + IsAuditing,
                function Init() {
                },
                function callback(_Data) {
                    //  LoadData();
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
            }
			  

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('AuditingFee', 'TakeProgress', $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {

                    var Obj = JSON.parse(_Data);

                    if (_Data == '[]') {
                        CloseProgress();
                    }
                    else {
                        SetProgress(Obj);

                        if (Obj[0].Curr == '100') {

                            CloseProgress();

                            if (Obj[0].IsComplete == '0') {
                                HDialog.Info('审核完成!');
                            }

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
				$(".datagrid-mask_1").css({ display: "block", width: "100%", height: h });
				$(".datagrid-mask-msg_1").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
			}
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask_1").hide();
                $(".datagrid-mask-msg_1").hide();
            }

			//设置进度
			function SetProgress(Obj) {
				$('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
				$('#DivMsg').html(Obj[0].MessageInfo);
			}
			 

        </script>
    </form>
</body>
</html>
