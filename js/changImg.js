var curIndex = 0;
//设置时间间隔，单位为毫秒
var timeInterval = 2000;
var arr = new Array();
arr[0] = "../images/1.jpg";
arr[1] = "../images/2.jpg";
arr[2] = "../images/3.jpg";
arr[3] = "../images/4.jpg";
//HTML DOM setInterval() 方法
setInterval(changeImg, timeInterval);
function changeImg() {
   var img=document.getElementById("img");
   if (curIndex == arr.length - 1) {
       curIndex = 0;
   }
   else {
       curIndex++;
   }
   img.src=arr[curIndex];
}