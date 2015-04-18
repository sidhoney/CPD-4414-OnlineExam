<%-- 
    Document   : register
    Created on : 17-Apr-2015, 10:22:30 PM
    Author     : C0648301
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>New User Registration</title>
        <script type="text/javascript"
                src="scripts/userRegistrationValidation.js">
        </script>
        <script type="text/javascript">

        </script>
        <style>
            #login-box {
                width:333px;
                height: 552px;
                padding: 58px 76px 0 76px;
                color: #ebebeb;
                font: 12px Arial, Helvetica, sans-serif;

            }

            #login-box img {
                border:none;
            }

            #login-box h2 {
                padding:0;
                margin:0;
                color: #ebebeb;
                font: bold 44px "Calibri", Arial;
            }


            #login-box-name {
                float: left;
                display:inline;
                width:80px;
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
                border: 1px solid #0d2c52;
                font-size: 16px;
                color: #000000;
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
                width:833px;
                height: 652px;
                padding: 0px 186px 20px 106px;
                color: black;
                font: 12px Arial, Helvetica, sans-serif;
            }
        </style>
    </head>

    <body> 
        <div style="padding: 10px 0 0 100px;">
            <form name="registerForm" id="registerForm" method="post" action="RegisterNewUser">
                <table width="100%" id="register-box">
                    <tbody>
                        <tr>
                            <td><span style="font-family: arial,verdana; font-size: 10pt;">
                                    <h2>Register to continue</h2>


                                    <div>

                                        <table cellspacing="1" cellpadding="3" border="0">
                                            <tbody>
                                                <tr>
                                                    <td id="login-box-name">NAME</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="name" id="txtName" onChange="validateName()" />
                                                        <i id="nameError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">AGE</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="age" id="txtAge" onchange="validateAge()"  />
                                                        <i id="ageError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">ADDRESS</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="address" id="txtAddress" onchange="validateAddress()"  />
                                                        <i id="addressError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">MOBILE NO</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="phoneno" id="txtPhone" onchange="validatePhone()"  />
                                                        <i id="phoneError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name" >EMAIL-ID</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="email" id="txtEmail" onchange="validateEmail()"  />
                                                        <i id="emailError"></i>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td id="login-box-name"> USERNAME</td>
                                                    <td>
                                                        <input type="text" class="form-login" name="username" id="txtUsername" onchange="check(this.value)" />
                                                        <i id="usernameError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">PASSWORD</td>
                                                    <td>
                                                        <input type="password" class="form-login" id="txtPassword" name="password" />
                                                        <i id="passwordError"></i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="login-box-name">CONFIRM PASSWORD</td>
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
