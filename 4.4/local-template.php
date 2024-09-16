<?php
// Put this file in /data/local.php

// Paths
@define('CONST_Postgresql_Version', '14');
@define('CONST_Postgis_Version', '3.4.2');
// Website settings
@define('CONST_Website_BaseURL', '/');
@define('CONST_Replication_MaxInterval', '86400');     // Process each update separately, osmosis cannot merge multiple updates
@define('CONST_Replication_Update_Interval', '86400');  // How often upstream publishes diffs
@define('CONST_Replication_Recheck_Interval', '900');   // How long to sleep if no update found yet
@define('CONST_Pyosmium_Binary', '/usr/local/bin/pyosmium-get-changes');
//@define('CONST_Osm2pgsql_Flatnode_File', '/data/flatnode.file');

# Connection string for shared nominatim database in EC2 <driver>:host=<host>;port=<port>;user=<username>;password=<password>;dbname=<database>
@define('CONST_Database_DSN', '{DB_DSN}');
@define('CONST_Replication_Url', '{REPLICATION_URL}');

?>
