/**
 * 
 */


let successCallback = function successCallback(result) {
	result.forEach(item => {
		makeRow2(item);
	});
}

// 삭제 함수
function deleteFnc(rno) {
	let deleteOK = confirm("진짜 삭제하려구요?🥺");
	if(!deleteOK){
		return;
	}
	svc.removeReply(rno
		, function(result) {
			if(result.retCode == 'OK'){
				alert("삭제 성공!!🔥");
				document.querySelector('#rno_'+rno).remove();
			}
		}
		, errorCallback)
	};

function errorCallback(err) {
	console.log(err);
}

//이벤트
document.querySelector('button.addReply').addEventListener('click', function(e) {
	if (replyer == "") {
		alert("로그인을 하시죠?😏");
		return;
	}
	let reply = document.querySelector('#reply').value;
	if (reply == "") {
		alert("댓글 내용을 입력하세요!");
		return;
	}
	svc.addReply({ bno, reply, replyer },
		function(result) { 
			if(result.retCode == 'OK') {
				alert('등록 성공!');
				let item = result.retVal;
				makeRow2(item);
				// 입력값 초기화
				document.querySelector('#reply').value = '';
			}else{
				alert('등록 실패ㅠㅠ');
			}
		},
		errorCallback);
});

svc.replyList(bno, successCallback, errorCallback);

//댓글 정보
function makeRow2(item) {
	let html = `<li data-rno="${item.replyNo}" id="rno_${item.replyNo}">
	          <span class="col-sm-2">${item.replyNo}</span> 
	          <span class="col-sm-5">${item.reply}</span> 
	          <span class="col-sm-2">${item.replyer}</span> 
	          <button class="btn btn-light" onclick="deleteFnc(${item.replyNo})">❌</butoon>
	          </li>`;
	let templ = document.querySelector('div.content>ul');
	templ.insertAdjacentHTML('beforeend', html);
}