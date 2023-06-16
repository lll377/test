<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Point.Edit" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>点位登记</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-2.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
       
    </style>
</head>
<body>
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <input type="hidden" id="DisableTime" name="DisableTime" />
    <input type="hidden" id="OpType" name="OpType" />
    <form id="mainForm" method="post" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">点位信息</legend>
            <div class="form-group">
                <div class="col-sm-1 col-xs-1 control-label">序号</div>
                <div class="col-sm-5 col-xs-5">
                    <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true,tipPosition:'bottom',value:'0',disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">点位类型</label>
                <div class="col-sm-5 col-xs-5" style="padding-right: 0">
                    <input id="Type" name="Type" class="easyui-combobox" />
                    <div id="div_OptNumber" style="display: inline-block;">
                        <label class="control-text" id="lbl_OptNumber"></label>
                        <input type="hidden" id="OptID" name="OptID" />
                        <input id="OptNumber" name="OptNumber" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'204',validType:'ajaxCheckRepeatData[\'DivfManage_Point\',\'CheckData\',\'OptNumber\',\'IsDelete\',\'0\',\'ID\',\'#ID\']',invalidMessage:'当前编号已被录入,不能重复录入!',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelOptNumber();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#OptID').val('');
                            }}] " />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">点位类别</label>
                <div class="col-sm-5 col-xs-5">
                    <input type="hidden" id="CategoryID" name="CategoryID" />
                    <input id="CategoryName" name="CategoryName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCategory();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#CategoryID').val('');
                            }}] " />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">点位区域</label>
                <div class="col-sm-5 col-xs-5">
                    <input type="hidden" id="RegionID" name="RegionID" />
                    <input id="RegionName" name="RegionName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRegion();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#RegionID').val('');
                            }}] " />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">点位编号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Number" name="Number" class="easyui-textbox" data-options="required:true,disabled:true,tipPosition:'bottom',width:'100%',validType:'unnormal'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">点位名称</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Name" name="Name" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">点位位置</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Position" name="Position" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">所属楼宇</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="StoreyLayer_BuildSNum" name="StoreyLayer_BuildSNum" type="hidden" />
                    <input id="StoreyLayer_UnitSNum" name="StoreyLayer_UnitSNum" type="hidden" />
                    <input id="StoreyLayer_FloorSNum" name="StoreyLayer_FloorSNum" type="hidden" />
                    <input id="StoreyLayer" name="StoreyLayer" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelStoreyLayer();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#StoreyLayer_BuildSNum').val('');
                            $('#StoreyLayer_UnitSNum').val('');
                            $('#StoreyLayer_FloorSNum').val('');
                            }}] " />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">点位面积</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Area" name="Area" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',value:'0',min:0,suffix:' ㎡'" />
                    <label class="control-text">(单位:平米)</label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">点位尺寸</label>
                <div class="col-sm-5 col-xs-5">
                    <label class="control-text">长</label>
                    <input id="SizeLength" name="SizeLength" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',value:'0',min:0,suffix:' cm'" />
                    <label class="control-text">宽</label>
                    <input id="SizeWidth" name="SizeWidth" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',value:'0',min:0,suffix:' cm'" />
                    <label class="control-text">高</label>
                    <input id="SizeHeight" name="SizeHeight" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',value:'0',min:0,suffix:' cm'" />
                    <label class="control-text">(单位:厘米)</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">是否安装表计</label>
                <div class="col-sm-5 col-xs-5">
                    <%--<input type="hidden" id="IsInstall" name="IsInstall" value="否" />--%>
                    <input id="IsInstall" name="IsInstall" class="easyui-switchbutton sf" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">是否停用</label>
                <div class="col-sm-5 col-xs-5">
                    <%--<input type="hidden" id="IsDisable" name="IsDisable" value="否" />--%>
                    <input id="IsDisable" name="IsDisable" class="easyui-switchbutton sf" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">备注</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'100%',height:'50px'" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">点位图片</legend>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="padding-left: 10px">
                    <div id="fileForm">
                        <input type="hidden" name="FileType" id="FileType" />
                        <input type="hidden" name="FilePath" id="FilePath" />
                        <input type="hidden" name="FileCode" id="FileCode" />
                        <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="required:false,width:'200px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                        <input id="FileRemark" name="FileRemark" class="easyui-textbox" data-options="required:false,width:'250px',prompt:'文件备注(选填)',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                        <a href="javascript:void(0)" onclick="SaveFile()" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80">上传</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="<div><p>1、文件限制最大为2M。</p><p>2、文件新增/删除后点击保存才会生效。</p></div>" data-options="plain:true,iconCls:'icon-help'"></a>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="padding: 0; padding-left: 10px" id="list_up_img">
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">点位规划信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">招商规划</label>
                <div class="col-sm-5 col-xs-5">
                    <input type="hidden" id="TradePlanID" name="TradePlanID" />
                    <input id="TradePlanName" name="TradePlanName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#TradePlanID').val('');
                            }}] " />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">计费单位</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="CalculateCostUnit" name="CalculateCostUnit" class="easyui-combobox" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">指导价格</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Price" name="Price" class="easyui-numberbox" data-options="required:true,tipPosition:'bottom',value:'0',groupSeparator:',',precision:'2',suffix:' ¥'" />
                    <label class="control-text">(单位:元)</label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">价格单位</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="PriceUnit" name="PriceUnit" class="easyui-combobox" />
                    <label class="control-text" id="lblCalculateCostUnit"></label>
                </div>
            </div>
        </fieldset>
        <%--<div class="form-group">
            <div class="col-sm-12 col-xs-12 control-btn">
                <input type="hidden" name="ID" id="ID" runat="server" />
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
            </div>
        </div>--%>
    </form>
    <div style="height: 50px"></div>
    <div class="fixed-tool-btn">
        <input type="hidden" name="ID" id="ID" runat="server" />
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
    </div>
    <script type="text/javascript">
        function SelOptNumber() {
            var typeValue = $("#Type").combobox('getValue');
            var pagePath = "/HM/M_Main/DiversifiedManage/Dialog/Room.aspx";
            if (typeValue == "车位") {
                pagePath = "/HM/M_Main/DiversifiedManage/Dialog/Park.aspx";
            }
            LayerDialog.OpenWin('1000', '500', pagePath, '选择' + typeValue, true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var val = "", id = "";
                    if (typeValue == "房屋") {
                        id = data.RoomID;
                        val = data.RoomSign;
                        $("#Name").textbox('setValue', data.RoomName);
                        $("#Area").numberbox('setValue', data.BuildArea);
                        //$('#StoreyLayer_BuildSNum').val(data.BuildSNum);
                        //$('#StoreyLayer_UnitSNum').val(data.UnitSNum);
                        //$('#StoreyLayer_FloorSNum').val(data.FloorSNum);
                        var storeyLayer = data.BuildName + "-" + data.UnitSNum + "单元-" + data.FloorSNum + "楼";
                        ControlStoreyLayer(false, storeyLayer);
                    } else {
                        id = data.ParkID;
                        val = data.ParkName;
                        $("#Name").textbox('setValue', data.ParkName);
                        $("#Area").numberbox('setValue', data.ParkArea);
                        ControlStoreyLayer(true, '');
                    }
                    $('#OptID').val(id);
                    $("#OptNumber").textbox('setValue', val);
                    //$("#Number").textbox('setValue', val);
                }
            });
        }
        function SelDictionary() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": "招商规划" }), '选择招商规划', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#TradePlanID").val(data.ID);
                    $("#TradePlanName").textbox('setValue', data.Name);
                }
            });
        }

        function SelCategory() {
            var type = $("#Type").combobox('getValue');
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Category.aspx?' + $.param({ "Type": type }), '选择点位类别', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#CategoryID").val(data.ID);
                    $("#CategoryName").textbox('setValue', data.Name);
                    if (type == "广告" || type == "场地") {
                        $("#Name").textbox('setValue', data.Name);
                    }
                    var param = $.getParam();
                    param.CategoryID = data.ID
                    if ($("#OpType").val() == "Add") {
                        $.dataPostJson('DivfManage_Point', 'GetPointCode', param, true, false,
                            function Init() {
                            },
                            function callback(result) {
                                if (result.result) {
                                    $("#Number").textbox('setValue', result.data);
                                } else {
                                    $.messager.alert('温馨提示', "获取编码前缀数据失败!");
                                }

                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }

                }
            });
        }

        function SelRegion() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Region.aspx', '选择点位区域', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#RegionID").val(data.ID);
                    $("#RegionName").textbox('setValue', data.Region);
                }
            });
        }

        function SelStoreyLayer() {
            LayerDialog.OpenWin('400', '500', '/HM/M_Main/DiversifiedManage/Dialog/StoreyLayer.aspx', '选择所属楼宇', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    //var storeyLayer = data.BuildName + "-" + data.UnitSNum + "单元-" + data.FloorSNum + "层";
                    $("#StoreyLayer").textbox('setValue', data.attributes.Location);
                    $('#StoreyLayer_BuildSNum').val(data.attributes.BuildSNum);
                    $('#StoreyLayer_UnitSNum').val(data.attributes.UnitSNum);
                    $('#StoreyLayer_FloorSNum').val(data.attributes.FloorSNum);
                }
            });
        }

        function ControlOptNumber(isShow, text) {
            if (isShow) {
                $("#div_OptNumber").show();
                $("#OptNumber").combobox('enable');
            } else {
                $("#div_OptNumber").hide();
                $("#OptNumber").combobox('disable');
            }
            $("#lbl_OptNumber").text(text + "编号");
            $("#OptNumber").textbox('setValue', "");
            $('#OptID').val('');
        }

        function ControlStoreyLayer(isEnable, value) {
            if (isEnable) {
                $("#StoreyLayer").textbox('enable').textbox('setValue', value);
            } else {
                $("#StoreyLayer").textbox('disable').textbox('setValue', value);
            }
        }

        $(function () {
            InitPage();
        });

        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            $("#OpType").val(OpType);
            InitControl();
            if (OpType == "Edit") {
                $("#ID").val(ID);
                InitData();
                $("#Type").combobox('disable');
                $("#CategoryName").textbox('disable');
            } else {
                GetMaxSort();
                $("#IsDisable").switchbutton('disable');
                ControlOptNumber(false, '');
            }

        }
        function GetMaxSort() {
            $.dataPostJson('DivfManage_Point', 'GetMaxSort', { "IsLevel": "是" }, true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function InitControl() {

            var data = [{ id: '房屋', text: '房屋' }, { id: '车位', text: '车位' }, { id: '广告', text: '广告' }, { id: '场地', text: '场地' }];
            $('#Type').combobox({
                editable: false,
                required: true,
                width: '100px',
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                        ControlOptNumber(false, '');
                    }
                }],
                onSelect: function (record) {
                    if (record.text == "房屋") {
                        ControlStoreyLayer(false, '');
                        ControlOptNumber(true, record.text);
                    } else if (record.text == "车位") {
                        ControlStoreyLayer(true, '');
                        ControlOptNumber(true, record.text);
                    } else {
                        ControlStoreyLayer(true, '');
                        ControlOptNumber(false, record.text);
                    }
                }
            });

            $('.sf').switchbutton({
                handleText: '否',
                value: '否',
                onText: '',
                offText: '',
                onChange: function (checked) {
                    var val = '否';
                    if (checked) {
                        val = "是";
                        $("#DisableTime").val($.dateFormat(new Date()));
                    } else {
                        $("#DisableTime").val('');
                    }
                    $(this).next('span').find('.switchbutton-handle').html(val);
                    $(this).val(val);
                }
            });

            var data = [{ id: '个', text: '个' }, { id: '平米', text: '平米' }];
            $('#CalculateCostUnit').combobox({
                editable: false,
                required: true,
                //width: '100%',
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                        $("#lblCalculateCostUnit").html('');
                    }
                }],
                onChange: function (newValue, oldValue) {
                    $("#lblCalculateCostUnit").html(" / " + newValue);
                }
            });

            var data = [{ id: '日', text: '日' }, { id: '月', text: '月' }, { id: '季', text: '季' }, { id: '年', text: '年' }];
            $('#PriceUnit').combobox({
                editable: false,
                required: false,
                //width: '100%',
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });

        }
        function InitData() {
            $.dataPostJson('DivfManage_Point', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                    if (data.IsInstall == "是") { $('#IsInstall').switchbutton('check'); } else { $('#IsInstall').switchbutton('uncheck'); }
                    if (data.IsDisable == "是") { $('#IsDisable').switchbutton('check'); } else { $('#IsDisable').switchbutton('uncheck'); }
                    InitDataFileAnnex(data.ID);

                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function InitDataFileAnnex(AttachedID) {
            $.dataPostJson('DivfManage_FileAnnex', 'GetListDataTable', { "AttachedID": AttachedID }, true, false,
                function Init() {
                },
                function callback(data) {
                    AppendImg(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            var param = $.getParam();

            var fileData = [];
            $('img[filename]').each(function (i, item) {
                fileData.push({ "FileName": $(this).attr("filename"), "FileSize": $(this).attr("filesize"), "FullPath": $(this).attr("src"), "FileRemark": $(this).attr("fileremark") });
            });

            param.FileData = JSON.stringify(fileData);
            console.log(param);
            if ($('#mainForm').form("validate")) {
                $.dataPostJson('DivfManage_Point', 'Save', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $('#mainForm').form('clear');
                            Close();
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }
        function Close() {
            LayerDialog.Close();
        }




        //上传附件
        function SaveFile() {
            var file = $("input[name='uploadFile']")[0].files[0];
            if (!file) {
                $.messager.alert('温馨提示', '请选择文件!');
            }
            var FileRemark = $("#FileRemark").textbox('getValue');
            //if (!$("#fileForm").form('validate')) { return false; };
            //var file = $("input[name='uploadFile']")[0].files[0];
            var maxsize = 2 * 1024 * 1024;
            var tipFileSize = 2;
            var fileType = file.type;
            var fileSize = file.size;
            var fileName = file.name;

            if (fileType != "image/bmp" && fileType != "image/jpeg" && fileType != "image/png" && fileType != "image/gif") {
                $.messager.alert('温馨提示', '图片格式不正确!', 'error');
                return false;
            }
            if (fileSize > parseInt(maxsize)) {
                $.messager.alert('温馨提示', "不能上传超过" + tipFileSize + "M的附件！", 'error');
                return false;
            }
            var lastIndex = fileName.lastIndexOf(".");
            var suffix = fileName.substr(lastIndex + 1);//后缀

            var formData = new FormData();
            formData.append('file', file);
            formData.append('CorpId', "1862");
            formData.append('ExtName', suffix);
            formData.append('DicName', "");
            $.ajax({
                //url: "http://localhost:1241/HM/FileUpload/FileUpload.aspx",
                url: "/HM/M_Main/FileTransferred/FileTransferred.ashx",
                type: 'post',
                cache: false,
                processData: false,
                contentType: false,
                dataType: "json",
                async: false,
                data: formData,
                beforeSend: function (xhr) { $.messager.progress({ title: "温馨提示", msg: "正在上传...", interval: 3000 }); },
                success: function (data, status) {
                    if (data.result) {
                        var lastIndex = data.data.lastIndexOf("/");
                        var fileName = data.data.substr(lastIndex + 1);//后缀
                        var jsonData = [{ "FullPath": data.data, "FileName": fileName, "FileSize": fileSize, "FileRemark": FileRemark }];
                        AppendImg(jsonData);
                        $("#uploadFile").filebox('clear');
                        $("#FileRemark").textbox('clear');
                    } else {
                        $.messager.alert('错误', "图片服务器发生错误!", 'error');
                    }
                    $.messager.progress('close');
                },
                error: function (data) {
                    $.messager.alert('错误', "图片服务器发生错误!", 'error');
                    $.messager.progress('close');
                }
            });
            return false;
        }

        function AppendImg(arr) {
            if (!!arr) {
                var html = "", FileSize = '';
                $.each(arr, function (i, item) {
                    FileSize = Number((parseFloat(item.FileSize) / 1024).toString()).toFixed(2);
                    html += "<div class=\"list_up_img\"><a href=\"" + item.FullPath + "\"  target=\"_blank\"><img filename=\"" + item.FileName + "\" filesize=\"" + item.FileSize + "\" fileremark=\"" + item.FileRemark + "\" src=\"" + item.FullPath + "\" title=\"<div><p style='text-align:center'>(点击查看原图)</p><p>文&nbsp;&nbsp;件&nbsp;&nbsp;名:" + item.FileName + "</p><p>文件大小:" + FileSize + "KB</p><p>文件备注:" + item.FileRemark + "</p></div>\" class=\"easyui-tooltip\" /></a><a onclick=\"javascript:$(this).parent().remove();\"href=\"javascript:void(0);\"title=\"删除\"class=\"btn_del\"></a></div>";
                });
                console.log(html);
                $("#list_up_img").append(html);
                $(".easyui-tooltip").tooltip();
            }
        }
    </script>
</body>
</html>
