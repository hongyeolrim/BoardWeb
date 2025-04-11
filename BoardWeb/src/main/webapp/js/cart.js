/**
 * 
 */

// 태그.addEventListener('이벤트종류', 할일함수)

document.addEventListener('DOMContentLoaded', function() {

	function updateSum(row) {
		const numberInput = row.querySelector('.p_num');
		const number = parseInt(numberInput.value); // 값 다시 꺼내옴

		const price = parseInt(row.querySelector('.p_price').value); // 개당 가격 가져오기
		const sum = price * number; // 합계 계산
		row.querySelector('.sum').textContent = sum.toLocaleString() + '원';
	};

	function updateNumber(row, change) {
		const numberInput = row.querySelector('.p_num'); // 수량 입력칸
		const number = parseInt(numberInput.value) + change; // 수량 + (바뀌는 값, 음수 또는 양수)

		if (number < 1) return; // 수량은 1보다 작아질 수 없음

		numberInput.value = number; // 바뀐 수량 반영

		updateSum(row);
	};

	// 수량 업 버튼 처리
	let upBtns = document.querySelectorAll('.fas.up');
	upBtns.forEach(btn => {
		btn.addEventListener('click', function(e) {

			const row = e.target.closest('.row.data'); // 버튼이 포함된 상품 줄
			updateNumber(row, +1);
		})
	})

	// 수량 다운 버튼 처리
	let downBtns = document.querySelectorAll('.fas.down');
	downBtns.forEach(btn => {
		btn.addEventListener('click', function(e) {
			const row = e.target.closest('.row.data'); // 버튼이 포함된 상품 줄
			updateNumber(row, -1);
		})
	})

	// 사용자가 직접 수량 입력하는 부분 처리
	let inputByKeys = document.querySelectorAll('.updown .p_num');
	inputByKeys.forEach(input => {
		input.addEventListener('keyup', function(e) {
			const row = e.target.closest('.row.data'); // 버튼이 포함된 상품 줄
			updateSum(row);
		})
	})

	let deleteBtns = document.querySelectorAll('.basketcmd .abutton');
	deleteBtns.forEach(btn => {
		btn.addEventListener('click', function(e) {
			e.target.closest('.row.data').remove();
		})
	})

	let delSeletedBtn = document.querySelector('#btnDeleteSelected');
	delSeletedBtn.addEventListener('click', function(e) {
		const checkBoxes = document.querySelectorAll('input[type="checkbox"]:checked');
		checkBoxes.forEach(checkbox => {
			checkbox.closest('.row.data').remove();
		})
	});

	let delAllBtn = document.querySelector('#btnDeleteAll');
	delAllBtn.addEventListener('click', function(e) {
		const allData = document.querySelectorAll('.row.data')
		allData.forEach(data => {
			data.remove();
		})
	});
}); 