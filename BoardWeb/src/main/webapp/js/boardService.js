/**
 *
 */

const svc = {
	// 목록
	name: "홍길동",
	replyList: function(search={bno, page}, successCallback, errorCallback) {
		fetch('replyList.do?bno=' + search.bno + '&page=' + search.page)
			.then(result => result.json())
			.then(successCallback)
			.catch(errorCallback)
	},

	// 삭제
	removeReply(rno, successCallback, errorCallback) {
		fetch('removeReply.do?rno=' + rno)
			.then(result => result.json())
			.then(successCallback)
			.catch(errorCallback)
	},

	// 추가
	addReply(rvo = {bno, reply, replyer}, successCallback, errorCallback) {
		fetch('addReply.do?bno=' + rvo.bno + '&reply=' + rvo.reply + '&replyer=' + rvo.replyer)
			.then(result => result.json())
			.then(successCallback)
			.catch(errorCallback)
	},
	
	// 페이지 계산
	pagingList(bno, successCallback, errorCallback) {
			fetch('replyCount.do?bno=' + bno)
				.then(result => result.json())
				.then(successCallback)
				.catch(errorCallback)
		}
}; // 객체 닫고 ; 찍기