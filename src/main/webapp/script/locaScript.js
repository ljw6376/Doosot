function categoryChange(e) {
	  var seoul = ["강남구", "강동구", "강북구", "강서구", "광진구"]
	  var gyeonggi = ["광명시", "수원시", "평택시", "안양시", "하남시"];
	  var busan = ["강서구", "금정구", "해운대구", "동구", "북구"];
	  var target = document.getElementById("gugun");
	 
	  if(e.value == "서울특별시 ") var d = seoul;
	  else if(e.value == "경기도 ") var d = gyeonggi;
	  else if(e.value == "부산광역시 ") var d = busan;
	 
	  target.options.length = 0;
	 
	  for (x in d) {
	    var opt = document.createElement("option");
	    opt.value = d[x];
	    opt.innerHTML = d[x];
	    target.appendChild(opt);
	  }
}

function locaSelect() {
	window.open("loca_Select.do?pg=1",'newWindow' ,"width=1300 height=1000 left=250 top=20");
}

function locaChoice(num, name, addr, phone, valid) {
	window.opener.document.getElementById("loca_num").value = num;
	window.opener.document.getElementById("loca_name").value = name;
	window.opener.document.getElementById("loca_addr").value = addr;
	window.opener.document.getElementById("loca_phone").value = phone;
	
	if(valid == 'true') {
		window.opener.document.getElementById("valid_true").checked = true;
	} else {
		window.opener.document.getElementById("valid_false").checked = true;
	}
	
	window.close();
}

function loca_cus_Choice(num, name, addr) {
	window.opener.document.getElementById("loca_num").value = num;
	window.opener.document.getElementById("deli_store_name").value = name;
	window.opener.document.getElementById("deli_store_addr").value = addr;

	window.close();
}

function checkWrite() {
	if(!loca_frm.loca_name.value) {
		alert("매장 이름을 입력하세요");
		loca_frm.loca_name.focus();
	} else if(!loca_frm.loca_addr.value) {
		alert("매장 주소를 입력하세요");
		loca_frm.loca_addr.focus();
	} else if(!loca_frm.loca_phone.value) {
		alert("매장 전화번호를 입력하세요");
		loca_frm.loca_phone.focus();
	} else if(!loca_frm.loca_img.value) {
		alert("매장 지도이미지를 입력하세요");
		loca_frm.loca_img.focus();
	}else {
		loca_frm.submit();
	}
}

function checkName() {
	var sId = loca_frm.loca_name.value;
	
	if(sId == "") {
		alert("매장 이름을 입력하세요.");
	} else {
		window.open("../loca/checkName.do?loca_name=" + sId, "", "width=450 height=100 left=500 top=200")
	}
}
	
function checkWrite() {
	if(!loca_frm.loca_name.value) {
		alert("매장 이름을 입력하세요");
		loca_frm.loca_name.focus();
	} else if(!loca_frm.loca_addr.value) {
		alert("매장 주소를 입력하세요");
		loca_frm.loca_addr.focus();
	} else if(!loca_frm.loca_phone.value) {
		alert("매장 전화번호를 입력하세요");
		loca_frm.loca_phone.focus();
	} else if(!loca_frm.loca_img.value) {
		alert("매장 지도이미지를 입력하세요");
		loca_frm.loca_img.focus();
	}else {
		loca_frm.submit();
	}
} 