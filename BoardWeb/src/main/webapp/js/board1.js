/**
 * 
 *
 */


let currentResult;
let page = 1;

// 성공 콜백
let successCallback = function(result) {
	document.querySelectorAll('div.reply div.content>ul>li').forEach((item, idx) => {
		if (idx) item.remove();
	});
	result.forEach(item => {
		makeRow2(item);
	});
};

// 에러 콜백
function errorCallback(err) {
	console.log(err);
}

// 댓글 한 줄 만들기
function makeRow2(item) {
	let html = `<li data-rno="${item.replyNo}" id="rno_${item.replyNo}">
		<span class="col-sm-2">${item.replyNo}</span> 
		<span class="col-sm-5">${item.reply}</span> 
		<span class="col-sm-2">${item.replyer}</span> 
		<button class="btn btn-light" onclick="deleteFnc(${item.replyNo})">❌</button>
	</li>`;
	document.querySelector('div.content>ul').insertAdjacentHTML('beforeend', html);
}

// 댓글 삭제 함수
function deleteFnc(rno) {
	if (!confirm("진짜 삭제하려구요?🥺")) return;
	svc.removeReply(rno, result => {
		if (result.retCode === 'OK') {
			alert("삭제 성공!!🔥");
			svc.replyList({ bno, page }, successCallback, errorCallback);
			svc.pagingList(bno, result => pagingCallback(result, page), errorCallback);
		}
	}, errorCallback);
}

// 댓글 등록 이벤트
document.querySelector('button.addReply').addEventListener('click', function() {
	if (replyer == "") {
		alert("로그인을 하시죠?😏");
		return;
	}
	let reply = document.querySelector('#reply').value;
	if (reply == "") {
		alert("댓글 내용을 입력하세요!");
		return;
	}
	svc.addReply({ bno, reply, replyer }, result => {
		if (result.retCode === 'OK') {
			alert('등록 성공!');
			makeRow2(result.retVal);
			document.querySelector('#reply').value = '';
			
			page = 1;
			svc.replyList({ bno, page }, successCallback, errorCallback);
			svc.pagingList(bno, result => pagingCallback(result, page), errorCallback);
		} else {
			alert('등록 실패ㅠㅠ');
		}
	}, errorCallback);
});

// 페이징 콜백
function pagingCallback(result, pageNum) {
	currentResult = result;
	page = pageNum || 1;

	const target = document.querySelector('nav>ul.pagination');
	target.innerHTML = '';

	let totalCnt = result.totalCnt;
	let endPage = Math.ceil(page / 10) * 10;
	let startPage = endPage - 9;
	let realEnd = Math.ceil(totalCnt / 10);
	endPage = (endPage > realEnd) ? realEnd : endPage;

	let prev = (startPage > 1);
	let next = (endPage < realEnd);

	// 이전 버튼
	let prevClass = prev ? '' : 'disabled';
	target.insertAdjacentHTML('beforeend', `
		<li class="page-item previous-button ${prevClass}"><a class="page-link" href="#">Previous</a></li>`);

	// 숫자 페이지
	for (let p = startPage; p <= endPage; p++) {
		let active = (p === page) ? 'active' : '';
		target.insertAdjacentHTML('beforeend', `
			<li class="page-item ${active}"><a class="page-link" href="#">${p}</a></li>`);
	}

	// 다음 버튼
	let nextClass = next ? '' : 'disabled';
	target.insertAdjacentHTML('beforeend', `
		<li class="page-item next-button ${nextClass}"><a class="page-link" href="#">Next</a></li>`);

	// 이벤트 등록
	pagelink(startPage, endPage, realEnd);
}

// 페이지 클릭 이벤트 등록
function pagelink(startPage, endPage, realEnd) {
	const links = document.querySelectorAll('div.reply ul a');
	links.forEach(atag => {
		atag.addEventListener('click', function(e) {
			e.preventDefault();
			let selectedPage = parseInt(atag.innerHTML);
			if (!isNaN(selectedPage)) {
				page = selectedPage;
				svc.replyList({ bno, page }, successCallback, errorCallback);
				svc.pagingList(bno, result => pagingCallback(result, page), errorCallback);
			}
		});
	});

	// 이전
	const prevBtn = document.querySelector('.previous-button:not(.disabled)');
	if (prevBtn) {
		prevBtn.addEventListener('click', function() {
			page = startPage - 1;
			svc.replyList({ bno, page }, successCallback, errorCallback);
			svc.pagingList(bno, result => pagingCallback(result, page), errorCallback);
		});
	}

	// 다음
	const nextBtn = document.querySelector('.next-button:not(.disabled)');
	if (nextBtn) {
		nextBtn.addEventListener('click', function() {
			page = endPage + 1;
			svc.replyList({ bno, page }, successCallback, errorCallback);
			svc.pagingList(bno, result => pagingCallback(result, page), errorCallback);
		});
	}
}

// 초기 실행
svc.replyList({ bno, page }, successCallback, errorCallback);
svc.pagingList(bno, result => pagingCallback(result, page), errorCallback);
