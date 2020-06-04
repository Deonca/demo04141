<%--
  Created by IntelliJ IDEA.
  User: zhaohaiyang
  Date: 2020/5/8
  Time: 上午9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>共享系统登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/zui/1.9.1/css/zui.min.css">

    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            margin: 0 auto;
            padding: 0 auto;
        }

        body {
            background: #0F769D;
            text-align: center;
        }

        .title {
            width: 100%;
            height: 100px;
            font-size: 25px;
            line-height: 100px;
        }

        .input-text.size-L, .btn.size-L {
            font-size: 16px;
            height: 41px;
            padding: 8px;
        }

        .input-text {
            box-sizing: border-box;
            border: solid 1px #ddd;
            width: 100%;
            -webkit-transition: all .2s linear 0s;
            -moz-transition: all .2s linear 0s;
            -o-transition: all .2s linear 0s;
            transition: all .2s linear 0s;
        }

        .loginBtn {
            background: #12b5b0;
            height: 40px;
            text-align: center;
            color: #fff;
            font-size: 20px;
            margin-top: 20px;
            width: 150px;
            border-radius: 0px;
            padding: 0px 0px;
            border-radius: 30px;
        }

        .formControls {
            text-align: center;
            margin: 10px 20px 0 20px;
            clear: both;
        }


        .loginDiv {
            background: #fff;
            position: relative;
            width: 60%;
            min-width: 380px;
            max-width: 500px;
            border-radius: 20px;
            height: 400px;
            top: 50%;
            margin: 0 auto;
            margin-top: -200px;
            padding-left: 20px;
            padding-right: 20px;
        }
        #messageBox {
            color: red;
            text-align: left;
        }
    </style>

    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"> </script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"> </script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/zui/1.9.1/js/zui.min.js"></script>
    <script type="text/javascript">

        var msg=new $.zui.Messager('这是一个浮动消息。', {
            icon: 'bell', // 定义消息图标
            placement: 'center' // 定义显示位置
        });
        $(document).ready(function(){

            $("#btnLogin").click(function () {
                if (!validate()) {
                    return;
                }
                $.ajax({
                    url: "../LoginServlet",
                    type: 'POST',
                    dataType: 'json',//预期服务器返回的数据类型text、json
                    data: {
                        username: $("#username").val(),
                        pwd: $("#pwd").val()
                    },
                    success: function (data, textStatus, xhr) {
                        if (data.code == "00") {
                            window.location.href = "../admin/index.html";
                        } else {
                            msg.show(data.message);
                        }
                    },
                    beforeSend: function(){


                    },
                    error: function (xhr, textStatus, errorThrown) {

                    },
                    complete: function () {
                        $('#btnLogin').removeAttr("disabled");
                    }
                });
            })});
        function validate() {
            return $("#formLogin").validate({
                //把错误信息统一放在一个容器里面。
                errorLabelContainer: "#messageBox",
                //用什么标签再把上边的 errorELement 包起来。
                wrapper: "li",
                rules: {
                    username: {
                        required: true,
                        rangelength: [2, 8]
                    },
                    pwd: {
                        required: true,
                        rangelength: [2, 8]
                    }
                },
                messages: {
                    username: {
                        required: "请输入用户名",
                        rangelength: "长度2到8个字符"
                    }, pwd: {
                        required: "请输入密码",
                        rangelength: "长度2到8个字符"
                    }
                }
            }).form();
        }


    </script>


</head>

<body>
<div class="loginDiv">
    <div class="title">文件共享系统</div>
    <form action="login" method="post" id="formLogin">
        <div class="formControls">
            <input type="text" name="username" id="username" class="input-text size-L" placeholder="请输入您的账号"/>
        </div>
        <div class="formControls">
            <input type="password" name="pwd" id="pwd" class="input-text size-L" placeholder="请输入您的密码"/>
        </div>
        <div>
            <input type="button" id="btnLogin" name="btnLogin" value="登录" class="loginBtn">
        </div>
    </form>
    <div id="messageBox"></div>
</div>
</body>
</html>

