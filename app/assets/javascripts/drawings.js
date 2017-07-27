document.addEventListener("turbolinks:load", function(){
  $("#image_id").on("click", function(event){
    $("#x").val(event.offsetX / event.currentTarget.width)
    $("#y").val(event.offsetY / event.currentTarget.height)
    $("#btn_submit").click()
console.log(event);
console.log(event.offsetX / event.currentTarget.width,
event.offsetY / event.currentTarget.height);
  })
  $(".color_picker a").on("click", function(event){
    $(".color_picker a").css("border-color", "transparent");
    $(event.currentTarget).css("border-color", "white");
    var backg_color = $(event.currentTarget).css("background-color");
    $("#color").val(backg_color);
    console.log(backg_color);
  })
  $(".color_picker a:first").click()
})
