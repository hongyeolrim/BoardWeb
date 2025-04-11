const svc = {
  // 전체 일정 가져오기
  eventList: async function () {
    try {
      const res = await fetch('eventList.do');
      const data = await res.json();
      getEventList(data); // 가져온 이벤트를 캘린더에 표시
    } catch (error) {
      errorCallback(error);
    }
  },

  // 일정 등록
  addEvent: async function (event) {
    try {
      const res = await fetch('addEvent.do', {
        method: 'POST',
        headers: {
          'Content-type': 'application/json'
        },
        body: JSON.stringify(event)
      });
      const result = await res.json();
      eventAddSuccess(result); // 등록 성공 후 캘린더에 추가
    } catch (error) {
      errorCallback(error);
    }
  },

  // 일정 삭제
  removeEvent: async function (eventId) {
    try {
      const res = await fetch('removeEvent.do?eventId=' + eventId, {
        method: 'POST'
      });
      const result = await res.text();
      return result; // 삭제 결과(success/fail) 반환
    } catch (error) {
      throw error; // 호출한 쪽에서 catch 하도록 던져줌
    }
  }
};
