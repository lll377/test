<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTakeoverInformation.aspx.cs" Inherits="M_Main.InformationManage.ProjectTakeoverInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>项目接管信息</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/self-vilidate.js"></script>
    <script src="../jscript/help.js"></script>
    <script src="../jscript/jquery.form.js"></script>
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script>
         $.extend($.fn.validatebox.defaults.rules, {
            eqPwd: {
                validator: function (value, param) {
                    return value == $(param[0]).val();
                },
                message: '密码不一致！'
            },
            idcard: {// 验证身份证
                validator: function (value) {
                    return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
                },
                message: '身份证号码格式不正确'
            },
            minLength: {
                validator: function (value, param) {
                    return value.length >= param[0];
                },
                message: '请输入至少（2）个字符.'
            },
            length: {
                validator: function (value, param) {
                    var len = $.trim(value).length;
                    return len >= param[0] && len <= param[1];
                },
                message: "输入内容长度必须介于{0}和{1}之间."
            },
            phone: {// 验证电话号码
                validator: function (value) {
                    return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
                },
                message: '格式不正确,请使用下面格式:010-88888888'
            },
            mobile: {// 验证手机号码
                validator: function (value) {
                    return /^(13|15|18)\d{9}$/i.test(value);
                },
                message: '手机号码格式不正确'
            },
            intOrFloat: {// 验证整数或小数
                validator: function (value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message: '请输入正确的金额'
            },
            currency: {// 验证货币
                validator: function (value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message: '货币格式不正确'
            },
            qq: {// 验证QQ,从10000开始
                validator: function (value) {
                    return /^[1-9]\d{4,9}$/i.test(value);
                },
                message: 'QQ号码格式不正确'
            },
            integer: {// 验证整数
                validator: function (value) {
                    return /^[+]?[1-9]+\d*$/i.test(value);
                },
                message: '请输入整数'
            },
            age: {// 验证年龄
                validator: function (value) {
                    return /^(?:[1-9][0-9]?|1[01][0-9]|120)$/i.test(value);
                },
                message: '年龄必须是0到120之间的整数'
            },
            chinese: {// 验证中文
                validator: function (value) {
                    return /^[\Α-\￥]+$/i.test(value);
                },
                message: '请输入中文'
            },
            english: {// 验证英语
                validator: function (value) {
                    return /^[A-Za-z]+$/i.test(value);
                },
                message: '请输入英文'
            },
            unnormal: {// 验证是否包含空格和非法字符
                validator: function (value) {
                    return /.+/i.test(value);
                },
                message: '输入值不能为空和包含其他非法字符'
            },
            nospace: {//空白字符验证
                 validator: function (value) {
                    return !(/\s+/i.test(value));
                },
                message: '输入值不能包含包括空格、制表符、换页符'
            },
            username: {// 验证用户名
                validator: function (value) {
                    return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);
                },
                message: '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）'
            },
            faxno: {// 验证传真
                validator: function (value) {
                    return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
                },
                message: '传真号码不正确'
            },
            zip: {// 验证邮政编码
                validator: function (value) {
                    return /^[0-9]\d{5}$/i.test(value);
                },
                message: '邮政编码格式不正确'
            },
            ip: {// 验证IP地址
                validator: function (value) {
                    return /d+.d+.d+.d+/i.test(value);
                },
                message: 'IP地址格式不正确'
            },
            name: {// 验证姓名，可以是中文或英文
                validator: function (value) {
                    return /^[\Α-\￥]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
                },
                message: '请输入姓名'
            },
            msn: {
                validator: function (value) {
                    return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
                },
                message: '请输入有效的msn账号(例：abc@hotnail(msn/live).com)'
            }
        });
    </script>
    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        .bootstrap_table tr td.title {
            width: 14%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 36%;
            text-align: left;
        }
    </style>
</head>
<body>
    <input type="hidden" id="OpType" runat="server" name="OpType" />
    <div style="margin: 10px; display: block;">
        <form id="basicform" runat="server">
            <input type="hidden" id="IID" runat="server" name="IID" />
            <input type="hidden" id="ParentId" runat="server" name="ParentId" />

            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目接管详情</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                         <td class="title"><span>合同编号</span></td>
                        <td class="text">
                            <input type="text" id="ContractSign" name="ContractSign"  runat="server" class="easyui-textbox" style="width:250px;" data-options="required:true " 
                                 />
                        </td>
                        <td class="title"><span>合同名称</span></td>
                        <td class="text">
                            <input id="ContractName" runat="server" name="ContractName" class="easyui-textbox" data-options=" tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            <span>获得方式</span>
                        </td>
                        <td class="text">
                             <input id="GetMethod" runat="server" name="GetMethod" class="easyui-textbox" data-options=" tipPosition:'bottom',multiline:false,width:'250'" />
                          <%--  <select id="GetMethod" runat="server" name="GetMethod" class="easyui-combobox" data-options="required:true,width:100,panelHeight:80">
                                <option>新签合同</option>
                                <option>公司并购</option>
                            </select>--%>
                        </td>
                        <td class="title"><span>获得时间</span></td>
                        <td class="text">
                            <%--<input id="GetTime" runat="server" name="GetTime" class="easyui-textbox" data-options=" tipPosition:'bottom',multiline:false,width:'250'" />--%>
                            <input id="GetTime" runat="server" name="GetTime" class="easyui-datebox" data-options="required:true,disable:true,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>合同面积(㎡)</span></td>
                        <td class="text">
                            <input id="ContractArea" runat="server" name="ContractArea" class="easyui-textbox" data-options="validType:'intOrFloat',tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                        <td class="title"><span>管理口径合同面积(㎡)</span></td>
                        <td class="text">
                            <input id="ManageContractArea" runat="server" name="ManageContractArea" class="easyui-textbox" data-options="required:true,validType:'intOrFloat',tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>单年金额(元/年)</span></td>
                        <td class="text">
                            <input id="YearPrice" runat="server" name="YearPrice" class="easyui-textbox" data-options="required:false,validType:'intOrFloat',tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                        <td class="title"><span>是否接管</span></td>
                        <td class="text">
                            <select id="IsTakeOver" runat="server" name="IsTakeOver" class="easyui-combobox" data-options="required:true,width:100,panelHeight:80,onChange:function(newValue,oldValue){ TakeOverChange(newValue, oldValue)}">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>接管时间</span></td>
                        <td class="text">
                            <input id="TakeOverTime" runat="server" name="TakeOverTime" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>

                        <td class="title"><span>接管面积(㎡)</span></td>
                        <td class="text">
                            <label id="TakeOverArea" runat="server"></label>
<%--                            <input id="TakeOverArea" runat="server" name="TakeOverArea" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',multiline:false,width:'250'" />--%>

                        </td>

                    </tr>
                    <tr>
                        <td class="title"><span>管理口径接管面积(㎡)</span></td>
                        <td class="text">
                            <label id="ManageTakeOverArea" runat="server"></label>
<%--                            <input id="ManageTakeOverArea" runat="server" name="ManageTakeOverArea" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',multiline:false,width:'250'" />--%>

                        </td>
                        <td class="title"><span>是否终止</span></td>
                        <td class="text">
                            <select id="IsStop" runat="server" name="IsStop" class="easyui-combobox" data-options="required:true,width:100,panelHeight:80,onChange:function(newValue,oldValue){ StopChange(newValue, oldValue)}">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td class="title"><span>终止时间</span></td>
                        <td class="text">
                            <input id="StopTime" runat="server" name="StopTime" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                </table>

            </fieldset>

        </form>

        <fieldset class="frame-fieldset" style="width:98%">
            <legend class="frame-legend">项目接管详情</legend>
            <div id="mianScheme">
                <table id="dgScheme" border="0" cellspacing="0" cellpadding="0"></table>
            </div>
        </fieldset>

        <div style="height: 30px; display: block; text-align: center">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
        </div>
    </div>


    <script type="text/javascript">

        function TakeOverChange(newValue, oldValue) {
            if (newValue == "1") {
                $('#TakeOverTime').datebox({
                    required: true
                });
            }
            else {
                $('#TakeOverTime').datebox({
                    required: false
                });
            }
        }

        function StopChange(newValue, oldValue) {
            if (newValue == "1") {
                $('#StopTime').datebox({
                    required: true
                });
            }
            else {
                $('#StopTime').datebox({
                    required: false
                });
            }
        }


        $(function () {
            //InitControl();
            InitPage();

            if ($("#IsTakeOver").combobox('getValue') == "1") {
                $('#TakeOverTime').datebox({
                    required: true
                });
            }
            if ($("#IsStop").combobox('getValue') == "1") {
                $('#StopTime').datebox({
                    required: true
                });
            }

        });
        function SelSignContract() {
            HDialog.OpenWin("600", "400", '../DialogNew/SelSignContract.aspx?OpType=基础信息登记', "选择OA合同", false, function callback(_Data) {
                if (_Data != "") {
                    var data = $.parseJSON(_Data);
                    $('#ContractName').searchbox('setValue', data.htmc);
                    $('#ContractSign').searchbox('setValue', data.htbh);
                    $('#GetTime').textbox('setValue', data.hthqsj);
                    $('#GetMethod').textbox('setValue', data.GetMethod);
                    $('#ContractArea').textbox('setValue', data.ContractArea);
                }
            });
        }


        function InitPage() {
            InitDataGrid();
        }

        function Save() {
            if ($('#basicform').form("validate")) {

                $.dataPostJson('ProjectBasicInformation', 'TakeOverSave', $.getParam(), true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.msg == "true") {
                            $("#IID").val(data.data);
                            $.messager.alert('温馨提示', '保存成功');
                            LayerDialog.Close();
                        } else {
                        }
                    },
                    function completeCallback() {

                    }, function errorCallback() {

                    });
            }
        }


        var column = [[
            {
                field: 'TakeOverTime', title: '接管时间', width: 100, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'TakeOverArea', title: '接管面积(㎡)', width: 160, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'ManageTakeOverArea', title: '管理口径接管面积(㎡)', width: 160, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            }
        ]];

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#IID").val() == "") {
                        $.messager.alert('温馨提示', '请先保存基本信息');
                    }
                    else {
                        Edit("新增", '');
                    }

                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dgScheme").datagrid("getSelected");
                    if (row) {
                        Edit('编辑', row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#dgScheme").datagrid("getSelected");
                    if (row) {
                        Del(row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }
        ];


        var loadType = "Init";
        function InitDataGrid() {

            $("#dgScheme").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                height: 220,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                toolbar: toolbar,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("ProjectBasicInformation", "TakeOverDetailList", param);


                },
                onLoadSuccess: function (data) {
                    //$("#" + dgName).datagrid('resize');

                    //if (loadType == "Init") {
                    //    if (dgName == "dgScheme") { InitDataGrid("dgRecord", "签到记录", "Init"); }
                    //}

                },
                onLoadError: function (data) {

                }
            });

        }

        function Del(id) {
            $.dataPostJson('ProjectBasicInformation', 'TakeOverDetailDel', {"IID":id}, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.msg == "true") {
                        $.messager.alert("温馨提示", '删除成功!');
                    }
                    InitDataGrid();
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }


        function Edit(title, id) {
            var OpType = "Add";
            if (isValueNull(id)) { OpType = "Edit"; } else { id = ''; }
            var param = { "OpType": OpType, "IID": id, "ParentId": $("#IID").val() };
            LayerDialog.OpenWin('800', '600', '../InformationManage/ProjectTakeoverDetail.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
    </script>
</body>
</html>
