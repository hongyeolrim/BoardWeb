/**
 * 
 */

console.log(bno);
const xhtp = new XMLHttpRequest();
xhtp.open('get', 'replyList.do?bno=' + bno);
xhtp.send();
xhtp.onload = function() {
	console.log(xhtp.responseText);
	let data = JSON.parse(xhtp.responseText);
	console.log(data);

	data.forEach(item => {
		makeRow2(item);
	});
}

/*function makeRow(item) {
	// template 가져오기
	let templ = document.querySelector('div.content>ul>li').cloneNode(true);
	console.log(templ);
	templ.querySelector('span:nth-of-type(1)').innerHTML = item.replyNo;
	templ.querySelector('span:nth-of-type(2)').innerHTML = item.reply;
	templ.querySelector('span:nth-of-type(3)').innerHTML = item.replyer;
	templ.querySelector('span:nth-of-type(4)').innerHTML = '<button class="btn btn-light">❌</butoon>';

	document.querySelector('div.content>ul').appendChild(templ);
}*/