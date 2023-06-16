<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Products.AnalysisDistribution.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-竞品管理-竞品分布分析</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/echarts-3.7.2/echarts.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/echarts-3.7.2/dist/theme/macarons.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/area.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',border:false" style="overflow: hidden; height: 45px;">
            <form class="form-horizontal dialog-fixed-tool-top" role="form" style="background-color: #F5F5F5;">
                <div class="form-group">
                    <div class="col-sm-12 col-xs-12" style="width: 100%;">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',width:100" onclick="DistanceClick();">距离分组</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick=" $('#dlg_search').dialog('open');">统计</a>
                        <a id="tip" href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="<div><p>温馨提示：<br/>&emsp;&emsp;请先设置距离分组!</p></div>" data-options="plain:true,iconCls:'icon-help'"></a>
                    </div>
                </div>
            </form>
            <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1000px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
                <form id="formSearch" class="form-horizontal" role="form">
                    <fieldset class="frame-fieldset">
                        <legend class="frame-legend">竞品信息</legend>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">所属区域</label>
                            <div class="col-sm-7 col-xs-7">
                                <input id="NativePlaceProvince" name="NativePlaceProvince" class="easyui-combobox"
                                    data-options="prompt:'省份',editable:false,tipPosition:'bottom',required:false,valueField:'label',textField:'label',panelHeight:'200',width:'100px'" />
                                <label class="control-text">-</label>
                                <input id="NativePlaceCity" name="NativePlaceCity" class="easyui-combobox"
                                    data-options="prompt:'地级市',editable:false,tipPosition:'bottom',required:false,valueField:'label',textField:'label',panelHeight:'200',width:'120px'" />
                                <label class="control-text">-</label>
                                <input id="NativePlaceDistrict" name="NativePlaceDistrict" class="easyui-combobox"
                                    data-options="prompt:'县/区',editable:false,tipPosition:'bottom',required:false,valueField:'label',textField:'label',panelHeight:'200',width:'120px'" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">装修属性</label>
                            <div class="col-sm-3 col-xs-3">
                                <input id="RenoAttribute" name="RenoAttribute" class="easyui-combobox"
                                    data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiline:true,
                                    valueField:'id',textField:'text',data: [{id: '毛坯',text: '毛坯'},{id: '简装',text: '简装'},{id: '精装',text: '精装'},{id: '豪装',text: '豪装'}]"
                                    runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">物业大类</label>
                            <div class="col-sm-3 col-xs-3">
                                <input id="PropertyCategory" name="PropertyCategory" class="easyui-combobox"
                                    data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiple:true,
                                    valueField:'id',textField:'text',data: [
                                   {id: '居住物业',text: '居住物业'},
                                   {id: '商业物业',text: '商业物业'},
                                   {id: '工业物业',text: '工业物业'},
                                   {id: '政府物业',text: '政府物业'},
                                   {id: '其他物业',text: '其他物业'}]"
                                    runat="server" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">物业细类</label>
                            <div class="col-sm-3 col-xs-3">
                                <input id="PropertyFinelinesName" name="PropertyFinelinesName" class="easyui-textbox"
                                    data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelPropertyFinelines();}"
                                    runat="server" />
                                <input type="hidden" id="PropertyFinelinesID" name="PropertyFinelinesID" runat="server" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">租售类型</label>
                            <div class="col-sm-3 col-xs-3">
                                <input id="RentAndSellType" name="RentAndSellType" class="easyui-combobox"
                                    data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiple:true,
                                    valueField:'id',textField:'text',data: [
                                   {id: '出租',text: '出租'},
                                   {id: '出售',text: '出售'},
                                   {id: '租售结合',text: '租售结合'}]"
                                    runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">经营业态</label>
                            <div class="col-sm-3 col-xs-3">
                                <input id="BusinessFormName" name="BusinessFormName" class="easyui-textbox"
                                    data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelBusinessForm();}"
                                    runat="server" />
                                <input type="hidden" id="BusinessFormID" name="BusinessFormID" runat="server" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">租金均价从</label>
                            <div class="col-sm-3 col-xs-3">
                                <input type="text" id="RentQuoteStart" name="RentQuoteStart" class="easyui-numberbox" runat="server"
                                    data-options="width:'100%',min:0,precision:2" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">到</label>
                            <div class="col-sm-3 col-xs-3">
                                <input type="text" id="RentQuoteEnd" name="RentQuoteEnd" class="easyui-numberbox" runat="server"
                                    data-options="width:'100%',min:0,precision:2" />
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-group">
                        <div class="col-sm-12 col-xs-12" style="text-align: center">
                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadData();">确定筛选</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formSearch').form('clear')">清空</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="layout_center" data-options="region:'center',border:false" style="padding: 0px;">
            <div id="DistributionPie" style="height: 100%; width: 100%;"></div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
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

            InitPie([], []);
        });

        //选择物业细类
        function SelPropertyFinelines() {
            var param = {
                IsMultiple: "是",
                Type: "物业细类"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择物业细类", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let PropertyFinelinesID = "";
                    let PropertyFinelinesName = "";
                    data.forEach((itemRow) => {
                        PropertyFinelinesID = PropertyFinelinesID + itemRow.ID + ",";
                        PropertyFinelinesName = PropertyFinelinesName + itemRow.Name + ",";
                    });
                    if (PropertyFinelinesID.endsWith(",")) {
                        PropertyFinelinesID = PropertyFinelinesID.substring(0, PropertyFinelinesID.length - 1)
                        PropertyFinelinesName = PropertyFinelinesName.substring(0, PropertyFinelinesName.length - 1)
                    }

                    $("#PropertyFinelinesID").val(PropertyFinelinesID); // 
                    $("#PropertyFinelinesName").textbox("setValue", PropertyFinelinesName); //
                }
            });
        }

        //选择经营业态
        function SelBusinessForm() {
            var param = {
                IsMultiple: "是",
                Type: "经营业态"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择经营业态", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let BusinessFormID = "";
                    let BusinessFormName = "";
                    data.forEach((itemRow) => {
                        BusinessFormID = BusinessFormID + itemRow.ID + ",";
                        BusinessFormName = BusinessFormName + itemRow.Name + ",";
                    });
                    if (BusinessFormID.endsWith(",")) {
                        BusinessFormID = BusinessFormID.substring(0, BusinessFormID.length - 1)
                        BusinessFormName = BusinessFormName.substring(0, BusinessFormName.length - 1)
                    }
                    $("#BusinessFormID").val(BusinessFormID); // 
                    $("#BusinessFormName").textbox("setValue", BusinessFormName); //
                }
            });
        }

        //设置距离分组
        function DistanceClick() {
            LayerDialog.OpenWin('800', '500', '/HM/M_Main/Renting/Products/AnalysisDistribution/Edit.aspx', "距离分组设置", true, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                }
            });
        }

        //加载数据
        function LoadData() {
            $('#dlg_search').dialog('close');
            $.dataPostJson("Renting_Products_AnalysisDistribution", 'BuildingDistributionDataStructure', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        let Resultdata = $.parseJSON(data.data);
                        InitPie(Resultdata.LegendData, Resultdata.SeriesData)
                    } else { $.messager.alert("温馨提示", data.msg); }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function InitPie(LegendData, SeriesData) {
            let option = {
                title: {
                    text: '项目分布',
                    left: 'center',
                    top: 20,
                    textStyle: {
                        color: '#ccc'
                    }
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                legend: {
                    type: 'scroll',
                    orient: 'horizontal',
                    bottom: 10,
                    left: 'center',
                    //data: [
                    //    { name: '直接访问' },
                    //    { name: '邮件营销' },
                    //    { name: '联盟广告' },
                    //    { name: '视频广告' },
                    //    { name: '搜索引擎' }]
                    data: LegendData
                },
                series: [
                    {
                        name: '项目分布',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '50%'],
                        //data: [
                        //    { value: 1, name: '直接访问' },
                        //    { value: 2, name: '邮件营销' },
                        //    { value: 3, name: '联盟广告' },
                        //    { value: 4, name: '视频广告' },
                        //    { value: 5, name: '搜索引擎' }
                        //].sort(function (a, b) { return a.value - b.value; }),
                        data: SeriesData.sort(function (a, b) { return a.value - b.value; }),
                        roseType: 'radius',
                        label: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        },
                        itemStyle: {
                            normal: {
                                borderWidth: 4,
                                borderColor: '#ffffff'
                            }
                        },
                        animationType: 'scale',
                        animationEasing: 'elasticOut',
                        animationDelay: function (idx) {
                            return Math.random() * 200;
                        }
                    }
                ]
            };
            var dom = document.getElementById("DistributionPie");
            var myChart = echarts.init(dom, 'macarons');
            myChart.setOption(option);
        }
    </script>
</body>
</html>
