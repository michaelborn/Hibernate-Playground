<h1>ORM Startup Speed Test</h1>

<p>Measures (or seeks to measure) the application startup time for an ORM app with 1000 entities.</p>

<cfscript>
    start = getTickCount();
    new metrics().doPageRequest();
    end = getTickCount();
</cfscript>
<cfoutput>
<p>
    Finished in <strong>#end-start#ms</strong>.
</p>
</cfoutput>