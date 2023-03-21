<cfcomponent output="false">
    <cffunction name="validateUser" access="public" output="false" returntype="array">
        <cfargument name="username" type="string" required="true" />
        <cfargument name="password" type="string" required="true" />

        <cfset aErrorMessages = ArrayNew(1)>
        <cfif NOT isValid('string', arguments.username)>
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

        <cfset var isUserLogin = false>

        <cfquery name="rsLoginUser" datasource="CRM">
            SELECT * FROM "user" WHERE username = '#arguments.username#' AND password = '#arguments.password#';
        </cfquery>

        <cfif rsLoginUser.recordCount EQ 1>
            <cflogin>
                <rsLoginUser name="#qryUser.username#" password="#qryUser.password#">
            </cflogin>

            <cfset session.stLoggedInUser = {'first_name' = qryUser.first_name, 'last_name' = qryUser.last_name, 'id' = qryUser.id}>
            <cfset var isUserLogin = true >
        </cfif>
        <cfreturn isUserLoggedIn />
    </cffunction>

    <cffunction name="doLogout" access="public" output="false" returntype="void">
        <cfset structDelete(session, 'stLoggedInUser')>
        <cflogout >
    </cffunction>
</cfcomponent>