$(
  $(document).ready(function () {
    const array = [
      {
        src: "./images/list_02_615x615.jpg",
        company: "[리바트 온라인]",
        title: "슬브 4인 헤드틸팅 소파",
      },
      {
        src: "./images/list_03_615x615.jpg",
        company: "[리바트 온라인]",
        title: "슬브 4인 헤드틸팅 소파",
      },
      {
        src: "./images/list_04_615x615.jpg",
        company: "[리바트 온라인]",
        title: "슬브 4인 헤드틸팅 소파",
      },
      {
        src: "./images/list_05_220x220.jpg",
        company: "[리바트 온라인]",
        title: "슬브 4인 헤드틸팅 소파",
      },
      {
        src: "./images/list_06_615x615.jpg",
        company: "[리바트 온라인]",
        title: "슬브 4인 헤드틸팅 소파",
      },
      {
        src: "./images/list_07_220x220.jpg",
        company: "[리바트 온라인]",
        title: "슬브 4인 헤드틸팅 소파",
      },
    ];
    $.each(array, function (o, i) {
      $("#rightImgWrapper").append(`
      <div class="imgCard">
        <div id="imgWrap">
          <img class="imgContent" name="${i.src}" src="${i.src}"/>
        </div>
        <div class="flexRow">
          <span class="company">${i.company}</span>
          <span class="title">${i.title}</span>
        </div>
        <div class="flexPriceRow">
          <span class="plusComma">100000</span>
          <span>원</span>
        </div>
      </div>
    `);
    });

    // 콤마 추가하기
    $(".plusComma").each(function () {
      let result = $(this).text();
      result = result.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      $(this).text(result);
    });
    // 이미지 영역 클릭시 모달띄우고 사진 보이기
    $(".imgCard").click(function () {
      let src = $(this).find(".imgContent").attr("name");
      $("#modalContainer").css({ display: "flex" });
      $("#modalContent").empty().append(`
      <img src="${src}" />
    `);
    });
    // 닫기버튼
    $(".modalCloseBtn").click(function () {
      $("#modalContainer").css({ display: "none" });
    });
  })
);
