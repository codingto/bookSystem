<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>$Title$</title>
    <script src="JQ.js" type="text/javascript"></script>
    <script>
        $(function () {
            // window.location.href = "book/admin_allBook.jsp";
            $("#loginButton").click(function () {
                // console.log("adaasdas");
                var name = $("#name").val();
                var pwd = $("#pwd").val();
                // console.log(id);
                // console.log(pwd);
                // var remember=$("#remember").prop('checked');

                if (name == '' && pwd == '') {
                    $("#info").text("提示:账号和密码不能为空");
                } else if (name == '') {
                    $("#info").text("提示:账号不能为空");
                } else if (pwd == '') {
                    $("#info").text("提示:密码不能为空");
                } else {

                    $.ajax({
                        type: "POST",
                        url: "/loginCheck",
                        data: {
                            "name": name,
                            "pwd": pwd
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.stateCode.trim() == "-1") {
                                $("#info").text("提示:无此用户，请先注册！");
                            } else if (data.stateCode.trim() == "0") {
                                $("#info").text("提示:密码错误！");

                            } else if (data.stateCode.trim() == "1") {

                                $("#info").text("提示:登陆成功，跳转中...");
                                setTimeout(function () {
                                    window.location.href = "book/admin_main.jsp";
                                }, 700);


                            }

                        }
                        ,
                        error: function () {
                            console.log("fall");
                        }
                    });
                }
            })
        })

    </script>
</head>
<body>
<div style="height: 300px;width: 200px;">




        <input type="text" id="name"><br>
        <input type="password" id="pwd"><br>

        <button id="loginButton" style="text-align: right;color: red;">登录</button>

        <a href="/book/register.jsp">注册</a><br>
    <p style="text-align: right;color: red;position: absolute" id="info"><br>
</div>
</body>
</html>
