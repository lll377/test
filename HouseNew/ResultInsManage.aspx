<%@ Page Language="c#" CodeBehind="ResultInsManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.ResultInsManage" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>ResultInsManage</title>
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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>


    <script language="javascript">
		<!--


    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    $(document).ready(function () {


        if (GetQueryString("ShowType") == "1") {
            $('body').pagewalkthrough({
                name: 'ShowSte3',
                steps: [{
                    wrapper: '#tbb',
                    popup: {
                        content: '<span style=\'font-size:30px\'>输入本次止数</span>',
                        type: 'tooltip',
                        position: 'bottom'
                    }
                },
                {
                    wrapper: '#btnSave',
                    popup: {
                        content: '<span style=\'font-size:30px\'>点击保存</span>',
                        type: 'tooltip',
                        position: 'top'
                    },
                    onLeave: function (e) {
                        if (e) {
                            HDialog.Close()
                        }
                    }
                }
                ],
                buttons: {
                    // ID of the button
                    jpwClose: {
                        // Translation string for the button
                        i18n: '关闭'
                        // Whether or not to show the button.  Can be a boolean value, or a
                        // function which returns a boolean value

                    },
                    jpwNext: {
                        i18n: '下一步 &rarr;'
                        // Function which resolves to a boolean

                    },
                    jpwPrevious: {
                        i18n: '&larr; 上一步'

                    },
                    jpwFinish: {
                        i18n: '结束 &rarr;'

                    }
                },
                onClose: function () {
                    HDialog.Close();
                }
            })

            $('body').pagewalkthrough('show');
        }
    }

    )
    function better_time(strDateStart, strDateEnd) {
        var strSeparator = "-";   //日期分隔符   
        var strDateArrayStart;
        var strDateArrayEnd;
        var intDay = 9999;
        if ((strDateStart != "") && (strDateEnd != "")) {
            strDateArrayStart = strDateStart.split(strSeparator);
            strDateArrayEnd = strDateEnd.split(strSeparator);
            var strDateS = new Date(strDateArrayStart[0] + "/" + strDateArrayStart[1] + "/" + strDateArrayStart[2]);
            var strDateE = new Date(strDateArrayEnd[0] + "/" + strDateArrayEnd[1] + "/" + strDateArrayEnd[2]);
            intDay = (strDateS - strDateE) / (1000 * 3600 * 24)
        }
        return intDay
    }

    function CheckData() {
        if (ResultInsManage.ListDate.value == "") {
            HDialog.Info("请输入抄表日期,此项不能为空!");
            ResultInsManage.ListDate.focus();
            return false;
        }

        var iday = better_time(ResultInsManage.ListDate.value, ResultInsManage.MaxListDate.value)
        if (parseInt(iday, 10) <= 0) {
            HDialog.Info("抄表日期应大于最近抄表日期(" + ResultInsManage.MaxListDate.value + ")！");
            return false;
        }

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
</head>
<body style="margin: 0px; padding: 0px">

    <form id="ResultInsManage" method="post" runat="server">
        <input id="BatchResult" name="BatchResult" type="hidden" runat="server" />
        <input id="MeterSource" name="MeterSource" type="hidden" value="ERP单户抄表" runat="server" />
        <table width="100%" cellspacing="0" cellpadding="0">

            <tr>
                <td valign="top" width="100%">
                    <div id="tbb">
                        <table style="font-size: 12px" width="100%">

                            <tr>
                                <td align="left">房屋编号：<asp:Label ID="RoomSign" runat="server"></asp:Label><input id="RoomID" style="width: 16px; height: 22px" type="hidden" size="1" name="RoomID"
                                    runat="server" />&nbsp;&nbsp;客户名称：<select id="OwnerCustID" name="OwnerCustID" runat="server">
                                        <option selected></option>
                                    </select><input id="CustID" style="width: 16px; height: 22px" type="hidden" size="1" name="CustID"
                                        runat="server" /><input id="OPType" style="width: 24px; height: 22px" type="hidden" size="1" name="OPType"
                                            runat="server" />
                                    <input id="MaxListDate" style="width: 16px; height: 22px" type="hidden" size="1" name="MaxListDate"
                                        runat="server" /><input id="hiNum" style="width: 24px; height: 22px" type="hidden" size="1" name="hiNum"
                                            runat="server" />
                                    <input id="ThisDate" style="width: 16px; height: 22px" type="hidden" size="1" name="ThisDate"
                                        runat="server" />&nbsp;&nbsp;抄表日期：<input id="ListDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })"
                                            readonly name="ListDate" runat="server" style="width: 100px;" /></td>


                            </tr>

                        </table>
                    </div>

                    <div style="width: 100%;" id="TableContainer"></div>

                </td>
            </tr>
            <tr>
                <td style="height: 30px"></td>
            </tr>
            <tr>
                <td valign="top" width="100%" style="text-align: center">
                    <input class="button" id="btnSave"
                        type="button" value="保存" name="btnFilter" runat="server" />&nbsp;&nbsp; 
                                            <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn"
                                                runat="server" />
                </td>
            </tr>


        </table>


        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height() - 80;

                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column = [[


                { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                { field: 'MeterTypeName', title: '表计类型', width: 50, align: 'left', sortable: true },
                {
                    field: 'ListDate', title: '上次抄表日期', width: 100, align: 'left', sortable: true
                },
                { field: 'LastStartDegree', title: '上次起数', width: 100, align: 'left', sortable: true },
                { field: 'LastEndDegree', title: '上次止数', width: 100, align: 'left', sortable: true },
                {
                    field: 'EndDegree', title: '本次止数', width: 100, align: 'left', sortable: true, editor: {
                        type: 'validatebox',
                        options: {
                            validType: 'digital'
                        }
                    }
                },
                {
                    field: 'NewStartDegree', title: '新表起数', width: 100, align: 'left', sortable: true, editor: {
                        type: 'validatebox',
                        options: {
                            validType: 'digital'
                        }
                    }
                },
                {
                    field: 'NewEndDegree', title: '新表止数', width: 100, align: 'left', sortable: true, editor: {
                        type: 'validatebox',
                        options: {
                            validType: 'digital'
                        }
                    }
                },

                { field: 'Ratio', title: '变比', width: 100, align: 'left', sortable: true },
                {
                    field: 'ExtraDosage', title: '损耗', width: 100, align: 'left', sortable: true, editor: {
                        type: 'validatebox',
                        options: {
                            validType: 'digital'
                        }
                    }
                },
                { field: 'Price', title: '单价', width: 100, align: 'left', sortable: true },
                {
                    field: 'CostPrice', title: '成本单价', width: 100, align: 'left', sortable: true, editor: {
                        type: 'validatebox',
                        options: {
                            validType: 'digital'
                        }
                    }
                }
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
                $.tool.DataPost('Meter', 'CustomerMeterResultListAdd', "page=" + page + "&rows=" + top.ListPageSize + "&" + $('#ResultInsManage').serialize(),
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
                                $(ed.target).focus();
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



                if (ResultInsManage.ListDate.value == "") {
                    HDialog.Info("请输入抄表日期,此项不能为空!");
                    ResultInsManage.ListDate.focus();
                    return false;
                }

                var iday = better_time(ResultInsManage.ListDate.value, ResultInsManage.MaxListDate.value)
                if (parseInt(iday, 10) <= 0) {
                    HDialog.Info("抄表日期应大于最近抄表日期(" + ResultInsManage.MaxListDate.value + ")！");
                    return false;
                }

                $('#TableContainer').datagrid('acceptChanges');

                var rows = $("#TableContainer").datagrid("getData").rows;
                var IsSub = true;
                if (rows.length > 0) {
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].IsReverse == '0') {
                            if (parseFloat(rows[i].EndDegree) < parseFloat(rows[i].LastEndDegree)) {
                                IsSub = false;
                                HDialog.Info('输入的本次止数小于上次抄表止数');
                                break;
                            }
                            if (parseFloat(rows[i].NewEndDegree) < parseFloat(rows[i].NewStartDegree)) {
                                IsSub = false;
                                HDialog.Info('输入的新表止数小于新表起数');
                                break;
                            }
                        }
                        if (rows[i].IsReverse == '1') {
                            if (parseFloat(rows[i].EndDegree) > parseFloat(rows[i].LastEndDegree)) {
                                IsSub = false;
                                HDialog.Info('输入的本次止数大于上次抄表止数');
                                break;
                            }
                            if (parseFloat(rows[i].NewEndDegree) > parseFloat(rows[i].NewStartDegree)) {
                                IsSub = false;
                                HDialog.Info('输入的新表止数大于新表起数');
                                break;
                            }
                        }
                    }
                }
                if (IsSub) {
                    $('#BatchResult').val(JSON.stringify(rows));


                    $.tool.DataPost('Meter', 'CustomerMeterAdd', $('#ResultInsManage').serialize(),
                        function Init() {

                        },
                        function callback(_Data) {

                            if (_Data == "true") {
                                HDialog.Info('抄表成功');
                                HDialog.Close(1);
                            }
                            else {
                                HDialog.Info('抄表失败');
                            }

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {

                        });
                }
                else {
                    var Rows = $("#TableContainer").datagrid('getRows');
                    for (var i = 0; i < Rows.length; i++) {
                        $('#TableContainer').datagrid('beginEdit', i);
                        if (i == 0) {
                            var ed = $('#TableContainer').datagrid('getEditor', { index: i, field: 'EndDegree' });
                            $(ed.target).focus();
                        }
                    }
                }
            });

            $('#btnReturn').click(function () {
                HDialog.Close();
            });

        </script>
    </form>
</body>
</html>
