<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtSupplierInfoEdit.aspx.cs" Inherits="M_Main.Mt.MtSupplierInfoEdit" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <script src="../jscript/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>



    <style type="text/css">
        .button1 {
            line-height: 28px;
            height: 30px;
            width: 103px;
            color: #ffffff;
            background-color: #3e73ca;
            font-size: 12px;
            font-weight: normal;
            font-family: 微软雅黑;
            border: 0px solid #dcdcdc;
            -webkit-border-top-left-radius: 3px;
            -moz-border-radius-topleft: 3px;
            border-top-left-radius: 3px;
            -webkit-border-top-right-radius: 3px;
            -moz-border-radius-topright: 3px;
            border-top-right-radius: 3px;
            -webkit-border-bottom-left-radius: 3px;
            -moz-border-radius-bottomleft: 3px;
            border-bottom-left-radius: 3px;
            -webkit-border-bottom-right-radius: 3px;
            -moz-border-radius-bottomright: 3px;
            border-bottom-right-radius: 3px;
            -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
            -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
            box-shadow: inset 0px 0px 0px 0px #ffffff;
            text-align: center;
            display: inline-block;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div id="tabSupplier" class="tab-pane active">
        <form id="frmSupplierInfo" name="frmSupplierInfo">
             <input type="hidden" id="HidCorpID" runat="server" name="HidCorpID" />
            <table class="DialogTable">
                <tr style="line-height: 28px;">
                    <td class="TdTitle">管理单位：</td>
                    <td class="TdContentSearch">
                        <input id="SelOrganCode" data-options="required:true"  name="SelOrganCode" runat="server" class="easyui-searchbox " searcher="SelLastDep" />
                    </td>
                    <td class="TdTitle">供方类别：</td>
                    <td class="TdContent">
                        <select runat="server" id="SupplierType" style="border: 1px solid #cccccc;" name="SupplierType">
                        </select>
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">合作级别：</td>
                    <td class="TdContent">
                        <select runat="server" id="CooperationLevel" style="border: 1px solid #cccccc;" name="CooperationLevel">
                        </select>
                    </td>

                    <td class="TdTitle">供方名称：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" data-options="required:true" style="height: 22px;" id="SupplierName" runat="server" value="" name="SupplierName" />
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">企业类型：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" runat="server" style="width: 98%; height: 22px;" id="CooperationType" value="" name="CooperationType" />
                    </td>
                    <td class="TdTitle">企业住所：</td>
                    <td class="TdContent">
                        <input type="text" runat="server" class="easyui-validatebox" style="height: 22px;" id="CooperationLive" value="" name="CooperationLive" />
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">法定代表人：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" runat="server" style="width: 98%; height: 22px;" id="Representative" value="" name="Representative" />
                    </td>
                    <td class="TdTitle">注册资本：</td>
                    <td class="TdContent" colspan="1">
                        <input type="text" class="easyui-numberbox" data-options="min:1,precision:2"  runat="server" style="width: 84%; height: 22px;" id="Capital" value="" name="Capital" />(万元)
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">成立日期：</td>
                    <td class="TdContent">
                        <input id="CreateDate" runat="server" name="CreateDate" value="" style="width: 154.2px; height: 22px;" type="text" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" format="date" />
                    </td>
                    <td class="TdTitle">营业期限：</td>
                    <td class="TdContent" colspan="2">
                        <input id="BusinessSartDate" runat="server" value="" name="BusinessSartDate" type="text" style="width: 45%; height: 22px;" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" format="date"/>至&nbsp;<input id="BusinessEndDate" runat="server" value="" name="BusinessEndDate" type="text" style="width: 45%; height: 22px;" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" format="date"/>
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">营业范围：</td>
                    <td class="TdContent" colspan="3">
                        <input type="text" runat="server" class="easyui-validatebox" style="width: 99%; height: 22px;" id="Range" value="" name="Range" />
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">企业资质：</td>
                    <td class="TdContent">
                        <select runat="server" id="CooperationQualifications" style="border: 1px solid #cccccc;" name="CooperationQualifications">
                        </select>
                    </td>

                    <td class="TdTitle">所在省市：</td>
                    <td class="TdContent">
                        <%--<input type="text" class="easyui-validatebox" id="Address" runat="server" style="width: 98%; height: 22px;" value="" name="Address" />--%>
                        <select id="Province" name="Province" class="easyui-validatebox "  runat="server">
                            <option value="">请选择</option>
                        </select><select id="City" name="City" class="easyui-validatebox "  runat="server"><option value="">请选择</option>
                        </select><select id="Area" name="Area" class="easyui-validatebox "  runat="server"><option value="">请选择</option>
                        </select>

                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">办公地址：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" runat="server" id="WorkAddress" value="" style="height: 22px;" name="WorkAddress" />
                    </td>

                    <td class="TdTitle">联&nbsp;系&nbsp;人：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" data-options="required:true" id="Contacts" style="width: 98%; height: 22px;" runat="server" value="" name="Contacts" />
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">联系人职务：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" runat="server" id="Duty" style="height: 22px;" value="" name="Duty" />
                    </td>

                    <td class="TdTitle">联系电话：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" data-options="required:true" runat="server" id="ContactTel" style="width: 98%; height: 22px;" value="" name="ContactTel" />
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">开&nbsp;户&nbsp;行：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" runat="server" id="BankName" style="height: 22px;" value="" name="BankName" />
                    </td>

                    <td class="TdTitle">账&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" runat="server" id="BankAccount" style="width: 98%; height: 22px;" value="" name="BankAccount" />
                    </td>
                </tr>
                <tr id="cance" style="line-height: 28px;">
                    <td class="TdTitle">供方编号：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" runat="server" style="height: 22px;" id="SupplierNum" value="" name="SupplierNum" />
                    </td>
                    <td class="TdContent" colspan="2"></td>
                </tr>
                 <tr id="cance1" style="line-height: 28px;">
                    <td class="TdTitle">供应商考察时间：</td>
                    <td class="TdContent">
                        <input name="SupplierInspectionDate" type="text" id="SupplierInspectionDate" runat="server" onkeypress="CheckSmallDate();" class="Wdate" style="width: 63%;" onclick="WdatePicker()" />
                    </td>
                     <td class="TdTitle">附&nbsp;&nbsp;&nbsp;件：</td>
                    <td colspan="2" class="TdContent">
                        <iframe src="../UploadFileNameInspection.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
                    </td>
                </tr>
                <tr id="flist">
                    <td class="TdTitle">供应商考察附件列表：
                    </td>
                    <td class="TdContent" colspan="3">
                        <span id="InspectionList" runat="server" />
                    </td>
                </tr>
                 <tr id="cance2" style="line-height: 28px;">
                    <td class="TdTitle">供应商入库时间：</td>
                    <td class="TdContent">
                        <input name="SupplierWarehousingDate" type="text" id="SupplierWarehousingDate" runat="server" onkeypress="CheckSmallDate();" class="Wdate" style="width: 63%;" onclick="WdatePicker()" />
                    </td>
                    <td class="TdTitle">附&nbsp;&nbsp;&nbsp;件：</td>
                    <td colspan="2" class="TdContent">
                        <iframe src="../UploadFileNameWarehousing.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
                    </td>
                 </tr>
                 <tr id="flist1">
                    <td class="TdTitle">供应商入库附件列表：
                    </td>
                    <td class="TdContent" colspan="3">
                        <span id="WarehousingList" runat="server" />
                    </td>
                </tr>
                 <tr style="line-height: 28px;">
                    <td class="TdTitle">供应商评审时间：</td>
                    <td class="TdContent">
                         <input name="SupplierReviewDate " type="text" id="SupplierReviewDate" runat="server" onkeypress="CheckSmallDate();" class="Wdate" style="width: 63%;" onclick="WdatePicker()" />
                      
                    </td>
                    <td class="TdTitle">附&nbsp;&nbsp;&nbsp;件：</td>
                    <td colspan="2" class="TdContent">
                        <iframe src="../UploadFileNameReview.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
                    </td>
                  
                </tr>
                 <tr id="flist2">
                    <td class="TdTitle">供应商评审附件列表：
                    </td>
                    <td class="TdContent" colspan="3">
                        <span id="ReviewList" runat="server" />
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">备&nbsp;&nbsp;&nbsp;注：</td>
                    <td colspan="3" class="TdContent">
                        <textarea id="Memo" name="Memo" runat="server" style="width: 99%; height: 86px; border: 1px solid #cccccc;" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
                <tr style="line-height: 28px;">
                    <td class="TdTitle">附&nbsp;&nbsp;&nbsp;件：</td>
                    <td colspan="3" class="TdContent">
                        <iframe src="../UploadFileName.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">附件列表：
                    </td>
                    <td class="TdContent" colspan="3">
                        <span id="List" runat="server" />
                    </td>
                </tr>
                <tr style="line-height: 17px;">
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr style="line-height: 28px;">
                    <td colspan="4" align="center">
                        <input type="button" class="button1" value="保    存" id="BtnSave" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" class="button1" value="关   闭" id="BtnReturn" />
                    </td>
                </tr>
            </table>
            <input type="hidden" id="Id" name="Id" value="" runat="server" />
            <input type="hidden" id="HidOpType" value="" runat="server" name="HidOpType" />
            <input type="hidden" id="OrganCode" name="OrganCode" value="" runat="server" />
            <input type="hidden" id="Attach" name="Attach" runat="server" value="" />
            <input type="hidden" id="InspectionAttach" name="InspectionAttach" runat="server" value="" />
            <input type="hidden" id="ReviewAttach" name="ReviewAttach" runat="server" value="" />
            <input type="hidden" id="WarehousingAttach" name="WarehousingAttach" runat="server" value="" />
            
            <input type="hidden" id="State" name="State" runat="server" value=""/>
            <input type="hidden" id="CooperateStartDate" name="CooperateStartDate" runat="server" value=""/>
            <input type="hidden" id="CooperateEndDate" name="CooperateEndDate" runat="server" value=""/>
            <input type="hidden" id="ProvinceName" name="ProvinceName" runat="server" />
            <input type="hidden" id="CityName" name="CityName" runat="server" />
            <input type="hidden" id="AreaName" name="AreaName" runat="server" />
            <input type="hidden" id="Address" name="Address" runat="server" value="" />
            <input type="hidden" id="ExamineState" name="ExamineState" runat="server" />
        </form>
    </div>

    <script type="text/javascript">
        //省市区绑定联动
        $(function () {

            $.each(province, function (k, p) {
                var option = "<option value='" + p.ProID + "'>" + p.ProName + "</option>";
                $("#Province").append(option);
            });

            $("#Province").change(function () {
                var selValue = $(this).val();
                $("#City option:gt(0)").remove();
                $.each(city, function (k, p) {
                    if (p.ProID == selValue) {
                        var option = "<option value='" + p.CityID + "'>" + p.CityName + "</option>";
                        $("#City").append(option);
                    }
                });
            });
            $("#City").change(function () {
                var selValue = $(this).val();
                $("#Area option:gt(0)").remove();
                $.each(District, function (k, p) {
                    if (p.CityID == selValue) {
                        var option = "<option value='" + p.DisID + "'>" + p.DisName + "</option>";
                        $("#Area").append(option);
                    }
                });
            });


            if ($("#HidCorpID").val() != "1528")
            {
                $("#cance").hide();
                $("#cance1").hide();
                $("#cance2").hide();
                $("#flist").hide();
                $("#flist1").hide();
                $("#flist2").hide();
                
            }
        });

        //管理单位
        function SelLastDep() {
            HDialog.Open('300', '400', '../DialogNew/SelOrganComm.aspx', '选择管理单位', false, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                $("#SelOrganCode").searchbox("setValue",Obj.text);
                $("#OrganCode").val(Obj.attributes.OrganCode);
            });
        }

        $("#BtnSave").click(function () {
            if ($("#SupplierName").val() == "") {
                HDialog.Info('供方名称不能为空');
                return;
            }
            if ($("#Contacts").val() == "") {
                HDialog.Info("联系人不能为空");
                return;
            }
            if ($("#ContactTel").val() == "") {
                HDialog.Info("联系电话不能为空");
                return;
            }
            $("#ProvinceName").val($("#Province").find("option:selected").text());
            $("#CityName").val($("#City").find("option:selected").text());
            $("#AreaName").val($("#Area").find("option:selected").text());
            var AddStr = "";
            if ($("#ProvinceName").val() != "" && $("#ProvinceName").val() != "请选择") {
                AddStr += $("#ProvinceName").val();
            }
            if ($("#CityName").val() != "" && $("#CityName").val() != "请选择") {
                AddStr += "," + $("#CityName").val();
            }
            if ($("#AreaName").val() != "" && $("#AreaName").val() != "请选择") {
                AddStr += "," + $("#AreaName").val();
            }
            $("#Address").val(AddStr);
            GetAttach();
            GetInspectionAttach();
            GetWarehousingAttach();
            GetReviewAttach();
            $.tool.DataPostChk('frmSupplierInfo', 'MaterialSupplierInfo', 'SaveSupplierInfo', $('#frmSupplierInfo').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info('操作成功');
                        parent.HDialog.Close('1');
                    } else {
                        HDialog.Info(_Data);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        });

        $("#BtnReturn").click(function () {
            parent.HDialog.Close();
        });


        //文件上传
        //上传文件相关js
        function UploadCallBack(addr, Name) {
            var Id = Getid();
            var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class=List url=\"" + addr + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"Delete(this);\">&nbsp;删除&nbsp;</span>"
            $("#List").append(v);
            GetAttach();
        }
        function UploadCallBackInspection(addr, Name) {
            var Id = Getid();
            var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class=List url=\"" + addr + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"DeleteInspection(this);\">&nbsp;删除&nbsp;</span>"
            $("#InspectionList").append(v);
            GetInspectionAttach();
        }
        function UploadCallBackWarehousing(addr, Name) {
            var Id = Getid();
            var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class=List url=\"" + addr + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"DeleteWarehousing(this);\">&nbsp;删除&nbsp;</span>"
            $("#WarehousingList").append(v);
            GetWarehousingAttach();
        }
        function UploadCallBackReview(addr, Name) {
            var Id = Getid();
            var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class=List url=\"" + addr + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"DeleteReview(this);\">&nbsp;删除&nbsp;</span>"
            $("#ReviewList").append(v);
            GetReviewAttach();
        }
       
        function Delete(obj)
        {
            $(obj).prev().remove();
            $(obj).remove();
            GetAttach();
        }
        function DeleteInspection(obj)
        {
            $(obj).prev().remove();
            $(obj).remove();
            GetInspectionAttach();
        }
        function DeleteWarehousing(obj)
        {
            $(obj).prev().remove();
            $(obj).remove();
            GetWarehousingAttach();
        }
        function DeleteReview(obj)
        {
            $(obj).prev().remove();
            $(obj).remove();
            GetReviewAttach();
        }
        
        function GetReviewAttach()
        {
            var v = $("#ReviewList").html();
            re = /\"/g;
            var mi = v.replace(re, "'");
            $("#ReviewAttach").val(mi);
        }
        function GetWarehousingAttach()
        {
            var v = $("#WarehousingList").html();
            re = /\"/g;
            var mi = v.replace(re, "'");
            $("#WarehousingAttach").val(mi);
        }
        function GetInspectionAttach()
        {
            var v = $("#InspectionList").html();
            re = /\"/g;
            var mi = v.replace(re, "'");
            $("#InspectionAttach").val(mi);
        }
        function GetAttach() {
            var v = $("#List").html();
            re = /\"/g;
            var mi = v.replace(re, "'");
            $("#Attach").val(mi);
        }

        function Getid()
        {
            d = new Date();
            var s = "";
            s += d.getYear();
            s += (d.getMonth() + 1);
            s += d.getDate();
            s += d.getHours();
            s += d.getMinutes();
            s += (d.getSeconds());
            return s;
        }
    </script>


</body>
</html>
