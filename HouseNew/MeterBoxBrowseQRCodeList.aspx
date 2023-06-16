<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeterBoxBrowseQRCodeList.aspx.cs" Inherits="M_Main.HouseNew.MeterBoxBrowseQRCodeList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/EquimentDictionaryCanNull.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <style type="text/css">
        #divContent div {
            margin: 0px auto;
            width: 28%;
            height: 29%;
            float: left;
            text-align: center;
            border: 1px dashed #BBBBBB;
        }

            #divContent div img {
                width: 63.5%;
                height: 44%;
                margin: 20px 0px 0px 0px;
            }

            #divContent div label {
                width: 100%;
                min-height:24px;
                max-height:53px;
                line-height: 24px;
                text-align:center;
                display:block;
                overflow:hidden;
                white-space:pre-wrap;
                /*margin-left:10%;*/
                font-size:13px;
                
            }

        #divContent {
            width: 794px;
            height: 1090px;
            margin:0px auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="divBool" name="divBool" value="0" />
        <div id="divContent" runat="server"></div>
        <script type="text/javascript">
            if ($("#divBool").val() == "1")
            {
                $('#divContent').find('div').css("height", "270");
            }
        </script>

    </form>
</body>
</html>

