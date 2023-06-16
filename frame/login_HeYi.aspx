<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_HeYi.aspx.cs" Inherits="M_Main.frame.login_HeYi" %>

<!DOCTYPE html>
<!-- saved from url=(0030)https://www.tw369.com/login/ -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>合谊置地ERP信息平台</title>
    
    <!-- Bootstrap -->
    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <link rel="stylesheet" type="text/css" href="前端框架/bootstrap/bootstrap/css/bootstrap.min.css" />
    <!-- element.css -->
    <link rel="stylesheet" href="前端框架/index.css">
    <link rel="stylesheet" type="text/css" href="css/BaoLiIcon.css" />
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style scoped type="text/css">
        /*轮播图开始*/
        .Img-Number {
            border: 0px solid red;
            color: white;
            width: 100%;
            height: 30px;
            line-height: 30px;
            position: absolute;
            top: 80%;
            left: 30%;
        }

        .Img-Number ul {
            list-style: none;
        }

        .Img-Number ul li {
            float: left;
            margin-left: 20px;
        }

        .Img-Number ul li a {
            border: 0px solid red;
            display: inline-block;
            height: 20px;
            line-height: 20px;
            width: 20px;
            text-align: center;
            border-radius: 10px;
            color: white;
            background: #F39818;
            text-decoration: none;
        }
        /*轮播图结束*/
        .code {
    font-family: Arial;
    font-style: italic;
    color: blue;
    font-size: 30px;
    border: 0;
    border-radius:5px;
    padding: 2px 3px;
    letter-spacing: 3px;
    font-weight: bolder;
    float: left;
    cursor: pointer;
    width: 100%;
    height: 40px;
    line-height: 40px;
    text-align: center;
    vertical-align: middle;
    background-color: #D8B7E3;
}
        .el-checkbox   .el-checkbox { 
            margin-left: 15px; 
        }
    </style>
</head>

<body>
    <div id="app">
    
        <div class="container-fluid" style="border: 0px solid red; height: calc(100vh);">
            <div class="row bg-img" style="border: 0px solid red; height: 100%; background-image: url(HYZD/banner1.jpg); background-size: 100% 100%; background-repeat: no-repeat;">
                <div class="col-lg-8 col-md-8 col-sm-8" style="border: 0px solid red; height: 100%;">
                    <img src="HYZD/hoin.png" width="100px" height="85px" style="display: block; position: absolute; left: 40px; top: 40px;" />
                    <span class="font-one" style="">ERP</span>
                    <span class="font-two" style="">合谊置地ERP信息平台</span>
                    <div class="Img-Number">
                        <ul>
                            <li v-for="item in ImgNumber">
                                <a href="#" v-on:click="action(item.num)">{{item.num}}</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4" style="border: 0px solid red; height: 100%; padding: 0px;">
                    <div style="border: 0px solid red; height: 100%;">
                        <div class="bg-blur"></div>
                        <div class="bg-blur1"></div>
                       

                        <form id="LoginF" method="post" action="logining.aspx" onsubmit="return confirmLogin();">
                            <div class="content-Login">
                                <div class="content-Login-One">
                                    <span style="color: white; display: inline-block; font-size: 14px; font-weight: bold;">用户登录</span>
                                    <!--<span >用户登录</span>-->
                                   
                                </div>
                                
                                <div class="content-Login-Two">
                                    <el-input placeholder="用户名" prefix-icon="glyphicon glyphicon-user" id="AccountName" name="AccountName" style="width: 100%;"></el-input>
                                </div>
                                <div class="content-Login-Two" style="margin-top: 15px;">
                                    <el-input id="Password" name="Password" type="password" placeholder="密码" prefix-icon="glyphicon glyphicon-lock" style="width: 100%;"></el-input>
                                </div>
                                <div class="content-Login-Two" style="margin-top: 15px; text-align: right; display: none;">
                                    <el-select v-model="value" placeholder="自动选择">
											    <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
										    </el-select>
                                </div>
                                <div class="content-Login-Two" style="margin-top: 15px; width:120%">
                                    <el-checkbox><span style="color: white;font-size: 14px;">记住用户名</span></el-checkbox>
                                </div>
                                <div class="content-Login-Two">
                                    
                                    <button class="register btn btn-info" id="BtnLogin" hidefocus="true" style="width: 100%">登录</button>
                                    
                                    <input type="hidden" id="IsEncrypt" name="IsEncrypt" value="false" />
                                    <input name="CorpId" type="hidden" id="CorpId" value="6008" />
                                    <input type="hidden" id="IsBi" name="IsBi" value="0">
                                </div>
                                <div class="content-Login-Three"  style="margin-top: 15px;"><a href="#"  style="color: white; text-decoration: none;">系统客服热线：400-702-0018</a></div>
                                <div class="content-Login-Three" >
                                    <a  href="../frame/findPassword.aspx" style="color: white; text-decoration: none;">忘记密码？</a>
                                </div>
                                 <div class="content-Login-Three"  ><a href="http://www.firefox.com.cn/" target="_blank" style="color: white; text-decoration: none;">FirFox下载</a></div>
                                <div class="content-Login-Three"  ><a href="http://erp.polywuye.com/HM/M_Main/UploadFiles/HelpDocument/Activex.rar" style="color: white; text-decoration: none;">插件下载</a></div>
                                 
                                <div style="border:0px solid red;text-align:right;margin-top:-95px;">
                                    <div style="border:0px solid red;width:100%;">
                                        <img src="img/erweima.png" width="95px" /><br />
                                        <span style="color:white;font-size:12px;margin-top:4px;display:inline-block;margin-right:13px">下载物管APP</span>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <!--<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>-->
    <script src="前端框架/jQuery/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>-->
    <script src="前端框架/bootstrap/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <!-- vue.js -->
    <script src="前端框架/vue.js"></script>
    <!-- element.js-->
    <script src="前端框架/index.js"></script>
    <!-- layer.js -->
    <script src="前端框架/layer弹出层/layer-v3.1.1/layer/layer.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#AccountName").focus(function () {
                //console.log("这里是aaa获取焦点时的事件");
                $(this).parent().find("span i").css("color", "#52565A");
            });
            $("#AccountName").blur(function () {
                //console.log("这里是aaa失去焦点时的事件");
                $(this).parent().find("span i").css("color", "#C0C4CC");
            });
            $("#Password").focus(function () {
                //console.log("这里是bbb获取焦点时的事件");
                $(this).parent().find("span i").css("color", "#52565A");
            });
            $("#Password").blur(function () {
                //console.log("这里是bbb失去焦点时的事件");
                $(this).parent().find("span i").css("color", "#C0C4CC");
            });

        });

        //登录按钮点击事件
        function confirmLogin() {
            //获取用户名和密码
            var userName = $("#AccountName").val();
            var pwds = $("#Password").val();
            if (userName == "" && pwds == "") {
                layer.msg('用户名密码不能为空', { icon: 2 });
                $("#AccountName").parent().find("span i").css("color", "red");
                $("#Password").parent().find("span i").css("color", "red");
                return false;
            } else if (userName == "") {
                layer.msg('用户名不能为空', { icon: 2 });
                $("#AccountName").parent().find("span i").css("color", "red");
                return false;
            } else if (pwds == "") {
                layer.msg('密码不能为空', { icon: 2 });
                $("#Password").parent().find("span i").css("color", "red");
                return false;
            } else {
                return true;
            }
        }
        //背景图自动切换
        var i = 2;
        setInterval(function () {
            $(".bg-img").css("background-image", "url(HYZD/banner" + i + ".jpg)")
            //console.log(i);
            i++;
            if (i > 3) {
                i = 1;
            }
        }, 5000)

        var app = new Vue({
            el: '#app',
            data: {
                options: [{
                    value: '选项1',
                    label: '自动选择'
                }, {
                    value: '选项2',
                    label: 'XT5.0风格'
                }, {
                    value: '选项3',
                    label: 'XT3.0风格'
                }],
                value: '',
                ImgNumber: [
                    { "num": 1 },
                    { "num": 2 },
                    { "num": 3 }
                ]
            },
            methods: {
                action: function (nums) {
                    $(".bg-img").css("background-image", "url(HYZD/banner" + nums + ".jpg)");
                },
                checkinlist() { 
                   // alert(this.checked);
                    var IsBi = $("#IsBi").val();
                    if (IsBi == '1') {
                        $("#IsBi").val('0');
                    }
                    else {
                        $("#IsBi").val('1');
                    } 
                } 
            } 
        });
        //页面加载时，生成随机验证码
        window.onload = function () {
            //createCode(4);
        }

        //生成验证码的方法
        function createCode(length) {
            var code = "";
            var codeLength = parseInt(length); //验证码的长度
            var checkCode = document.getElementById("checkCode");
            ////所有候选组成验证码的字符，当然也可以用中文的
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
            //循环组成验证码的字符串
            for (var i = 0; i < codeLength; i++) {
                //获取随机验证码下标
                var charNum = Math.floor(Math.random() * 62);
                //组合成指定字符验证码
                code += codeChars[charNum];
            }
            if (checkCode) {
                //为验证码区域添加样式名
                checkCode.className = "code";
                //将生成验证码赋值到显示区
                checkCode.innerHTML = code;
            }
        }

        //检查验证码是否正确
        function validateCode() {
            //获取显示区生成的验证码
            var checkCode = document.getElementById("checkCode").innerHTML;
            //获取输入的验证码
            var inputCode = document.getElementById("inputCode").value;
            //console.log(checkCode);
            //console.log(inputCode);
            if (inputCode.length <= 0) {
                alert("请输入验证码！");
                return false;
            }
            else if (inputCode.toUpperCase() != checkCode.toUpperCase()) {
                alert("验证码输入有误！");
                createCode(4);
                return false;
            }
            else {
                //alert("验证码正确！");
                return true;
            }
        }
        
    </script>
</body>

</html>
