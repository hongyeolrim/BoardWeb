/**
 * 
 */

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
}