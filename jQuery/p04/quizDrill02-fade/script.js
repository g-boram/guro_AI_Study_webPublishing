$(function () {
  let currentIndex = 0;
  const slideCount = $("#slide img").length;

  $("#slide > #imgWrapper").hide();
  $("#slide > #imgWrapper").eq(currentIndex).show();

  function moveSlider() {
    $("#slide > #imgWrapper").eq(currentIndex).fadeOut(1000);
    currentIndex++;

    if (currentIndex >= slideCount) {
      currentIndex = 0;
    }

    $("#slide > #imgWrapper").eq(currentIndex).fadeIn(1000);
  }

  setInterval(moveSlider, 3000);
});
