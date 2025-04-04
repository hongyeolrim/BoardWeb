/**
 * 
 */

const xhtp = new XMLHttpRequest();
xhtp.open('get', 'boardList.do'); // 경로 지정
xhtp.send();

xhtp.onload = function(){
}