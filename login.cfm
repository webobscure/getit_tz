<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./index.css" rel="stylesheet"> 
        <title>Login page</title>
    </head>
    <body>

        <cfif structKeyExists(URL, 'logout')>
            <cfset createObject('component', 'ColdFusion2021.cfusion.wwwroot.components.authenticationService')>
        </cfif>
        
        <cfif structKeyExists(form, 'submitLogin')>
            <!---Create of instance of the auth service component--->
            <cfset authenticationService = createObject('component', 'authenticationsService')>
            <!---server side data validation--->
            <cfset aErrorMessages = authenticationService.validateUser(form.username, form.password)>
            <cfif arrayIsEmpty(aErrorMessages)>
                <!---Proceed--->
                <cfset isUserLoggedIn = authenticationService.doLogin(form.username, form.password)>

            </cfif>
        </cfif>

        <cfform id='formConnection' preservedata="true">
            <fieldset>
                <cfif structKeyExists(variables, 'aErrorMessages') AND NOT arrayIsEmpty(aErrorMessages)>
                    <cfoutput>
                        <cfloop array="#aErrorMessages#" item="message">
                            <p class="error_message">#message#</p>
                        </cfloop>
                    </cfoutput>
                </cfif>

                <cfif structKeyExists(variables, 'isUserLoggedIn') AND isUserLoggedIn EQ false>
                    <p class="error_message">User not found. Please try again</p>
                </cfif>


                <cfif structKeyExists(session, 'stLoggedInUser')>
                    <!---Display a welcome page--->
                    <p><cfoutput>Welcome #session.stLoggedInUser.first_name# #session.stLoggedInUser.last_name#!</cfoutput></p>
                    <p><a href="index.cfm">Main page</a> <a href="index.cfm?logout">Logout</a></p>
                <cfelse >
                <div class="contianer">
                    <label for="username"><b>Username</b></label>
                <cfinput type="text"  name="username" id="username" validateat="onSubmit" required >
                <br/>
                <label for="password"><b>Password</b></label>
                <cfinput type="password"  name="password"  id="password" validateat="onSubmit" required>
                <br/>
                <cfinput type="submit" name="submitlogin" id="submitlogin" value="Login"> 
                </cfif>
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
    
    