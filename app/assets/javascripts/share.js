$(document).ready(function() {
  $(".friend-pool").click(function(e) {
    e.preventDefault;
    var id = e.target.id;
    $("#" + id).toggleClass("hidden");
    $("#b" + id).toggleClass("hidden");
  })
});
