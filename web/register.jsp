<%-- 
    Document   : register
    Created on : 18-Apr-2015, 8:14:48 PM
    Author     : C0648301
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>New Registration- MGIT</title>
        <style>
            #login-box {
                width:800px;
                height: 352px;
                padding: 58px 76px 0 76px;
                color: #ebebeb;
                font: 12px;


            }
            #login-box h2 {
                padding:0;
                margin:0;
                color: black;

            }


            #login-box-name {
                float: left;
                display:inline;
                width: 60px;
                text-align: left;
                padding: 14px 10px 0 0;
                margin:0 0 7px 0;
            }

            #login-box-field {
                float: left;
                display:inline;
                width:230px;
                margin:0;
                margin:0 0 7px 0;
            }


            .form-login  {
                width: 205px;
                padding: 10px 4px 6px 3px;
                background-color:#8A601E;
                font-size: 16px;
                color: black;
            }


            .login-box-options  {
                clear:both;
                padding-left:87px;
                font-size: 11px;
            }

            .login-box-options a {
                color: #ebebeb;
                font-size: 11px;
            }

            #register-box {
                width:733px;
                height: 550px;
                padding: 0px 186px 20px 106px;
                color: #ebebeb;
                font: 12px Arial, Helvetica, sans-serif;
                background: url(images/4.png) no-repeat left top;
            }
        </style>
        <script type="text/javascript" src="scripts/userRegistrationValidation.js"></script>
        <script type="text/javascript"></script>
    </head>

    <body> 
        <div style="padding: 100px 0 0 100px;">
            <form name="registerForm" id="registerForm" method="post" action="RegisterNewUser">
                <table width="100%" id="register-box">
                    <tbody>
                        <tr>
                            <td><span style="font-family: arial,verdana; font-size: 10pt;">
                                    <h2>Registration Form</h2>


                                    <div>

                                        <table cellspacing="1" cellpadding="3" border="0">
                                            <tbody>
                                                <tr>
                                                    <td id="login-box-name">Name:</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="name" id="txtName" onChange="validateName()" />
                                                        <i id="nameError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">Age:</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="age" id="txtAge" onchange="validateAge()"  />
                                                        <i id="ageError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">Address:</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="address" id="txtAddress" onchange="validateAddress()"  />
                                                        <i id="addressError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">Mobile Number:</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="phoneno" id="txtPhone" onchange="validatePhone()"  />
                                                        <i id="phoneError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name" >Email:</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="email" id="txtEmail" onchange="validateEmail()"  />
                                                        <i id="emailError"></i>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td id="login-box-name"> Username:</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="username" id="txtUsername" onchange="check(this.value)" />
                                                        <i id="usernameError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">Password:</td>
                                                    <td>
                                                        <input type="password" class="form-login" id="txtPassword" name="password" />
                                                        <i id="passwordError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">Confirm Password:</td>
                                                    <td>
                                                        <input type="password" class="form-login" name="password2" id="txtConfirmPassword" onchange="validatePassword()" />
                                                        <i id="confirmpasswordError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td><i id="errMain"></i></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <a href="javascript:registerUser()">
                                                            <img src="images/register-btn.png" width="103" height="42" style="margin-left:0px; border: 0" /></a>

                                                        <a href="index.html"><img src="images/cancel-btn.png" width="103" height="42" 

                                                                                  style="margin-left:10px; border: 0" /></a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div></span></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
