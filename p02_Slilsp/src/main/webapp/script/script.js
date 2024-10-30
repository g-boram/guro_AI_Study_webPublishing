let btnDom = document.querySelector("button");
btnDom.addEventListener("click", ()=>{
	let formDom = document.querySelector("#frm01");
	formDom.setAttribute("action", "receive.jsp");
	formDom.submit();
});