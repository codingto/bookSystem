<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <title>Title</title>
    <script src="../JQ.js" type="text/javascript"></script>
    <script>
        $(function () {

            var name = "${userSession.name}";
            //用户未登录，转跳登录页面
            if (name == "") {
                window.location.href = "../";
            }

            //将input内容设置
            var book = ${book};
            $("#id").val(book.book_id);
            $("#name").val(book.book_name);
            $("#author").val(book.book_author);
            $("#describe").val(book.book_describe);
            $("#numbers").val(book.book_numbers);


            $("#change").click(function () {
                var id =  $("#id").val();
                var name = $("#name").val();
                var author = $("#author").val();
                var describe = $("#describe").val();
                var numbers = $("#numbers").val();
                $.ajax(
                    {
                        type:"POST",
                        url:"/updataBook",
                        data:{
                            "book_id":id,
                            "book_name":name,
                            "book_author":author,
                            "book_describe":describe,
                            "book_numbers":numbers
                        },
                        success:function () {
                            alert("修改成功！");
                        }
                    }

                )
            })
            $("#back").click(function () {
                window.location.href = "/book/admin_allBook.jsp";
            })
        })

    </script>
</head>
<body>
    <h2 align="center">添加图书</h2>
    <div>
        id:       <input id="id" readonly type="text" ><info style="color: red">id不可更改</info><br>
        name:     <input id="name" type="text"><br>
        作者:     <input id="author" type="text"><br>
        描述:     <input id="describe" type="text"><br>
        库存数量:  <input id="numbers" type="text">
    </div>
    <button id="change">修改</button>
    <button id="back">返回</button>
</body>
</html>
