<%@page import="com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter"%>
<%@page import="com.artofsolving.jodconverter.DocumentConverter"%>
<%@page import="java.net.ConnectException"%>
<%@page import="com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection"%>
<%@page import="com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection"%>
<%@page import="edms.core.Conversion"%>
<%@page import="java.net.URL"%>
<%@page import="org.apache.pdfbox.util.PDFTextStripper"%>
<%@page import="com.lowagie.text.pdf.PRStream"%>
<%@page import="com.lowagie.text.pdf.PdfName"%>
<%@page import="com.lowagie.text.pdf.PdfStream"%>
<%@page import="com.lowagie.text.pdf.PdfObject"%>
<%@page import="com.lowagie.text.pdf.PdfReader"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.poi.xwpf.converter.xhtml.XHTMLConverter"%>
<%@page import="org.apache.poi.xwpf.converter.core.FileURIResolver"%>
<%@page import="org.apache.poi.xwpf.converter.xhtml.XHTMLOptions"%>
<%@page import="org.apache.poi.xwpf.usermodel.XWPFDocument"%>
<%@page import="edms.core.Config"%>
<%@page import="java.awt.geom.Rectangle2D"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="org.apache.poi.hslf.model.Slide"%>
<%@page import="java.awt.*"%>
<%@page import="org.apache.poi.hslf.usermodel.SlideShow"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.pdfbox.pdmodel.PDPage"%>
<%@page import="org.apache.pdfbox.pdmodel.PDDocument"%>
<%@page import="java.io.*"%>
<%@page import="edms.wsdl.File"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--jQuery and jQuery UI with jQuery Chat-->
<script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>

</head>
<body>
<div id="imageContainer" style="text-align: center;"></div>
<script type="text/javascript">
var heigh=$('.inner_prev_page').css( "height" );
	
	if(typeof $('.inner_prev_page').css( "height" ) === 'undefined')
		heigh=$(document).height()-30;

</script>
<%-- <%
ArrayList<String> imageList=(ArrayList<String>)request.getAttribute("previewImages");
if(imageList.size()==0){%>
<span style="display: block;
margin: 0 auto;
width: 157px;
position: relative;
top: 47%;" >No Preview Available!</span>
<%}
for(String str:imageList){
	%>
	<img alt="No Preview" src="<%=str %>" />
	<%
}
%> --%>
<%
File fileNode=(File)request.getAttribute("fileNode");
String ps="";
ArrayList<String> imageList=(ArrayList<String>)request.getAttribute("previewImages");

try {
	byte[] imageBytes = org.apache.commons.codec.binary.Base64
			.decodeBase64(fileNode.getFileContent());
		InputStream inStream = new ByteArrayInputStream(imageBytes);
		if(fileNode.getFileName().contains(".pdf")){
			java.io.File path =null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			String pathh="";
			try {
				String realPath = getServletContext().getRealPath("/");
				path = new java.io.File(realPath+"/WEB-INF/view/jsp/js/web/"+fileNode.getFileName());
				inputStream = inStream;
				pathh=path.getName();
				// write the inputStream to a FileOutputStream
				outputStream = new FileOutputStream(path);
				int read = 0;
				byte[] bytes = new byte[1024];
				while ((read = inputStream.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (inputStream != null) {
					try {
						inputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (outputStream != null) {
					try {
						// outputStream.flush();
						outputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}

				}
			}
			//	pathh=pathh.replaceAll("/\//g", "//");
			%>
			
			
			<script type="text/javascript">
			 	var x = document.createElement("EMBED");
			 	//path=path.replace(/\//g, "////");
			    x.setAttribute("src", "js/web/<%=pathh%>");
			    x.setAttribute("height", heigh);
			    x.setAttribute("width", "100%");
				$('#imageContainer').append(x);
			</script>
		
		
			<%--  <embed src="file:///<%=pathh %>" width="500" height="375" type='application/pdf' /> 
		 --%>
	 	<%
	/*  	PDDocument doc=null;
		try {
			
	  	doc=PDDocument.load(inStream);
		//Get all pages from document and store them in a list
		List<PDPage> pages=doc.getDocumentCatalog().getAllPages();
		//create iterator object so it is easy to access each page from the list
		Iterator<PDPage> i= pages.iterator();
		int count=1; //count variable used to separate each image file
		//Convert every page of the pdf document to a unique image file
		while(i.hasNext()){
		PDPage page1=i.next();
		BufferedImage bi=page1.convertToImage();
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ImageIO.write(bi, "png", bos);
		String encodedImage = org.apache.commons.codec.binary.Base64
				.encodeBase64String(bos.toByteArray());
		count++;
	}
	} catch (IOException e) {
		e.printStackTrace();
	}finally{
	
		doc.close();
	} */
 /* 	if(path!=null)
	 	org.apache.commons.io.FileUtils.deleteQuietly(path); */
	
}else if(fileNode.getFileName().contains(".odt")||fileNode.getFileName().contains(".ppt")||fileNode.getFileName().contains(".ods")||fileNode.getFileName().contains(".odp"))
{
	java.io.File path =null;
	InputStream inputStream = null;
	OutputStream outputStream = null;
	String pathh="";
	String realPath = getServletContext().getRealPath("/");
	try {
		path = new java.io.File(realPath+"/WEB-INF/view/jsp/js/web/"+fileNode.getFileName());
		inputStream = inStream;
		pathh=path.getName();
		// write the inputStream to a FileOutputStream
		outputStream = new FileOutputStream(path);
		int read = 0;
		byte[] bytes = new byte[1024];
		while ((read = inputStream.read(bytes)) != -1) {
			outputStream.write(bytes, 0, read);
		}
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		if (inputStream != null) {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (outputStream != null) {
			try {
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
 	// = new java.io.File("/document.xlsx"); 
 	String inPath=realPath+"/WEB-INF/view/jsp/js/web/"+fileNode.getFileName();
 	String otp=fileNode.getFileName().substring(0,fileNode.getFileName().lastIndexOf("."));
 	String outPath=realPath+"/WEB-INF/view/jsp/js/web/"+otp+".pdf";
	//Conversion.convertPDF(inPath, outPath);
	

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

		pathh=outputFile.getName();

	
	%>


			
			<script type="text/javascript">
			 	var x = document.createElement("EMBED");
			 	//path=path.replace(/\//g, "////");
			    x.setAttribute("src", "js/web/<%=pathh%>");
			    x.setAttribute("height", heigh);
			    x.setAttribute("width", "100%");
				$('#imageContainer').append(x);
			</script>
		
		
			<%--  <embed src="file:///<%=pathh %>" width="500" height="375" type='application/pdf' /> 
 --%>
		
		<%	
		/* outputFile.delete(); */
	
	
}else if(fileNode.getFileName().contains(".xls"))
{
	java.io.File path =null;
	InputStream inputStream = null;
	OutputStream outputStream = null;
	String pathh="";
	String realPath = getServletContext().getRealPath("/");
	try {
		path = new java.io.File(realPath+"/WEB-INF/view/jsp/js/web/"+fileNode.getFileName());
		inputStream = inStream;
		pathh=path.getName();
		// write the inputStream to a FileOutputStream
		outputStream = new FileOutputStream(path);
		int read = 0;
		byte[] bytes = new byte[1024];
		while ((read = inputStream.read(bytes)) != -1) {
			outputStream.write(bytes, 0, read);
		}
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		if (inputStream != null) {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (outputStream != null) {
			try {
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
 	// = new java.io.File("/document.xlsx"); 
 	String inPath=realPath+"/WEB-INF/view/jsp/js/web/"+fileNode.getFileName();
 	String otp=fileNode.getFileName().substring(0,fileNode.getFileName().lastIndexOf("."));
 	String outPath=realPath+"/WEB-INF/view/jsp/js/web/"+otp+".pdf";
	//Conversion.convertPDF(inPath, outPath);
	

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

		pathh=outputFile.getName();

	
	%>


			
			<script type="text/javascript">
			 	var x = document.createElement("EMBED");
			 	//path=path.replace(/\//g, "////");
			    x.setAttribute("src", "js/web/<%=pathh%>");
			    x.setAttribute("height", heigh);
			    x.setAttribute("width", "100%");
				$('#imageContainer').append(x);
			</script>
		
		
			<%--  <embed src="file:///<%=pathh %>" width="500" height="375" type='application/pdf' /> 
 --%>
		
		<%	
		/* outputFile.delete(); */
	
	
}else if(fileNode.getFileName().contains(".doc")){
	
	
	

	java.io.File path =null;
	InputStream inputStream = null;
	OutputStream outputStream = null;
	String pathh="";
	String realPath = getServletContext().getRealPath("/");
	try {
		path = new java.io.File(realPath+"/WEB-INF/view/jsp/js/web/"+fileNode.getFileName());
		inputStream = inStream;
		pathh=path.getName();
		// write the inputStream to a FileOutputStream
		outputStream = new FileOutputStream(path);
		int read = 0;
		byte[] bytes = new byte[1024];
		while ((read = inputStream.read(bytes)) != -1) {
			outputStream.write(bytes, 0, read);
		}
		
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		if (inputStream != null) {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (outputStream != null) {
			try {
				// outputStream.flush();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

 	String inPath=realPath+"/WEB-INF/view/jsp/js/web/"+fileNode.getFileName();
 	String otp=fileNode.getFileName().substring(0,fileNode.getFileName().lastIndexOf("."));
 	String outPath=realPath+"/WEB-INF/view/jsp/js/web/"+otp+".pdf";
	//Conversion.convertPDF(inPath, outPath);
	

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

		pathh=outputFile.getName();
	
	
	
	
	
	

	pathh=outputFile.getName();

	
	%>


			
			<script type="text/javascript">
			
			 	var x = document.createElement("EMBED");
			 	//path=path.replace(/\//g, "////");
			    x.setAttribute("src", "js/web/<%=pathh%>");
			    x.setAttribute("height", heigh);
			    x.setAttribute("width", "100%");
				$('#imageContainer').append(x);
			</script>
		
		
			<%--  <embed src="file:///<%=pathh %>" width="500" height="375" type='application/pdf' /> 
 --%>
	<%	
}else if(fileNode.getFileName().contains(".bmp")||fileNode.getFileName().contains(".jpg")||fileNode.getFileName().contains(".JPG")||fileNode.getFileName().contains(".png")||fileNode.getFileName().contains(".gif")){
	
	%>
	<div style=" margin: 0 auto;
    max-width: 85%;">
	<img width="100%"  src='data:image/png;base64,<%=org.apache.commons.codec.binary.Base64
			.encodeBase64String(imageBytes)%>' />
	</div>
	<%
}else if(fileNode.getFileName().contains(".txt")){
	

	String encodedImage = IOUtils.toString(imageBytes);
	
	%>

	<%=encodedImage %>
	<%
}else{
	%>
	<span style="display: block;
	margin: 0 auto;
	width: 157px;
	position: relative;
	top: 47%;" >No Preview Available!</span> 
	<%
}
} catch (Exception e) {
	e.printStackTrace();
}
%>








</body>
</html>