/**
 * 
 */

// filter()
// 각 요소를 하나씩 callback 함수에 넣고(배열이 끝날 때까지 반복), 그 함수의 리턴값이 true일 때만 요소를 남김
// filter(function(매개값은 아이템, 인덱스, 배열 중에 고르기 또는 전부){ 아이템의 속성과 조건 } 


const numAry = [10, 17, 23, 26, 49];
let filterAry = numAry.filter(function(item, idx, ary) {
	return item % 2 == 0; // true 값을 반환하는 item을 배열로 저장
});


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

const jsonAry = JSON.parse(jsonStr);

filterAry = jsonAry.filter(item => item.gender == "Male" && item.salary >= 5000);

// reduce() - 누적값과 초기값이 들어가는 반복문 함수
// 초기값을 안 넣으면 첫 번째 배열값이 acc가 되고 두번째 배열값이 cur이 됨, 반복 횟수는 배열 전체 길이 -1
// 초기값을 넣어주면 acc는 초기값이 되고 cur는 첫 번째 배열값이 됨, 반복 횟수는 배열 전체 길이와 동일
// 리턴값이 그 다음 반복에서 acc로 사용됨

[10, 23, 34, 48, 51].reduce(function(acc, cur, idx, ary) {
}, 0);

// 숫자 더하기
let numbers = [1, 2, 3, 4];

let sum = numbers.reduce((acc, cur) => {
	return acc + cur;
}, 0);

console.log(sum); // 👉 10

// 배열의 최댓값 구하기
let numbers2 = [5, 8, 2, 10, 4];

let max = numbers2.reduce((acc, cur) => {
	return cur > acc ? cur : acc;
});

console.log(max); // 👉 10

// 객체 배열 합치기
let items = [
	{ price: 1000 },
	{ price: 2500 },
	{ price: 3200 }
];

let total = items.reduce((acc, item) => acc + item.price, 0);

console.log(total); // 👉 6700


const ary = [
	{ name: "홍길동", phone: "010-1111-2222" },
	{ name: "최길동", phone: "010-1111-3333" },
	{ name: "박길동", phone: "010-1111-4444" },
	{ name: "김길동", phone: "010-1111-5555" }
]

const aryPrint = ary.reduce((acc, item) => {
	return acc + `<li>${item.name} - ${item.phone}</li>`;
}, '');

const myUlTag = document.querySelector('#nameList');
myUlTag.innerHTML = aryPrint;

// map() 배열의 각 요소를 변형해서 새로운 배열을 만드는 함수
// 배열의 요소들을 하나씩 꺼내서, 새로운 값으로 변형하고, 그 새로운 값을 넣은 새로운 배열을 만들어서 반환함(배열의 길이만큼 반복하면서 요소를 하나씩 넣는 거임)
// 리턴된 값이 새로운 배열에 들어감
/* 배열.map(function(item, index, array중에 하나 또는 전부) {
	return 바꿔진 새로운 값 
}) */

// 배열 숫자 2배로 만들기
const numbers3 = [1, 2, 3];

const double = numbers3.map(item => {
	return item * 2;
});

console.log(double); // 👉 [2, 4, 6]

// 객체 배열에서 특정 값만 추출
const users = [
	{ name: "Alice", age: 25 },
	{ name: "Bob", age: 30 }
];

const names = users.map(user => user.name);

console.log(names); // 👉 ["Alice", "Bob"]