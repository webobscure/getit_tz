<cfcomponent output="false">
    <cffunction name="validateUser" access="public" output="false" returntype="array">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">

        <cfset aErrorMessages = ArrayNew(1)>
        <cfif NOT isValid('username', arguments.username)>
            <cfset arrayAppend(aErrorMessages, 'Please provide a valid username') >
        </cfif>
        <cfif arguments.password EQ ''>
            <cfset arrayAppend(aErrorMessages, 'Please provide a password') >
        </cfif>
        <cfreturn aErrorMessages>
    </cffunction>

    <cffunction name="doLogin" access="public" output="false" returntype="boolean">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">

        <cfset isUserLogin = false>

        <cfquery name="LoginUser">
            SELECT * FROM "user" WHERE username = '#arguments.username#' AND password = '#arguments.password#';
        </cfquery>

        <cfif LoginUser.recordCount EQ 1>
            <cflogin>
                <cfloginuser name="#LoginUser.username#" password="#LoginUser.password#">
            </cflogin>

            <cfset session.stLoggedInUser = {'first_name' = LoginUser.first_name, 'last_name' = LoginUser.last_name, 'id' = LoginUser.id}>
            <cfset isUserLogin = true>
        </cfif>
    </cffunction>

    <cffunction name="doLogout" access="public" output="false" returntype="void">
        <cfset structDelete(session, 'stLoggedInUser')>
        <cflogout >
    </cffunction>
</cfcomponent>