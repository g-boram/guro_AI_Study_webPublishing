$(function () {
  let currentIndex = 0;

  const slideCount = $("#slide img").length; // 이미지 개수
  const slideWidth = $("#slideWrapper").width(); // 슬라이드의 너비

  function moveSlider() {
    currentIndex++;

    if (currentIndex >= slideCount) {
      currentIndex = 0; // 마지막 이미지 이후에는 첫 번째 이미지로
    }
    $("#slide").css("transform", `translateX(-${slideWidth * currentIndex}px)`);
  }

  // 3초마다 슬라이드 이동
  setInterval(moveSlider, 3000);
});
