<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='js/index.global.js'></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    window.calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: new Date().toISOString().slice(0, 10),
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('🌸일정 제목을 입력하세요🌸');
        if (title) {
          
          // 날짜 문자열 가져오기
          let startStr = arg.startStr;
          let endStr = arg.endStr;
          
          // allDay면 그대로, 시간 포함이면 19자로 자르기
          let isAllDay = startStr.length <= 10;
          
          let newEvent = {
            title: title,
            startDate: (isAllDay) ? startStr : startStr.slice(0, 19),
            endDate: (isAllDay) ? endStr : endStr.slice(0, 19)
          };
          svc.addEvent(newEvent, eventAddSuccess, function(err){
          alert("일정 등록 실패🥺");
          });
        }
        calendar.unselect()
      },
      
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2023-01-01'
        },
        {
          title: 'Long Event',
          start: '2023-01-07',
          end: '2023-01-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-01-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-01-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2023-01-11',
          end: '2023-01-13'
        },
        {
          title: 'Meeting',
          start: '2023-01-12T10:30:00',
          end: '2023-01-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2023-01-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2023-01-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2023-01-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2023-01-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2023-01-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2023-01-28'
        }
      ]
    });

    calendar.render();
    svc.eventList();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>
  
<script src="js/eventService.js"></script>
<script src="js/event.js"></script>
</body>
</html>
