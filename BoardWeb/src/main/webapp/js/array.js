/**
 *  push, unshift 추가
 *  pop, shift 제거
 *  splice 추가, 수정, 삭제
 *  forEach()
 */

const ary = [];

ary.push('홍열림');
ary.push('홍수근');
ary.unshift('최형철');

/*ary.pop();
ary.shift();

ary.splice(0, 1, '둘리');
ary.splice(0, 0, '둘리', '고로케');*/

ary.forEach(function(item, idx, ary) {
	console.log(`item=> ${item}, index=> ${idx}, array=> ${ary}`);
	});
	
// 함수
function addElement(elem = "noElem"){
	ary.push(elem);
}

// 화면에서 요소 제거
function deleteElement(e){
	e.target.parentElement.remove();
}


//추가 버튼에 클릭 이벤트
document.querySelector('button#addBtn').addEventListener('click', function() {
	let  value = document.querySelector('input#userInput').value; // input의 값
	addElement(value); // ary 배열에 추가
	let html = '';
	ary.forEach(function(item, idx, ary){
		html += '<li>' + item + '<button onclick="deleteElement(event)">삭제</button></li>';
	});
	document.querySelector('ul#list').innerHTML = html;
});
