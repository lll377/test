<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTakeoverDetail.aspx.cs" Inherits="M_Main.InformationManage.ProjectTakeoverDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>项目接管详情</title>
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
    <script>
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
    <input type="hidden" id="OpType" name="OpType" />
    <div style="margin: 10px; display: block;">
        <form id="basicform" runat="server">
          <input type="hidden" id="IID" runat="server" name="IID" />
         <input type="hidden" id="ParentId" runat="server" name="ParentId" />
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目合同/接管信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>

                        <td class="title"><span>接管时间</span></td>
                        <td class="text">
                            <input id="TakeOverTime" runat="server" name="TakeOverTime" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                    <tr>

                        <td class="title"><span>接管面积(㎡)</span></td>
                        <td class="text">
                            <input id="TakeOverArea" runat="server" name="TakeOverArea" class="easyui-textbox" data-options="required:true,validType:'intOrFloat',tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                        <td class="title"><span>管理口径接管面积(㎡)</span></td>
                        <td class="text">
                            <input id="ManageTakeOverArea" runat="server" name="ManageTakeOverArea" class="easyui-textbox" data-options="required:false,validType:'intOrFloat',tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                    </tr>

                </table>

            </fieldset>

        </form>


        <div style="height: 30px; display: block; text-align: center">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" runat="server" />
        </div>
    </div>


    <script type="text/javascript">



        function Save() {
            if ($('#basicform').form("validate")) {
                $.dataPostJson('ProjectBasicInformation', 'TakeOverDetailSave', $.getParam(), true, false,
                    function Init() {
                    },
                    function callback(data) {
                     if (data.msg == 'true') {
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


    </script>
</body>
</html>

