<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenovationDetailed.aspx.cs" Inherits="M_Main.RenovationNew.RenovationDetailed" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修登记详情</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script src="../jscript/help.js" type="text/javascript"></script>
    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        .bootstrap_table tr td.title {
            width: 10%;
            text-align: right;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            padding-left: 20px;
            width: 40%;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="mainForm" runat="server">
        <input type="hidden" name="PrintRegister" id="PrintRegister" runat="server" />
        <input type="hidden" name="PrintLicence" id="PrintLicence" runat="server" />

        <input type="hidden" name="OpType" id="OpType" />
        <input type="hidden" name="AuditState" id="AuditState" value="未送审" />
        <input type="hidden" name="QRCode" id="QRCode" />
        <input type="hidden" name="FeesRoleCodes" id="FeesRoleCodes" />
        <input type="hidden" name="StoppageDays" id="StoppageDays" />


        <div style="padding: 5px">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">基础信息</legend>
                <div class="divPrint add">
                    <input type="button" id="BtnPrintLicence" class="button" value="打印装修许可证" onclick="OpenPrintLicence()" />
                </div>
                <table class="border-table" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>
                            <span>客户名称</span>
                        </th>
                        <td>
                            <div id="CustName"></div>
                        </td>
                        <th><span>房屋编号</span></th>
                        <td>
                            <div id="RoomSign"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>房屋名称</span></th>
                        <td>
                            <div id="RoomName"></div>
                        </td>
                        <th><span>联系电话</span></th>
                        <td>
                            <div id="ContactPhone"></div>
                        </td>
                    </tr>

                    <tr>
                        <th><span>申请日期</span></th>
                        <td>
                            <div id="ApplyDate"></div>
                        </td>
                        <th><span>装修类型</span></th>
                        <td>
                            <div id="RenovationType"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>装修前房屋情况</span></th>
                        <td colspan="3">
                            <div id="HousesBeforeSituation" multiline></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>装修内容</span></th>
                        <td colspan="3" multiline>
                            <div id="RenovationContent"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>装修开工时间</span></th>
                        <td>
                            <div id="StartDate"></div>
                        </td>
                        <th><span>预计完工时间</span></th>
                        <td>
                            <div id="EstimateEndDate"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>预计装修天数</span></th>
                        <td>
                            <div id="EstimateEndDay"></div>
                        </td>
                        <th><span>是否自装</span></th>
                        <td>
                            <div id="OneselfOutfit"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>施工单位名称</span></th>
                        <td>
                            <div id="BuildCompany"></div>
                        </td>
                        <th><span>统一信用代码</span></th>
                        <td>
                            <div id="CreditCode"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>有无资质</span></th>
                        <td>
                            <div id="Qualification"></div>
                        </td>
                        <th><span>资质等级</span></th>
                        <td>
                            <div id="QualificationLevel"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>单位负责人</span></th>
                        <td>
                            <div id="BuildCompanyLeadPerson"></div>
                        </td>
                        <th><span>单位负责人电话</span></th>
                        <td>
                            <div id="BuildCompanyLeadPersonPhone"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>进场人数</span></th>
                        <td>
                            <div id="EnterSitePersonNum"></div>
                        </td>
                        <th><span>是否留宿</span></th>
                        <td>
                            <div id="StayOvernight"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>现场负责人</span></th>
                        <td>
                            <div id="NewSiteLeadPerson"></div>
                        </td>
                        <th><span>现场负责人电话</span></th>
                        <td>
                            <div id="NewSiteLeadPersonPhone"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>有无图纸方案</span></th>
                        <td>
                            <div id="Drawing"></div>
                        </td>
                        <th><span>经办人</span></th>
                        <td>
                            <div id="HandlePerson"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>经办时间</span></th>
                        <td>
                            <div id="HandleDate"></div>
                        </td>
                        <th><span>信息来源</span></th>
                        <td>
                            <div id="InfoSource"></div>

                        </td>
                    </tr>
                    <tr>
                        <th><span>装修许可证编号</span></th>
                        <td colspan="3">
                            <div id="LicenceNum"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>备注</span></th>
                        <td colspan="3" multiline>
                            <div id="Remark"></div>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">完工信息</legend>
                <table class="border-table" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th><span>实际完工时间</span></th>
                        <td>
                            <div id="ActualCompleteDate"></div>
                        </td>
                        <th><span>实际装修天数</span></th>
                        <td>
                            <div id="ActualCompleteDay"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>装修状态</span></th>
                        <td>
                            <div id="RenovationState"></div>

                        </td>
                        <th><span>变更时间</span></th>
                        <td>
                            <div id="RenovationChangeDate"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>装修变更原因</span></th>
                        <td colspan="3" multiline>
                            <div id="RenovationChangeReason"></div>
                        </td>
                    </tr>

                    <tr>
                        <th><span>房屋状态</span></th>
                        <td>
                            <div id="HandOverHousesState"></div>
                        </td>
                        <th><span>变更时间</span></th>
                        <td>
                            <div id="HandOverHousesChangeDate"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>交房变更原因</span></th>
                        <td colspan="3" multiline>
                            <div id="HandOverHousesChangeReason"></div>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <input type="hidden" name="ID" id="ID" runat="server" />
        <%--   <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>--%>
    </form>
    <script type="text/javascript">
        function OpenPage(id) {
            var value = $("#" + id).val();
            if (isValueNull(value)) {
                window.open(value, "_blank", "menubar=no,toolbar=no,status=no,scrollbars=yes,resizable=yes");
                $("#" + id).val('')
            }
        }
        function OpenPrintLicence() {
            window.open("RenovationPrintLicence.aspx?ID=" + $("#ID").val());
        }
        function Print() {
            OpenPage("PrintRegister");
            OpenPage("PrintLicence");
        }

        $(function () {
            Print();
            InitPage();
        });

        function InitPage() {
            $("#ID").val($.getUrlParam("ID"));
            InitData();
        }
        function InitData() {
            $.tool.DataPostJson('Renovation', 'GetModelRenovation', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    data = data[0];
                    data.ApplyDate = DateFomater(data.ApplyDate);
                    data.StartDate = DateFomater(data.StartDate);
                    data.EstimateEndDate = DateFomater(data.EstimateEndDate);
                    data.HandleDate = DateFomater(data.HandleDate);
                    data.ActualCompleteDate = DateFomater(data.ActualCompleteDate);
                    data.RenovationChangeDate = DateFomater(data.RenovationChangeDate);
                    data.HandOverHousesState = DateFomater(data.HandOverHousesState);
                    data.RenovationContent = data.RenovationContent.replace(/[\r\n]/g, "<br/>");
                    data.HousesBeforeSituation = data.HousesBeforeSituation.replace(/[\r\n]/g, "<br/>");
                    data.Remark = data.Remark.replace(/[\r\n]/g, "<br/>");
                    data.RenovationChangeReason = data.RenovationChangeReason.replace(/[\r\n]/g, "<br/>");

                    if (data.RenovationState == "装修" && isValueNull(data.MinStoppageBeginTime)) {
                        data.RenovationState = "停工";
                        data.RenovationChangeDate = data.MinStoppageBeginTime;
                        data.RenovationChangeReason = "停工审核通过";
                    }
                    if (data.RenovationState == "停工" && isValueNull(data.MaxStoppageEndTime)) {
                        data.RenovationState = "装修";
                        data.RenovationChangeDate = data.MaxStoppageEndTime;
                        data.RenovationChangeReason = "停工结束";
                    }

                    $.JQForm.SetStrParam(data);
                    if (data.AuditState != "已审核") {
                        $(".divPrint").hide();
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }


        function Close() {
            HDialog.CloseWindow("", parent.window.name);
        }
    </script>
</body>
</html>
