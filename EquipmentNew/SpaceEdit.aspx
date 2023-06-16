<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpaceEdit.aspx.cs" Inherits="M_Main.EquipmentNew.SpaceEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <%--<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>--%>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=PlhFWpA02aoURjAOpnWcRGqw7AI8EEyO"></script>

</head>
<body>
    <input type="hidden" name="CityWhere" id="CityWhere" value="成都" />
    <input type="hidden" name="path" id="path" runat="server" />
    <input type="hidden" id="InPopedom" name="InPopedom"/>
    <form id="frmFrom">
        <input type="hidden" name="EqCodesPath" id="EqCodesPath" />
        <div style="padding: 5px;">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr style="height: 37px">
                    <td class="title">
                        <a href="#" title="<p>温馨提示:</p><p>1、下方地图中找到正确点位位置并在点击地图上具体位置方可生成经纬度!</p><p>2、红色标注图标可进行拖拽!</p>" class="easyui-tooltip easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                        <span>机房坐标:</span>
                    </td>
                    <td class="text">
                        <input id="SpaceMap" name="SpaceMap" class="easyui-textbox" data-options="required:false,disabled:true" />
                    </td>
                    <td class="title">
                        <span>地址搜索(地图):</span>
                    </td>
                    <td class="text">
                        <span class="textbox" style="width: 335px; height: 20.4px;">
                            <input id="suggestId" name="suggestId" type="text" class="textbox-text" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 3px; padding-bottom: 3px; width: 328px;" />
                        </span>
                        <div id="searchResultPanel" style="height: auto; display: none;"></div>
                    </td>
                </tr>
                <tr>
                    <td class="text" colspan="4">
                        <div id="BaiduMap" style="height: 270px; width: 100%; border: 1px dashed red"></div>
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>项目名称:</span></td>
                    <td class="text">
                        <input id="CommID" name="CommID" class="easyui-textbox" data-options="required:true,disabled:true,width:'85%'" />
                    </td>
                    <td class="title"><span>序号:</span></td>
                    <td class="text">
                        <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true,width:'83%'" />
                        <%-- <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true,buttonText:'检测',buttonIcon:'icon-reload',onClickButton:function(){
                        GetIsSortRepeat();
                        ;}
                        " />&nbsp;&nbsp;<label id="lbl_SortRepeat"></label>--%>
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>机房名称:</span></td>
                    <td class="text">
                        <input id="SpaceName" name="SpaceName" class="easyui-textbox" data-options="required:true,width:'85%'" />
                    </td>
                    <td class="title"><span>所属设备系统:</span></td>
                    <td class="text">
                        <input id="SystemId" name="SystemId" class="easyui-textbox" data-options="prompt:'请单击右侧\'请选择\'按钮进行操作!',editable:false,tipPosition:'top',required:true,multiline:false,width:'85%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetSystem();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td class="title"><span>机房地址:</span></td>
                    <td class="text">
                        <input id="SpaceAddress" name="SpaceAddress" class="easyui-textbox" data-options="required:true,width:'85%'" />
                    </td>
                     <td class="title"><span>对应报事系统公区:</span></td>
                    <td class="text">
                        <input id="IncidentArea" name="IncidentArea" class="easyui-combobox" />
                    </td>
                </tr>
                <tr>
                    <td class="title">对应通用设备空间</td>
                    <td class="text">
                        <input id="SysSpaceId" name="SysSpaceId" class="easyui-combobox" />
                        <%--<input id="SysSpaceId" name="SysSpaceId" class="easyui-textbox" data-options="prompt:'请单击右侧\'请选择\'按钮进行操作!',editable:false,tipPosition:'top',multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){SelSysSpace();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />--%>
                    </td>
                    <td class="title"><span>机房编码:</span></td>
                    <td class="text">
                        <input id="SpaceNo" name="SpaceNo" class="easyui-textbox" data-options="required:true,width:'85%'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>备注:</span></td>
                    <td class="text" colspan="3">
                        <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,validType:'length[0,200]'" style="width: 94%;" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃" id="btnClose" onclick="Close();" />
        </div>
        <%--        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃" id="btnClose" onclick="Close();" />
        </div>--%>
    </form>
    <script type="text/javascript">

        //---------------------------------------------百度地图----------------------------------------
        //初始化地图
        function initMap() {
            //获取项目城市名称
            $.tool.DataPostJson('CsEquipment', 'GetCommAddress', $.JQForm.GetStrParam(),
                   function Init() {
                   },
                   function callback(data) {
                       console.log(data[0].City);
                       if (data.length > 0) {
                           $("#CityWhere").val(data[0].City);
                       }
                       createMap();//创建地图
                       setMapEvent();//设置地图事件
                       createSearch();
                   },
                   function completeCallback() {
                   }, function errorCallback() {
                   });

        }
        //创建地图函数
        function createMap() {
            var map = new BMap.Map("BaiduMap");//在百度地图容器中创建一个地图
            var mapValue = $("#SpaceMap").textbox("getValue");
            if (isValueNull(mapValue)) {
                var array = mapValue.split(',');
                var p = new BMap.Point(array[0], array[1]);
                window.map = map;//将map变量存储在全局
                createMarker(p);
                map.centerAndZoom(p, 18);
            } else {
                map.centerAndZoom($("#CityWhere").val(), 12);//设定地图的中心点和坐标并将地图显示在地图容器中
                window.map = map;//将map变量存储在全局
            }
        }

        //地图事件设置函数：
        function setMapEvent() {
            map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
            map.enableScrollWheelZoom();//启用地图滚轮放大缩小
            map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
            map.enableKeyboard();//启用键盘上下左右键移动地图
            map.enableContinuousZoom();//启用地图惯性拖拽，默认禁用
            map.enableInertialDragging();
            map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
            map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件

            //点击事件 红点标注位置
            map.addEventListener("click", function (e) {
                createMarker(e.point);
            });
        }
        var myValue;
        //展示搜索结果
        function createSearch() {
            var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
                {
                    "input": "suggestId",
                    "location": map
                });

            ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
                var str = "";
                var _value = e.fromitem.value;
                var value = "";
                if (e.fromitem.index > -1) {
                    value = _value.province + _value.city + _value.district + _value.street + _value.business;
                }
                str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

                value = "";
                if (e.toitem.index > -1) {
                    _value = e.toitem.value;
                    value = _value.province + _value.city + _value.district + _value.street + _value.business;
                }
                str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
                $("#searchResultPanel").html(str);
            });


            ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
                var _value = e.item.value;
                myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
                $("#searchResultPanel").html("onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue);
                searchPlace();
            });
        }

        //搜索
        function searchPlace() {
            function myFun() {
                var p = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                map.centerAndZoom(p, 18);
                createMarker(p);
            }
            var local = new BMap.LocalSearch(map, { //智能搜索
                onSearchComplete: myFun
            });
            local.search(myValue);
        }

        //创建红色标点
        function createMarker(p) {
            map.clearOverlays();//清空原来的标注
            $("#SpaceMap").textbox("setValue", p.lng + "," + p.lat);
            // var myIcon = new BMap.Icon("../images/Icons/meeting_point.png", new BMap.Size(35, 45));
            //marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat), { icon: myIcon });  // 创建标注，为要查询的地方对应的经纬度
            //var p = new BMap.Point(lng, lat);
            var marker = new BMap.Marker(p);  // 创建标注，为要查询的地方对应的经纬度
            marker.enableDragging();
            //marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
            marker.addEventListener("dragend", function (e) {  //拖动事件 
                $("#SpaceMap").textbox("setValue", e.point.lng + "," + e.point.lat);
            });
            map.addOverlay(marker);
        }

        //--------------------------------------------- 结束 百度地图----------------------------------------


        function GetSystem() {
            HDialog.Open('700', '450', '../EquipmentNew/SelSystem.aspx?type=more', '选择设备系统', true, function callback(data) {
                var array = data.split('|');
                $('#SystemId').textbox('setValue', array[0]);
                $('#SystemId').textbox('setText', array[1]);
            });
        }

        function SelSysSpace() {
            HDialog.Open('700', '450', '../EquipmentNew/SelSysSpace.aspx', '选择通用设备空间', true, function callback(data) {
                var array = data.split('|');
                $('#SysSpaceId').textbox('setValue', array[0]);
                $('#SysSpaceId').textbox('setText', array[1]);
            });
        }

        $(function () {
            PageInit();
        });
        function PageInit() {
            var ID = GetQueryString("ID");
            var CommID = GetQueryString("CommID");
            var CommName = GetQueryString("CommName");
            $("#ID").val(ID);
            $('#CommID').textbox('setValue', CommID);
            $('#CommID').textbox('setText', CommName);
            $('#InPopedom').val(CommID);
            $('#Sort').numberbox('textbox').attr('maxlength', 8);

            $('#IncidentArea').combobox({
                required: false,
                validType: ['comboBoxValid[\'#IncidentArea\']'],
                width: '83%',
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }],
                url: '/HM/M_Main/HC/DataGetControl.aspx',
                method: 'get',
                valueField: 'RegionalID',
                textField: 'RegionalPlace',
                onBeforeLoad: function (param) {
                    param.Method = 'DataGet';
                    param.Class = 'CsEquipment';
                    param.Command = 'GetIncidentArea';
                    param.CommID = CommID;
                }, onLoadSuccess: function () {
                    if (isValueNull(ID)) {
                        //编辑
                        LoadInfo();
                    } else {
                        $(".QRCodeCheck").hide();
                        //新增
                        initMap();//初始化地图
                    }
                }
            });
            $('#SysSpaceId').combobox({
                required: false,
                //validType: ['comboBoxValid[\'#SysSpaceId\']'],
                width: '83%',
                multiple:true,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }],
                url: '/HM/M_Main/HC/DataGetControl.aspx',
                method: 'get',
                valueField: 'ID',
                textField: 'Name',
                onBeforeLoad: function (param) {
                    param.Method = 'DataGet';
                    param.Class = 'CsEquipment';
                    param.Command = 'BindDictionary';
                    param.DType = '通用设备空间';
                }, onLoadSuccess: function () {
                }
            });
            $("#imgEqCodesPath").dblclick(function () {
                console.log(1);
            });

        }

        function GetIsSortRepeat() {
            var sort = $("#Sort").numberbox('getValue');
            if (!isValueNull(sort)) {
                $("#lbl_SortRepeat").text("请输入序号!").css("color", "red");
                return;
            }
            $.tool.DataPostJson('CsEquipment', 'GetIsSortRepeatSpace', $.JQForm.GetStrParam(),
                   function Init() {
                       $("#lbl_SortRepeat").text("正在检测...").css("color", "#666");
                   },
                   function callback(data) {
                       console.log(data);
                       if (!data.result) {
                           $("#lbl_SortRepeat").text("通过!").css("color", "red");
                       } else {
                           $("#lbl_SortRepeat").text(data.msg).css("color", "#399a28");
                       }
                   },
                   function completeCallback() {
                   }, function errorCallback() {
                   });
        }



        function LoadInfo() {
            $.tool.DataPostJson('CsEquipment', 'GetModelSpace', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    $('#frmFrom').form('load', data);
                    debugger;
                    $('#CommId').textbox('setValue', data.CommId);
                    $('#CommId').textbox('setText', data.CommName);
                    $('#SystemId').textbox('setValue', data.SystemId);
                    $('#SystemId').textbox('setText', data.SystemIdName);
                    $('#SpaceAddress').textbox('setValue', data.SpaceAddress);

                    console.log($('#path').val() + data.QRCodesPath);
                    $('#imgEqCodesPath').attr('src', $('#path').val() + "/EquipmentSpace/" + data.EqCodesPath);
                    initMap();//初始化地图
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#frmFrom').form("validate")) {
                $.tool.DataPostJson('CsEquipment', 'SaveSpace', $.JQForm.GetStrParam(),
                   function Init() {
                       $("#btnSave").attr("disabled", "disabled");
                   },
                   function callback(data) {
                       if (data.result) {
                           Close();
                       } else { $.messager.alert('温馨提示', data.msg); }
                   },
                   function completeCallback() {
                       $("#btnSave").removeAttr("disabled");
                   }, function errorCallback() {
                       $("#btnSave").removeAttr("disabled");
                   });
            }
        }

        function Close() {
            HDialog.Close();
        }
    </script>
</body>
</html>

