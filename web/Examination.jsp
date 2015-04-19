<%-- 
    Document   : Examination
    Created on : 18-Apr-2015, 8:10:41 PM
    Author     : C0648301
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@page import="java.util.Date"%>
        <%
            HttpSession UserSession = request.getSession(false);
            if (UserSession.getAttribute("Username") == null) {
                response.sendRedirect("index.html");

            } else {
                String mins = request.getParameter("mins");
                if (mins == null) {
                    mins = "30";
                }

                String secs = request.getParameter("secs");
                if (secs == null) {
                    secs = "1";
                }

                String StartTime = "";
                String AlottedTime = "";

                StartTime = UserSession.getAttribute("StartTime").toString();

                AlottedTime = UserSession.getAttribute("Alotted").toString();

                int iAlottedTime = Integer.parseInt(AlottedTime);

                Date timer = new Date();

                long currentTime = timer.getTime() / 1000; //-- Current time in seconds

                int Elapsed = (int) currentTime - Integer.parseInt(StartTime); //-- Elapsed duration of the exam in seconds

                int remaining = iAlottedTime - Elapsed; //-- Remaining duration of the exam in seconds

                int remainingMin = remaining / 60;

                int remainingSec = remaining % 60;


        %>
        <script>
            <!--
        var mins = <%=remainingMin%>; // write mins to javascript
            var secs = <%=remainingSec%>; // write secs to javascript

            function timer()
            {

                if (--secs == -1)
                {
                    secs = 59;
                    --mins;
                }

                if (secs < 10)
                    secs = "0" + secs;
                if (mins < 10)
                    mins = "0" + parseInt(mins, 10);


                document.getElementById("ShowTimer").innerHTML = mins + " : " + secs;


                if (mins < 20)
                {
                    document.getElementById("ShowTimer").style.color = "#FF9933";
                }
                if (mins < 10)
                {
                    document.getElementById("ShowTimer").style.color = "#CC0000";
                }
                if (secs == 0 && mins == 0) // time over
                {
                    alert("Your exam duration has ended. Please click OK to view your Result Summary");
                    document.getElementById("timeoutExamPost").submit();

                }
                else
                    ec
                {
                    window.setTimeout("timer()", 1000);
                }
            }

            function getPreviousQuestion()
            {
                var myframe = document.getElementById("QuestionPaperFrame");
                var QNo = getCookie("QuestionNo");
                QNo--;
                if (QNo != 0)
                {
                    setCookie("QuestionNo", QNo, 1);
                    setCookie("MoveDirection", "Back", 1);

                    myframe.contentDocument.getElementById("QuestionPaperForm").submit();
                }
            }

            function getNextQuestion()
            {
                var myframe = document.getElementById("QuestionPaperFrame");
                var QNo = getCookie("QuestionNo");

                QNo++;
                if (QNo != 6)
                {
                    setCookie("QuestionNo", QNo, 1);
                    setCookie("MoveDirection", "Next", 1);

                    myframe.contentDocument.getElementById("QuestionPaperForm").submit();
                }
            }



            function setCookie(c_name, value, exdays)
            {
                var exdate = new Date();
                exdate.setDate(exdate.getDate() + exdays);
                var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
                document.cookie = c_name + "=" + c_value;
            }

            function getCookie(c_name)
            {
                var i, x, y, ARRcookies = document.cookie.split(";");
                for (i = 0; i < ARRcookies.length; i++)
                {
                    x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
                    y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
                    x = x.replace(/^\s+|\s+$/g, "");
                    if (x == c_name)
                    {
                        return unescape(y);
                    }
                }
            }
            //-->
        </script>
        <title><% out.print(UserSession.getAttribute("ExamName") + " : " + UserSession.getAttribute("UEID"));%> - Online Examination Portal</title>
    </head>
    <body>
        <form action="<%=request.getRequestURL()%>" name="forma">
            <div id="ExamPageHeader" style="height: 10%; width:100%; position: fixed; top: 0;left: 0; padding-top: 5px; padding-bottom: 12px; background-color: #e1e1f0">

                <table align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table border="0"  width="200" cellspacing="0" cellpadding="2">
                                <tr>
                                    <td>
                                        Exam-ID
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td style="padding-left: 10px">
                                        <% out.println(UserSession.getAttribute("ExamID")); %>
                                    </td>


                                </tr>
                                <tr>
                                    <td>
                                        User-ID
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td style="padding-left: 10px">
                                        <% out.println(UserSession.getAttribute("UserId")); %>
                                    </td>


                                </tr>
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td>
                                        :
                                    </td>
                                    <td style="padding-left: 10px">
                                        <%
                                            DateFormat dtFormat = new SimpleDateFormat("dd / MM / yyyy");
                                            out.println(dtFormat.format(timer));
                                            UserSession.setAttribute("ExamDate", dtFormat.format(timer));
                                        %>
                                    </td>
                                </tr>
                            </table>


                        </td>
                        <td>
                            <table border="0" width="600"  cellspacing="0" cellpadding="2">
                                <tr align="center">
                                    <td valign="center">
                                        <b>Online Exam</b>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td rowspan="2">
                                        <b style="font-size: 24px"> <% out.print(UserSession.getAttribute("ExamName")); %> </b>
                                    </td>
                                </tr>

                            </table>


                        </td>
                        <td>
                            <table border="0" width="200" cellspacing="0" cellpadding="2">

                                <tr >
                                    <td colspan="3" valign="bottom" align="right">
                                        <b>Time Remain</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="right">
                                        <b id="ShowTimer"></b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <hr/>
            </div>
            <div id="ExamPageQuestionPaper" style="height: 78%; width:99.5%; position: fixed; padding-left: 0px; padding-top: 78px">
                <iframe src="QuestionPaper.jsp" id="QuestionPaperFrame" width="100%" height="100%" frameborder="0" name="QuestionPaper"></iframe>
                <hr/>

                <a href="javascript:void(0)" onClick="getPreviousQuestion()" style="padding: 6px"><img src ="images/previous-question-btn.png" style="border: 0"/></a>
                <a href="javascript:void(0)" style="padding: 6px;" onClick="getNextQuestion()"><img src ="images/next-question-exam.png" style="border: 0"/></a>

                <br>
                <b id="testID"></b>
            </div>

            <a href="submitExamConfirmation.jsp" 
               style="position: absolute; bottom: 0; right: 0; padding-bottom: 5px; padding-right: 20px">
                <img src ="images/finish-test-exam.png" style="border: 0"/></a>

        </form>
        <form name="finishExamonTimeout" id="timeoutExamPost" action="submitExamination" method="POST"></form>


        <script>
            <!--
        timer(); // call timer() after page is loaded
            //-->
        </script>
        <%
            }
        %>
    </body>
</html>

