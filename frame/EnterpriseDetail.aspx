<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseDetail.aspx.cs" Inherits="M_Main.frame.EnterpriseDetail" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>企业内刊详情</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="favicon.ico"> <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight article">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="pull-right">
                            <button class="btn btn-white btn-xs" type="button">系统</button>
                            <button class="btn btn-white btn-xs" type="button">企业内刊</button>
                            <button class="btn btn-white btn-xs" type="button">内容</button>
                        </div>
                        <div class="text-center article-title">
                            <h1>
                                    <div id="Title" runat="server"></div>
                            </h1>
                        </div>
                        <div id="Content" runat="server"></div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
</body>

</html>