document.addEventListener('DOMContentLoaded', function () {

    var calendarEl = $('#calendar')[0];
    // full-calendar 생성하기
    var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: false, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
            left: 'prev,next',
            center: 'title',
            right: 'today timeGridWeek dayGridMonth' // timeGridDay,timeGridWeek,listWeek'

        },
        initialView: 'timeGridWeek', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        // initialDate: '2023-05-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function (obj) { // 이벤트가 추가되면 발생하는 이벤트
            console.log(obj);
        },
        eventChange: function (obj) { // 이벤트가 수정되면 발생하는 이벤트
            console.log(obj);
        },
        eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
            console.log('삭제완료');
        },





        // calendarGet
        // 처음 캘린더 데이터를 모두 불러와야함

        // 필요 데이터  로그인된 id 로 t_calender에서 전부 검색해서 불러오고 출력? or api로 쏴주기 
        // <select id="" resultType="">
        // select * from t_calender where id = #{id}
        // </select>



        // 캘린더의 빈공간 클릭시, or calendarfix에서 일정 추가. 색상은 으음 모르겟음
        // canlendarAdd


        // <insert id="" parameterType="">
        // insert into t_calender
        // values(
        // #{cal_seq}, #{id}, #{cal_title}, #{cal_startdate}, #{cal_enddate} ) 순서 중요
        //                         ㄴ> 테이블컬럼명은 cal_memo인데 일단 편의상 cal_title로 표기
        // </insert>

        select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.

            var title = prompt('일정 입력:');
            if (title) {
                // 얘네들을 받아서 DB에 등록?
                calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay
                });

            }

        },


        droppable: true,







        // canlendarDelete
        eventClick: function (arg) {

            // 클릭한 데이터 받아와서 삭제하기
            // 같은 이름의 타이틀이 있는 경우엔? > id랑 cal_seq로 검색하면 문제x


            // 있는 일정 클릭시 삭제하는 기능 , 
            console.log(arg);
            if (confirm('일정을 삭제하시겠습니까?')) {
                $.ajax({
                    url: 'canlendarDelete.do', // 어디로?
                    type: 'post', // get? post?
                    data: {

                        // "id": session.getparameter("id"),
                        // "cal_seq": arg.cal_seq()

                    },  // 보낼 데이터
                    dataType: "json",


                    success: function (res) { //res== canlendarDelete.do의 리스폰스
                        // 요청이 성공하면 실행될 콜백함수(특정 타이밍에 자동으로 실행되는 함수) 
                        console.log(res);
                        result = res;
                        // 응답 시점이 코드 실행보다 느릴 수 있으므로
                        // 응답 결과를 사용할 때에는 가급적 success 안에서 할 것.

                        // 선택한 일정과 같은 데이터를 db에서 삭제 필요
                        console.log("삭제완료");
                    },
                    error: function (e) {
                        // 요청이 실패하면 실행될 콜백함수
                        alert("실패");
                    }

                });

                arg.event.remove();

            }
        },

        // 이벤트 
        events: [
            {
                title: 'All Day Event',
                start: '2023-05-15',
                end: '2023-05-19',
                // 종료일 -1일까지 바가 설정됌 
                color: 'blue'
            },
            {
                title: 'Repeating Event',
                start: '2023-05-13T16:00:00'
            },
            {
                title: 'Click for Google',
                start: '2021-05-19'
            }
        ]
    });
    // 캘린더 랜더링
    calendar.render();
});