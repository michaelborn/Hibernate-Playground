component {

	this.name = "orm-datasources";
	// H2 datasource
    // Inline datasources are only supported in Lucee.
    this.datasource={
    class: 'org.h2.Driver'
    , bundleName: 'org.h2'
    , connectionString: 'jdbc:h2:#getDirectoryFromPath(getCurrentTemplatePath())#/datasource/db;MODE=MySQL'
    };
	this.ormEnabled = true;
	this.ormSettings = {
		dbcreate: "dropcreate",
		skipCFCWithError : false,
		saveMapping : false
	};

	/**
	 * @url https://luceeserver.atlassian.net/browse/LDEV-4276
	 */
	javaSystem = createObject( "java", "java.lang.System" );
	javaSystem.setProperty("javax.xml.bind.context.factory", "com.sun.xml.bind.v2.ContextFactory");

}
