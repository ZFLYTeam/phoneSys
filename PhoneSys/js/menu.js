function Set() {
    var menu = document.getElementsByClassName("li_a");
    for (i = 0; i < menu.length; i++) {
        if (menu[i].className == "li_a") {
            menu[i].onmouseover = function () {
                this.getElementsByClassName("inter_ul")[0].style.display = "block";
                this.getElementsByClassName("inter_ul")[0].style.position = "absolute";
                this.getElementsByClassName("inter_ul")[0].style.left = "200px";
                this.getElementsByClassName("inter_ul")[0].style.top = "0";
            }
            menu[i].onmouseout = function () {
                this.getElementsByClassName("inter_ul")[0].style.display="none"; 
            }
       }
    }
}
window.onload = Set;