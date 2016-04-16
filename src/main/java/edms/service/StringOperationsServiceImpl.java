package edms.service;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.springframework.stereotype.Service;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.CharacterData;

@Service
public class StringOperationsServiceImpl implements StringOperationsService {

	@Override
	public byte[] compressString(String uncompressed) {
		System.out.println("String length : " + uncompressed.length());
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		GZIPOutputStream gzip;
		try {
			gzip = new GZIPOutputStream(out);
			gzip.write(uncompressed.getBytes("UTF-8"));
			gzip.close();
			byte[] outStr = out.toByteArray();
			return outStr;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public String decompressString(byte[] compressed) {
		String outStr = "";
		GZIPInputStream gis;
		try {
			gis = new GZIPInputStream(new ByteArrayInputStream(
					compressed));
			BufferedReader bf = new BufferedReader(new InputStreamReader(gis,
					"UTF-8"));
			String line;
			while ((line = bf.readLine()) != null) {
				outStr += line;
			}
			System.out.println("Output String lenght : " + outStr.length());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return outStr;
	}
	
	public String getCharacterDataFromElement(Element e) {
		if(e!=null){
	    Node child = e.getFirstChild();
	    if (child instanceof CharacterData) {
	      CharacterData cd = (CharacterData) child;
	      return cd.getData();
	    }
	    }
	    return "";
	  }

}
