package uk.ac.edina;

import java.net.MalformedURLException;
import java.net.URL;

import org.dspace.core.ConfigurationManager;
import org.dspace.core.Context;
import org.dspace.sword.DSpaceSWORDException;
import org.dspace.sword.SWORDConfiguration;
import org.dspace.sword.SWORDUrlManager;

public class RJBSWORDUrlManager extends SWORDUrlManager {

	private static final String RJB_SWORD_DEPOSIT_PATH = "/rjb-sword/deposit";
	private static final String RJB_SWORD_SD_PATH = "/rjb-sword/servicedocument";
	
	public RJBSWORDUrlManager(SWORDConfiguration config, Context context){
		super(config, context);
	}

	@Override
	public String getBaseServiceDocumentUrl() throws DSpaceSWORDException {
		String sdUrl = null;
		String dspaceUrl = ConfigurationManager.getProperty("dspace.baseUrl");
		if (dspaceUrl == null || "".equals(dspaceUrl))
		{
			throw new DSpaceSWORDException("Unable to construct service document urls, due to missing/invalid " +
					"config in dspace.baseUrl");
		}

        try
        {
            URL url = new URL(dspaceUrl);
            sdUrl = new URL(url.getProtocol(), url.getHost(), url.getPort(), RJB_SWORD_SD_PATH).toString();
        }
        catch (MalformedURLException e)
        {
            throw new DSpaceSWORDException("Unable to construct service document urls, due to invalid dspace.baseUrl " +
					e.getMessage(),e);
        }
        
        return sdUrl;
	}

	@Override
	public String getBaseDepositUrl() throws DSpaceSWORDException {
		String depositUrl = null;
		
		String dspaceUrl = ConfigurationManager.getProperty("dspace.baseUrl");
		if (dspaceUrl == null || "".equals(dspaceUrl))
		{
			throw new DSpaceSWORDException("Unable to construct deposit urls, due to missing/invalid config in " +
					"dspace.baseUrl");
		}

        try
        {
            URL url = new URL(dspaceUrl);
            depositUrl = new URL(url.getProtocol(), url.getHost(), url.getPort(), RJB_SWORD_DEPOSIT_PATH).toString();
        }
        catch (MalformedURLException e)
        {
            throw new DSpaceSWORDException("Unable to construct deposit urls, due to invalid dspace.baseUrl " +
					e.getMessage(),e);
        }
		
		return depositUrl;
	}
	
	
	
	
}
