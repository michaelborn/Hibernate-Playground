<h1>Page Request Speed Test</h1>

<p>Measures (or seeks to measure) the average request time for an ORM app with 1000 entities.</p>

<cfscript>
    iterations = 1000;
    start = getTickCount();
    new metrics().doPageRequest( 1000 );
    end = getTickCount();
</cfscript>
<cfoutput>
<p>
    Finished in <strong>#end-start#ms</strong>.
</p>
<p>
    That's <strong>#( end-start ) / iterations#ms per request</strong>.
</p>
</cfoutput>