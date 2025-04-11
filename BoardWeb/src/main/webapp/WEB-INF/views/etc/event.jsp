<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8' />
  <script src='js/index.global.js'></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      var calendarEl = document.getElementById('calendar');

      window.calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        initialDate: new Date().toISOString().slice(0, 10),
        navLinks: true, 
        selectable: true,
        selectMirror: true,
        
        
        select: async function (arg) {
            const title = prompt('🌸일정 제목을 입력하세요🌸');
            if (title) {
              let startStr = arg.startStr;
              let endStr = arg.endStr;
              let isAllDay = startStr.length <= 10;

              let newEvent = {
                title: title,
                startDate: isAllDay ? startStr : startStr.slice(0, 19),
                endDate: isAllDay ? endStr : endStr.slice(0, 19)
              };

              try {
                await svc.addEvent(newEvent); // 실패하면 catch에서 처리
              } catch (err) {
                alert("일정 등록 실패🥺");
              }
            }

            calendar.unselect();
          },

        eventClick: eventRemoveSuccess,
        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        events: [{
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

.back-to-board {
	text-align: center;
	margin-bottom: 20px;
}

.btn-cute {
	background-color: #ffb6c1;
	color: white;
	padding: 10px 25px;
	border-radius: 20px;
	font-size: 16px;
	text-decoration: none;
	border: none;
	display: inline-block;
	box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.2);
	transition: transform 0.2s ease;
	cursor: pointer;
}

.btn-cute:hover {
	transform: scale(1.05);
}
</style>
</head>

<body>
    <div class="back-to-board">
        <a href="boardList.do" class="btn-cute">🐰 게시판으로 가기</a>
    </div>
    <div id='calendar'></div>

  <script src="js/eventService.js"></script>
  <script src="js/event.js"></script>
</body>

</html>