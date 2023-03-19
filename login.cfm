<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./index.css" rel="stylesheet"> 
        <title>Login page</title>
    </head>
    <body>
        <cfif isDefined('url.error')>
            <font color='#FF0000'>
                <cfoutput>
                    #url.error#
                </cfoutput>
        </font>
        </cfif>

       <form action='auth.cfm' method="POST">
        <div class="container">
            <label for="username"><b>Username</b></label>
            <input type="text" placeholder="Enter a username" name="username" required >
            <br/>
            <label for="password"><b>Password</b></label>
            <input type="password" placeholder="Enter a password" name="password" required>
            <br/>
            <button type="submit">Login</button>
        </div>

        <div class="container">
            <button type="button" class="cancelbutton">Cancel</button>
            <span class="psw">Forget <a href="#">password</a></span>
        </div>
       </form>
    </body>
    </html>
    
    