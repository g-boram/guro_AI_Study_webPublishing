document.getElementById("submit-button").addEventListener("click", function() {
    const openDateString = document.getElementById("open-date").value;

    if (!openDateString) {
        alert("Open 날짜를 선택해주세요.");
        return;
    }

    const formData = new URLSearchParams();
    formData.append("openDate", openDateString);

    fetch("comingSoon.jsp", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: formData.toString()
    })
    .then(response => response.text())
    .then(html => {
        document.body.innerHTML = html; 
    })
    .catch(error => console.error("Error:", error));
});
