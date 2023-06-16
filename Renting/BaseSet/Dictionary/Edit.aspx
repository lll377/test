<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.BaseSet.Dictionary.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-字典设置编辑页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="ClassName" name="ClassName" value="Renting_Dictionary" />
    <input type="hidden" id="OpType" name="OpType" />
    <form id="mainForm" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">基础信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">序号</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true,tipPosition:'bottom',value:'0',width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">类型</label>
                <div class="col-sm-10 col-xs-10">
                   <%-- <input id="Type" name="Type" class="easyui-combobox"
                        data-options="required:true,editable:true,tipPosition:'bottom',panelHeight:'140px',width:'100%',multiple:false,
                                    valueField:'id',textField:'text',data: [
                                        {id: '物业细类',text: '物业细类'},{id: '经营业态',text: '经营业态'},{id: '跟进阶段',text: '跟进阶段'},{id: '经营品牌',text: '经营品牌'},
                                        {id: '品牌代理级别',text: '品牌代理级别'},{id: '主营车型',text: '主营车型'},{id: '经营地址',text: '经营地址'},{id: '退租原因',text: '退租原因'}],onHidePanel:TypeHidePanel"
                        runat="server" />--%>
                     <input id="Type" name="Type" class="easyui-combobox"
                        data-options="required:true,editable:true,tipPosition:'bottom',panelHeight:'140px',width:'100%',multiple:false,
                                    valueField:'id',textField:'text',data: [
                                        {id: '物业细类',text: '物业细类'},{id: '经营业态',text: '经营业态'},{id: '跟进阶段',text: '跟进阶段'},{id: '退租原因',text: '退租原因'}],onHidePanel:TypeHidePanel"
                        runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">名称</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Name" name="Name" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">编码</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Code" name="Code" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">备注</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true" />
                </div>
            </div>
        </fieldset>
        <div class="form-group">
            <div class="col-sm-12 col-xs-12 control-btn">
                <input type="hidden" name="TimeStampToBigInt" id="TimeStampToBigInt" />
                <input type="hidden" name="ID" id="ID" runat="server" />
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="Close();">关闭返回</a>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            InitPage();
        });

        function InitPage() {
            var param = $.getUrlParam();
            $.setParam(param);
            if (param.OpType == "Edit") {
                InitData();
            } else {
                GetMaxSort();
            }
        }
        function GetMaxSort(Type) {
            if (Type == null) {
                Type = $("#Type").val();
            }
            $.dataPostJson($("#ClassName").val(), 'GetMaxSort', { "Type": Type }, true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function InitData() {
            $.dataPostJson($("#ClassName").val(), 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.dataPostJson($("#ClassName").val(), 'Save', $.getParam(), true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $('#mainForm').form('clear');
                            LayerDialog.Close("true");
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }
        function Close() {
            LayerDialog.Close("");
        }

        function TypeHidePanel() {
            var _options = $(this).combobox('options');
            var _data = $(this).combobox('getData');/* 下拉框所有选项 */
            var _value = $(this).combobox('getValue');/* 用户输入的值 */
            var _b = false;/* 标识是否在下拉列表中找到了用户输入的字符 */
            for (var i = 0; i < _data.length; i++) {
                if (_data[i][_options.valueField] == _value) {
                    _b = true;
                    break;
                }
            }
            if (!_b) {
                $(this).combobox('setValue', '');
            }
        }

    </script>
</body>
</html>
