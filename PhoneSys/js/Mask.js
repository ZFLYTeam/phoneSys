      function openDiv(newDivID) {
             var newMaskID = "mask";  //遮罩层id
             var newMaskWidth = document.body.scrollWidth; //遮罩层宽度
             var newMaskHeight = document.body.scrollHeight; //遮罩层高度    
             //mask遮罩层  
             var newMask = document.createElement("div"); //创建遮罩层
             newMask.id = newMaskID; //设置遮罩层id
             newMask.style.position = "absolute"; //遮罩层位置
             newMask.style.zIndex = "6666"; //遮罩层zIndex
             newMask.style.width = newMaskWidth + "px"; //设置遮罩层宽度
             newMask.style.height = newMaskHeight + "px"; //设置遮罩层高度
             newMask.style.top = "0px"; //设置遮罩层于上边距离
             newMask.style.left = "0px"; //设置遮罩层左边距离
             newMask.style.background = "#666"; //遮罩层背景色
             newMask.style.filter = "alpha(opacity=60)"; //遮罩层透明度IE
             newMask.style.opacity = "0.60"; //遮罩层透明度FF
             document.body.appendChild(newMask); //遮罩层添加到DOM中

             //新弹出层
             var newDiv = document.getElementById("newDiv");   //从文档流中获取操作对象
             newDiv.style.display = "block";   //显示为块级元素
             newDiv.style.zIndex = "9999";   //索引为9999
             newDiv.style.position = "fixed";   //固定定位，使该层滚动条滚动时垂直居中

             //关闭遮罩层和弹出层
             var myClose = document.getElementById("close");   //从文档流中获取关闭对象元素
             myClose.onclick = function () {   //当点击关闭对象元素时执行该方法
                 newMask.style.display = "none";   //隐藏遮罩层
                 newDiv.style.display = "none";   //隐藏弹出层
             }
     }