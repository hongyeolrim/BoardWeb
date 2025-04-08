<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.btn-strawberry {
    background-color: #FFDDE4;  /* 🍓 딸기우유 색 */
    color: #5c3a3a;             /* 딸기시럽 느낌 나는 텍스트 */
    border: 1px solid #FF8DA1;  /* 테두리 진분홍 */
    padding: 8px 16px;
    font-weight: bold;
    transition: all 0.2s ease;
    box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
}

.btn-strawberry:hover {
    background-color: #FFB6C1;  /* hover 시 진한 딸기우유색 */
    color: white;
    transform: scale(1.05);
}

</style>
<!-- Top navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
    <div class="container-fluid">
        <button class="btn btn-strawberry" id="sidebarToggle">메뉴</button>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                <li class="nav-item dropdown"><c:choose>
                        <c:when test="${empty logId}">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">DROPDOWN</a>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#!">Action</a> <a class="dropdown-item" href="#!">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#!">Something else here</a>
                            </div>
                        </c:when>
                        <c:when test="${not empty logId && empty img}">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class=iconimg
                                src="images/chillguy.PNG"></a>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#!">Action</a> <a class="dropdown-item" href="#!">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#!">Something else here</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class=iconimg
                                src="images/${img }"></a>
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#!">Action</a> <a class="dropdown-item" href="#!">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#!">Something else here</a>
                            </div>
                        </c:otherwise>
                    </c:choose></li>
            </ul>
        </div>
    </div>
</nav>