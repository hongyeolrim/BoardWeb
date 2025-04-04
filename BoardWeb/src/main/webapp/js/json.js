/**
 * 
 */

const jsonStr = `[{"id":1,"first_name":"Gabby","last_name":"Beazer","email":"gbeazer0@answers.com","gender":"Male","salary":1143},
{"id":2,"first_name":"Trey","last_name":"Arnoud","email":"tarnoud1@umn.edu","gender":"Male","salary":3932},
{"id":3,"first_name":"Hughie","last_name":"Hahaha","email":"hhanscombe2@facebook.com","gender":"Male","salary":8088},
{"id":4,"first_name":"Milena","last_name":"Mathevet","email":"mmathevet3@mozilla.org","gender":"Female","salary":4201},
{"id":5,"first_name":"Whitney","last_name":"Coldbath","email":"wcoldbath4@intel.com","gender":"Female","salary":3954},
{"id":6,"first_name":"Brennen","last_name":"Lace","email":"blace5@desdev.cn","gender":"Male","salary":5404},
{"id":7,"first_name":"Coletta","last_name":"Wolverson","email":"cwolverson6@nih.gov","gender":"Female","salary":9627},
{"id":8,"first_name":"Dreddy","last_name":"Iashvili","email":"diashvili7@bbb.org","gender":"Female","salary":3613},
{"id":9,"first_name":"Farah","last_name":"Hutton","email":"fhutton8@wunderground.com","gender":"Female","salary":4297},
{"id":10,"first_name":"Rory","last_name":"Isaksen","email":"risaksen9@ihg.com","gender":"Male","salary":8458},
{"id":11,"first_name":"Amye","last_name":"Rameaux","email":"arameauxa@nydailynews.com","gender":"Female","salary":4221},
{"id":12,"first_name":"Calla","last_name":"Nicklinson","email":"cnicklinsonb@washingtonpost.com","gender":"Female","salary":5582},
{"id":13,"first_name":"Xylina","last_name":"Senn","email":"xsennc@webs.com","gender":"Female","salary":9250},
{"id":14,"first_name":"Sayre","last_name":"Bayldon","email":"sbayldond@woothemes.com","gender":"Female","salary":2929},
{"id":15,"first_name":"Mace","last_name":"Darell","email":"mdarelle@ibm.com","gender":"Male","salary":3900}]`;

let obj = JSON.parse(jsonStr); // json 문자열 -> object 타입으로 변경
let str = JSON.stringify(obj); // json 문자열로 변경
console.log(obj[2].last_name);

// 한 건 데이터를 매개값으로 tr을 생성하는 함수
function makeRow(emp = { id, first_name, last_name, email, gender, salary }) {
	const fields = ['id', 'first_name', 'last_name', 'email'];
	let tr = document.createElement('tr');
	for (let i = 0; i < fields.length; i++) {
		let td = document.createElement('td');
		td.innerHTML = emp[fields[i]]
		tr.appendChild(td);
	}
	return tr;
}

obj.forEach(function(item, idx, ary) {
	let tr = makeRow(item);
	document.querySelector('tbody#target').appendChild(tr);
})