<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${userSession.name}管理主页</title>
    <script src="../JQ.js" type="text/javascript"></script>
    <script>
        $(function () {


            // console.log("入口函数Allbook");
            //显示用户名
            var name = "${userSession.name}";
            //用户未登录，转跳登录页面
            if (name == "") {
                window.location.href = "../";
            }
            $.ajax({
                type:"POST",
                url:"/getAllBook",
                dataType: "json",
                success:function (data) {
                    console.log(data[0]);

                    var length = Object.keys(data).length;
                    //动态添加元素
                    for(var i=0;i<length;i++){
                        var id = data[i].book_id;
                        var ch = '<tr>' +
                            '<td>'+data[i].book_id+'</td>' +
                            '<td>'+data[i].book_name+'</td>' +
                            '<td>'+data[i].book_author+'</td>' +
                            '<td>'+data[i].book_describe+'</td>' +
                            '<td>'+data[i].book_numbers+'</td>' +
                            '<td><button class="'+id+'">修改</button><button class="'+id+'">删除</button></td>' +
                            '</tr>';
                            //这里动态指定按钮的class=对应的BoookId（这招帅炸了哈哈哈（可能之后会学到更方便的方法
                        $("#tb tbody").append(ch);

                        //为所有删除按钮绑定事件
                        document.getElementsByClassName(id)[1].addEventListener("click",function (event) {
                            deleteBook(event);
                        });
                        //为所有修改按钮绑定事件
                        document.getElementsByClassName(id)[0].addEventListener("click",function (event) {
                            updateBook(event);
                        });

                    }//循环结束，以上都在for循环中

                }

            })



        })
        function deleteBook(event) {
            if(confirm("确实要删除吗？")){
                alert("已删除！");
                //获取点击事件的按钮元素
                var message = event.toElement;
                //获取按钮元素的classname,即为BookId
                var book_id = message.className;
                $.ajax({
                    type:"POST",
                    url:"/deleteBook",
                    data: {
                        "book_id": book_id
                    },
                    success:function (data) {
                        window.location.reload();//刷新页面
                    }
                })

            }else {
                alert("已取消");
            }

        }

        function updateBook(event) {
            //获取元素
            var message = event.toElement;
            //获取按钮元素的classname,即为BookId
            var book_id = message.className;
            $.ajax({
                type:"POST",
                url:"/toUpdataBook",

                data: {
                    "book_id": book_id
                },
                success: function () {
                    window.location.href = "/book/admin_updataBook.jsp";
                },
                error:function () {
                    console.log("updataBook请求失败");
                }
            })
        }
    </script>
</head>
<body>
<div>
<h2 align="center">全部图书</h2>
    <table id="tb" border="1">
        <thead>
        <tr><th>id</th><th>name</th><th>author</th><th>describe</th><th>number</th><th>option</th></tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>
</body>
</html>
