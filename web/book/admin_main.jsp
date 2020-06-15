<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${userSession.name}管理主页</title>
    <script src="../JQ.js" type="text/javascript"></script>
    <script>
        $(function () {
            console.log("入口函数");
            //显示用户名
            var name = "${userSession.name}";
            //用户未登录，转跳登录页面
            if (name == "") {
                window.location.href = "../";
            }
            $("#allBook").click(function () {
                $("#frame").attr("src","admin_allBook.jsp");
            })
            $("#addBook").click(function () {
                $("#frame").attr("src","admin_addBook.jsp");
            })
            $("#queryBook").click(function () {
                $("#frame").attr("src","admin_queryBook.jsp");
            })
            $("#readme").click(function () {
                $("#frame").attr("src","readme.jsp");
            })
        })
    </script>
</head>
<body>
<div id="mainDiv">
    <div style="float: left">
        <ul>
            <h3>管理员:${userSession.name}</h3>
            <h4>您好!</h4>
            <br>
            <h4>菜单：</h4>
            <li>
                <button id="readme">操作说明</button>
            </li>
            <br>
            <li>
                <button id="allBook">全部图书</button>
            </li>
            <br>
            <li>
                <button id="addBook">增加图书</button>
            </li>
            <br>
            <li>
                <button id="queryBook">查询图书</button>
            </li>

        </ul>
    </div>
    <div style="float:left;">
        <iframe id="frame" src="readme.jsp" height="650px" width="1000px"></iframe>
    </div>
</div>
</body>
</html>
