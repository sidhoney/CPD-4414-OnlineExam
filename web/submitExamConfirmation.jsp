<%-- 
    Document   : submitExamConfirmation
    Created on : 18-Apr-2015, 8:15:45 PM
    Author     : C0648301
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final - MGIT</title>
    </head>
    <body>
        <%

        %>

        <form name="submitExam" id="submitExamNow" action="submitExamination" method="POST">
            <table border="0" cellspacing="0" cellpadding="10" style="position: absolute; top: 40%; left: 30%">
                <tr align="center" style="background-color: #e1e1f0; padding: 15px">
                    <td><b style="font-size: 20px">Do you wish to submit?</b></td>
                </tr>

                </tr>
                <tr align="center" style="background-color: #a9a8f0; padding: 15px">
                    <td align ="center">
                        <a href="javascript:void(0)" style="padding: 20px" 
                           onclick="javascript:document.getElementById('submitExamNow').submit()"><img src="images/exam-submit-confirm.png" style="border: 0"/></a>

                        <a href ="Examination.jsp" style="padding: 20px"><img src="images/back-to-exam.png" style="border: 0"/></a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>

