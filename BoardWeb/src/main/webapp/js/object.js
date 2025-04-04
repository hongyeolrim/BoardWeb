/**
 * 
 */

console.log("start");


// DOM 제어
let li = document.createElement('li'); // 새로운 요소 생성
li.innerText = 'cherry'; // <li>cherry</li>

document.querySelector('ul#list').appendChild(li); // 자식 요소 추가
console.log(document.querySelector('ul#list'));


let name = "Hong";
console.log(typeof name);

const obj = {
	name: "홍길동",
	age: 20,
	friends: ['피카츄', '라이츄'],
	pets: [{ name: '고슴도치', age: 3 }, { name: '코끼리', age: 1 }]
}
obj.height = 170;
console.log(typeof obj);
console.log(obj.name, obj["age"], obj.age, obj.height);
console.log('첫 번째 친구', obj.friends[0]);
console.log('첫 번째 애완동물', obj.pets[0].name);

// 새친구 추가
obj.friends[2] = '파이리';

// 친구 목록
for (let i = 0; i < obj.friends.length; i++) {
	console.log('친구 이름: ', obj.friends[i]);
}

// 애완동물 추가
obj.pets.push({name: '하프물범', age: 2});

// 애완동물 목록
for(let pet of obj.pets){
 console.log(`이름은 ${pet.name}, 나이는 ${pet.age}`);	
}

// 애완동물 목록 - 콘솔 말고 화면에 출력
// <table><thead><tr><th><tbody><td>

let tblHtml = '<table class="table">';
tblHtml += '<thead><tr><th>이름</th><th>나이</th></tr></thead>';
tblHtml += '<tbody>';
for(let pet of obj.pets){
   console.log(`이름은 ${pet.name}, 나이는 ${pet.age}`);
   tblHtml += '<tr><td>' + pet.name + '</td><td>' + pet.age +'</td></tr>';
}
tblHtml += '</tbody></table>';

document.querySelector('nav+div.container-fluid').innerHTML += tblHtml;
