let eventAddSuccess = function(result) {
  calendar.addEvent({
    id: result.eventId,
    title: result.title,
    start: result.startDate,
    end: result.endDate
  });
  alert("일정 등록 완료!🎉");
};

let getEventList = function(events) {
  events.forEach(ev => {
    calendar.addEvent({
      id: ev.eventId,
      title: ev.title,
      start: ev.startDate,
      end: ev.endDate
    });
  });
}; 

let eventRemoveSuccess = async function(arg) {
  if (confirm('정말 이 일정을 삭제할까요?')) {
    let id = arg.event.id;

    try {
      const result = await svc.removeEvent(id);
      if (result === 'success') {
        arg.event.remove();
        alert("삭제 완료! 🗑️");
      } else {
        alert("삭제 실패 😢");
      }
    } catch (error) {
      errorCallback(error);
    }
  }
}; 

let errorCallback = function(error) {
  alert("서버 요청 실패!");
}; 
