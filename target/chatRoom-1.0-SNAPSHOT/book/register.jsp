
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <script src="../JQ.js" type="text/javascript"></script>
    <script>
        $(function () {
            var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
            var pPattern = /^(\w){6,20}$/;


            $("#reButton").click(function () {
                var name = $("#name").val();
                var pwd = $("#pwd").val();
                if (name == '' && pwd == '') {
                    $("#info").text("提示:用户名和密码不能为空");
                } else if (name == '') {
                    $("#info").text("提示:用户名不能为空");
                } else if (pwd == '') {
                    $("#info").text("提示:用户名不能为空");
                }else if(!uPattern.test(name)){
                    $("#info").text("提示:用户名不合法：应为4到16位（字母，数字，下划线，减号");
                }else if(!pPattern.test(pwd)){
                    $("#info").text("提示:密码6-20个字母、数字、下划线 ");
                }else{
                    console.log("namepwd success");
                    $.ajax(
                        {
                            type:"POST",
                            url:"/registCheck",
                            data: {
                                "name": name,
                                "pwd": pwd
                            },
                            dataType: "json",
                            success:function (data) {

                                if(data.stateCode.trim() == "-1"){
                                    $("#info").text("该用户名已被注册！");
                                }else{
                                    $("#info").text("注册成功，正在转跳登录页面。。。");
                                    setTimeout(function(){window.location.href = "../";}, 1300);

                                }

                            },
                            error:function (data) {
                                console.log("error");
                            }
                        }
                    );
                }
            })
        })


    </script>
</head>
<h1>注册页面</h1>
<body>
<p id="info" style="text-align: right;color: red;position: absolute"></p><br><br>
用户名：<input type="text" id="name"><br>
密码：<input type="text" id="pwd">
<button id="reButton">注册</button>
</body>
</html>
