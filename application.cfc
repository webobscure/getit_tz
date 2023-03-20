<cfscript>
    THIS.Name = "Get It Tz";
    THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 0, 15 );
    THIS.SessionManagement = true;
    this.STRICTNUMBERVALIDATION = false;
    THIS.SessionTimeout = CreateTimeSpan( 0, 0, 0, 10 );
    THIS.LoginStorage = "SESSION";
    THIS.SetClientCookies = true;
</cfscript>
