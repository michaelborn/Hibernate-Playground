<h1><code>ORMReload()</code> Speed Test</h1>

<cfscript>
    start = getTickCount();
    new metrics().doORMReload();
    end = getTickCount();
</cfscript>
<cfoutput>
<p>
    Finished in <strong>#end-start#ms</strong>.
</p>
</cfoutput>