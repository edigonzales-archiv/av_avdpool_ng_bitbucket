package org.catais.avdpool.utils;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Properties;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class ImportProperties {
	private static Logger logger = Logger.getLogger(ImportProperties.class);
	
	String fileName = null;
	
    public ImportProperties(String fileName) {
		logger.setLevel(Level.DEBUG);
		
    	this.fileName = fileName;
    }
    
    public HashMap read() throws FileNotFoundException, IOException {    	
		Properties properties = new Properties();
		BufferedInputStream stream = new BufferedInputStream(new FileInputStream(fileName));
		properties.load(stream);
		stream.close();

    	HashMap params = new HashMap();

		// Database parameters
    	String host = properties.getProperty("dbhost");
    	if (host != null) {
        	params.put("dbhost", host.trim());
    	} else {
			throw new IllegalArgumentException("'dbhost' parameter not set.");
		}
		logger.debug("dbhost: " + host);
	
    	String port = properties.getProperty("dbport");
    	if (port != null) {
        	params.put("dbport", port.trim());
    	} else {
			throw new IllegalArgumentException("'dbport' parameter not set.");
		}
		logger.debug("dbport: " + port);		
		
    	String dbname = properties.getProperty("dbname");
    	if (dbname != null) {
        	params.put("dbname", dbname.trim());
    	} else {
			throw new IllegalArgumentException("'dbname' parameter not set.");
		}
		logger.debug("dbname: " + dbname);		
		
    	String schema = properties.getProperty("dbschema");
    	if (schema != null) {
        	params.put("dbschema", schema.trim());
    	} else {
			throw new IllegalArgumentException("'dbschema' parameter not set.");
		}
		logger.debug("dbschema: " + schema);		
		
    	String user = properties.getProperty("dbuser");
    	if (user != null) {
        	params.put("dbuser", user.trim());
    	} else {
			throw new IllegalArgumentException("'dbuser' parameter not set.");
		}
    	logger.debug("dbuser: " + user);		
		
    	String pwd = properties.getProperty("dbpwd");
    	if (pwd != null) {
        	params.put("dbpwd", pwd.trim());
    	} else {
			throw new IllegalArgumentException("'dbpwd' parameter not set.");
		} 
    	logger.debug("dbpwd: " + pwd);		

    	String admin = properties.getProperty("dbadmin");
    	if (admin != null) {
        	params.put("dbadmin", admin.trim());
    	} else {
			throw new IllegalArgumentException("'dbadmin' parameter not set.");
		}
    	logger.debug("dbadmin: " + admin);		
		
    	String adminpwd = properties.getProperty("dbadminpwd");
    	if (adminpwd != null) {
        	params.put("dbadminpwd", adminpwd.trim());
    	} else {
			throw new IllegalArgumentException("'dbadminpwd' parameter not set.");
		}
    	logger.debug("dbadminpwd: " + adminpwd);
    	
    	// import
    	String doImportString = properties.getProperty("import");
    	boolean doImport = false;
    	if (doImportString != null) {
    		doImport = Boolean.parseBoolean(doImportString.trim());
    	}
    	params.put("doImport", doImport);
    	logger.debug("doImport: " + doImport);
    			
        // source directory
        String srcdir = properties.getProperty("importSourceDir");
        if (srcdir != null) {
            params.put("importSourceDir", srcdir.trim());
        } else {
            throw new IllegalArgumentException("'importSourceDir' parameter not set.");
        }    	
        
        // destination directory LV03
        String ctDirLV03 = properties.getProperty("cantonDirLV03");
        if (ctDirLV03 != null) {
            params.put("cantonDirLV03", ctDirLV03.trim());
        } else {
            throw new IllegalArgumentException("'cantonDirLV03' parameter not set.");
        }    	
        
        // destination directory LV95
        String ctDirLV95 = properties.getProperty("cantonDirLV95");
        if (ctDirLV95 != null) {
            params.put("cantonDirLV95", ctDirLV95.trim());
        } else {
            throw new IllegalArgumentException("'cantonDirLV95' parameter not set.");
        }    	

        // destination directory LV03 federation
        String fedDirLV03 = properties.getProperty("federationDirLV03");
        if (fedDirLV03 != null) {
            params.put("federationDirLV03", fedDirLV03.trim());
        } else {
            throw new IllegalArgumentException("'federationDirLV03' parameter not set.");
        }    	

        // destination directory LV95 federation
        String fedDirLV95 = properties.getProperty("federationDirLV95");
        if (fedDirLV95 != null) {
            params.put("federationDirLV95", fedDirLV95.trim());
        } else {
            throw new IllegalArgumentException("'federationDirLV95' parameter not set.");
        }    
        
        // delete files
        String doDeleteFiles = properties.getProperty("deleteFiles");
        boolean deleteFiles = false;
        if (doDeleteFiles != null) {
        	deleteFiles = Boolean.parseBoolean(doDeleteFiles.trim());
        }
        params.put("deleteFiles", deleteFiles);
        logger.debug("deleteFiles:" + deleteFiles);
        
        // import ALL itf files
        String doAll = properties.getProperty("all");
        boolean all = false;
        if (doAll != null) {
            all = Boolean.parseBoolean(doAll.trim());
        }
        params.put("all", all);
        logger.debug("all: " + all);

        
//    	// sqlite file
//    	String sqlite = properties.getProperty("sqlite");
//    	if (sqlite != null) {
//    		params.put("sqlite", sqlite.trim());
//    	} else {
//			throw new IllegalArgumentException("'sqlite' parameter not set.");
//		}
//    	
//    	// destination directory
//    	String dstdir = properties.getProperty("dstdir");
//    	if (dstdir != null) {
//    		params.put("dstdir", dstdir.trim());
//    	} else {
//			throw new IllegalArgumentException("'dstdir' parameter not set.");
//		}
//    	
//        // temporary destination directory
//        String tmpdstdir = properties.getProperty("tmpdstdir");
//        if (dstdir != null) {
//            params.put("tmpdstdir", tmpdstdir.trim());
//        } else {
//            throw new IllegalArgumentException("'tmpdstdir' parameter not set.");
//        }    	
    	
    	return params;
    }

}


