<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Products.Register.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-竞品登记编辑页面页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/area.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <form id="mainForm" class="form-horizontal" role="form" style="height: 390px; overflow: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">竞品信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">竞品项目</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ProductsName" name="ProductsName" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">业主单位</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="OwnerUnitName" name="OwnerUnitName" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true,onChange:OwnerUnitNameChange" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">商管单位</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BusinessUnitName" name="BusinessUnitName" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">物管单位</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="PropertyUnitName" name="PropertyUnitName" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">所属区域</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="NativePlaceProvince" name="NativePlaceProvince" class="easyui-combobox"
                        data-options="prompt:'省份',editable:false,tipPosition:'bottom',required:true,valueField:'label',textField:'label',panelHeight:'200',width:'100px'" />
                    <label class="control-text">-</label>
                    <input id="NativePlaceCity" name="NativePlaceCity" class="easyui-combobox"
                        data-options="prompt:'地级市',editable:false,tipPosition:'bottom',required:true,valueField:'label',textField:'label',panelHeight:'200',width:'120px'" />
                    <label class="control-text">-</label>
                    <input id="NativePlaceDistrict" name="NativePlaceDistrict" class="easyui-combobox"
                        data-options="prompt:'县/区',editable:false,tipPosition:'bottom',required:true,valueField:'label',textField:'label',panelHeight:'200',width:'120px'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">项目地址</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="CommAddress" name="CommAddress" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%',multiline:false" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">开盘时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="OpeningTime" name="OpeningTime" class="easyui-datebox" runat="server"
                        data-options="editable:false,tipPosition:'bottom',width:'100%',required:true" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">交房时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="DeliveryTime" name="DeliveryTime" class="easyui-datebox" runat="server"
                        data-options="editable:false,tipPosition:'bottom',width:'100%',required:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">地上层数</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="GroundFloors" name="GroundFloors" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:0,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">地下层数</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnderFloors" name="UnderFloors" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:0,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">总套房数</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="RoomNumber" name="RoomNumber" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:0,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">总车位数</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ParkingNumber" name="ParkingNumber" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:0,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">建筑面积(平米)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BuildArea" name="BuildArea" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">装修属性</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="RenoAttribute" name="RenoAttribute" class="easyui-combobox"
                        data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [{id: '毛坯',text: '毛坯'},{id: '简装',text: '简装'},{id: '精装',text: '精装'},{id: '豪装',text: '豪装'}]"
                        runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">配套设施</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="SupportingFacility" name="SupportingFacility" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'40px',multiline:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">物业大类</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="PropertyCategory" name="PropertyCategory" class="easyui-combobox"
                        data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [
                                   {id: '居住物业',text: '居住物业'},
                                   {id: '商业物业',text: '商业物业'},
                                   {id: '工业物业',text: '工业物业'},
                                   {id: '政府物业',text: '政府物业'},
                                   {id: '其他物业',text: '其他物业'}]"
                        runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">物业细类</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="PropertyFinelinesName" name="PropertyFinelinesName" class="easyui-textbox"
                        data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelPropertyFinelines();}"
                        runat="server" />
                    <input type="hidden" id="PropertyFinelinesID" name="PropertyFinelinesID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">租售类型</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="RentAndSellType" name="RentAndSellType" class="easyui-combobox"
                        data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [
                                   {id: '出租',text: '出租'},
                                   {id: '出售',text: '出售'},
                                   {id: '租售结合',text: '租售结合'}]"
                        runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">经营业态</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="BusinessFormName" name="BusinessFormName" class="easyui-textbox"
                        data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelBusinessForm();}"
                        runat="server" />
                    <input type="hidden" id="BusinessFormID" name="BusinessFormID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">租金均价(元/平米.月)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="RentQuote" name="RentQuote" class="easyui-numberbox"
                        data-options="required:true,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label" style="line-height: normal;">
                    物管费均价<br />
                    (元/平米.月)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="PropertyManagementFeeQuote" name="PropertyManagementFeeQuote" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">其它收费</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="OtherCharges" name="OtherCharges" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'40px',multiline:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">招商政策</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="InvestmentPolicy" name="InvestmentPolicy" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'40px',multiline:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">优惠政策</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="FavouredPolicy" name="FavouredPolicy" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'40px',multiline:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">入住户数</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="HouseholdsNumbers" name="HouseholdsNumbers" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:0,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">出租率(%)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="RentalRate" name="RentalRate" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">典型客户</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="TypicalCustomers" name="TypicalCustomers" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'40px',multiline:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">距本项目距离(公里)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="Distance" name="Distance" class="easyui-numberbox"
                        data-options="required:true,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">客群重叠度(%)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="CustomerOverlapDegree" name="CustomerOverlapDegree" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">信息来源</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="InformationSource" name="InformationSource" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">更新时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="RefreshTime" name="RefreshTime" class="easyui-datebox" runat="server"
                        data-options="editable:false,tipPosition:'bottom',width:'100%',required:false" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">备注</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Remark" name="Remark" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'40px',multiline:true" />
                </div>
            </div>
        </fieldset>
    </form>
    <div class="form-group">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //加载省市区数据
            $('#NativePlaceProvince').combobox({
                data: CityInfo,
                onSelect: function (record) {
                    $("#NativePlaceCity").combobox('clear').combobox('loadData', []);
                    $("#NativePlaceDistrict").combobox('clear').combobox('loadData', []);
                    if (record.children) {
                        $('#NativePlaceCity').combobox({
                            data: record.children,
                            onSelect: function (ItemRecord) {
                                $("#NativePlaceDistrict").combobox('clear').combobox('loadData', []);
                                if (ItemRecord.children) {
                                    $('#NativePlaceDistrict').combobox({
                                        data: ItemRecord.children
                                    })
                                }
                            }
                        });
                    }
                }
            });
            InitPage();
        });

        function InitPage() {
            let param = $.getUrlParam();
            if (!!param.ID) {
                $("#ID").val(param.ID);
            }
            if (!!param.OpType) {
                $("#OpType").val(param.OpType);
            }
            let OpType = $("#OpType").val();
            if (OpType == "edit") {
                InitData();
            }
        }

        function OwnerUnitNameChange(newValue, oldValue) {
            try {
                var BusinessUnitNameVal = $('#BusinessUnitName').textbox("getValue");
                if (BusinessUnitNameVal == "") {
                    $('#BusinessUnitName').textbox("setValue", newValue);
                }
            } catch (e) {

            }
        }

        //选择物业细类
        function SelPropertyFinelines() {
            var param = {
                IsMultiple: "否",
                Type: "物业细类"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择物业细类", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#PropertyFinelinesID").val(data[0].ID);
                    $("#PropertyFinelinesName").textbox("setValue", data[0].Name);
                }
            });
        }

        //选择经营业态
        function SelBusinessForm() {
            var param = {
                IsMultiple: "否",
                Type: "经营业态"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择经营业态", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#BusinessFormID").val(data[0].ID);
                    $("#BusinessFormName").textbox("setValue", data[0].Name);
                }
            });
        }

        function InitData() {
            $.dataPostJson("Renting_Products", 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#mainForm').form('load', data);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.dataPostJson("Renting_Products", 'Save', $.getParam(), true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("true");
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }
        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
