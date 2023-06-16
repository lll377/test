<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UrgeFeesManage.aspx.cs" Inherits="M_Main.UrgeFees.UrgeFeesManage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="ArrearsID" name="ArrearsID" runat="server" />
         <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />

        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
        <input id="hiRegionNames" type="hidden" name="hiRegionNames" runat="server" />   

        <input id="RoomStates"  type="hidden" name="RoomStates" runat="server" />
        <input id="hiRoomStateNames" type="hidden" name="hiRoomStateNames" runat="server" />
        <input id="RoomStateNum" type="hidden" name="RoomStateNum" runat="server" />

        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" />

        <input type="hidden" id="path" name="path" runat="server" />
        <table class="DialogTable">
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">欠费明细生成</td>
            </tr>
             <tr>
                    <td class="TdTitle">收款截止时间</td>
                    <td class="TdContentSearch"><input type="text" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" id="CutEndDate" runat="server" name="CutEndDate" /></td>
                    <td class="TdTitle">时间类型</td>
                    <td class="TdContentSearch"><select id="FeesDateType" name="FeesDateType" runat="server">
                                     <option value="1" selected>费用日期</option>
                                     <option value="2">应收日期</option>
                                 </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从</td>
                    <td class="TdContentSearch"><input type="text" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" id="EditBeginDate" runat="server" name="EditBeginDate" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch"><input type="text" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" id="EditEndDate" runat="server" name="EditEndDate" /></td>
                </tr>
             <tr>
                    <td class="TdTitle">是否关联预算</td>
                    <td class="TdContentSearch">
                      <select id="IsPlan" name="IsPlan" runat="server">
                                     <option value="是" selected>是</option>
                                     <option value="否">否</option>
                                 </select>
                         </td>
                    <td class="TdTitle">关联预算年度</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy'})" id="PlanYear" runat="server" name="PlanYear" /></td>
                </tr>
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
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch"><input id="RoomStateNames" style="width:90%" class="easyui-searchbox" searcher="SelRoomState"
                            name="RoomStateNames" runat="server" />
                        </td>
                     <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" style="width:90%" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server"></td> 
                </tr>               
               
            <tr>
                <td colspan="4" align="center">
                    <input id="btnCreate" class="button" value="生成" type="button" name="btnCreate" runat="server">&nbsp; 
                            <input id="btnDetail" class="button" value="明细" type="button" name="btnDetail" runat="server">&nbsp;
                            <input id="btnReturn" class="button" value="关闭" type="button" name="btnReturn" runat="server"></td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        $(function () {
            $("#btnDetail").hide();
        })

        $("#btnReturn").click(function () {
            HDialog.Close(1);
        })

        $("#btnCreate").click(function () {

            if ($("#IsPlan").val() == "是")
            {
                if ($("#PlanYear").val() == "")
                {
                    alert("如果选择关联预算，预算年度必须选择!");
                    return;
                }
                
            }

            $.tool.DataPost('UrgeFeesNew', "ArrearsReasonManage", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    var data = eval('(' + _Data + ')');
                    if (data.result == "true") {
                        $("#btnDetail").show();
                        var w = $(parent.window).width() - 200;
                        var h = $(parent.window).height() - 200;
                        HDialog.Open(w, h, '../UrgeFees/UrgeFeesDetailNew.aspx?ArrearsID=' + data.ArrearsID, "欠费明细", false, function callback(_Data) {
                        });
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        })


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


        function btnClear_OnClick() {

            $('#BuildSNums').val('');
            $('#BuildNames').searchbox('setValue', '');
            $('#RegionSNums').val('');
            $('#RegionNames').searchbox('setValue', '');
            $('#hiRegionNames').val('');

            $('#CostIDs').val('');
            $('#CostNames').searchbox('setValue', '');

            $('#RoomStates').val('');
            $('#RoomStateNames').searchbox('setValue', '');
            $('#hiRoomStateNames').val('');
            $('#RoomStateNum').val('');

        }
    </script>
</body>
</html>
