package edms.service;

import org.w3c.dom.Element;

public interface StringOperationsService {
	public byte[] compressString (String uncompressed);
	public String decompressString (byte[] compressed);
	public String getCharacterDataFromElement(Element e);

}
