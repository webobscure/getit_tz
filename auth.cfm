<cfset username = 'webobscure'>
<cfset password = '123'>

<cfif form.username IS username>
    <!--- username is correct --->
    <cfif form.password IS password>
        <!--- password is also correct, send user to loggedin page --->
        <cflocation  url="index.cfm">
    <cfelse>
        <cfset error = "The password is wrong">
        <cflocation  url="login.cfm/error=#error#">

    </cfif>
    <cfelse>
        <cfset errormsg = "The username is wrong">
        <cflocation  url="login.cfm/error=#errormsg#">
</cfif>