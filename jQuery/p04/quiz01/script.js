$(function () {
  $(this).find(".subBtnBox").hide();

  function showMenu() {
    $(this).css("background-color", "blue");
    $(this).find(".subBtnBox").slideDown();
  }
  function hideMenu() {
    $(this).find(".subBtnBox").slideUp();
    $(this).css("background-color", "");
  }

  function showSubMenu() {
    $(this).css("background-color", "blue");
  }
  function hideSubMenu() {
    $(this).css("background-color", "");
  }

  $(".mainBtn").on("focusin mouseenter", showMenu); // Show on focus or hover
  $(".mainBtn").on("focusout mouseleave", hideMenu); // Hide on focus out or leave

  $(".subBtn").on("focusin mouseenter", showSubMenu);
  $(".subBtn").on("focusout mouseleave", hideSubMenu);
});
