/**
 * OpenKM, Open Document Management System (http://www.openkm.com)
 * Copyright (c) 2006-2014 Paco Avila & Josep Llort
 * 
 * No bytes were intentionally harmed during the development of this application.
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

package edms.core;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Config {

	public static final String EDMS_GUEST = "guestforpubliclink";
	public static String JCR_USERNAME="admin";
	public static String JCR_PASSWORD="admin";
	public static String JCR_SYSTEM="jcr:system";
	public static String EDMS_DOMAIN="@silvereye.in";
	//public static String EDMS_DOMAIN="@avi-oil.com";
	public static String EDMS_KEYWORDKEY="Date,UID,Party Name,Party Code OR ID,Remarks OR Note,Item,Description,Quantity,Rate,Amount,Payment Reference,Batch No,Manufacturing Advise No,Equipment ID";
	public static final String EDMS_FOLDER = "edms:folder";
	public static final String EDMS_NAME = "edms:name";
	public static final String EDMS_TITLE = "edms:title";
	public static final String EDMS_FILE = "edms:file";
	public static final String EDMS_DOCUMENT = "edms:document";
	public static final String USERS_READ = "edms:authUsersRead";
	public static final String USERS_WRITE = "edms:authUsersWrite";
	public static final String USERS_DELETE = "edms:authUsersDelete";
	public static final String USERS_SECURITY = "edms:authUsersSecurity";
	public static final String GROUPS_READ = "edms:authRolesRead";
	public static final String GROUPS_WRITE = "edms:authRolesWrite";
	public static final String GROUPS_DELETE = "edms:authRolesDelete";
	public static final String GROUPS_SECURITY = "edms:authRolesSecurity";
	public static final String EDMS_KEYWORDS = "edms:keywords";
	public static final String EDMS_AUTHOR = "edms:author";
	public static final String EDMS_DESCRIPTION = "edms:description";
	public static final String EDMS_CREATIONDATE = "edms:created";
	public static final String EDMS_MODIFICATIONDATE = "edms:modified";
	public static final String EDMS_RECYCLEDDATE = "edms:recycled";
	public static final String EDMS_OWNER = "edms:owner";
	public static final String EDMS_DOWNLOADDATE = "edms:downloadDate";
	public static final String EDMS_ACCESSDATE = "edms:accessDate";
	public static final String EDMS_NO_OF_FOLDERS = "edms:no_of_folders";
	public static final String EDMS_NO_OF_DOCUMENTS = "edms:no_of_documents";
	public static final String EDMS_RECYCLE_DOC = "edms:recycle";
	public static final String EDMS_RESTORATION_PATH = "edms:restorationPath";
	public static final String EDMS_GUEST_USER = "guest";
	public static final String EDMS_GUEST_PASSWORD = "google@2009";
	public static String LDAP_URL="ldap://mail.silvereye.in:389";
	public static String LDAP_DN="dc=silvereye,dc=in";
	public static String LDAP_RDN="ou=Users,domainName=silvereye.in,o=domains,dc=silvereye,dc=in";
	public static String LDAP_BASE="mail";
/*
	public static String LDAP_URL="ldap://127.0.0.1:389";
	public static String LDAP_DN="dc=avi-oil,dc=com";
	public static String LDAP_RDN="ou=Users,domainName=avi-oil.com,o=domains,dc=avi-oil,dc=com";
	public static String LDAP_BASE="mail";*/
/*
	public static String LDAP_URL="ldap://127.0.0.1:389";
	public static String LDAP_DN="dc=avi-oil,dc=com";
	public static String LDAP_RDN="ou=Users,dc=avi-oil,dc=com";
	public static String LDAP_BASE="uid";
*/	
	public static String escapeChars(String lineIn) {
		StringBuilder sb = new StringBuilder();
		int lineLength = lineIn.length();
		for (int i = 0; i < lineLength; i++) {
			char c = lineIn.charAt(i);
			switch (c) {
				case '"': 
					sb.append("&quot;");
					break;
				case '&':
					sb.append("&amp;");
					break;
				case '\'':
					sb.append("&apos;");
					break;
				case '<':
					sb.append("&lt;");
					break;
				case '>':
					sb.append("&gt;");
					break;
				default: sb.append(c);
			}
		}
		return sb.toString();
	}
 
	public static String tableHeader(String ps, String[] columns) {
		ps=("<tr>");
		for (int i = 0; i < columns.length; i++) {
			ps+=("<th>");
			ps+=(columns[i]);
			ps+=("</th>");
		}
		ps+=("</tr>");
		return ps;
	}
 
	public static String tableRow(String ps, String[] columns) {
		ps=("<tr>");
		for (int i = 0; i < columns.length; i++) {
			ps+=("<td>");
			ps+=(columns[i]);
			ps+=("</td>");
		}
		ps+=("</tr>");
		return ps;
	}
	public static void convertToXlsx(InputStream inStream, java.io.File outputFile) 
	{
	        // For storing data into CSV files
	StringBuffer cellValue = new StringBuffer();
	try 
	{
	        FileOutputStream fos = new FileOutputStream(outputFile);

	        // Get the workbook instance for XLSX file
	        XSSFWorkbook wb = new XSSFWorkbook(inStream);

	        // Get first sheet from the workbook
	        XSSFSheet sheet = wb.getSheetAt(0);

	        Row row;
	        Cell cell;

	        // Iterate through each rows from first sheet
	        Iterator<Row> rowIterator = sheet.iterator();

	        while (rowIterator.hasNext()) 
	        {
	        row = rowIterator.next();

	        // For each row, iterate through each columns
	        Iterator<Cell> cellIterator = row.cellIterator();
	        while (cellIterator.hasNext()) 
	        {
	                cell = cellIterator.next();

	                switch (cell.getCellType()) 
	                {
	                
	                case Cell.CELL_TYPE_BOOLEAN:
	                        cellValue.append(cell.getBooleanCellValue() + ",");
	                        break;
	                
	                case Cell.CELL_TYPE_NUMERIC:
	                        cellValue.append(cell.getNumericCellValue() + ",");
	                        break;
	                
	                case Cell.CELL_TYPE_STRING:
	                        cellValue.append(cell.getStringCellValue() + ",");
	                        break;

	                case Cell.CELL_TYPE_BLANK:
	                        cellValue.append("" + ",");
	                        break;
	                        
	                default:
	                        cellValue.append(cell + ",");

	                }
	        }
	        }

	fos.write(cellValue.toString().getBytes());

	fos.close();

	} 
	catch (Exception e) 
	{
	        System.err.println("Exception :" + e.getMessage());
	}
	
	}

	public static void convertToXls(InputStream inStream, java.io.File outputFile) 
	{
	// For storing data into CSV files
	StringBuffer cellDData = new StringBuffer();
	try 
	{
	        FileOutputStream fos = new FileOutputStream(outputFile);

	        // Get the workbook instance for XLS file
	        HSSFWorkbook workbook = new HSSFWorkbook(inStream);
	        // Get first sheet from the workbook
	        HSSFSheet sheet = workbook.getSheetAt(0);
	        Cell cell;
	        Row row;

	        // Iterate through each rows from first sheet
	        Iterator<Row> rowIterator = sheet.iterator();
	        while (rowIterator.hasNext()) 
	        {
	        row = rowIterator.next();

	        // For each row, iterate through each columns
	        Iterator<Cell> cellIterator = row.cellIterator();
	        while (cellIterator.hasNext()) 
	        {
	        cell = cellIterator.next();

	        switch (cell.getCellType()) 
	        {
	        
	        case Cell.CELL_TYPE_BOOLEAN:
	                cellDData.append(cell.getBooleanCellValue() + ",");
	                break;
	        
	        case Cell.CELL_TYPE_NUMERIC:
	                cellDData.append(cell.getNumericCellValue() + ",");
	                break;
	        
	        case Cell.CELL_TYPE_STRING:
	                cellDData.append(cell.getStringCellValue() + ",");
	                break;

	        case Cell.CELL_TYPE_BLANK:
	                cellDData.append("" + ",");
	                break;
	                
	        default:
	                cellDData.append(cell + ",");
	        }
	        }
	        }

	fos.write(cellDData.toString().getBytes());
	fos.close();

	}
	catch (FileNotFoundException e) 
	{
	    System.err.println("Exception" + e.getMessage());
	} 
	catch (IOException e) 
	{
	        System.err.println("Exception" + e.getMessage());
	}
	
	}

	

	 
	

}
