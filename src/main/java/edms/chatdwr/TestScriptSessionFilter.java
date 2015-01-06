package edms.chatdwr;

import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;

public class TestScriptSessionFilter implements ScriptSessionFilter {
	
	private String attributeName;
	private String compareAttribute;
	
	public TestScriptSessionFilter(String attributeName, String compareAttribute)
    {
        this.attributeName = attributeName;
        this.compareAttribute = compareAttribute;
    }
	
	@Override
	public boolean match(ScriptSession session) {
		Object check = session.getAttribute(attributeName);
        return (check != null && check.equals(compareAttribute));
	}

}
