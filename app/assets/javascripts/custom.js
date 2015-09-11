$(document).ready(function(){
  $(".alert").fadeOut(7000);

  /* card flip */
  $(".flip").hover(function(){
    $(this).find(".card").toggleClass("flipped");
    return false;
  });
});
