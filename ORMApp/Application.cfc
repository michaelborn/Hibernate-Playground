component {

	this.name = "ORMStartupApp";
	// H2 datasource
    // Inline datasources are only supported in Lucee.
    this.datasource={
        class: 'org.h2.Driver'
        , bundleName: 'org.h2'
        , connectionString: 'jdbc:h2:#getDirectoryFromPath(getCurrentTemplatePath())#/datasource/db;MODE=MySQL'
    };

    rootPath = getDirectoryFromPath( getCurrentTemplatePath() );
    parentPath = replace( rootPath, "ORMApp", "" );
    this.mappings[ "ormModels" ] = parentPath & "models";

	this.ormEnabled = true;
	this.ormSettings = {
        cfclocation     : this.mappings[ "ormModels" ],
        dbcreate        : "dropcreate",
        skipCFCWithError: false,
        saveMapping     : false
	};

	/**
	 * @url https://luceeserver.atlassian.net/browse/LDEV-4276
	 */
	javaSystem = createObject( "java", "java.lang.System" );
	javaSystem.setProperty("javax.xml.bind.context.factory", "com.sun.xml.bind.v2.ContextFactory");
}
