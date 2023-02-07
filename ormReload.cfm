<h1><code>ORMReload()</code> Speed Test</h1>

<cfscript>
    var start = getTickCount();
    new metrics().doORMReload();
    var end = getTickCount();
</cfscript>
<cfoutput>
<p>
    Finished in <strong>#end-start#ms</strong>.
</p>
</cfoutput>