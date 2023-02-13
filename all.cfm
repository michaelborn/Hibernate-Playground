<h1>All ORM Speed Test Metrics</h1>

<cfscript>
    setting requesttimeout="500";
    resultFile = new metrics().runAll();
</cfscript>

<cfoutput>
    <p>The finished metrics CSV file is located at <a href="#resultFile#">#resultFile#</a>.</p>
</cfoutput>