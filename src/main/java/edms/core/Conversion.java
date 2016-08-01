package edms.core;

import java.net.ConnectException;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;





public class Conversion {

	public synchronized static void convertPDF(String inPath,String outPath) {
		

		java.io.File inputFile = new java.io.File(inPath); //
		java.io.File outputFile = new java.io.File(outPath); //
		  OpenOfficeConnection connection = new	  SocketOpenOfficeConnection("127.0.0.1",8100);
		  try {
			connection.connect();
		} catch (ConnectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // convert 
		  DocumentConverter	 converter = new  OpenOfficeDocumentConverter(connection);
		  converter.convert(inputFile, outputFile); // close
		  connection.disconnect(); 
	}
	
	
}
