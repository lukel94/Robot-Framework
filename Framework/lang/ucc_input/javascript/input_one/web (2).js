<!DOCTYPE html>

<html>

<body>



<h1>这就是爱情~</h1>



<p id="demo">

我的生活，缺你不可

<script>

alert('你来了？');

alert('等你很久了');

document.write("<h1>我想说</h1>");

</script>



<script>

function myfunction(){

x=document.getElementById("demo");  //改变html文本

x.innerHTML="所以，forever";

}

function  isNO(){

var x=document.getElementById("identify").value;

if(x==""||isNaN(x)){   //判断是否是数字

alert("输入数字呀~"+x);

}

}

</script>

<button type="button" onclick="myfunction()">改变</button>

<button type="button" onclick="alert('我爱你')">点击这里</button>

<input id="identify" type="text">

<button type="button" onclick="isNO()">输入一个数字</button>

</body>

</html>

