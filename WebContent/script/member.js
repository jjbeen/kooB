function idCheck(){
	if(document.frm.userid.value == ""){
		alert('아이디를 입력하세요.');
		document.frm.userid.focus();
		return;
	}
	var url = "idCheck.do?userid=" + document.frm.userid.value;
	window.open(url, "_blank_1", "width=450, height=250, toolbar=no, menubar=no, scrollbars=yes, resizable=no");
}

function idok(){
	opener.frm.userid.value = document.frm.userid.value;
	opener.frm.reid.value = document.frm.userid.value;
	self.close();
}