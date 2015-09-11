$(document).ready(function(){
  $(".alert").fadeOut(6000);

  /* card flip */
  $(".flip").hover(function(){
    $(this).find(".card").toggleClass("flipped");
    return false;
  });
});
