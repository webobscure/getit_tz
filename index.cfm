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

<cfquery datasource="CRM" name="qryUser">
    SELECT * FROM "user";
</cfquery>
   <cfoutput query="qryUser">
    COLUMNS : #qryUser.columnList# <br/>
    RECORD COUNT: #qryUser.recordCount# <br/>
    CURRENT ROW: #qryUser.currentRow# <br/>
   </cfoutput>

<h2>Users</h2>
<cfoutput query="qryUser">
    #qryUser.last_name# <br/>
</cfoutput>
    <a href='login.cfm'>Go to login page</a>
</body>
</html>

