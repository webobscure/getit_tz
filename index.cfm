
<cfset strHelloWorld = 'Hello World!'>
<cfoutput>#strHelloWorld#</cfoutput>
<br/>
<cfscript> 
    myQuery = queryNew("id,name,ctype","", 
     [ 
     {id=1,name="1",ctype=true}, 
     {id=2,name="Two",ctype=false}, 
     {id=3,name="3",ctype="true"},
     {id="4",name="4",ctype="false"}
     ]); 
    writeOutput ( SerializeJSON(myQuery) );
   </cfscript>  