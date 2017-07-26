$(function(){
  $("#image_id").on("click", function(event){
    $("#x").val(event.offsetX / event.currentTarget.width)
    $("#y").val(event.offsetY / event.currentTarget.height)
    $("#btn_submit").click()
console.log(event);
console.log(event.offsetX / event.currentTarget.width,
event.offsetY / event.currentTarget.height);

  })
})
