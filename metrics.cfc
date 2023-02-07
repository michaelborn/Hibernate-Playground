component{

    property name="metricsFile" type="string";
    property name="luceeVersion" type="string";
    property name="hibernateVersion" type="string";
    property name="extensionVersion" type="string";
    property name="entities" type="array";

    public function init(){
        variables.metricsFile      = expandPath( "./metrics.csv" );
        variables.luceeVersion     = getCFEngine();
        variables.hibernateVersion = getHibernateVersion();
        variables.extensionVersion = getExtensionVersion();
        variables.entities = [];

        var headers = [
            "Test",
            "Iterations",
            "Lucee Version",
            "Extension Version",
            "Hibernate Version",
            "Elapsed Time"
        ];
        fileWrite( variables.metricsFile, arrayToList( headers ) & chr(10), "UTF-8" );
        return this;
    }

    public function runAll(){
        doORMReload();
        doEntityNew();
        doEntityLoad();
        doEntitySave();
        // Add new metrics here...
    }

    public function doORMReload(){
        var start = getTickCount();
        var iterations = 1;
        for( i = 0; i < iterations; i++ ){
            ormReload();
        }
        
        var elapsed = getTickCount()-start;        
        logMetric( "ORMReload", iterations, elapsed );
    }

    public function doEntityNew(){
        var iterations = 1000;
        var start = getTickCount();
        for( i = 1; i <= iterations; i++ ){
            variables.entities.append(
                entityNew( "TestEntity#i#", {
                    id : createUUID(),
                    name : "Michael Born"
                } )
            );
        }

        var elapsed = getTickCount()-start;        
        logMetric( "entityNew", iterations, elapsed );
    }

    public function doEntityLoad(){
        var iterations = 1000;
        var start = getTickCount();
        for( i = 1; i <= iterations; i++ ){
            entityLoad( "TestEntity#i#", createUUID() )
        }

        var elapsed = getTickCount()-start;        
        logMetric( "entityLoad", iterations, elapsed );
    }

    public function doEntitySave(){
        var iterations = 1000;
        var start = getTickCount();
        for( i = 1; i <= iterations; i++ ){
            entitySave( variables.entities[ i ] );
        }
        ormFlush();

        var elapsed = getTickCount()-start;        
        logMetric( "entitySave", iterations, elapsed );
    }

    /**
     * Log a metric to the CSV file.
     *
     * @name 
     * @iterations
     * @elapsedTime 
     */
    private function logMetric( required string name, required numeric iterations, required numeric elapsedTime ){
        var data = [
            arguments.name,
            arguments.iterations,
            variables.luceeVersion,
            variables.extensionVersion,
            variables.hibernateVersion,
            arguments.elapsedTime
        ];
        fileAppend( variables.metricsFile, arrayToList( data ) & chr(10), "UTF-8" );
    }

    private string function getHibernateVersion(){
        var version = createObject( "java", "org.hibernate.Version" );
        
        if ( version.getVersionString() != "[WORKING]" ) {
        return version.getVersionString();
        } else {
          // Differing code path for poorly packaged Lucee bundles which mangle the manifest version
        return version
          .getClass()
          .getClassLoader()
          .getBundle()
          .getVersion()
          .toString();
        }
    }

    private string function getExtensionVersion(){
        var extension = extensionList().filter( ( extension ) => extension.name == "Hibernate ORM Engine" );
        if ( !extension.recordCount ){
            throw( "Hibernate extension is not installed; please install it now." );
        } else {
            return extension.version;
        }
    }

    private string function getCFEngine(){
        return server.keyExists( "lucee" ) ? server.lucee.version : server.coldfusion.productversion;
    }
}