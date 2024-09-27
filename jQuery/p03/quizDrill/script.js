$(function () {
  // 전체 선택 체크박스 클릭 시
  $("#checkAll").click(function () {
    var isChecked = $(this).is(":checked");
    $(".items").prop("checked", isChecked); // 전체 체크박스 선택/해제
  });

  // 개별 체크박스 클릭 시
  $(".items").click(function () {
    var total = $(".items").length; // 전체 체크박스 개수
    var checked = $(".items:checked").length; // 선택된 체크박스 개수

    if (total === checked) {
      $("#checkAll").prop("checked", true); // 모두 선택된 경우, 전체 체크박스도 선택
    } else {
      $("#checkAll").prop("checked", false); // 하나라도 해제된 경우, 전체 체크박스 해제
    }
  });
});
