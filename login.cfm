<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./index.css" rel="stylesheet"> 
        <title>Login page</title>
    </head>
    <body>
        <cfif structKeyExists(form, 'submitLogin')>
            <!---Create of instance of the auth service component--->
            <cfset authenticationService = createObject("component", 'authenticationService')>
            <!---server side data validation--->
            <cfset aErrorMessage = authenticationService.validateUser(form.username, form.password)>
            <cfif arrayIsEmpty(aErrorMessage)>
                <!---Proceed--->
                <cfset isUserLoggedIn = authenticationService.doLogin(form.username, form.password)>

            </cfif>
        </cfif>

        <cfform id='formConnection' preservedata="true">
            <fieldset>
                <div class="contianer">
                    <label for="username"><b>Username</b></label>
                <cfinput type="text"  name="username" id="username" validateat="onSubmit" required >
                <br/>
                <label for="password"><b>Password</b></label>
                <cfinput type="password"  name="password"  id="password" validateat="onSubmit" required>
                <br/>
                <cfinput type="submit" name="submitlogin" id="submitlogin" value="Login"> 
                </div>
            </fieldset>
        </cfform>


      

        <div class="container">
            <button type="button" class="cancelbutton">Cancel</button>
            <span class="psw">Forget <a href="#">password</a></span>
        </div>
       </form>
    </body>
    </html>
    
    