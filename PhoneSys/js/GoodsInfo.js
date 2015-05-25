var LanMu = $(".lanmu-list");
var lanMuSun = LanMu.children('dd');
if ((lanMuSun.size()) > 8) {
    LanMu.children("dd:gt(5)").hide();
    $(".listmore").show();
}
$(".listmore").bind("click", function () {
    if (!$(".listmore").hasClass('ListMoreOn')) {
        $(".listmore").addClass('ListMoreOn');
        LanMu.children("dd:gt(5)").slideDown();
        $(".listmore").html("折叠栏目 ↑")
    } else {
        $(".listmore").removeClass('ListMoreOn');
        LanMu.children("dd:gt(5)").slideUp();
        $(".listmore").html("查看更多 ↓");

    }
})