$(function () {
  $("h2")
    .css({ border: "3px solid #08f" })
    .parent("div#wrap")
    .css({
      border: "3px solid green",
      padding: "10px",
    })
    .prepend("div")
    .children("h2")
    .siblings()
    .css({ color: "red" });
});
