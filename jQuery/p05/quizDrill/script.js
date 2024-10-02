$(function () {
  // header_navBar 슬라이드 함수 --------------------------------------------------------------------------
  $(this).find(".subBtnBox").hide();

  function showMenu() {
    $(this).css({ "background-color": "black", color: "white" });
    $(this).find(".subBtnBox").slideDown();
  }
  function hideMenu() {
    $(this).css({ "background-color": "", color: "black" });
    $(this).find(".subBtnBox").slideUp();
  }

  function showSubMenu() {
    $(this).css({ "background-color": "black", color: "white" });
  }
  function hideSubMenu() {
    $(this).css({ "background-color": "", color: "black" });
  }

  $(".mainBtn").on("focusin mouseenter", showMenu);
  $(".mainBtn").on("focusout mouseleave", hideMenu);

  $(".subBtn").on("focusin mouseenter", showSubMenu);
  $(".subBtn").on("focusout mouseleave", hideSubMenu);

  // slide --------------------------------------------------------------------------
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
  setInterval(moveSlider, 3000); // 3초마다 슬라이드 이동

  // gallery ---------------------------------------------------------------------
  function hoverOnImg() {
    $(this).css({ opacity: "0.5" });
  }
  function hoverOutImg() {
    $(this).css({ opacity: "1" });
  }

  $(".img").on("focusin mouseenter", hoverOnImg);
  $(".img").on("focusout mouseleave", hoverOutImg);

  // modal ---------------------------------------------------------------------
  $(".flexRow").click(function () {
    $("#modalContainer").css({ display: "flex", flexDirection: "column" });
    $("#modalContent").empty().append(`
    <div class="mContent">
      <div class="mTitle">["여름의 문턱", 5월 29일 <콘서트+뮤지엄나이트> 개최]</div>
      <div class="mDesc">
      <pre>
- 서울시립미술관은 5월 29일 수요일 19:00∽20:00 
  서소문 본관에서 옥상 세마휴에서 <콘서트+뮤지엄나이트> 개최합니다.

- '여름의 문턱'이라는 주제로 진행되는 이번 콘서트는 
  뮤지션 오지은의 공연으로 이루어지며, <그렇게 정해진 길 위에서>, 
  <NONE> 등 10여 곡을 선보일 예정입니다.

- 오지은은 2018 SeMA 신소장품<멀티-액세스 4913>전과 연계한 
  뮤지엄나이트 프로그램의 뮤직 디렉터를 맡아 
  전시 작품과 어울리는 8개의 곡을 선곡한 바 있습니다.
      </pre>
      </div>
      
    </div>
  `);
  });
  // 닫기버튼
  $(".modalCloseBtn").click(function () {
    $("#modalContainer").css({ display: "none" });
    console.log("gggg");
  });
});
