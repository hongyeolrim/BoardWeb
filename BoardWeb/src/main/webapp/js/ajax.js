/**
 * 
 */
let dataAry = [];

const xhtp = new XMLHttpRequest();
xhtp.open('get', 'data/MOCK_DATA.json'); // 경로 지정
xhtp.send();
xhtp.onload = function(){
	dataAry = JSON.parse(xhtp.responseText);
	console.log(dataAry);
	
	// 화면 출력
	dataAry.forEach(function(item, idx, ary) {
		let tr = makeRow(item);
		document.querySelector('tbody#target').appendChild(tr);
	})
}
// 한 건 데이터를 매개값으로 tr을 생성하는 함수
function makeRow(emp = { id, first_name, last_name, email, gender, salary }) {
	const fields = ['id', 'first_name', 'last_name', 'gender', 'email'];
	let tr = document.createElement('tr');
	
	// td 생성
	let td = document.createElement('td');
	let input = document.createElement('input');
	input.setAttribute('type', 'checkbox');
	td.appendChild(input);
	tr.appendChild(td);
	
	for (let i = 0; i < fields.length; i++) {
		let td = document.createElement('td');
		td.innerHTML = emp[fields[i]]
		tr.appendChild(td);
	}
	// button 생성
	td = document.createElement('td');
	let btn = document.createElement('button');
	btn.setAttribute('class', 'btn btn-danger');
	btn.innerText = '삭제';
	btn.addEventListener('click', deleteRow)
	
	// 부모-자식
	td.appendChild(btn);
	tr.appendChild(td);
	
	return tr;
}

// btn 이벤트 핸들러
function deleteRow(e) {
	e.target.parentElement.parentElement.remove();
}

// 전체 체크
const headerCheckbox = document.getElementById('checkAll');
	
headerCheckbox.addEventListener('change', function() {
	const isChecked = this.checked;
	const bodyCheckbox = document.querySelectorAll('tbody input[type="checkbox"]');
	bodyCheckbox.forEach(bcb => bcb.checked = isChecked);
})

// select의 change 이벤트
document.getElementById('searchGender').addEventListener('change', function(e){
	let selected = e.target.value;
	let tobody = document.querySelector('tbody#target');
	tobody.innerHTML = "";

	dataAry.forEach(function(item){
		if(selected === "All" || selected === item.gender){
			let tr = makeRow(item);
			tobody.appendChild(tr);	
		}
	}); 
}); 
