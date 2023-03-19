<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <cfset strHelloWorld = 'Hello World!'>
<cfoutput>#strHelloWorld#</cfoutput>
<br/>
   <cfset varCheck1 = 5>
   <cfset varCheck2 = 'password'>

   <cfif varCheck1 GT 5>
    Yes it's bigger than 1 (<cfoutput>#varCheck1#</cfoutput>)
   <cfelse>
    NO
    <a href='login.cfm'>Go to login page</a>
   </cfif>
</body>
</html>

