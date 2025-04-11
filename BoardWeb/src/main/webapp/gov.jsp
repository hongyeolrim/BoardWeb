<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gov.jsp</title>
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body>
    <table class="table table-striped">

        <thead>
            <tr>
                <th>아이디</th>
                <th>센터명</th>
                <th>연락처</th>
                <th>시/도 정보</th>
            </tr>
        </thead>
        <tbody id="centerList">
        </tbody>
    </table>

<ul id="nameList"></ul>

    <script>
let url = 'https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=284&serviceKey=bOpIZgdcRIFu2I9KnJiESB0QpudVGtMjJ8F0RHMaxf6liJRV5DD5WgaWvuFv6r43Gup%2FxwIzzHwMFd28kI76hg%3D%3D';
let centerList = [];

fetch(url)
.then(result => result.json())
.then(result => {
    console.log(result);
    centerList = result.data; // 센터 전체 정보
    centerList.forEach(center => {
        let tr = makeCenter(center);
        document.querySelector("#centerList").appendChild(tr);
    })
})
.catch(err => console.error(err))

function makeCenter(center){
    let tr = document.createElement('tr');
    
    // tr 영역 클릭 이벤트
    tr.addEventListener('click', function(e){
        openWindow(center);
    });
    
    let fields = ['id', 'centerName', 'phoneNumber', 'sido'];
    
    // td 생성
    fields.forEach(field => {
        let td = document.createElement('td');
        td.innerHTML = center[field];
        tr.appendChild(td);
    })
    return tr;
}

// tr 클릭 이벤트 핸들러
function openWindow(center){
    window.open('map.jsp?lat='+center.lat+'&lng='+center.lng);
}
</script>
<script src="js/arrayMethodBundle.js"></script>

</body>
</html>