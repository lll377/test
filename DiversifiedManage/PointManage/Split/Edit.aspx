<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Split.Edit" %>


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
        .radius {
            background: #f9f9f9;
            border: 1px solid #eee;
            text-align: center;
            height: 29px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }

            .radius .control-text {
                height: 28px;
                line-height: 28px
            }

        .fixed-tip {
            background: #f9f9f9;
            border: 1px solid #eee;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            color: #000000;
            position: fixed;
            top: 233px;
            right: 10px;
            padding: 10px;
        }

        /*表格样式*/
        .tb {
            width: 230px;
            padding: 0;
            margin: 0;
            /*background: #fff;*/
        }

            .tb th, .tb td {
                text-align: center;
                /*margin: 0;*/
                padding: 10px;
                /*line-height: 30px;
                height: 30px;*/
                border: 1px solid #eee;
                vertical-align: middle;
                white-space: nowrap;
                word-break: keep-all;
            }

            .tb th {
                text-align: center;
                color: #707070;
                width: 50%;
                background: #f9f9f9;
            }

            .tb td {
                background: #fff;
            }
    </style>
</head>
<body>
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <input type="hidden" id="ChangeType" name="ChangeType" value="拆分" />
    <form id="mainForm" method="post" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">功能诠释:</legend>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <p><b>点位拆分功能诠释：</b>1、正在使用的点位/生成的新点位/合并的新点位禁止拆分。<sm style="color: red">(注:禁止拆分的点位系统已自动屏蔽)</sm></p>
                    <p style="text-indent: 110px">2、原点位被拆分后将进行逻辑删除。</p>
                    <p><b>取消拆分功能诠释：</b>1、正在使用的新点位&nbsp;(&nbsp;同时该点位同批次生成新点位&nbsp;)&nbsp;都将禁止取消拆分功能操作。</p>
                    <p style="text-indent: 110px">2、原点位生成的所有新点位都将全部删除，并记录到拆分历史。</p>
                    <p style="text-indent: 110px">3、新点位取消拆分后，原点位将还原。</p>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">第一步、选择原始点位</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">原点位编号</label>
                <div class="col-sm-11 col-xs-11">
                    <input type="hidden" id="ChangeID" name="ChangeID" />
                    <input id="ChangeNumber" name="ChangeNumber" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelChange();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#ChangeID').val('');
                            $('#Area').html('0.00');
                            $('#div_Point').html('');
                            }}] " />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">第二步、设置拆分点位</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">拆分数量</label>
                <div class="col-sm-11 col-xs-1" style="padding-right: 0">
                    <input id="Number" name="Number" class="easyui-numberbox" data-options="prompt:'范围 (2 - 200) 个!',required:true,tipPosition:'bottom',min:2,max:200" />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',width:100" onclick="Create();">创建新点位</a>
                    <label class="control-text" style="color: red;">&nbsp;温馨提示:点击保存后，创建的新点位才会生效。</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-6 col-xs-6 control-label" style="text-align: center;">新点位编号</label>
                <label class="col-sm-6 col-xs-6 control-label" style="text-align: left; padding-left: 35px;">新点位面积(平米)</label>
            </div>
            <div id="div_Point">
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
    <div style="height: 30px"></div>
    <div class="fixed-tool-btn">
        <input type="hidden" name="ID" id="ID" runat="server" />
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="SaveCheck();">保&nbsp;存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
    </div>
    <div class="fixed-tip" class="tb">
        <table class="tb">
            <tr>
                <th>拆分面积合计(㎡)</th>
                <th>原点位面积(㎡)</th>
            </tr>
            <tr>
                <td id="AreaStatistic">0.00</td>
                <td id="Area">0.00</td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function SelChange() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Point.aspx?' + $.param({ "IsCheckbox": "否" ,"OriginalPoint": "是"}), '选择点位', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#ChangeID").val(data.ID);
                    $("#ChangeNumber").textbox('setValue', data.Number);
                    $("#Area").html(data.Area);
                    $('#div_Point').html('');
                }
            });
        }
        $(function () {
            InitPage();
        });

        function InitPage() {

        }


        function Create() {
            var changeNumber = $("#ChangeNumber").textbox('getValue');
            if (!changeNumber) {
                $.messager.alert('温馨提示', "请先选择原点位编号!");
                return;
            }
            var num = $("#Number").textbox('getValue');
            if (!num) {
                $.messager.alert('温馨提示', "请先选择拆分数量!");
                return;
            }
            var html = "", tempNumber = "";
            for (var i = 0; i < num; i++) {
                tempNumber = changeNumber + "[F" + (i + 1) + "]";
                html += "<div class=\"form-group\"><div class=\"col-sm-6 col-xs-6 radius\"><label class=\"control-text \">" + tempNumber + "</label></div><div class=\"col-sm-6 col-xs-6\"><input id=\"Number_" + i + "\" name=\"Number_" + i + "\" number=\"" + tempNumber + "\" class=\"easyui-numberbox nb\"data-options=\"required:true,tipPosition:'bottom',min:0,value:'0'\"/></div></div>";
            }
            $("#div_Point").html(html);
            $('.nb').numberbox({
                required: true, tipPosition: 'bottom', precision: '2', value: '0', min: 0, suffix: ' ㎡', onChange: function (newValue, oldValue) {
                    AreaStatistic();
                }
            });
            $('#AreaStatistic').html('0.00');
        }
        function AreaStatistic() {
            var total = 0;
            $.each($('.nb'), function (i, item) {
                total = NumAdd(total, $(item).val());
            });
            if (parseFloat(total) > parseFloat($("#Area").html())) {
                total = "<sm style='color:red'>" + total + "</sm>";
            }
            $("#AreaStatistic").html(total);

        }
        function NumAdd(num1, num2) {
            var baseNum, baseNum1, baseNum2;
            try {
                baseNum1 = num1.toString().split(".")[1].length;
            } catch (e) {
                baseNum1 = 0;
            }
            try {
                baseNum2 = num2.toString().split(".")[1].length;
            } catch (e) {
                baseNum2 = 0;
            }
            baseNum = Math.pow(10, Math.max(baseNum1, baseNum2));
            var precision = (baseNum1 >= baseNum2) ? baseNum1 : baseNum2;//精度
            return ((num1 * baseNum + num2 * baseNum) / baseNum).toFixed(precision);;
        };
        function SaveCheck() {
            if ($('#mainForm').form("validate")) {
                var total = 0, pointData = [];
                $.each($('.nb'), function (i, item) {
                    pointData.push({ "Number": $(item).attr("number"), "Area": $(item).val() });
                    total = NumAdd(total, $(item).val());
                });
                if (pointData.length == 0) {
                    $.messager.alert('温馨提示', "请创建新点位!");
                    return;
                }
                if (parseFloat(total) != parseFloat($("#Area").html())) {
                    $.messager.confirm('确定', '新面积之和不等于原点位面积确定保存?', function (r) {
                        if (r) {
                            Save(pointData);
                        }
                    });
                }
                else {
                    Save(pointData);
                }
            }
        }

        function Save(pointData) {
            var param = $.getParam();
            param.PointData = JSON.stringify(pointData);
            console.log(param);
            $.dataPostJson('DivfManage_Point_Split_Merge', 'SaveSplit', param, true, false,
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
        function Close() {
            LayerDialog.Close();
        }


    </script>
</body>
</html>
