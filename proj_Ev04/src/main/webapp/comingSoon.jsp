<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Coming Soon</title>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>

    <%
   
        LocalDate today = LocalDate.now();
        String openDateString = request.getParameter("openDate");

        long daysLeft = 0; 
        boolean isDateValid = false; 

                String[] dateParts = openDateString.split("-");
                int openYear = Integer.parseInt(dateParts[0]);
                int openMonth = Integer.parseInt(dateParts[1]);
                int openDay = Integer.parseInt(dateParts[2]);

                LocalDate openDate = LocalDate.of(openYear, openMonth, openDay);

                daysLeft = ChronoUnit.DAYS.between(today, openDate); 
                isDateValid = true; 

                int todayYear = today.getYear();
                int todayMonth = today.getMonthValue();
                int todayDay = today.getDayOfMonth();
    %>
        <div id="wrapper">
            <div id="flexRow_coming">
                <span>Today </span>
                <input type="text" value="<%= todayYear %>" readonly> 년
                <input type="text" value="<%= todayMonth %>" readonly> 월
                <input type="text" value="<%= todayDay %>" readonly> 일 
            </div>
            <div id="flexRow_coming">
                <span>Open </span>
                <input type="text" value="<%= openYear %>" readonly> 년 
                <input type="text" value="<%= openMonth %>" readonly> 월 
                <input type="text" value="<%= openDay %>" readonly> 일 	
            </div>
            <h1>COMMING SOON</h1>
            <div id="cntRow">오픈 <%= daysLeft %>일 전</div>
        </div>    

    <script src="script/script.js"></script>
</body>
</html>
