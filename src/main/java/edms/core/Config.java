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



public class Config {
	
	public static String JCR_USERNAME="admin";
	public static String JCR_PASSWORD="admin";
	public static String JCR_SYSTEM="jcr:system";
	public static String EDMS_DOMAIN="@avi-oil.com";

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
}
