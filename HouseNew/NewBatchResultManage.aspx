<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewBatchResultManage.aspx.cs" Inherits="M_Main.HouseNew.NewBatchResultManage" %>

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
    <script src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
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
    </script>
</head>
<body style="margin: 0px; padding: 0px">
    <form id="ResultInsManage" method="post" runat="server">
        <input id="BatchResult" name="BatchResult" type="hidden" runat="server" />
        <input id="CustID" style="width: 16px; height: 22px" type="hidden" size="1" name="CustID" runat="server" />
        <input id="OPType" style="width: 24px; height: 22px" type="hidden" size="1" name="OPType" runat="server" />
        <input id="MaxListDate" style="width: 16px; height: 22px" type="hidden" size="1" name="MaxListDate" runat="server" />
        <input id="hiNum" style="width: 24px; height: 22px" type="hidden" size="1" name="hiNum" runat="server" />
        <input id="ThisDate" style="width: 16px; height: 22px" type="hidden" size="1" name="ThisDate" runat="server" />
        <input type="button" name="getUnitSnum" id="getUnitSnum" runat="server" onserverclick="getUnitSnum_ServerClick" />
        <input type="button" name="getMeterType" id="getMeterType" runat="server" onserverclick="getMeterType_ServerClick" />
        <input id="MeterSource" name="MeterSource" type="hidden" value="ERP批量抄表" runat="server" />
        <table width="100%" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" width="100%">
                    <div id="tbb">
                        <table style="font-size: 12px" width="100%">

                            <tr>
                                <td align="left">楼宇：<select id="BuildSNum" name="BuildSNum" runat="server" width="200px" onchange="BuildSNumChange();"></select>
                                    &nbsp;&nbsp;单元：<select id="UnitSNum" name="UnitSNum" runat="server" width="60px" onchange="UnitSNumChange();"></select>
                                    <font face="宋体">&nbsp;&nbsp;收费类型：
																<select id="ChargeTypeID" runat="server" name="ChargeTypeID" Width="80px" onchange="ChargeTypeIDChange();" ></select></font>
                                    &nbsp;&nbsp;表计类型：<select id="MeterType" name="MeterType" runat="server" onchange="MeterTypeChange();"></select>
                                    &nbsp;&nbsp;表计：<select id="MeterSign" name="MeterSign" runat="server" width="60"></select>&nbsp;&nbsp;抄表日期：<input id="ListDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })"
                                        readonly name="ListDate" runat="server" style="width: 100px;" />
                                    <a href="#" id="ins" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick=" JavaScript:InsertMeter(); ">保存</a>
                                    <span style="color: red">注：抄表日期应大于最近抄表日期，否则抄表登记无效！</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="width: 100%;" id="TableContainer"></div>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#getUnitSnum").hide();
                $("#getMeterType").hide();

                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var frozenColumns = [[
                { field: 'RoomSign', title: '房屋编号', width: '150', align: 'left' },
                { field: 'RoomName', title: '房屋名称', width: '150', align: 'left' },
            ]];

            var column = [[

                { field: 'YzCustName', title: '业主', width: '100', align: 'left' },
                { field: 'ZhCustName', title: '租户', width: '100', align: 'left' },

                { field: 'MeterName', title: '表计名称', width: '80', align: 'left' },
                { field: 'ListDate', title: '最近抄表', width: '100', align: 'left' },

                { field: 'LastStartDegree', title: '上次起数', width: '80', align: 'left' },

                { field: 'LastEndDegree', title: '上次止数', width: '80', align: 'left' },
                {
                    field: 'EndDegree', title: '本次止数', width: '80', align: 'left'
                    , formatter: function (value, row, index) {
                        var str = "<input id=\"ED" + row.MeterID + "\" value=\"" + row.EndDegree + "\" onkeypress='if(event.keyCode==13) {TextKeyInput(\"" + index + "\",\"ED\");return false;}' type=\"text\" 'valuevalidatebox2(this.id,\"" + index + "\")' style=\" border:1px solid #cccccc;width:100%\"/> ";
                        return str;
                    }, editor: { type: 'numberbox' }
                },
                {
                    field: 'NewStartDegree', title: '新表起数', width: '80', align: 'left', editor: { type: 'numberbox' }, formatter: function (value, row, index) {
                        var str = "<input id=\"NSD" + row.MeterID + "\" value=\"" + row.NewStartDegree + "\" onkeypress='if(event.keyCode==13) {TextKeyInput(\"" + index + "\",\"NSD\");return false;}' type=\"text\" onblur = 'valuevalidatebox(this.id)' style=\" border:1px solid #cccccc;width:100%\"/> ";
                        return str;
                    }
                },

                {
                    field: 'NewEndDegree', title: '新表止数', width: '80', align: 'left', editor: { type: 'numberbox' }, formatter: function (value, row, index) {
                        var str = "<input id=\"NED" + row.MeterID + "\" value=\"" + row.NewEndDegree + "\" onkeypress='if(event.keyCode==13) {TextKeyInput(\"" + index + "\",\"NED\");return false;}' type=\"text\" onblur = 'valuevalidatebox(this.id)' style=\" border:1px solid #cccccc;width:100%\"/> ";
                        return str;
                    }
                },
                {
                    field: 'ExtraDosage', title: '损耗', width: '50', align: 'left', editor: { type: 'numberbox' }, formatter: function (value, row, index) {
                        var str = "<input id=\"Ext" + row.MeterID + "\" value=\"" + row.ExtraDosage + "\" onkeypress='if(event.keyCode==13) {TextKeyInput(\"" + index + "\",\"Ext\");return false;}' type=\"text\" onblur = 'valuevalidatebox(this.id)' style=' border:1px solid #cccccc;width:100%'/> ";
                        return str;
                    }
                },
                { field: 'Dosage', title: '用量', width: '50', align: 'left' },

                { field: 'OldDosage', title: '旧表用量', width: '80', align: 'left' },
                { field: 'Ratio', title: '变比', width: '50', align: 'left' },

                { field: 'TotalDosage', title: '合计用量', width: '80', align: 'left' },
                { field: 'Price', title: '单价', width: '50', align: 'left' },
                { field: 'MeterHint', title: '异常提示', width: '180', align: 'left' },
                { field: 'LastStartDegree', title: '上次起数', width: '80', align: 'left' },
                {
                    field: 'CostPrice', title: '成本单价', width: '80', align: 'left', editor: { type: 'numberbox' }, formatter: function (value, row, index) {
                        var str = "<input id=\"NSD" + row.MeterID + "\" value=\"" + row.CostPrice + "\" onkeypress='if(event.keyCode==13) {TextKeyInput(\"" + index + "\",\"NSD\");return false;}' type=\"text\" onblur = 'valuevalidatebox(this.id)' style=\" border:1px solid #cccccc;width:100%\"/> ";
                        return str;
                    }
                }
                //{
                //    field: 'MeterSource', title: '抄表来源', width: 100, align: 'left', sortable: true, editor: {
                //        type: 'validatebox',
                //        options: {
                //            validType: 'digital'
                //        }
                //    }
                //}

            ]];
            //{ field: 'ExtraDosage', title: '损耗', width:'80', align: 'left' },

            function TextKeyInput(index, Type) {

                var Iindex = parseInt(index) + 1;
                var row = $('#TableContainer').datagrid('getRows')[Iindex];

                var TypeID = Type + row.MeterID;

                document.getElementById(TypeID).focus();

            }
            function valuevalidatebox(obj) {

                if (isNaN($('#' + obj).val())) {
                    HDialog.Info("请输入数字");
                    $('#' + obj).val('');

                    return false;
                }


            }

            function valuevalidatebox2(obj, index) {

                if (isNaN($('#' + obj).val())) {
                    HDialog.Info("请输入数字");
                    $('#' + obj).val('');

                    return false;
                }
                else {
                    var Iindex = parseInt(index);
                    var LastEndDegree = parseFloat($('#TableContainer').datagrid('getRows')[Iindex].LastEndDegree);
                    var EndDegree = parseFloat($('#' + obj).val());
                    if (EndDegree < LastEndDegree) {
                        HDialog.Info("输入的本次止数小于上次止数");
                        $('#' + obj).val('');

                        return false;
                    }
                }



            }
            function LoadList(_Data) {


                $("#TableContainer").datagrid({
                    data: _Data,
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: false,
                    width: "100%",
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    toolbar: '#tbb',
                    onLoadSuccess: function (data) {

                        //var Rows = $(this).datagrid('getRows');

                        //for (var i = 0; i < Rows.length; i++) {
                        //    $(this).datagrid('beginEdit', i);
                        //}

                        //$(this).edatagrid('enableEditing');
                        //$(this).edatagrid('editRow',0);

                    }
                });

            }
            function LoadData(page) {
                $.tool.DataPost('Meter', 'CustomerMeterResultListBatch', "page=" + page + "&rows=" + top.ListPageSize + "&" + $('#ResultInsManage').serialize(),
                    function Init() {

                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        $('#hiNum').val(Data.total);
                        LoadList(Data);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            }

            LoadData(1);

            function InsertMeter() {
                $('#TableContainer').datagrid('acceptChanges');

                var rows = $("#TableContainer").datagrid("getData").rows;

                for (var i = 0; i < rows.length; i++) {

                    rows[i].EndDegree = $('#ED' + rows[i].MeterID).val();
                    rows[i].NewStartDegree = $('#NSD' + rows[i].MeterID).val();
                    rows[i].NewEndDegree = $('#NED' + rows[i].MeterID).val();
                    rows[i].ExtraDosage = $('#Ext' + rows[i].MeterID).val();
                }


                $('#BatchResult').val(JSON.stringify(rows));
                console.log($('#BatchResult').val());


                $.tool.DataPost('Meter', 'CustomerMeterAdd', $('#ResultInsManage').serialize(),
                    function Init() {

                    },
                    function callback(_Data) {

                        if (_Data == "true") {
                            HDialog.Info('抄表成功');
                            LoadData(1);
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


            $('#btnReturn').click(function () {
                HDialog.Close();
            });

            function BuildSNumChange() {
                document.getElementById('getUnitSnum').onclick();
                LoadData(1);
            }

            function UnitSNumChange() {
                LoadData(1);
            }

            function ChargeTypeIDChange() {
                LoadData(1);
            }
            function MeterTypeChange() {
                document.getElementById('getMeterType').onclick();
                LoadData(1);
            }
        </script>
    </form>
</body>
</html>
