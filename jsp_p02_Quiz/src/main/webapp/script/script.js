let btnDom = document.querySelector("#loginBtn");
btnDom.addEventListener("click", ()=>{
	let formDom = document.querySelector("#loginFrm");
	formDom.setAttribute("action", "./receive.jsp");
	formDom.submit();
});

