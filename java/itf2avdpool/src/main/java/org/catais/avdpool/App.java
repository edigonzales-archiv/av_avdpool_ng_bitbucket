package org.catais.avdpool;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

import static java.nio.file.StandardCopyOption.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.catais.avdpool.ili2ch.Ili2ch;
import org.catais.avdpool.utils.ImportProperties;
import org.catais.avdpool.utils.Reindex;
import org.catais.avdpool.utils.Vacuum;

import ch.interlis.ili2c.Ili2cException;


public class App 
{
	private static Logger logger = Logger.getLogger(App.class);

	public static void main( String[] args )
	{
    	logger.setLevel(Level.DEBUG);
    	
    	try {	
			// configure log4j with properties file
			InputStream is =  App.class.getResourceAsStream("log4j.properties");
			PropertyConfigurator.configure(is);
	
			// begin logging
			logger.info("Start: "+ new Date());
			
			// read the properties file with all the things we need to know
			// filename is itf2avdpool.properties
			String propertiesFileName = (String) args[0];
			ImportProperties myProperties = new ImportProperties(propertiesFileName);
			HashMap params = myProperties.read();
			
			logger.debug(params);
			
			boolean doImport = (boolean) params.get("doImport");
			String importSourceDir = (String) params.get("importSourceDir");
			String cantonDirLV03 = (String) params.get("cantonDirLV03");
			String cantonDirLV95 = (String) params.get("cantonDirLV95");
			String federationDirLV03 = (String) params.get("federationDirLV03");
			String federationDirLV95 = (String) params.get("federationDirLV95");
			
			Path importSourcePath = Paths.get(importSourceDir);
			logger.debug(importSourcePath);

			try (DirectoryStream<Path> stream = Files.newDirectoryStream(importSourcePath, "*.itf")) {
				for (Path entry : stream) {
					// import only files delivered today (-> mumkin yesterday?)
					BasicFileAttributes attrs = Files.readAttributes(entry, BasicFileAttributes.class);
					long millis = attrs.lastModifiedTime().toMillis();

					Calendar c = Calendar.getInstance(); 
					c.setTimeInMillis(millis);
					int fYear = c.get(Calendar.YEAR);
					int fDay = c.get(Calendar.DAY_OF_MONTH);

					long today = new Date().getTime();
					c.setTimeInMillis(today);
					int mYear = c.get(Calendar.YEAR);
					int mDay = c.get(Calendar.DAY_OF_MONTH);

					// everything will be imported (regardless the delivery date)
					boolean all = false;
					all = (boolean) params.get("all");
					if (!all)
					{
						if (fYear != mYear || fDay != mDay) {
							continue;
						}
					}

					String fileName = entry.getFileName().toString();

					try {
						int bfsnr = Integer.valueOf(fileName.substring(0, 4)).intValue();
						int los = Integer.valueOf(fileName.substring(4, 6)).intValue();

						String prefix = Integer.toString(bfsnr) + Integer.toString(los);
						logger.debug(prefix);
						logger.debug(entry.toAbsolutePath());

						// convert from canton to federation model
						Path cantonFilePath = entry.toAbsolutePath();						
						Path federationFilePath = Paths.get(federationDirLV03, "ch_" + fileName.substring(0, 6) + ".itf");

						logger.info("Start conversion...");
						Ili2ch ili2ch = new Ili2ch(cantonFilePath.toString(), federationFilePath.toString());
						ili2ch.convert();
						logger.info("End of conversion.");

						// import data
						logger.info("Start data import...");
						if (doImport) {
							IliReader iliReader = new IliReader(federationFilePath.toAbsolutePath().toString(), "21781", params);
							iliReader.setTidPrefix(prefix);
							iliReader.startTransaction();
							iliReader.delete(bfsnr, los);
							iliReader.read(bfsnr, los);  
							iliReader.commitTransaction();
							
							Files.copy(cantonFilePath, Paths.get(cantonDirLV03, fileName), REPLACE_EXISTING);
						} else {
							logger.info("doImport = false");
						}
						logger.info("End data import.");
						
						// LV03 -> LV95
						
						
						

					// exceptions for each loop (file)
					} catch (NumberFormatException e) {
						logger.fatal(e.getMessage());
						logger.fatal(fileName + " will not be imported.");
					} catch (Ili2cException e) {
						logger.fatal(e.getMessage());
						logger.fatal(fileName + " will not be imported.");	                    	
					} catch (IllegalArgumentException e) {
						logger.fatal(e.getMessage());
					} 
				}
			}
			
			catch (IOException e) {
				e.printStackTrace();
				logger.fatal(e.getMessage());
				throw new IOException(e.getMessage());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				logger.fatal(e.getMessage());
				throw new NumberFormatException(e.getMessage());
			} catch (Exception e) {
				e.printStackTrace();
				logger.fatal(e.getMessage());
			}  

			// reindex tables
            logger.info("Start Reindexing...");
            Reindex reindex = new Reindex(params);
            reindex.run();
            logger.info("End Reindexing.");

			// vacuum tables
            logger.info("Start Vacuum...");
            Vacuum vacuum = new Vacuum(params);
            vacuum.run();
            logger.info("End Vacuum.");
	
        } catch (FileNotFoundException e) {
            logger.fatal(e.getMessage());
        } catch (IOException e) {
        	logger.fatal(e.getMessage());
        } catch (NumberFormatException e) {
        	logger.fatal(e.getMessage());
        }  catch (Exception e) {
            logger.fatal(e.getMessage());
        } finally {
        	// stop logging
			logger.info("Ende: "+ new Date());
    	}
		
		System.out.println( "Hallo Stefan." );
	}
}
